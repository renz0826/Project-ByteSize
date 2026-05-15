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

  // Status update helper
// --- UPDATED HELPER ---
  Future<void> _updateQueueStatus(
      DashboardQueueItem item, String newStatus) async {
    try {
      final repo = ref.read(appointmentRepositoryProvider);
      await repo.updateAppointmentStatus(item.appointmentId, newStatus);

      if (mounted) {
        StatusToast.show(
          context,
          title: 'Queue Updated',
          message: '${item.patientName} marked as $newStatus.',
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

  @override
  Widget build(BuildContext context) {
    final queueState = ref.watch(todayQueueProvider);
    final newPatientsState = ref.watch(newPatientsProvider);

    String dailyProgress = "0/0";
    String lobbyStatus = "0";
    String newPatients = "0";

    queueState.whenData((items) {
      final total = items.length;
      final treated = items
          .where((i) =>
              i.status.toLowerCase() == 'finished' ||
              i.status.toLowerCase() == 'paid')
          .length;
      final inQueue = items
          .where((i) =>
              i.status.toLowerCase() == 'waiting' ||
              i.status.toLowerCase() == 'pending' ||
              i.status.toLowerCase() == 'in progress')
          .length;

      dailyProgress = "$treated/$total";
      lobbyStatus = inQueue.toString();
    });

    newPatientsState.whenData((count) {
      newPatients = count.toString();
    });

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: _buildHeader(),
          ),
          SliverCrossAxisGroup(
            slivers: [
              // LEFT COLUMN (Flex 2)
              SliverCrossAxisExpanded(
                flex: 2,
                sliver: SliverMainAxisGroup(
                  slivers: [
                    // 1. Top Section (Statistics)
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

                    // 2. Bottom Section (The White Card Container)
                    SliverPadding(
                      padding: const EdgeInsets.only(left: 24, right: 12),
                      sliver: SliverToBoxAdapter(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppTheme.white500,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: AppTheme.floatShadow,
                          ),
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Patients In Queue",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.black500,
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

              SliverCrossAxisExpanded(
                flex: 1,
                sliver: SliverMainAxisGroup(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.only(left: 12, right: 24),
                      sliver: SliverToBoxAdapter(
                        child: _buildRightSidebar(queueState),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]));
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
          padding: EdgeInsets.all(32.0),
          child: Center(child: CircularProgressIndicator())),
      error: (error, stack) => Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(child: Text('Database Error: $error'))),
      data: (queueItems) {
        final activeQueue = queueItems
            .where((item) =>
                item.status.toLowerCase() != 'finished' &&
                item.status.toLowerCase() != 'cancelled')
            .toList();

        if (activeQueue.isEmpty) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 48.0),
            child: Center(
              child: Text(
                "No active appointments in the queue.",
                style: TextStyle(color: AppTheme.gray500, fontSize: 16),
              ),
            ),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: activeQueue.length,
          itemBuilder: (context, index) {
            final item = activeQueue[index];
            return AppointmentBar(
              fullName: item.patientName,
              time: item.timeSlot,
              reason: item.reason,
              status: _mapDatabaseStatusToBadge(item.status),

              onPrimaryAction: () async {
                final currentStatus = item.status.trim().toLowerCase();
                if (currentStatus == 'waiting' || currentStatus == 'pending') {
                  final bool? shouldCancel = await showDialog<bool>(
                    context: context,
                    builder: (BuildContext context) {
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
                    _updateQueueStatus(item, 'Cancelled');
                  }
                } else if (currentStatus == 'in progress') {
                  _updateQueueStatus(item, 'Finished');
                }
              },

              // 2. Dropdown Menu Logic
              onMenuSelected: (String actionValue) async {
                switch (actionValue) {
                  case 'admit':
                    _updateQueueStatus(item, 'In Progress');
                    break;
                  case 'send_back':
                    _updateQueueStatus(item, 'Waiting');
                    break;
                  case 'reschedule':
                    // Placeholder for now
                    StatusToast.show(
                      context,
                      title: 'Coming Soon',
                      message: 'Reschedule modal not yet implemented.',
                      isSuccess: true,
                    );
                    break;
                }
              },
            );
          },
        );
      },
    );
  }

  Widget _buildRightSidebar(AsyncValue<List<DashboardQueueItem>> queueState) {
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
            final treatedQueue = queueItems
                .where((item) =>
                    item.status.toLowerCase() == 'finished' ||
                    item.status.toLowerCase() == 'paid')
                .toList();

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
        return BadgeStatus.finished;
      case 'cancelled':
        return BadgeStatus.cancelled;
      default:
        return BadgeStatus.waiting;
    }
  }
}
