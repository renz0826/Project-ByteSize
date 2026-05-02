import '/../style/theme.dart';
import '../../db/database.dart';
import 'package:flutter/material.dart';
import '/../widgets/search_bar.dart';
import '/../widgets/app_pagination.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/filter_dropdown.dart';
import 'add_patient.dart';
import '../../widgets/attribute_read_view.dart';

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
  // Functions to change patients screen states
  PatientsView _currentView = PatientsView.main;

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
    /* updated: once both pages were finished, saves to database
     and sends the user back to the main dashboard
     */ 

    final db = AppDatabase();

    try {
      final newPatientId = await db.into(db.patient).insert(_draftPatient!); // add to database
      final recordWithId = clinicalData.copyWith( // add to database with new patient data
        patientId: drift.Value(newPatientId),
      );

      await db.into(db.clinicalRecord).insert(recordWithId);

      setState(() {
        _draftClinicalRecord = clinicalData;
        _currentView = PatientsView.main;
      });
    } catch (e) {
      print("Database Error: $e"); // print this in case any error comes up and notify @fons immediately
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen;

    // Switches the view for each screen
    // TODO: Add View and Edit States
    switch (_currentView) {
      case PatientsView.addPatient:
        activeScreen = AddPatientForm(
          // existingPatient: {
          //     'birthday': '1995-08-24', // ! If this is enabled, the birthdate field will not show
          //     'firstName': 'John',
          //   },
          onNext: _goToAddClinicalRecord, onBack: _goBackToMain,
        );
      case PatientsView.addClinicalRecord:
        activeScreen = AddClinicalRecordForm(
            onPrevious: _goToAddPatient, onFinish: _goBackToMain);
        break;
      case PatientsView.main:
        activeScreen = _buildMainDashboard();
        break;
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: activeScreen,
        ),
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