import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import 'package:heroicons/heroicons.dart';
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
import 'view_patient.dart';

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
  int? _existingPatientId;

  // NEW: Tracks where the user came from when adding a record
  int _returnIndex = 0;

  // Variables for View Patient Screen
  PatientData? _patientToView;
  List<ClinicalRecordData> _clinicalRecordsToView = [];

  // Bug Fix: Using IndexedStack to prevent form data from being deleted when clicking back
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
  void _goToAddPatient() {
    setState(() {
      _draftPatient = null;
      _existingPatientId = null;
      _currentIndex = 1;
    });
  }

  // Send user to add_clinical_record.dart
  void _goToAddClinicalRecord(
      {PatientCompanion? draftPatient,
      int? existingPatientId,
      int returnIndex = 0}) {
    setState(() {
      _draftPatient = draftPatient;
      _existingPatientId = existingPatientId;
      _returnIndex = returnIndex; // Remembers where we came from
      _currentIndex = 2;
    });
  }

  // Archive Function
  Future<void> _archivePatient(PatientData patient) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Archive Patient Record'),
        content: Text(
            'Are you sure you want to archive the record for ${patient.lastName}, ${patient.firstName}?\n\nYou can always restore this later from the Archived filter.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Cancel',
                style: TextStyle(color: AppTheme.black500.withOpacity(0.6))),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.red600),
            child: const Text('Archive', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        final repository = ref.read(patientRepositoryProvider);

        await repository.archivePatient(patient.patientId);

        await _loadPatients(); // Refresh the table list

        if (_currentIndex == 3) {
          setState(() => _currentIndex = 0);
        }

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    "${patient.firstName} has been archived.")), // confirmation message
          );
        }
      } catch (e) {
        debugPrint("Failed to archive patient: $e");
      }
    }
  }

  // Send user to View Patient Page function
  Future<void> _goToViewPatient(PatientData patient) async {
    try {
      final db = ref.read(databaseProvider);

      // Fetch all clinical records linked to this patient (using the drop-down)
      final records = await (db.select(db.clinicalRecord)
            ..where((t) => t.patientId.equals(patient.patientId))
            ..orderBy([
              (t) => drift.OrderingTerm(
                  expression: t.createdAt, mode: drift.OrderingMode.desc)
            ])) // Put newest first
          .get();

      setState(() {
        _patientToView = patient;
        _clinicalRecordsToView = records;
        _currentIndex = 3;
      });
    } catch (e) {
      debugPrint("Error fetching patient records: $e");
    }
  }

  // Send user back to the main dashboard
  void _goBackToMain(ClinicalRecordCompanion clinicalData) async {
    try {
      final db = ref.read(databaseProvider);
      int finalPatientId;

      if (_existingPatientId != null) {
        // if an existingPatientId already exists
        finalPatientId = _existingPatientId!;
      } else {
        finalPatientId = await db.into(db.patient).insert(_draftPatient!);
      }

      final recordWithId = clinicalData.copyWith(
        patientId: drift.Value(finalPatientId),
      );

      await db.into(db.clinicalRecord).insert(recordWithId);

      await _loadPatients(); // refresh table

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_existingPatientId != null
                ? "New Clinical Record added to patient successfully!"
                : "Patient and Clinical Record Saved Successfully!"), // conditional confirmation message
          ),
        );
      }

      // If Clinical Record was created using the view screen
      if (_returnIndex == 3 && _patientToView != null) {
        _goToViewPatient(_patientToView!);
      } else {
        setState(() {
          _draftClinicalRecord = clinicalData;
          _currentIndex = 0; // reset the index back to 0
        });
      }
    } catch (e) {
      print("Database Error: $e");
    }
  }

  // Dynamic Popup when clicking back (Allows going back to View or Dashboard)
  Future<void> _confirmReturnToDashboard({int targetIndex = 0}) async {
    final bool? shouldDiscard = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Discard Changes?'),
          content: const Text(
              'Are you sure you want to discard your progress? Any unsaved data will be lost.'),
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
      setState(
          () => _currentIndex = targetIndex); // Uses the dynamic target index
    }
  }

  // Send user to main dashboard
  void _goBackFromView() {
    _loadPatients();
    setState(() {
      _currentIndex = 0;
      _patientToView = null;
      _clinicalRecordsToView = [];
    });
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
                onBack: () => _confirmReturnToDashboard(targetIndex: 0),
              ),
              Transform.translate(
                offset: const Offset(0, -30),
                child: AddPatientForm(
                    key: ValueKey(_formSessionId),
                    onNext: (data) => _goToAddClinicalRecord(
                        draftPatient: data, returnIndex: 0),
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
                // Dynamic Title depending on where the user came from
                title: _returnIndex == 3
                    ? 'Back to Patient View'
                    : 'Back to Records',
                type: PageHeaderType.withBack,
                // Uses dynamic target index based on return path
                onBack: () =>
                    _confirmReturnToDashboard(targetIndex: _returnIndex),
              ),
              Transform.translate(
                offset: const Offset(0, -30),
                child: AddClinicalRecordForm(
                  patientId: _existingPatientId ?? 0,
                  key: ValueKey(_formSessionId),

                  // removes previous button if user is creating one in the View Page area
                  showPreviousButton: _returnIndex != 3,

                  onPrevious: () {
                    // Uses dynamic target index for the "Previous/Cancel" button
                    if (_existingPatientId != null) {
                      setState(() => _currentIndex = _returnIndex);
                    } else {
                      setState(() => _currentIndex = 1);
                    }
                  },
                  onFinish: (clinicalData) => _goBackToMain(clinicalData),
                ),
              ),
            ],
          ),
        ),

        // NEW -> Setting this as Index 3: View Patient Details
        if (_patientToView != null)
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageHeader(
                  title: 'Back to Records',
                  type: PageHeaderType.withBack,
                  onBack: _goBackFromView,
                ),
                ViewPatientScreen(
                  patient: _patientToView!,
                  clinicalRecords: _clinicalRecordsToView,
                  onBack: _goBackFromView,
                  onMenuAction: (value) {
                    if (value == 'add_clinical_record') {
                      setState(() {
                        _formSessionId++;
                      });
                      // Sends index "3" to let the form know we came from the view screen!
                      _goToAddClinicalRecord(
                          existingPatientId: _patientToView!.patientId,
                          returnIndex: 3);
                    } else if (value == 'archive') {
                      _archivePatient(_patientToView!);
                    }
                  },
                ),
              ],
            ),
          )
        else
          const SizedBox.shrink(), // Fallback if no patient is selected
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
    return GestureDetector(
      onTap: () => _goToViewPatient(patient), // to make the row tappable
      child: PatientRecordBar(
        fullName: '${patient.lastName}, ${patient.firstName}',
        sex: patient.sex,
        age: DateHelper.calculateAge(patient.birthDate),
        address: '${patient.province ?? ''}, ${patient.cityMunicipality ?? ''}',
        contact: patient.contactNumber,
        onMenuSelected: (value) {
          if (value == 'add_clinical_record') {
            // FIX: Increment form session ID to clear the form
            setState(() {
              _formSessionId++;
            });
            _goToAddClinicalRecord(
                existingPatientId: patient.patientId, returnIndex: 0);
          } else if (value == 'view_record') {
            _goToViewPatient(patient);
          } else if (value == 'archive') {
            _archivePatient(patient);
          }
        },
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
