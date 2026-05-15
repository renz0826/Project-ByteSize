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
import '../providers/app_providers.dart';

final newPatientsProvider = FutureProvider<int>((ref) async {
  final repo = ref.watch(patientRepositoryProvider);
  final patients = await repo.getActivePatients();
  
  final now = DateTime.now();
  return patients.where((p) {
    return p.createdAt.year == now.year && 
           p.createdAt.month == now.month && 
           p.createdAt.day == now.day;
  }).length;
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

  // Realtime patient provider
  final newPatientsProvider = StreamProvider.autoDispose<int>((ref) {
    final db = ref.watch(databaseProvider);

    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day, 0, 0, 0);
    final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

    // Watches the patient table and instantly counts anyone created today
    final query = db.select(db.patient)
      ..where((p) => p.createdAt.isBetweenValues(startOfDay, endOfDay));

    return query.watch().map((rows) => rows.length);
  });

  // Status update helper
  Future<void> _updateQueueStatus(
      DashboardQueueItem item, String newStatus) async {
    try {
      final repo = ref.read(appointmentRepositoryProvider);
      await repo.updateAppointmentStatus(item.appointmentId, newStatus);

      if (mounted) {
        StatusToast.show(
          context,
          title: 'Queue Updated',
          message: '${item.patientName}\'s appoint is $newStatus.',
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

  // Reschedule helper using IndexedStack
  Future<void> _handleReschedule(DashboardQueueItem item) async {
    try {
      final db = ref.read(databaseProvider);

      // Fetch the raw data
      final rawAppt = await (db.select(db.appointment)
            ..where((a) => a.appointmentId.equals(item.appointmentId)))
          .getSingle();

      final rawPatient = await (db.select(db.patient)
            ..where((p) => p.patientId.equals(rawAppt.patientId)))
          .getSingle();

      final allPatients = await db.select(db.patient).get();

      final joinedRecord = JoinedAppointment(
        appointment: rawAppt,
        patient: rawPatient,
      );

      if (!mounted) return;

      setState(() {
        _allPatients = allPatients;
        _selectedAppointment = joinedRecord;
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
    final queueState = ref.watch(todayQueueProvider);
    final newPatientsState = ref.watch(newPatientsProvider);

    // Return the IndexedStack at the root of the page
    return IndexedStack(
      index: _currentIndex,
      children: [
        _buildDashboardView(context, queueState, newPatientsState),
        _buildRescheduleView(),
      ],
    );
  }

  Widget _buildDashboardView(
      BuildContext context,
      AsyncValue<List<DashboardQueueItem>> queueState,
      AsyncValue<int> newPatientsState) {
    final items = queueState.value ?? [];

    // Calculate Lobby Status (Active in Queue)
    final inQueue = items.where((i) {
      final status = i.status.trim().toLowerCase();
      return status != 'completed' &&
          status != 'finished' &&
          status != 'cancelled';
    }).length;

    // Calculate Daily Progress (Treated / Total Non-Cancelled)
    final treated = items.where((i) {
      final status = i.status.trim().toLowerCase();
      return status == 'completed' || status == 'finished';
    }).length;

    final totalActive = items.where((i) {
      return i.status.trim().toLowerCase() != 'cancelled';
    }).length;

    String dailyProgress = "$treated/$totalActive";
    String lobbyStatus = inQueue.toString();
    String newPatients = newPatientsState.value?.toString() ?? "0";
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: _buildHeader(),
          ),
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

  Widget _buildRescheduleView() {
    if (_selectedAppointment == null) return const SizedBox.shrink();

    final queueState = ref.watch(todayQueueProvider);
    final newPatientsState = ref.watch(newPatientsProvider);

    String dailyProgress = "0/0";
    String lobbyStatus = "0";
    String newPatients = "0";

    queueState.whenData((items) {
      final total = items.length;
      final treated = items.where((i) => 
        i.status.toLowerCase() == 'finished' || 
        i.status.toLowerCase() == 'paid').length;
      final inQueue = items.where((i) => 
        i.status.toLowerCase() == 'waiting' || 
        i.status.toLowerCase() == 'pending' || 
        i.status.toLowerCase() == 'in progress').length;
      
      dailyProgress = "$treated/$total";
      lobbyStatus = inQueue.toString();
    });

    newPatientsState.whenData((count) {
      newPatients = count.toString();
    });

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

  Widget _buildHeader() {
    return const PageHeader(
      title: 'Dashboard Overview',
      type: PageHeaderType.plain,
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

  Widget _buildPatientQueue(AsyncValue<List<DashboardQueueItem>> queueState) {
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
                item.status.toLowerCase() != 'completed' &&
                item.status.toLowerCase() != 'finished' &&
                item.status.toLowerCase() != 'cancelled')
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

                final badge = _mapDatabaseStatusToBadge(item.status);

                return AppointmentBar(
                  fullName: item.patientName,
                  time: item.timeSlot,
                  reason: item.reason,
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
                                  'Are you sure you want to cancel ${item.patientName}\'s appointment? This action cannot be undone.',
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

  Widget _buildRightSidePanel(AsyncValue<List<DashboardQueueItem>> queueState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppCalendar(
          selectedDay: _selectedDate,
          onDaySelected: (date) {
            setState(() {
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
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 32),

        // Patients Treated
        Container(
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
                          item.status.trim().toLowerCase() == 'completed' ||
                          item.status.trim().toLowerCase() == 'finished' ||
                          item.status.trim().toLowerCase() == 'paid')
                      .toList();

                  if (treatedQueue.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.0),
                      child: Text(
                        "No patients treated yet today.",
                        style: TextStyle(color: AppTheme.gray500, fontSize: 14),
                      ),
                    );
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
                            fullName: item.patientName,
                            procedure: item.reason,
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

class _DashboardPageState extends ConsumerState<DashboardPage> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final queueState = ref.watch(todayQueueProvider);
    final newPatientsState = ref.watch(newPatientsProvider);

    String dailyProgress = "0/0";
    String lobbyStatus = "0";
    String newPatients = "0";

    queueState.whenData((items) {
      final total = items.length;
      final treated = items.where((i) => 
        i.status.toLowerCase() == 'finished' || 
        i.status.toLowerCase() == 'paid').length;
      final inQueue = items.where((i) => 
        i.status.toLowerCase() == 'waiting' || 
        i.status.toLowerCase() == 'pending' || 
        i.status.toLowerCase() == 'in progress').length;
      
      dailyProgress = "$treated/$total";
      lobbyStatus = inQueue.toString();
    });

    newPatientsState.whenData((count) {
      newPatients = count.toString();
    });

    return Scaffold(
      backgroundColor: AppTheme.gray200,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 32),
                  _buildStatisticsSection(dailyProgress, lobbyStatus, newPatients),
                  const SizedBox(height: 32),
                  _buildPatientQueue(queueState),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: AppTheme.gray200,
              padding: const EdgeInsets.all(32.0),
              child: _buildRightSidebar(queueState),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const PageHeader(
      title: 'Dashboard Overview',
      type: PageHeaderType.plain,
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
          subtitle: "Added today",
          icon: HeroIcons.sparkles,
        ),
      ],
    );
  }

  Widget _buildPatientQueue(AsyncValue<List<DashboardQueueItem>> queueState) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Patients In Queue",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.black500,
                ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: queueState.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Database Error: $error')),
              data: (queueItems) {
                final activeQueue = queueItems.where((item) => 
                  item.status.toLowerCase() != 'finished' && 
                  item.status.toLowerCase() != 'cancelled'
                ).toList();

                if (activeQueue.isEmpty) {
                  return const Center(
                    child: Text(
                      "No active appointments in the queue.",
                      style: TextStyle(color: AppTheme.gray500, fontSize: 16),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: activeQueue.length,
                  itemBuilder: (context, index) {
                    final item = activeQueue[index];
                    return AppointmentBar(
                      fullName: item.patientName,
                      time: item.timeSlot,
                      status: _mapDatabaseStatusToBadge(item.status),
                      onAction: () async {
                        String newStatus = item.status.toLowerCase() == 'waiting' 
                            ? 'Finished' 
                            : 'Cancelled';

                        try {
                          final repo = ref.read(appointmentRepositoryProvider);
                          await repo.updateAppointmentStatus(item.appointmentId, newStatus);
                          
                          ref.invalidate(todayQueueProvider);

                          if (context.mounted) {
                            StatusToast.show(
                              context,
                              title: 'Queue Updated',
                              message: '${item.patientName} marked as $newStatus.',
                              isSuccess: true,
                            );
                          }
                        } catch (e) {
                          if (context.mounted) {
                            StatusToast.show(
                              context,
                              title: 'Error',
                              message: 'Failed to update database.',
                              isSuccess: false,
                            );
                          }
                        }
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRightSidebar(AsyncValue<List<DashboardQueueItem>> queueState) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCalendar(
            selectedDay: _selectedDate,
            onDaySelected: (date) {
              setState(() {
                _selectedDate = date;
              });
            },
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: Button(
              label: "Add Patient Record",
              variant: ButtonVariant.primary,
              heroIcon: HeroIcons.plus,
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 32),
          Text(
            "Patients Treated",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.black500,
                ),
          ),
          const SizedBox(height: 16),
          queueState.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => const Text('Error loading history'),
            data: (queueItems) {
              final treatedQueue = queueItems.where((item) => 
                item.status.toLowerCase() == 'finished' || 
                item.status.toLowerCase() == 'paid'
              ).toList();

              if (treatedQueue.isEmpty) {
                return const Text(
                  "No patients treated yet today.",
                  style: TextStyle(color: AppTheme.gray500, fontSize: 14),
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: treatedQueue.length,
                itemBuilder: (context, index) {
                  final item = treatedQueue[index];
                  return PatientsTreatedBar(
                    fullName: item.patientName,
                    procedure: "Completed at ${item.timeSlot}",
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  BadgeStatus _mapDatabaseStatusToBadge(String dbStatus) {
    switch (dbStatus.toLowerCase()) {
      case 'waiting':
        return BadgeStatus.waiting;
      case 'in progress':
        return BadgeStatus.inProgress;
      case 'finished':
      case 'paid':
        return BadgeStatus.paid; 
      case 'pending':
        return BadgeStatus.pending;
      default:
        return BadgeStatus.waiting;
    }
  }
}