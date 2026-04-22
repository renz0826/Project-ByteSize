import '../style/theme.dart';
import 'package:flutter/material.dart';


//data model
class PatientRecord {
  final String name;
  final String sex;
  final String age;
  final String address;
  final String contactNumber;
  final String procedure;
  
  PatientRecord({
    required this.name,
    required this.sex,
    required this.age,
    required this.address,
    required this.contactNumber,
    required this.procedure,
  });
}

//sample data
final List<PatientRecord> patientRecords =
List.generate(20, (index) => PatientRecord( //to generate 20 sample records
  name: 'Patient Full name',
  sex: 'Male',
  age: '30',
  address: '123 Main St',
  contactNumber: '0995746543',
  procedure: 'Teeth Cleaning',
), 
);

//patient record page
class PatientRecordsScreen extends StatefulWidget {
  const PatientRecordsScreen({super.key});

  @override
  State<PatientRecordsScreen> createState() => _PatientRecordsScreenState();
}

class _PatientRecordsScreenState extends State<PatientRecordsScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<PatientRecord> _filteredRecords = patientRecords;
  int _currentPage = 1;
  final int _recordsPerPage = 9;

  //number of ietms to show per page
  List<PatientRecord> get _currentPageRecords {
    final start = (_currentPage - 1) * _recordsPerPage;
    final end = (start + _recordsPerPage).clamp(0, _filteredRecords.length); //to ensure end does not exceed the length of the filtered records
    return _filteredRecords.sublist(
      start, end);
  }

  int get _totalPages => (_filteredRecords.length / _recordsPerPage).ceil();


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
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(
            'Patient Records',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 16),
          
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

          _buildPagination(),
        ],
      ),
    ),
  );
}

//table header
Widget _buildTableHeader(){
  final headerStyle = AppTheme.textTheme.bodyLarge;
  
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      children: [
        Expanded(flex: 3, child: Text('Name', style: headerStyle)),
        Expanded(flex: 2, child: Text('Sex', style: headerStyle)),
        Expanded(flex: 2, child: Text('Age', style: headerStyle)),
        Expanded(flex: 4, child: Text('Address', style: headerStyle)),
        Expanded(flex: 3, child: Text('Contact No.', style: headerStyle)),
        Expanded(flex: 3, child: Text('Procedure', style: headerStyle)),
        SizedBox(width: 40, child: Text('Actions', style: headerStyle)),
      ],
    ),
  );
}

//table row
Widget _buildTableRow(PatientRecord patient) {
  final cellStyle = AppTheme.textTheme.bodyMedium;

  return Container(
    margin: const EdgeInsets.only(bottom: 8),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      color: AppTheme.white500,
      borderRadius: BorderRadius.circular(10),
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
        Expanded(flex: 2, child: Text(patient.name, style: cellStyle)),
        Expanded(flex: 1, child: Text(patient.sex, style: cellStyle)),
        Expanded(flex: 1, child: Text(patient.age, style: cellStyle)),
        Expanded(flex: 4, child: Text(patient.address, style: cellStyle, overflow: TextOverflow.ellipsis)), 
        Expanded(flex: 2, child: Text(patient.contactNumber, style: cellStyle)),
        Expanded(flex: 2, child: Text(patient.procedure, style: cellStyle)),

        SizedBox(
          width: 8,
          child: PopupMenuButton<String>(
            icon: const Icon(Icons.more_horiz, size: 16), //edit
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
            ],
          ),
        ),
      ],
    ),
  );
}

//pagination
Widget _buildPagination() {
  return Padding(
    padding: const EdgeInsets.only(top: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //back button
        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: _currentPage > 1
            ? () => setState(() => _currentPage--)
            : null,
      ),

      //page number
      ...List.generate(_totalPages, (index){
        final page = index + 1;
        final isActive = page == _currentPage;
        return GestureDetector(
          onTap: () => setState(() => _currentPage = page),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: isActive ? const Color(0xFFE6E6FF) : AppTheme.white500,
              borderRadius: BorderRadius.circular(8), border: Border.all(color: AppTheme.gray400)
            ),
            alignment: Alignment.center,
            child: Text(
              '$page',
              style: TextStyle(
                color: isActive ? AppTheme.white500 : AppTheme.black500,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }),

      //forward button
      IconButton(
        icon: const Icon(Icons.arrow_forward_ios),
        onPressed: _currentPage < _totalPages
          ? () => setState(() => _currentPage++)
          : null,
      ),
    ],
    )
  );
}
}