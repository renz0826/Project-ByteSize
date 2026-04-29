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
  final int _recordsPerPage = 7;
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
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
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
  final cellStyle = AppTheme.textTheme.bodySmall!.copyWith(color: AppTheme.black500);

  return Container(
    height: 59,
    margin: const EdgeInsets.only(bottom: 8),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    decoration: BoxDecoration(
      color: AppTheme.white500,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      children: [
        Expanded(flex: 3, child: Text(patient.name, style: cellStyle)),
        Expanded(flex: 2, child: Text(patient.sex, style: cellStyle)),
        Expanded(flex: 2, child: Text(patient.age, style: cellStyle)),
        Expanded(flex: 5, child: Text(patient.address, style: cellStyle, overflow: TextOverflow.ellipsis)), 
        Expanded(flex: 3, child: Text(patient.contactNumber, style: cellStyle)),
        Expanded(flex: 3, child: Text(patient.procedure, style: cellStyle)),

        const Spacer(),

        //actions menu
        SizedBox(
          width: 70,
          child: PopupMenuButton<String>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            ),
            color: AppTheme.white500,
            padding: EdgeInsets.zero,
            icon: const HeroIcon(HeroIcons.ellipsisHorizontal, color: AppTheme.gray500), 
            onSelected: (value) {
              if (value == 'add new clinical record') {
                _goToAddClinicalRecord(); //switch to add clinical record view
              }
              //TODO: implement other actions view record, edit, add schedule, archive
            },
            itemBuilder: (context) => [
              _buildPopupItem(
                value: 'add new clinical record',
                icon: HeroIcons.documentPlus,
                label: 'Add New Clinical Record',
              ),
              _buildPopupItem(
                value: 'add schedule',
                icon: HeroIcons.calendar,
                label: 'Add Schedule'),
              _buildPopupItem(
                value: 'view record',
                icon: HeroIcons.eye,
                label: 'View Record'),
              _buildPopupItem(
                value: 'edit personal details',
                icon: HeroIcons.pencilSquare,
                label: 'Edit Personal Details'
              ),
              _buildPopupItem(
                value: 'archive record',
                icon: HeroIcons.archiveBox,
                label: 'Archive Record',
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

//popupitem helper
PopupMenuItem<String> _buildPopupItem({
  required String value,
  required HeroIcons icon,
  required String label,
}) {
  return PopupMenuItem<String>(
    value: value,
    height: 35,
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        HeroIcon(
          icon,
          color: AppTheme.gray500,
          size: 20,
        ),
        const SizedBox(width: 10), 
        Text(
          label,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    ),
  );
}
}