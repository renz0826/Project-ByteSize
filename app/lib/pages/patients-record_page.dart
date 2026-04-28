import '../style/theme.dart';
import 'package:flutter/material.dart';
import '../widgets/page_header.dart';
import '../widgets/search_bar.dart';
import '../widgets/app_pagination.dart';
import 'package:heroicons/heroicons.dart';
import '../widgets/main_buttons.dart';
import '../widgets/filter_dropdown.dart';
import 'personal_details.dart';
import 'package:sidebarx/sidebarx.dart';


//data model
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
final List<PatientRecord> patientRecords = List.generate(20, (index) => PatientRecord(
  name: 'Full Name Here',
  sex: index.isEven ? 'Male' : 'Female',     
  age: '100 yo',
  address: 'Luna St., La Paz, Iloilo City',
  contactNumber: '09123456780',
  procedure: 'Teeth Removal',
  status: index % 3 == 0 ? 'Archived' : 'Active',
));

//patient record page
class PatientRecordsScreen extends StatefulWidget {
  final SidebarXController sidebarController;
  const PatientRecordsScreen({super.key, required this.sidebarController});

  @override
  State<PatientRecordsScreen> createState() => _PatientRecordsScreenState();
}

class _PatientRecordsScreenState extends State<PatientRecordsScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<PatientRecord> _filteredRecords = patientRecords;
  int _currentPage = 1;
  final int _recordsPerPage = 7;
  String? _selectedStatus; //for filter chips

  //number of ietms to show per page
  List<PatientRecord> get _currentPageRecords {
    final start = (_currentPage - 1) * _recordsPerPage;
    final end = (start + _recordsPerPage).clamp(0, _filteredRecords.length); //to ensure end does not exceed the length of the filtered records
    return _filteredRecords.sublist(
      start, end);
  }

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

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: AppTheme.gray200,
    body: Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24), 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSearchBar(),
          
          const SizedBox(height: 8), 
          
          _buildTableHeader(),
          
              //table body
              Expanded(
                child: _currentPageRecords.isEmpty
                    ? const Center(child: Text('No records found'))
                    : ListView.builder(
                        itemCount: _currentPageRecords.length,
                        itemBuilder: (context, index) {
                          return _buildTableRow(_currentPageRecords[index]);
                        },
                ),
              ),
              AppPagination(
              currentPage: _currentPage,
              totalPages: _totalPages,
              onPageChanged: (newPage) {
                setState(() {
                  _currentPage = newPage;
                });
              },
            ),
            ],
          ),
      ),
    );
}

//search bar
Widget _buildSearchBar() {
  return Column(
        children: [
          //search and add New Record
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
              width: 243,
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
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PersonalDetailsScreen(
                        sidebarController: widget.sidebarController,
                      ),
                    ),
                  ),
                ),
              ),
            )
            ],
          ),
          const SizedBox(height: 20),
      
          //filter chips and dort dropdown 
          Row(
            children: [
              //filter chips
              _buildFilterChips(),
              const Spacer(),
      
              AppSortDropdown(
                onSortChanged: (selectedSort) {
                  setState(() {
                    switch (selectedSort) {
                      case 'Name (A-Z)':
                        _filteredRecords.sort((a, b) => a.name.compareTo(b.name));
                        break;
                      case 'Name (Z-A)':
                        _filteredRecords.sort((a, b) => b.name.compareTo(a.name));
                        break;
                      case 'Oldest First':
                        //TODO: sort by date
                        break;
                      case 'Youngest First':
                        //TODO: sort by date
                        break;
                      case 'Female':
                        //TODO: filter by sex
                        break;
                      case 'Male':
                        //TODO: filter by sex
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

Widget _buildFilterChips() {
  final filters = ['All', 'Active', 'Archived'];
  return Row(
    // Ensure the Row takes up only the space it needs
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
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.more_horiz, color: AppTheme.gray500), 
            onSelected: (value) {
              //TODO: add functionality
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'add new clinical record',
                child: Text('Add New Clinical Record'),
              ),
              const PopupMenuItem(
                value: 'add schedule',
                child: Text('Add Schedule')),
              const PopupMenuItem(
                value: 'view record',
                child: Text('View Record')),
              const PopupMenuItem(
                value: 'edit personal details',
                child: Text('Edit Personal Details')),
              const PopupMenuItem(
                value: 'archive record',
                child: Text('Archive Record')),
            ],
          ),
        ),
      ],
    ),
  );
}
}