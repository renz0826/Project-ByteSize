import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import '/../style/theme.dart';
import '/../widgets/search_bar.dart';
import '/../widgets/app_pagination.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/filter_dropdown.dart';
import '/../widgets/page_header.dart';
import '/../widgets/app_info_bar.dart';
import '../../db/database.dart';
import '../../repositories/patient_repository.dart'; 
import '../../services/date_helper.dart';
import 'add_patient.dart';
import 'add_clinical_record.dart';
import 'package:heroicons/heroicons.dart';

//view enum
enum PatientsView { main, addPatient, addClinicalRecord }

//main screen
class PatientDashboard extends StatefulWidget {
  const PatientDashboard({super.key});

  @override
  State<PatientDashboard> createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  // Database & Repository
  late PatientRepository _repository;
  final AppDatabase _db = AppDatabase();
  
  // Real Database Lists
  List<PatientData> _allPatients = [];
  List<PatientData> _filteredRecords = []; // Choosing the sort option on the top-right

  // Functions to change patients screen states
  PatientCompanion? _draftPatient; // create a patient record
  ClinicalRecordCompanion? _draftClinicalRecord; // create a patient + clinical record
  PatientsView _currentView = PatientsView.main;

  //state for search, filter, and pagination
  final TextEditingController _searchController = TextEditingController();
  int _currentPage = 1;
  final int _recordsPerPage = 8;
  String? _selectedStatus; //for filter chips

  @override
  void initState() {
    super.initState();
    _repository = PatientRepository(_db);
    _loadPatients();
  }

  // Fetch real data from the database 
  Future<void> _loadPatients() async {
    final patients = await _repository.getAllPatients();
    setState(() {
      _allPatients = patients;
      _filteredRecords = patients;
      _applyFilters(); // function to apply the sorting filters
    });
  }

  void _goToAddPatient() {
    setState(() => _currentView = PatientsView.addPatient);
  }

  void _goToAddClinicalRecord(PatientCompanion patientData) {
    setState(() {
      _draftPatient = patientData;
      _currentView = PatientsView.addClinicalRecord;
    });
  }

  void _goBackToMain(ClinicalRecordCompanion clinicalData) async {
    try {
      final newPatientId = await _db.into(_db.patient).insert(_draftPatient!); // add to database
      final recordWithId = clinicalData.copyWith(// add to database with new patient data
        patientId: drift.Value(newPatientId),
      );

      await _db.into(_db.clinicalRecord).insert(recordWithId);

      // Refresh the list immediately after a successful save
      await _loadPatients(); 

      setState(() {
        _draftClinicalRecord = clinicalData;
        _currentView = PatientsView.main;
      });
    } catch (e) {
      print("Database Error: $e"); // print this in case any error comes up and notify @fons immediately
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
      
      // Assuming 'isArchived' is a boolean in your database based on the repository file
      bool matchesStatus = true;
      if (_selectedStatus == 'Active') {
        matchesStatus = p.isArchived == false || p.isArchived == null;
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

  //build method with switch case for different views
  @override
  Widget build(BuildContext context) {
    return switch (_currentView) {
      //main dashboard view
      PatientsView.main => Scaffold(
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

      //add patient view
      PatientsView.addPatient => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageHeader(title: 'Patient Records', type: PageHeaderType.plain),
              Transform.translate(
                offset: const Offset(0, -20), //pulls form up to reduce gap below header
                child: AddPatientForm(
                  onNext: (data) => _goToAddClinicalRecord(data),
                  onBack: () {
                    _loadPatients(); // Refresh list when returning
                    setState(() => _currentView = PatientsView.main);
                  } 
                ),
              ),
            ],
          ),
        ),

      //add clinical record view
      PatientsView.addClinicalRecord => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageHeader(title: 'Patient Records', type: PageHeaderType.plain),
              Transform.translate(
                offset: const Offset(0, -20),
                child: AddClinicalRecordForm(
                  patientId: 0,
                  onPrevious: _goToAddPatient,
                  onFinish: (clinicalData) => _goBackToMain(clinicalData), 
                ),
              ),
            ],
          ),
        ),
    };
  }

  //search bar
  Widget _buildSearchBar() {
    return Column(
      children: [
        //search and add new record
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
                  onPressed: _goToAddPatient,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),

        //filter chips and sort dropdown
        Row(
          children: [
            _buildFilterChips(),
            const Spacer(),
            AppSortDropdown(
              onSortChanged: (value) {
                setState(() {
                  switch (value) {
                    case 'Name (A-Z)':
                      _filteredRecords.sort((a, b) => a.firstName.compareTo(b.firstName));
                      break;
                    case 'Name (Z-A)':
                      _filteredRecords.sort((a, b) => b.firstName.compareTo(a.firstName));
                      break;
                    case 'Oldest First':
                      _filteredRecords.sort((a, b) => a.birthDate.compareTo(b.birthDate));
                      break;
                    case 'Youngest First':
                      _filteredRecords.sort((a, b) => b.birthDate.compareTo(a.birthDate));
                      break;
                    case 'Female':
                    case 'Male':
                      _applyFilters(); // Reset base filters
                      _filteredRecords = _filteredRecords.where((p) => p.sex == value).toList();
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
          Expanded(flex: 2, child: Text('Procedure', style: headerStyle)),
          Expanded(flex: 2, child: const SizedBox()),
          SizedBox(width: 70, child: Text('Actions', style: headerStyle)),
        ],
      ),
    );
  }

  // table row using real PatientData
  Widget _buildTableRow(PatientData patient) {
    return PatientRecordBar(
      fullName: '${patient.firstName}${patient.lastName}',
      sex: patient.sex,
      // Safely calculate age based on database birthDate
      age: DateHelper.calculateAge(patient.birthDate),
      address: '${patient.province ?? ''}, ${patient.cityMunicipality ?? ''}',
      contact: patient.contactNumber,
      procedure: 'Consultation', // Placeholder (still trying to link this to clinical record)
      onMenuSelected: (value) {
        if (value == 'add_clinical_record') {
          // Convert the existing real data back into a Companion for the form
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