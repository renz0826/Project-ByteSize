import 'package:dentcity_management_system/widgets/status_toast.dart';
import 'package:dentcity_management_system/widgets/warning_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import 'package:heroicons/heroicons.dart';
import '/../style/theme.dart';
import '/../widgets/search_bar.dart';
import '/../widgets/app_pagination.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/page_header.dart';
import '/../widgets/app_info_bar.dart';
import '/../widgets/calendar.dart';
import '../../db/database.dart';
import '../../services/scheduling_service.dart';
import '../schedule/schedule_appointment.dart';
import '../schedule/view_appointment.dart';
import '../../providers/app_providers.dart';

class JoinedAppointment {
  final AppointmentData appointment;
  final PatientData patient;
  JoinedAppointment({required this.appointment, required this.patient});
}

class ScheduleDashboard extends ConsumerStatefulWidget {
  const ScheduleDashboard({super.key});

  @override
  ConsumerState<ScheduleDashboard> createState() => _ScheduleDashboardState();
}

class _ScheduleDashboardState extends ConsumerState<ScheduleDashboard> {
  List<JoinedAppointment> _allAppointments = []; // list of all appointments
  List<JoinedAppointment> _filteredRecords =
      []; // list of filtered records (may be completed or upcoming)
  List<PatientData> _allPatients = []; // list to ge tall patients
  JoinedAppointment? _selectedAppointment;
  int _currentIndex = 0;
  int _previousIndex = 0; // set the current index to 0

  final TextEditingController _searchController = TextEditingController();
  int _currentPage = 1;
  final int _recordsPerPage = 8;
  String _selectedStatus = 'Upcoming';
  int _formSessionId = 0;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _loadAppointments();
  }

  Future<void> _loadAppointments() async {
    // use repository to load appointment data from the database
    final db = ref.read(databaseProvider);
    final patients = await db.select(db.patient).get();

    final query = db.select(db.appointment).join([
      drift.innerJoin(
          // use inner join here
          db.patient,
          db.patient.patientId.equalsExp(db.appointment.patientId)),
    ]);

    final results = await query.get();
    final appointments = results.map((row) {
      return JoinedAppointment(
        appointment: row.readTable(db.appointment), // read appointments to list
        patient: row.readTable(db.patient), // read patients to list
      );
    }).toList();

    setState(() {
      _allPatients = patients;
      _allAppointments = appointments;
      _applyFilters(); // apply the filter that earliest times should be on top
    });
  }

  void _applyFilters() {
    final query = _searchController.text.toLowerCase();

    List<JoinedAppointment> filtered = _allAppointments.where((item) {
      final p = item.patient;
      final a = item.appointment;
      final fullName = '${p.firstName} ${p.lastName}'.toLowerCase();
      final matchesSearch = fullName.contains(query);

      final matchesDate = a.scheduleDateTime.year == _selectedDate.year &&
          a.scheduleDateTime.month == _selectedDate.month &&
          a.scheduleDateTime.day == _selectedDate.day;

      bool matchesStatus = false;

      // THE FIX: Prevent null crashes by defaulting to 'waiting'
      final dbStatus = (a.status).trim().toLowerCase();

      if (_selectedStatus  != 'All') {
        if (_selectedStatus == 'Completed') {
          matchesStatus = dbStatus == 'completed' || dbStatus == 'finished';
        } else if (_selectedStatus == 'Upcoming') {
          matchesStatus = dbStatus == 'waiting' ||
              dbStatus == 'pending' ||
              dbStatus == 'in progress' ||
              dbStatus == 'scheduled' ||
              dbStatus == 'upcoming' ||
              dbStatus == 'booked';
        } else {
          matchesStatus = dbStatus == _selectedStatus.toLowerCase();
        }
      } else {
        matchesStatus = dbStatus != 'cancelled';
      }

      return matchesSearch && matchesDate && matchesStatus;
    }).toList();

    // Sorting Function
    filtered.sort((a, b) {
      int timeA = SchedulingService.timeToMinutes(a.appointment.timeSlot);
      int timeB = SchedulingService.timeToMinutes(b.appointment.timeSlot);
      return timeA.compareTo(timeB);
    });

    setState(() {
      _filteredRecords = filtered;
    });
  }

  void _goBackToMain() async {
    await _loadAppointments();

    if (mounted) {
      setState(() {
        _currentIndex = 0;
      });
    }
  }

  // Dynamic Popup when clicking back (Allows going back to View or Dashboard)
  Future<void> _confirmReturnToPrevious({int targetIndex = 0}) async {
    final bool? shouldDiscard = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return WarningDialog(
            isCaution: false,
            title: "Discard Unsaved Changes?",
            content:
                "Are you sure you want to return to the appointment dashboard? Any unsaved data will be lost.",
            secondaryAction: "Keep Editing",
            primaryAction: "Discard");
      },
    );

    if (shouldDiscard == true) {
      _loadAppointments;
      setState(() {
        if (_previousIndex == 0) {
          _selectedAppointment = null;
        }
        _currentIndex = _previousIndex; // Dynamically go back!
      });
    }
  }

  Future<void> _cancelAppointmentConfirmation(int appointmentId) async {
    // function for the cancellation of appointments
    final bool? shouldCancel = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return WarningDialog(
            isCaution: false,
            title: 'Cancel Appointment?',
            content:
                'Are you sure you want to cancel this appointment? This action is cannot be undone.',
            secondaryAction: "Keep Appointment",
            primaryAction: "Cancel Appointment");
      },
    );

    if (shouldCancel == true) {
      final repo = ref.read(appointmentRepositoryProvider);
      await repo.updateAppointmentStatus(
          appointmentId, 'Cancelled'); // update the specific attribute: status

      if (mounted) {
        StatusToast.show(
          context,
          title: "Appointment Cancelled",
          message: "Appointment has been successfully cancelled.",
          isSuccess: true,
        ); // confirmation message
      }
      _goBackToMain(); // send user back to main afterwards
    }
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: _currentIndex,
      children: [
        _buildMainDashboard(),
        _buildScheduleForm(),
        _buildViewAppointment()
      ],
    );
  }

  Widget _buildMainDashboard() {
    return Scaffold(
      backgroundColor: AppTheme.gray200,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: PageHeader(
              title: 'Patient Schedules',
              type: PageHeaderType.plain,
            ),
          ),
          SliverCrossAxisGroup(
            slivers: [
              SliverCrossAxisExpanded(
                  flex: 2,
                  sliver: SliverMainAxisGroup(slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.only(left: 24, right: 12),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          _buildSearchBar(),
                          const SizedBox(height: 24),
                          _buildFilterChips(),
                          const SizedBox(height: 24),
                          _buildTableHeader(),
                        ]),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      sliver: _filteredRecords.isEmpty
                          ? SliverToBoxAdapter(
                              child: _buildEmptyState(),
                            )
                          : SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) =>
                                    _buildTableRow(_currentPageRecords[index]),
                                childCount: _currentPageRecords.length,
                              ),
                            ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 24, top: 16),
                      sliver: SliverToBoxAdapter(
                        child: _filteredRecords.isEmpty
                            ? const SizedBox.shrink()
                            : AppPagination(
                                currentPage: _currentPage,
                                totalPages: _totalPages,
                                onPageChanged: (newPage) =>
                                    setState(() => _currentPage = newPage),
                              ),
                      ),
                    ),
                  ])),
              SliverCrossAxisExpanded(
                  flex: 1,
                  sliver: SliverMainAxisGroup(slivers: [
                    SliverPadding(
                        padding: const EdgeInsets.only(left: 12, right: 24),
                        sliver: SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            return Column(
                              spacing: 20,
                              children: [
                                AppCalendar(
                                  selectedDay: _selectedDate,
                                  onDaySelected: (newDate) {
                                    setState(() {
                                      _selectedDate = newDate;
                                      _applyFilters();
                                    });
                                  },
                                ),
                                SizedBox(
                                  child: Button(
                                    label: 'Schedule an Appointment',
                                    variant: ButtonVariant.primary,
                                    heroIcon: HeroIcons.calendar,
                                    width: double.infinity,
                                    onPressed: () {
                                      setState(() {
                                        _formSessionId++;
                                        _selectedAppointment =
                                            null; // Forces CREATE state
                                        _previousIndex = _currentIndex;
                                        _currentIndex = 1;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            );
                          }, childCount: 1),
                        )),
                  ])),
            ],
          ),
        ],
      ),
    );
  }

  List<JoinedAppointment> get _currentPageRecords {
    final start = (_currentPage - 1) * _recordsPerPage;
    final end = (start + _recordsPerPage).clamp(0, _filteredRecords.length);
    return _filteredRecords.sublist(start, end);
  }

  int get _totalPages => (_filteredRecords.length / _recordsPerPage).ceil();

  void _onSearch(String query) {
    setState(() {
      _currentPage = 1;
      _applyFilters();
    });
  }

  void _onFilter(String status) {
    setState(() {
      _currentPage = 1;
      _selectedStatus = status;
      _applyFilters();
    });
  }

  Widget _buildTableRow(JoinedAppointment joinedRecord) {
    final patient = joinedRecord.patient;
    final appointment = joinedRecord.appointment;

    return GestureDetector(
      onTap: () => setState(() {
        _selectedAppointment = joinedRecord;
        _previousIndex = _currentIndex;
        _currentIndex = 2;
      }),
      child: ScheduleBar(
        fullName: '${patient.lastName}, ${patient.firstName} ${patient.suffix}',
        date: appointment.scheduleDateTime,
        time: appointment.timeSlot,
        procedure: appointment.reasonForVisit,
        onMenuSelected: (String actionValue) async {
          switch (actionValue) {
            case 'view_appointment': // if user clicks view appointment option -> allows to use cancel and edit options
              setState(() {
                _selectedAppointment = joinedRecord;
                _previousIndex = _currentIndex;
                _currentIndex = 2;
              });
              break;

            case 'edit_appointment':
              setState(() {
                _formSessionId++; // error handling, in case user edits the same page many times
                _selectedAppointment = joinedRecord;
                _previousIndex = _currentIndex;
                _currentIndex = 1;
              });
              break;

            case 'cancel_appointment': // cancel appointment (call out function on top)
              _cancelAppointmentConfirmation(appointment.appointmentId);
              break;
          }
        },
      ),
    );
  }

  Widget _buildScheduleForm() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            title: 'Back to Schedules',
            type: PageHeaderType.withBack,
            onBack: _confirmReturnToPrevious,
          ),
          Transform.translate(
            offset: const Offset(0, -30),
            child: ScheduleAppointmentForm(
              key: ValueKey(_formSessionId),
              activePatients: _allPatients,
              appointmentToEdit: _selectedAppointment,
              onSave: _goBackToMain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewAppointment() {
    if (_selectedAppointment == null) {
      return const SizedBox.shrink(); // Renders nothing if no data is loaded
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            title: 'Back to Schedules',
            type: PageHeaderType.withBack,
            onBack: _goBackToMain,
          ),
          Transform.translate(
            offset: const Offset(0, -30),
            child: ViewAppointment(
              key: ValueKey(_selectedAppointment!.appointment.appointmentId),
              appointmentData: {
                // display the different appointment datas in the database
                'patientName':
                    '${_selectedAppointment?.patient.lastName}, ${_selectedAppointment?.patient.firstName}',
                'date': _selectedAppointment?.appointment.scheduleDateTime,
                'time': _selectedAppointment?.appointment.timeSlot,
                'reason': _selectedAppointment?.appointment.reasonForVisit,
              },
              onEdit: () {
                setState(() {
                  _formSessionId++;
                  _previousIndex = _currentIndex;
                  _currentIndex = 1; // Switches directly to edit mode
                });
              },
              onCancel: () => _cancelAppointmentConfirmation(
                  _selectedAppointment!
                      .appointment.appointmentId), // Pass cancellation ID
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return AppSearchBar(
      controller: _searchController,
      onChanged: _onSearch,
      hintText: 'Search for a Patient...',
      onFilter: () {},
    );
  }

  Widget _buildFilterChips() {
    final filters = ['Upcoming', 'Completed'];
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: filters.map((filter) {
        final isSelected = _selectedStatus == filter;
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: SizedBox(
            height: 32,
            child: Button(
              fontSize: 14,
              label: filter,
              variant: isSelected
                  ? ButtonVariant.smallPrimary
                  : ButtonVariant.smallSecondary,
              onPressed: () => _onFilter(filter),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTableHeader() {
    final headerStyle = AppTheme.textTheme.bodyLarge;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 20),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text('Patient', style: headerStyle)),
          const SizedBox(width: 6),
          Expanded(flex: 2, child: Text('Date', style: headerStyle)),
          const SizedBox(width: 6),
          Expanded(flex: 2, child: Text('Time', style: headerStyle)),
          const SizedBox(width: 8),
          Expanded(flex: 2, child: Text('Reason ', style: headerStyle)),
          SizedBox(width: 62, child: Text('Actions', style: headerStyle)),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Text(
              _searchController.text.isNotEmpty
                  ? "Sorry, We couldn't find anything that matches '${_searchController.text}'."
                  : 'No appointments scheduled for ${SchedulingService.formatDate(_selectedDate)}.',
              style: AppTheme.textTheme.bodyMedium?.copyWith(
                color: AppTheme.gray400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
