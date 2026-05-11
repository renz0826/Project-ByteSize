import 'package:dentcity_management_system/widgets/status_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import '/../style/theme.dart';
import '/../widgets/search_bar.dart';
import '/../widgets/app_pagination.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/filter_dropdown.dart';
import '/../widgets/page_header.dart';
import '/../widgets/app_info_bar.dart';
import '../../db/database.dart';
import '../../services/date_helper.dart';
import '../../providers/app_providers.dart';
import 'add_patient.dart';
import 'add_clinical_record.dart';
import 'package:heroicons/heroicons.dart';
import '../../widgets/discard_dialog.dart';

//main screen
class PatientDashboard extends ConsumerStatefulWidget {
  const PatientDashboard({super.key});

  @override
  ConsumerState<PatientDashboard> createState() => _PatientDashboardState();
}

class _PatientDashboardState extends ConsumerState<PatientDashboard> {
  // Real Database Lists
  List<PatientData> _allPatients = [];
  List<PatientData> _filteredRecords = [];

  // Functions to change patients screen states
  PatientCompanion? _draftPatient;
  ClinicalRecordCompanion? _draftClinicalRecord;

  // Bug Fix: Using IndexedStack to prevent form data from being deleted when clicking back
  int _currentIndex = 0;

  //state for search, filter, and pagination
  final TextEditingController _searchController = TextEditingController();
  int _currentPage = 1;
  final int _recordsPerPage = 8;
  String? _selectedStatus;
  int _formSessionId = 0;

  // Toast State Variables
  bool _showToast = false;
  bool _toastIsSuccess = true;
  String _toastTitle = "";
  String _toastMessage = "";

  @override
  void initState() {
    super.initState();
    _loadPatients();
  }

  // Trigger toast function
  void _triggerToast(bool isSuccess, String title, String message) {
    if (!mounted) return;

    setState(() {
      _showToast = true;
      _toastIsSuccess = isSuccess;
      _toastTitle = title;
      _toastMessage = message;
    });

    // Auto hide the toast after 3 seconds? (This can be changed)
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted && _showToast) {
        setState(() {
          _showToast = false;
        });
      }
    });
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
  void _goToAddPatient() {
    setState(() => _currentIndex = 1);
  }

  // Send user to add_clinical_record.dart
  void _goToAddClinicalRecord(PatientCompanion patientData) {
    setState(() {
      _draftPatient = patientData;
      _currentIndex = 2;
    });
  }

  // Send user back to this page
  void _goBackToMain(ClinicalRecordCompanion clinicalData) async {
    try {
      final db = ref.read(databaseProvider);
      final newPatientId = await db.into(db.patient).insert(_draftPatient!);
      final recordWithId = clinicalData.copyWith(
        patientId: drift.Value(newPatientId),
      );

      await db.into(db.clinicalRecord).insert(recordWithId);

      await _loadPatients();

      // Trigger the toast here
      _triggerToast(true, "Success",
          "New Patient has been successfully created"); // toast message

      setState(() {
        _draftClinicalRecord = clinicalData;
        _currentIndex = 0;
      });
    } catch (e) {
      print("Database Error: $e");
      _triggerToast(false, "Error", "Failed to save record: $e");
    }
  }

  Future<void> _confirmReturnToDashboard() async {
    final bool? shouldDiscard = await DiscardDialog.show(context);

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
    return Stack(
      children: [
        IndexedStack(
          index: _currentIndex,
          children: [
            // Set this as Index 0: The Main Patient Dashboard
            Scaffold(
              backgroundColor: AppTheme.gray200,
              body: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: PageHeader(
                      title: 'Patient Records',
                      type: PageHeaderType.plain,
                    ),
                  ),
                  //search bar, filter, and table header
                  SliverPadding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
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
                    sliver: _currentPageRecords.isEmpty
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
                ],
              ),
            ),

            // Setting this as Index 1: When user clicks add record
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageHeader(
                    title: 'Back to Records',
                    type: PageHeaderType.withBack,
                    onBack: _confirmReturnToDashboard,
                  ),
                  Transform.translate(
                    offset: const Offset(0, -30),
                    child: AddPatientForm(
                        key: ValueKey(_formSessionId),
                        onNext: (data) => _goToAddClinicalRecord(data),
                        onBack: () {
                          _loadPatients();
                          setState(() => _currentIndex = 0);
                        }),
                  ),
                ],
              ),
            ),

            // Setting this as Index 2: When user clicks next after adding a patient record
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageHeader(
                    title: 'Back to Records',
                    type: PageHeaderType.withBack,
                    onBack: _confirmReturnToDashboard,
                  ),
                  Transform.translate(
                    offset: const Offset(0, -30),
                    child: AddClinicalRecordForm(
                      patientId: 0,
                      key: ValueKey(_formSessionId),
                      onPrevious: () {
                        setState(() => _currentIndex = 1);
                      },
                      onFinish: (clinicalData) => _goBackToMain(clinicalData),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (_showToast)
          Positioned(
            bottom: 32, 
            right:
                32, 
            
            child: StatusToast(
              isSuccess: _toastIsSuccess,
              title: _toastTitle,
              message: _toastMessage,
              onClose: () {
                setState(() {
                  _showToast = false;
                });
              },
            ),
          )
      ],
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
            const SizedBox(width: 26),
            SizedBox(
              height: 48,
              child: Theme(
                data: Theme.of(context).copyWith(
                  elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
                child: Button(
                  label: 'Add New Record',
                  variant: ButtonVariant.primary,
                  heroIcon: HeroIcons.documentPlus,
                  onPressed: () {
                    setState(() {
                      _formSessionId++;
                    });
                    _goToAddPatient();
                  },
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            _buildFilterChips(),
            const Spacer(),
            AppSortDropdown(
              onSortChanged: (value) {
                setState(() {
                  switch (value) {
                    case 'Name (A-Z)':
                      _filteredRecords
                          .sort((a, b) => a.firstName.compareTo(b.lastName));
                      break;
                    case 'Name (Z-A)':
                      _filteredRecords
                          .sort((a, b) => b.firstName.compareTo(a.lastName));
                      break;
                    case 'Oldest First':
                      _filteredRecords
                          .sort((a, b) => a.birthDate.compareTo(b.birthDate));
                      break;
                    case 'Youngest First':
                      _filteredRecords
                          .sort((a, b) => b.birthDate.compareTo(a.birthDate));
                      break;
                    case 'Female':
                    case 'Male':
                      _applyFilters();
                      _filteredRecords = _filteredRecords
                          .where((p) => p.sex == value)
                          .toList();
                      break;
                  }
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  //filter chips - all/archived/active
  Widget _buildFilterChips() {
    final filters = ['All', 'Active', 'Archived'];
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
          Expanded(flex: 2, child: Text('Sex', style: headerStyle)),
          Expanded(flex: 2, child: Text('Age', style: headerStyle)),
          Expanded(flex: 5, child: Text('Address', style: headerStyle)),
          Expanded(flex: 3, child: Text('Contact No.', style: headerStyle)),
          Expanded(flex: 2, child: const SizedBox()),
          SizedBox(width: 70, child: Text('Actions', style: headerStyle)),
        ],
      ),
    );
  }

  // table row using real PatientData
  Widget _buildTableRow(PatientData patient) {
    return PatientRecordBar(
      fullName: '${patient.lastName}, ${patient.firstName}',
      sex: patient.sex,
      age: DateHelper.calculateAge(patient.birthDate),
      address: '${patient.province ?? ''}, ${patient.cityMunicipality ?? ''}',
      contact: patient.contactNumber,
      onMenuSelected: (value) {
        if (value == 'add_clinical_record') {
          _goToAddClinicalRecord(patient.toCompanion(true));
        }
      },
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
                  ? "Sorry, We couldn't find anything that matches '${_searchController.text}'"
                  : 'No records found',
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
