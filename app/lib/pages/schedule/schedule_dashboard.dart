// file: schedule_dashboard.dart
import '../schedule/schedule_appointment.dart';
import '../schedule/view_appointment.dart';
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
  List<JoinedAppointment> _allAppointments = [];
  List<JoinedAppointment> _filteredRecords = [];
  List<PatientData> _allPatients = [];
  JoinedAppointment? _selectedAppointment;
  int _currentIndex = 0;

  final TextEditingController _searchController = TextEditingController();
  int _currentPage = 1;
  final int _recordsPerPage = 8;
  String? _selectedStatus;
  int _formSessionId = 0;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _loadAppointments();
  }

  Future<void> _loadAppointments() async {
    final db = ref.read(databaseProvider);
    final patients = await db.select(db.patient).get();

    final query = db.select(db.appointment).join([
      drift.innerJoin(
          db.patient, db.patient.patientId.equalsExp(db.appointment.patientId)),
    ]);

    final results = await query.get();
    final appointments = results.map((row) {
      return JoinedAppointment(
        appointment: row.readTable(db.appointment),
        patient: row.readTable(db.patient),
      );
    }).toList();

    setState(() {
      _allPatients = patients;
      _allAppointments = appointments;
      _applyFilters();
    });
  }

  // --- NEW SORTING HELPER ---
  /// Converts "08:30 AM" into total minutes (510) for sorting
  int _timeToMinutes(String? timeSlot) {
    if (timeSlot == null || timeSlot.isEmpty || timeSlot == '-') return 0;
    try {
      final parts = timeSlot.split(' ');
      final time = parts[0];
      final amPm = parts[1];
      final timeParts = time.split(':');
      int hour = int.parse(timeParts[0]);
      int minute = int.parse(timeParts[1]);

      if (amPm == 'PM' && hour != 12) hour += 12;
      if (amPm == 'AM' && hour == 12) hour = 0;
      return (hour * 60) + minute;
    } catch (e) {
      return 0;
    }
  }

  void _applyFilters() {
    final query = _searchController.text.toLowerCase();

    // 1. Filter results based on search/date/status
    List<JoinedAppointment> filtered = _allAppointments.where((item) {
      final p = item.patient;
      final a = item.appointment;
      final fullName = '${p.firstName} ${p.lastName}'.toLowerCase();
      final matchesSearch = fullName.contains(query);
      final matchesDate = a.scheduleDateTime.year == _selectedDate.year &&
          a.scheduleDateTime.month == _selectedDate.month &&
          a.scheduleDateTime.day == _selectedDate.day;
      bool matchesStatus = true;
      if (_selectedStatus != null && _selectedStatus != 'All') {
        matchesStatus =
            a.status.toLowerCase() == _selectedStatus!.toLowerCase();
      }
      return matchesSearch && matchesDate && matchesStatus;
    }).toList();

    // 2. APPLY DEFAULT SORT (Earliest to Latest)
    filtered.sort((a, b) {
      int timeA = _timeToMinutes(a.appointment.timeSlot);
      int timeB = _timeToMinutes(b.appointment.timeSlot);
      return timeA.compareTo(timeB);
    });

    setState(() {
      _filteredRecords = filtered;
    });
  }

  // ... (Rest of the original widget building logic remains the same)
  // Ensure _buildTableRow uses: time: appointment.timeSlot ?? '-'
  // Ensure _buildTableRow uses: procedure: appointment.reasonForVisit ?? 'Consultation'

  void _goBackToMain() {
    setState(() {
      _currentIndex = 0;
      _loadAppointments();
    });
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
                                      });
                                      setState(() => _currentIndex = 1);
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

  void _onFilter(String? status) {
    setState(() {
      _currentPage = 1;
      _selectedStatus = status;
      _applyFilters();
    });
  }

  Widget _buildTableRow(JoinedAppointment joinedRecord) {
    final patient = joinedRecord.patient;
    final appointment = joinedRecord.appointment;

    return ScheduleBar(
      fullName: '${patient.lastName}, ${patient.firstName}',
      date: appointment.scheduleDateTime,
      time: appointment.timeSlot ?? '-',
      procedure: appointment.reasonForVisit ?? 'Consultation',
      onMenuSelected: (String actionValue) async {
        setState(() => _selectedAppointment = joinedRecord);
        if (actionValue == 'view_appointment')
          setState(() => _currentIndex = 2);
      },
    );
  }

  Widget _buildScheduleForm() => ScheduleAppointmentForm(
      activePatients: _allPatients, onSave: _goBackToMain);

  Widget _buildViewAppointment() => ViewAppointment(appointmentData: {
        'patientName':
            '${_selectedAppointment?.patient.lastName}, ${_selectedAppointment?.patient.firstName}',
        'date': _selectedAppointment?.appointment.scheduleDateTime,
        'time': _selectedAppointment?.appointment.timeSlot,
        'reason': _selectedAppointment?.appointment.reasonForVisit,
      }, onEdit: () {});

  Widget _buildSearchBar() {
    return AppSearchBar(
      controller: _searchController,
      onChanged: _onSearch,
      hintText: 'Search for a Patient...',
      onFilter: () {},
    );
  }

  Widget _buildFilterChips() {
    final filters = ['All', 'Upcoming', 'Completed'];
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: filters.map((filter) {
        final isSelected = _selectedStatus == filter ||
            (filter == 'All' && _selectedStatus == null);
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
              onPressed: () => _onFilter(filter == 'All' ? null : filter),
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
