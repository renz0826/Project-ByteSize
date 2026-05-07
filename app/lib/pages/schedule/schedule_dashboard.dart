import 'package:dentcity_management_system/pages/schedule/schedule_appointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import '/../style/theme.dart';
import '/../widgets/search_bar.dart';
import '/../widgets/app_pagination.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/page_header.dart';
import '/../widgets/app_info_bar.dart';
import '../../db/database.dart';
import '../../services/date_helper.dart';
import '../../providers/app_providers.dart';
import 'package:heroicons/heroicons.dart';
import '/../widgets/calendar.dart';

//main screen
class ScheduleDashboard extends ConsumerStatefulWidget {
  const ScheduleDashboard({super.key});

  @override
  ConsumerState<ScheduleDashboard> createState() => _ScheduleDashboardState();
}

class _ScheduleDashboardState extends ConsumerState<ScheduleDashboard> {
  // Real Database Lists // TODO: Connect to schedule db
  List<PatientData> _allPatients = [];
  List<PatientData> _filteredRecords = [];

  // Functions to change patients screen states
  PatientCompanion? _draftPatient;

  int _currentIndex = 0;

  //state for search, filter, and pagination
  final TextEditingController _searchController = TextEditingController();
  int _currentPage = 1;
  final int _recordsPerPage = 8;
  String? _selectedStatus;
  int _formSessionId = 0;

  @override
  void initState() {
    super.initState();
    _loadPatients();
  }

  // Fetch real data from the database
  Future<void> _loadPatients() async {
    final repository = ref.read(patientRepositoryProvider);
    final patients = await repository.getAllPatients();
    setState(() {
      _allPatients = patients;
      _filteredRecords = patients;
      _applyFilters();
    });
  }

  // Send user to add_patient.dart
  void _goToScheduleAppointment() {
    setState(() => _currentIndex = 1);
  }

  // Send user back to this page
  void _goBackToMain() {
    setState(() => _currentIndex);
  }

// ! Dummy data specifically for testing the Schedule Table UI
// TODO: Replace after testing.
  final List<Map<String, dynamic>> mockAppointments = [
    {
      'patientName': 'Dela Cruz, Juan',
      'date': DateTime(2024, 11, 15),
      'time': '09:00 AM',
      'reason': 'Teeth Cleaning',
    },
    {
      'patientName': 'Smith, Anna',
      'date': DateTime(2024, 11, 15),
      'time': '10:30 AM',
      'reason': 'Root Canal',
    },
    {
      'patientName': 'Garcia, Maria',
      'date': DateTime(2024, 11, 16),
      'time': '01:00 PM',
      'reason': 'Initial Consultation',
    },
    {
      'patientName': 'Lee, Jonathan',
      'date': DateTime(2024, 11, 16),
      'time': '03:15 PM',
      'reason': 'Braces Adjustment',
    },
    {
      'patientName': 'Santos, Miguel',
      'date': DateTime(2024, 11, 17),
      'time': '11:00 AM',
      'reason': 'Tooth Extraction',
    },
  ];

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
      _loadPatients();
      setState(() => _currentIndex = 0);
    }
  }

  //number of items to show per page
  List<PatientData> get _currentPageRecords {
    final start = (_currentPage - 1) * _recordsPerPage;
    final end = (start + _recordsPerPage).clamp(0, _filteredRecords.length);
    return _filteredRecords.sublist(start, end);
  }

  //total number of pages based on the filtered records
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

  // Centralized filter logic applied to real data
  void _applyFilters() {
    final query = _searchController.text.toLowerCase();

    _filteredRecords = _allPatients.where((p) {
      final fullName = '${p.firstName}${p.lastName}'.toLowerCase();
      final matchesSearch = fullName.contains(query);

      bool matchesStatus = true;
      if (_selectedStatus == 'Active') {
        matchesStatus = p.isArchived == false;
      } else if (_selectedStatus == 'Archived') {
        matchesStatus = p.isArchived == true;
      }

      return matchesSearch && matchesStatus;
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
      children: [_buildMainDashboard(), _buildScheduleForm()],
    );
  }

// Main Schedule Dashboard
  Widget _buildMainDashboard() {
    return // Set this as Index 0: The Main Patient Dashboard
        Scaffold(
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
                          const SizedBox(height: 8),
                          _buildTableHeader(),
                        ]),
                      ),
                    ),
                    //table rows
                    SliverPadding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      sliver: mockAppointments
                              .isEmpty // TODO: Connect to DB variable
                          ? SliverToBoxAdapter(
                              child: _buildEmptyState(),
                            )
                          : SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) => _buildTableRow(
                                    mockAppointments[
                                        index]), // TODO: Connect to DB variable
                                childCount: mockAppointments
                                    .length, // TODO: Connect to DB variable
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
                                AppCalendar(),
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

  Widget _buildScheduleForm() {
    // Setting this as Index 1: When user clicks schedule appointment
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
                onSave: _goBackToMain),
          ),
        ],
      ),
    );
  }
  // Schedule Form

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

  //filter chips - all/archived/active
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
          SizedBox(width: 2),
          Expanded(flex: 2, child: Text('Date', style: headerStyle)),
          SizedBox(width: 6),
          Expanded(flex: 2, child: Text('Time', style: headerStyle)),
          SizedBox(width: 8),
          Expanded(flex: 2, child: Text('Reason ', style: headerStyle)),
          SizedBox(width: 62, child: Text('Actions', style: headerStyle)),
        ],
      ),
    );
  }

// Notice we changed the parameter to accept our Map!
  Widget _buildTableRow(Map<String, dynamic> appointment) {
    return ScheduleBar(
      // Dynamically injecting the data into your custom widget
      fullName: appointment['patientName'],
      date: appointment['date'], // Assuming your ScheduleBar expects a DateTime
      time: appointment['time'],
      procedure: appointment['reason'],
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
                  : 'No records found.',
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
