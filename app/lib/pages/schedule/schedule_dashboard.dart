import '../schedule/schedule_appointment.dart';
import '../schedule/view_appointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import 'package:intl/intl.dart'; 
import 'package:heroicons/heroicons.dart';
import '/../style/theme.dart';
import '/../widgets/search_bar.dart';
import '/../widgets/app_pagination.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/page_header.dart';
import '/../widgets/app_info_bar.dart';
import '/../widgets/calendar.dart';
import '../../db/database.dart';
import '../../services/date_helper.dart';
import '../../providers/app_providers.dart';

// Helper class to hold both the patient and their appointment data together
class JoinedAppointment {
  final AppointmentData appointment;
  final PatientData patient;

  JoinedAppointment({required this.appointment, required this.patient});
}

//main screen
class ScheduleDashboard extends ConsumerStatefulWidget {
  const ScheduleDashboard({super.key});

  @override
  ConsumerState<ScheduleDashboard> createState() => _ScheduleDashboardState();
}

class _ScheduleDashboardState extends ConsumerState<ScheduleDashboard> {
  // Real Database Lists
  List<JoinedAppointment> _allAppointments = [];
  List<JoinedAppointment> _filteredRecords = [];

  JoinedAppointment? _selectedAppointment;

  int _currentIndex = 0;

  // State for search, filter, pagination, and CALENDAR
  final TextEditingController _searchController = TextEditingController();
  int _currentPage = 1;
  final int _recordsPerPage = 8;
  String? _selectedStatus;
  int _formSessionId = 0;
  
  // State for the calendar (Defaults to today)
  DateTime _selectedDate = DateTime.now(); 

  @override
  void initState() {
    super.initState();
    _loadAppointments(); // Fetch from real DB on load
  }

  // Fetch real data from the database using a Join
  Future<void> _loadAppointments() async {
    final db = ref.read(databaseProvider); 
    
    // Join the Appointment table with the Patient table using patientId
    final query = db.select(db.appointment).join([
      drift.innerJoin(
        db.patient, 
        db.patient.patientId.equalsExp(db.appointment.patientId)
      ),
    ]);

    final results = await query.get();
    
    final appointments = results.map((row) {
      return JoinedAppointment(
        appointment: row.readTable(db.appointment),
        patient: row.readTable(db.patient),
      );
    }).toList();

    setState(() {
      _allAppointments = appointments;
      _applyFilters();
    });
  }

  // Send user to schedule form
  void _goToScheduleAppointment() {
    setState(() {
      _selectedAppointment = null;
      _currentIndex = 1;
    });
  }

  // Send user to edit state
  void _goToEditAppointment() {
    setState(() {
      _formSessionId++;
      _currentIndex = 1;
    });
  }

  // Send user back to this page
  void _goBackToMain() {
    setState(() {
      _currentIndex = 0;
      _loadAppointments(); // Refresh data when coming back from a form
    });
  }

  // Popup when clicking back to dashboard
  Future<void> _confirmReturnToDashboard() async {
    final bool? shouldDiscard = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Discard Changes?'),
          content: const Text(
              'Are you sure you want to return to the dashboard? Any unsaved data will be lost.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text(
                'Discard',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );

    if (shouldDiscard == true) {
      _loadAppointments();
      setState(() => _currentIndex = 0);
    }
  }

  // Number of items to show per page
  List<JoinedAppointment> get _currentPageRecords {
    final start = (_currentPage - 1) * _recordsPerPage;
    final end = (start + _recordsPerPage).clamp(0, _filteredRecords.length);
    return _filteredRecords.sublist(start, end);
  }

  // Total number of pages based on the filtered records
  int get _totalPages => (_filteredRecords.length / _recordsPerPage).ceil();

  // Search logic
  void _onSearch(String query) {
    setState(() {
      _currentPage = 1;
      _applyFilters();
    });
  }

  // Filter function for the status chips
  void _onFilter(String? status) {
    setState(() {
      _currentPage = 1;
      _selectedStatus = status;
      _applyFilters();
    });
  }

  // Centralized filter logic applied to real data AND Calendar
  void _applyFilters() {
    final query = _searchController.text.toLowerCase();

    _filteredRecords = _allAppointments.where((item) {
      final p = item.patient;
      final a = item.appointment;

      // 1. Search Bar Filter
      final fullName = '${p.firstName} ${p.lastName}'.toLowerCase();
      final matchesSearch = fullName.contains(query);

      // 2. Calendar Filter: Check if appointment matches the selected day
      final matchesDate = a.scheduleDateTime.year == _selectedDate.year &&
                          a.scheduleDateTime.month == _selectedDate.month &&
                          a.scheduleDateTime.day == _selectedDate.day;

      // 3. Status Filter
      bool matchesStatus = true;
      if (_selectedStatus != null && _selectedStatus != 'All') {
         matchesStatus = a.status.toLowerCase() == _selectedStatus!.toLowerCase();
      }

      // Record must match the Search Bar AND the Calendar Date AND the Status Chip
      return matchesSearch && matchesDate && matchesStatus;
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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

// Main Schedule Dashboard
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
                    //search bar, filter, and table header
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
                    //table rows
                    SliverPadding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      sliver: _filteredRecords.isEmpty 
                          ? SliverToBoxAdapter(
                              child: _buildEmptyState(),
                            )
                          : SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) => _buildTableRow(
                                    _currentPageRecords[index] 
                                ), 
                                childCount: _currentPageRecords.length, 
                              ),
                            ),
                    ),
                    //pagination
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
                    // calendar and button
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
                                      _goToScheduleAppointment();
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

  // Schedule Form
  Widget _buildScheduleForm() {
    Map<String, dynamic>? patientToEdit;
    if (_selectedAppointment != null) {
      final p = _selectedAppointment!.patient;
      patientToEdit = {
        'fullName': '${p.lastName}, ${p.firstName}',
      };
    }
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            title: 'Back to Schedules',
            type: PageHeaderType.withBack,
            onBack: _confirmReturnToDashboard,
          ),
          Transform.translate(
            offset: const Offset(0, -30),
            child: ScheduleAppointmentForm(
                activePatients: [], 
                key: ValueKey(_formSessionId),
                existingPatient: patientToEdit,
                onSave: _goBackToMain),
          ),
        ],
      ),
    );
  }

  // --- CHANGED: View Appointment now converts data back to Map ---
  Widget _buildViewAppointment() {
    Map<String, dynamic>? legacyFormat;
    
    if (_selectedAppointment != null) {
      final p = _selectedAppointment!.patient;
      final a = _selectedAppointment!.appointment;
      
      legacyFormat = {
        'patientName': '${p.lastName}, ${p.firstName}',
        'date': a.scheduleDateTime, // Your view_appointment expects a DateTime here!
        'time': DateFormat('hh:mm a').format(a.scheduleDateTime),
        'reason': a.toJson().containsKey('reason') ? a.toJson()['reason'] : 'Consultation',
      };
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
                  appointmentData: legacyFormat, // Pass the converted Map here!
                  onEdit: _goToEditAppointment)),
        ],
      ),
    );
  }

  //search bar
  Widget _buildSearchBar() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AppSearchBar(
                controller: _searchController,
                onChanged: _onSearch,
                hintText: 'Search for a Patient...',
                onFilter: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  //filter chips - all/upcoming/completed
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
              onPressed: () {
                setState(() {
                  _onFilter(filter == 'All' ? null : filter);
                });
              },
            ),
          ),
        );
      }).toList(),
    );
  }

  //table header
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

// Build Table Row configured for Database Record
  Widget _buildTableRow(JoinedAppointment joinedRecord) {
    final patient = joinedRecord.patient;
    final appointment = joinedRecord.appointment;
    
    // Formatting data for the UI
    final fullName = '${patient.lastName}, ${patient.firstName}';
    final timeString = DateFormat('hh:mm a').format(appointment.scheduleDateTime);
    
    final reasonString = (appointment.toJson().containsKey('reason')) 
        ? appointment.toJson()['reason'].toString() 
        : 'Consultation';

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAppointment = joinedRecord;
          _currentIndex = 2;
        });
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: ScheduleBar(
          fullName: fullName,
          date: appointment.scheduleDateTime, // FIX: Pass the raw DateTime directly!
          time: timeString, 
          procedure: reasonString, 

          // Makes the menu popup functional
          onMenuSelected: (String actionValue) async {
            setState(() {
              _selectedAppointment = joinedRecord;
            });

            switch (actionValue) {
              case 'view_appointment':
                setState(() => _currentIndex = 2);
                break;
              case 'edit_appointment':
                _goToEditAppointment();
                break;
              case 'cancel_appointment':
                final repo = ref.read(appointmentRepositoryProvider);
                await repo.updateAppointmentStatus(appointment.appointmentId, 'Cancelled');
                _loadAppointments(); // Refresh the screen
                break;
            }
          },
        ),
      ),
    );
  }

  // empty state
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
                  : 'No appointments scheduled for ${DateFormat('MMM dd, yyyy').format(_selectedDate)}.',
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