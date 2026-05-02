import '/../style/theme.dart';
import '../../db/database.dart';
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
import 'package:drift/drift.dart' as drift;

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
  PatientCompanion? _draftPatient; // create a patient record 
  ClinicalRecordCompanion? _draftClinicalRecord; // create a patient + clinical record
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
          onNext: (data) => _goToAddClinicalRecord(data), // brings the patient data into the add clinical record page
          onBack: () => setState(() => _currentView = PatientsView.main), 
        );
        break;
      case PatientsView.addClinicalRecord:
        activeScreen = AddClinicalRecordForm(
          patientId: 0, // set the patientID to 0 (since were using atomic saving, this doesnt matter, its more of a safety precaution)
          onPrevious: _goToAddPatient,
          onFinish: (clinicalData) => _goBackToMain(
              clinicalData), // use a wrapper to pass clinicalData argument
        );
        break;
      case PatientsView.main:
        activeScreen = _buildTableRow();
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