import '/../style/theme.dart';
import 'package:flutter/material.dart';
import '/../widgets/search_bar.dart';
import '/../widgets/app_pagination.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/filter_dropdown.dart';
import 'add_patient.dart';
import 'add_clinical_record.dart';
import '/../widgets/page_header.dart';
import 'package:heroicons/heroicons.dart';
import '/../widgets/app_info_bar.dart';

//data model
//TODO: replace with Patient Data when database is connected
class PatientRecord {
  final String name;
  final String sex;
  final String age;
  final String address;
  final String contactNumber;
  final String procedure;
  final String status; 
  
  PatientRecord({
    required this.name,
    required this.sex,
    required this.age,
    required this.address,
    required this.contactNumber,
    required this.procedure,
    required this.status,
  });
}

//sample data
//TODO: remove this and fetch real data from database when connected
final List<PatientRecord> patientRecords = List.generate(20, (index) => PatientRecord(
  name: 'Full Name Here',
  sex: index.isEven ? 'Male' : 'Female',     
  age: '100 yo',
  address: 'Luna St., La Paz, Iloilo City',
  contactNumber: '09123456780',
  procedure: 'Teeth Removal',
  status: index % 3 == 0 ? 'Archived' : 'Active',
));

//view enum
enum PatientsView { main, addPatient, addClinicalRecord }

//main screen
class PatientDashboard extends StatefulWidget {
  const PatientDashboard({super.key});

  @override
  State<PatientDashboard> createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  PatientsView _currentView = PatientsView.main;

    void _goToAddPatient() {
    setState(() => _currentView = PatientsView.addPatient);
  }

  void _goToAddClinicalRecord() {
    setState(() => _currentView = PatientsView.addClinicalRecord);
  }

  // TODO: Make the save button functional and return to the main dashboard.
  void _goBackToMain() {
    setState(() => _currentView = PatientsView.main);
  }

  //state for search, filter, and pagination
  final TextEditingController _searchController = TextEditingController();
  List<PatientRecord> _filteredRecords = patientRecords;
  int _currentPage = 1;
  final int _recordsPerPage = 6;
  String? _selectedStatus; //for filter chips

  //number of items to show per page
  List<PatientRecord> get _currentPageRecords {
    final start = (_currentPage - 1) * _recordsPerPage;
    final end = (start + _recordsPerPage).clamp(0, _filteredRecords.length); //to ensure end does not exceed the length of the filtered records
    return _filteredRecords.sublist(
      start, end);
  }
  //total number of pages based on the filtered records
  int get _totalPages => (_filteredRecords.length / _recordsPerPage).ceil();

  
//search function
  void _onSearch(String query) {
  setState(() {
    _currentPage = 1;
    _filteredRecords = patientRecords.where((p) {
      final matchesSearch = p.name.toLowerCase().contains(query.toLowerCase());
      final matchesStatus = _selectedStatus == null || p.status == _selectedStatus;
      return matchesSearch && matchesStatus;
    }).toList();
  });
}
  //filter function for the status chips
  void _onFilter(String? status){
    setState(() {
      _currentPage = 1;
      _selectedStatus = status;
      _filteredRecords = patientRecords.where((p) {
        final matchesSearch = p.name
            .toLowerCase()
            .contains(_searchController.text.toLowerCase());
        final matchesStatus = _selectedStatus == null || p.status == _selectedStatus;
        return matchesSearch && matchesStatus;
      }).toList();
    });
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
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildTableRow(_currentPageRecords[index]),
                childCount: _currentPageRecords.length,
              ),
            ),
          ),
          //pagination
          SliverPadding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 16),
            sliver: SliverToBoxAdapter(
              child: AppPagination(
                currentPage: _currentPage,
                totalPages: _totalPages,
                onPageChanged: (newPage) => setState(() => _currentPage = newPage),
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
            onNext: _goToAddClinicalRecord,
            onBack: _goBackToMain,
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
              onPrevious: _goToAddPatient,
              onFinish: _goBackToMain,
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
                      //overrides the internal padding 
                      padding: EdgeInsets.zero, 
                    ),
                  ),
                ),
                child: Button(
                  label: 'Add New Record',
                  variant: ButtonVariant.primary,
                  icon: Icons.insert_drive_file_outlined,
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
              //filter chips
              _buildFilterChips(),
              const Spacer(),
              AppSortDropdown(
                onSortChanged: (value) {
                  setState(() {
                    switch (value) {
                      case 'Name (A-Z)':
                        _filteredRecords.sort((a, b) => a.name.compareTo(b.name));
                        break;
                      case 'Name (Z-A)':
                        _filteredRecords.sort((a, b) => b.name.compareTo(a.name));
                        break;
                      case 'Oldest First':
                        //TODO: sort by birthDate when real data is connected
                        break;
                      case 'Youngest First':
                        //TODO: sort by birthDate when real data is connected
                        break;
                      case 'Female':
                      case 'Male':
                        //filter by sex
                        _filteredRecords = patientRecords
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
            variant: isSelected ? ButtonVariant.smallPrimary : ButtonVariant.smallSecondary,
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
Widget _buildTableHeader(){
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
        Expanded(flex: 2, child: SizedBox()),
        SizedBox(width: 70, child: Text('Actions', style: headerStyle)),
      ],
    ),
  );
}

//table row
Widget _buildTableRow(PatientRecord patient) {
  return PatientRecordBar(
    fullName: patient.name, 
    sex: patient.sex, 
    age: int.parse(patient.age.replaceAll(' yo', '')),
    address: patient.address, 
    contact: patient.contactNumber, 
    procedure: patient.procedure,
    onMenuSelected: (value){
      if (value == 'add_clinical_record') _goToAddClinicalRecord();
      //TODO: other actions
    }
  );
}
}