import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';
import '../style/theme.dart';
import '../widgets/page_header.dart';
import '../widgets/statistic_card.dart';
import '../widgets/app_info_bar.dart';
import '../widgets/app_status_badge.dart';
import '../widgets/main_buttons.dart';
import '../widgets/calendar.dart';
import '../widgets/status_toast.dart';
import '../widgets/warning_dialog.dart';
import '../providers/app_providers.dart';
import 'package:drift/drift.dart' hide Column;
import '/pages/schedule/schedule_appointment.dart';
import '/pages/schedule/schedule_dashboard.dart';
import '/pages/patient_records/add_patient.dart';
import '/pages/patient_records/add_clinical_record.dart';
import '../../db/database.dart';
import '../../services/scheduling_service.dart';

// Dynamic patient provider
final dailyNewPatientsProvider =
    StreamProvider.autoDispose.family<int, DateTime>((ref, selectedDate) {
  final db = ref.watch(databaseProvider);

  final startOfDay = DateTime(
      selectedDate.year, selectedDate.month, selectedDate.day, 0, 0, 0);
  final endOfDay = DateTime(
      selectedDate.year, selectedDate.month, selectedDate.day, 23, 59, 59);

  final query = db.select(db.patient)
    ..where((p) => p.createdAt.isBetweenValues(startOfDay, endOfDay));

  return query.watch().map((rows) => rows.length);
});

// Dynamic appointment provider
final dailyAppointmentsProvider = StreamProvider.autoDispose
    .family<List<JoinedAppointment>, DateTime>((ref, selectedDate) {
  final db = ref.watch(databaseProvider);

  final startOfDay = DateTime(
      selectedDate.year, selectedDate.month, selectedDate.day, 0, 0, 0);
  final endOfDay = DateTime(
      selectedDate.year, selectedDate.month, selectedDate.day, 23, 59, 59);

  final query = db.select(db.appointment).join([
    innerJoin(
        db.patient, db.patient.patientId.equalsExp(db.appointment.patientId)),
  ])
    ..where(
        db.appointment.scheduleDateTime.isBetweenValues(startOfDay, endOfDay));

  return query.watch().map((rows) {
    final list = rows.map((row) {
      return JoinedAppointment(
        appointment: row.readTable(db.appointment),
        patient: row.readTable(db.patient),
      );
    }).toList();

    // Sorts list by time
    list.sort((a, b) {
      int timeA = SchedulingService.timeToMinutes(a.appointment.timeSlot);
      int timeB = SchedulingService.timeToMinutes(b.appointment.timeSlot);
      return timeA.compareTo(timeB);
    });

    return list;
  });
});

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  DateTime _selectedDate = DateTime.now();

  int _currentIndex = 0;
  int _formSessionId = 0;
  JoinedAppointment? _selectedAppointment;
  List<PatientData> _allPatients = [];

  PatientCompanion? _draftPatient;
  ClinicalRecordCompanion? _draftClinicalRecord;
  int? _existingPatientId;
  int _returnIndex = 0;
  Map<String, dynamic>? _patientToEditMap;

  // Live queue updating helper
  Future<void> _updateQueueStatus(
      JoinedAppointment item, String newStatus) async {
    try {
      final repo = ref.read(appointmentRepositoryProvider);
      final formattedStatus =
          newStatus[0].toUpperCase() + newStatus.substring(1).toLowerCase();

      await repo.updateAppointmentStatus(
          item.appointment.appointmentId, formattedStatus);

      if (mounted) {
        StatusToast.show(
          context,
          title: 'Queue Updated',
          message:
              '${item.patient.firstName} ${item.patient.lastName} marked as $formattedStatus.',
          isSuccess: true,
        );
      }
    } catch (e) {
      if (mounted) {
        StatusToast.show(
          context,
          title: 'Error',
          message: 'Failed to update database.',
          isSuccess: false,
        );
      }
    }
  }

  void _goToAddPatient() {
    setState(() {
      _draftPatient = null;
      _existingPatientId = null;
      _patientToEditMap = null;
      _currentIndex = 2;
    });
  }

  void _goToAddClinicalRecord(
      {PatientCompanion? draftPatient,
      int? existingPatientId,
      int returnIndex = 0}) {
    setState(() {
      _draftPatient = draftPatient;
      _existingPatientId = existingPatientId;
      _returnIndex = returnIndex;
      _currentIndex = 3;
    });
  }

  Future<void> _handleSaveClinicalRecord(dynamic clinicalRecordData) async {
    try {
      final db = ref.read(databaseProvider);

      if (_draftPatient != null) {
        final newPatientId = await db.into(db.patient).insert(_draftPatient!);

        final newRecord =
            (clinicalRecordData as ClinicalRecordCompanion).copyWith(
          patientId: Value(newPatientId),
        );
        await db.into(db.clinicalRecord).insert(newRecord);
      } else if (_existingPatientId != null) {
        final newRecord =
            (clinicalRecordData as ClinicalRecordCompanion).copyWith(
          patientId: Value(_existingPatientId!),
        );
        await db.into(db.clinicalRecord).insert(newRecord);
      }

      if (mounted) {
        setState(() {
          _currentIndex = 0;
          _draftPatient = null;
          _existingPatientId = null;
        });

        StatusToast.show(
          context,
          title: 'Record Created',
          message: 'Patient record has been successfully created!',
          isSuccess: true,
        );
      }
    } catch (e) {
      if (mounted) {
        StatusToast.show(
          context,
          title: 'Error',
          message: 'Failed to save record. Please try again.',
          isSuccess: false,
        );
      }
    }
  }

  Future<void> _handleReschedule(JoinedAppointment item) async {
    try {
      final db = ref.read(databaseProvider);
      final allPatients = await db.select(db.patient).get();

      if (!mounted) return;

      setState(() {
        _allPatients = allPatients;
        _selectedAppointment = item;
        _formSessionId++;
        _currentIndex = 1;
      });
    } catch (e) {
      if (mounted) {
        StatusToast.show(
          context,
          title: 'Error',
          message: 'Could not load appointment details.',
          isSuccess: false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final queueState = ref.watch(dailyAppointmentsProvider(_selectedDate));
    final newPatientsState = ref.watch(dailyNewPatientsProvider(_selectedDate));

    return IndexedStack(
      index: _currentIndex,
      children: [
        _buildDashboardView(context, queueState, newPatientsState),
        _buildRescheduleView(),
        _buildAddPatientView(),
        _buildAddClinicalRecordView()
      ],
    );
  }

  Widget _buildDashboardView(
      BuildContext context,
      AsyncValue<List<JoinedAppointment>> queueState,
      AsyncValue<int> newPatientsState) {
    final items = queueState.value ?? [];

    // Calculate Lobby Status (Active in Queue)
    final inQueue = items.where((i) {
      final status = (i.appointment.status ?? 'waiting').trim().toLowerCase();
      return status != 'completed' &&
          status != 'finished' &&
          status != 'cancelled';
    }).length;

    // Calculate Daily Progress (Treated / Total Non-Cancelled)
    final treated = items.where((i) {
      final status = (i.appointment.status ?? 'waiting').trim().toLowerCase();
      return status == 'completed' || status == 'finished';
    }).length;

    final totalActive = items.where((i) {
      return (i.appointment.status ?? 'waiting').trim().toLowerCase() !=
          'cancelled';
    }).length;

    String dailyProgress = "$treated/$totalActive";
    String lobbyStatus = inQueue.toString();
    String newPatients = newPatientsState.value?.toString() ?? "0";

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(slivers: [
          SliverCrossAxisGroup(
            slivers: [
              // LEFT COLUMN
              SliverCrossAxisExpanded(
                flex: 2,
                sliver: SliverMainAxisGroup(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.only(left: 24, right: 12),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          _buildStatisticsSection(
                              dailyProgress, lobbyStatus, newPatients),
                          const SizedBox(height: 32),
                        ]),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 12, bottom: 32),
                      sliver: SliverToBoxAdapter(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppTheme.white500, 
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: AppTheme.floatShadow,
                          ),
                          padding: const EdgeInsets.only(
                              top: 24, bottom: 8, left: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 24),
                                child: Text(
                                  "Patients In Queue",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.black500,
                                      ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              _buildPatientQueue(queueState),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // RIGHT COLUMN
              SliverCrossAxisExpanded(
                flex: 1,
                sliver: SliverMainAxisGroup(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.only(left: 12, right: 24),
                      sliver: SliverToBoxAdapter(
                        child: _buildRightSidePanel(queueState),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]));
  }

  Widget _buildAddPatientView() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeader(
              title: 'Back to Dashboard',
              type: PageHeaderType.withBack,
              onBack: () async {
                final bool? shouldDiscard = await showDialog<bool>(
                  context: this.context,
                  builder: (BuildContext dialogContext) {
                    return WarningDialog(
                        isCaution: false,
                        title: 'Discard Patient Record?',
                        content:
                            'Are you sure you want to return to the dashboard? This patient record has not been saved yet.',
                        secondaryAction: "Keep Editing",
                        primaryAction: "Discard");
                  },
                );

                if (shouldDiscard == true) {
                  setState(() {
                    _currentIndex = 0;
                  });
                }
              },
            ),
            Transform.translate(
              offset: const Offset(0, -30),
              child: AddPatientForm(
                  key: ValueKey('form_$_formSessionId'),
                  existingPatient: _patientToEditMap,
                  onNext: (data) {
                    _goToAddClinicalRecord(draftPatient: data, returnIndex: 0);
                  },
                  onBack: () {
                    setState(() {
                      _currentIndex = _patientToEditMap != null ? 3 : 0;
                      _patientToEditMap = null;
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddClinicalRecordView() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeader(
              title: 'Back to Details',
              type: PageHeaderType.withBack,
              onBack: () async {
                final bool? shouldDiscard = await showDialog<bool>(
                  context: this.context,
                  builder: (BuildContext dialogContext) {
                    return WarningDialog(
                        isCaution: false,
                        title: 'Discard Clinical Record?',
                        content:
                            'Are you sure you want to go back? Any data entered in this clinical record will be lost.',
                        secondaryAction: "Keep Editing",
                        primaryAction: "Discard");
                  },
                );

                if (shouldDiscard == true) {
                  setState(() {
                    _currentIndex = _returnIndex;
                  });
                }
              },
            ),
            Transform.translate(
              offset: const Offset(0, -30),
              child: AddClinicalRecordForm(
                patientId: _existingPatientId ?? 0,
                key: ValueKey(_formSessionId),
                showPreviousButton: _returnIndex != 3,
                onPrevious: () {
                  setState(() => _currentIndex = 2);
                },
                onFinish: _handleSaveClinicalRecord,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRescheduleView() {
    if (_selectedAppointment == null) return const SizedBox.shrink();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeader(
              title: 'Back to Dashboard',
              type: PageHeaderType.withBack,
              onBack: () async {
                final bool? shouldDiscard = await showDialog<bool>(
                  context: this.context,
                  builder: (BuildContext dialogContext) {
                    return WarningDialog(
                        isCaution: false,
                        title: 'Discard Unsaved Changes?',
                        content:
                            'Are you sure you want to return to the dashboard? Any unsaved changes to this schedule will be lost.',
                        secondaryAction: "Keep Editing",
                        primaryAction: "Discard");
                  },
                );

                if (shouldDiscard == true) {
                  setState(() {
                    _currentIndex = 0;
                  });
                }
              },
            ),
            Transform.translate(
              offset: const Offset(0, -30),
              child: ScheduleAppointmentForm(
                key: ValueKey('reschedule_$_formSessionId'),
                activePatients: _allPatients,
                appointmentToEdit: _selectedAppointment,
                onSave: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsSection(String progress, String lobby, String newPts) {
    return Row(
      spacing: 16,
      children: [
        StatisticCard(
          title: "Daily Progress",
          value: progress,
          subtitle: "Patients treated today",
          icon: HeroIcons.clipboardDocumentCheck,
        ),
        StatisticCard(
          title: "Lobby Status",
          value: lobby,
          subtitle: "Patients in queue",
          icon: HeroIcons.users,
        ),
        StatisticCard(
          title: "New Patients",
          value: newPts,
          subtitle: "Records added today",
          icon: HeroIcons.sparkles,
        ),
      ],
    );
  }

  Widget _buildPatientQueue(AsyncValue<List<JoinedAppointment>> queueState) {
    return queueState.when(
      loading: () => const Padding(
          padding: EdgeInsets.only(top: 32.0, bottom: 32.0, right: 24.0),
          child: Center(child: CircularProgressIndicator())),
      error: (error, stack) => Padding(
          padding: const EdgeInsets.only(top: 32.0, bottom: 32.0, right: 24.0),
          child: Center(child: Text('Database Error: $error'))),
      data: (queueItems) {
        final activeQueue = queueItems
            .where((item) =>
                (item.appointment.status ?? 'waiting').toLowerCase() !=
                    'completed' &&
                (item.appointment.status ?? 'waiting').toLowerCase() !=
                    'finished' &&
                (item.appointment.status ?? 'waiting').toLowerCase() !=
                    'cancelled')
            .toList();

        if (activeQueue.isEmpty) {
          return const Padding(
            padding: EdgeInsets.only(top: 48.0, bottom: 48.0, right: 24.0),
            child: Center(
              child: Text(
                "No active appointments in the queue.",
                style: TextStyle(color: AppTheme.gray500, fontSize: 16),
              ),
            ),
          );
        }

        return ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 610,
          ),
          child: RawScrollbar(
            thickness: 0,
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(right: 24),
              physics: const BouncingScrollPhysics(),
              itemCount: activeQueue.length,
              itemBuilder: (BuildContext listContext, int index) {
                final item = activeQueue[index];

                final String fullName =
                    '${item.patient.lastName}, ${item.patient.firstName}';
                final badge = _mapDatabaseStatusToBadge(
                    item.appointment.status ?? 'waiting');

                return AppointmentBar(
                  fullName: fullName,
                  time: item.appointment.timeSlot,
                  reason: item.appointment.reasonForVisit,
                  status: badge,
                  onPrimaryAction: () async {
                    if (badge == BadgeStatus.waiting ||
                        badge == BadgeStatus.pending) {
                      final bool? shouldCancel = await showDialog<bool>(
                        context: listContext,
                        builder: (BuildContext dialogContext) {
                          return WarningDialog(
                              isCaution: false,
                              title: 'Cancel Appointment?',
                              content:
                                  'Are you sure you want to cancel $fullName\'s appointment? This action cannot be undone.',
                              secondaryAction: "Keep Appointment",
                              primaryAction: "Cancel Appointment");
                        },
                      );

                      if (shouldCancel == true) {
                        _updateQueueStatus(item, 'cancelled');
                      }
                    } else if (badge == BadgeStatus.inProgress) {
                      _updateQueueStatus(item, 'completed');
                    }
                  },
                  onMenuSelected: (String actionValue) async {
                    switch (actionValue) {
                      case 'admit':
                        _updateQueueStatus(item, 'In Progress');
                        break;
                      case 'send_back':
                        _updateQueueStatus(item, 'Waiting');
                        break;
                      case 'reschedule':
                        _handleReschedule(item);
                        break;
                    }
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildRightSidePanel(AsyncValue<List<JoinedAppointment>> queueState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppCalendar(
          selectedDay: _selectedDate,
          onDaySelected: (date) {
            setState(() {
              // Clicking a date instantly triggers a refetch from the providers
              _selectedDate = date;
            });
          },
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: Button(
            label: "Add New Record",
            heroIcon: HeroIcons.documentPlus,
            onPressed: () {
              setState(() {
                _formSessionId++;
              });
              _goToAddPatient();
            },
          ),
        ),
        const SizedBox(height: 32),

        // Patients Treated
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppTheme.white500,
            borderRadius: BorderRadius.circular(24),
            boxShadow: AppTheme.floatShadow,
          ),
          padding:
              const EdgeInsets.only(top: 28, bottom: 8, left: 18, right: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  "Patients Treated",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.black500,
                      ),
                ),
              ),
              const SizedBox(height: 16),
              queueState.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => const Text('Error loading history'),
                data: (queueItems) {
                  final treatedQueue = queueItems
                      .where((item) =>
                          (item.appointment.status ?? 'waiting')
                                  .trim()
                                  .toLowerCase() ==
                              'completed' ||
                          (item.appointment.status ?? 'waiting')
                                  .trim()
                                  .toLowerCase() ==
                              'finished' ||
                          (item.appointment.status ?? 'waiting')
                                  .trim()
                                  .toLowerCase() ==
                              'paid')
                      .toList();

                  if (treatedQueue.isEmpty) {
                    return const Center(
                        child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.0),
                      child: Text(
                        "No patients treated yet.",
                        style: TextStyle(color: AppTheme.gray500, fontSize: 14),
                      ),
                    ));
                  }

                  return ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 272,
                    ),
                    child: RawScrollbar(
                      thumbColor: AppTheme.gray400,
                      radius: const Radius.circular(8),
                      thickness: 0,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(right: 16),
                        physics: const BouncingScrollPhysics(),
                        itemCount: treatedQueue.length,
                        itemBuilder: (context, index) {
                          final item = treatedQueue[index];
                          return PatientsTreatedBar(
                            fullName:
                                '${item.patient.firstName} ${item.patient.lastName}',
                            procedure: item.appointment.reasonForVisit,
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  BadgeStatus _mapDatabaseStatusToBadge(String dbStatus) {
    switch (dbStatus.trim().toLowerCase()) {
      case 'waiting':
        return BadgeStatus.waiting;
      case 'pending':
        return BadgeStatus.pending;
      case 'in progress':
        return BadgeStatus.inProgress;
      case 'finished':
      case 'completed':
        return BadgeStatus.finished;
      case 'cancelled':
        return BadgeStatus.cancelled;
      default:
        return BadgeStatus.waiting;
    }
  }
}
