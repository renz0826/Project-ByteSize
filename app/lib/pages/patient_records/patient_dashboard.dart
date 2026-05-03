import 'package:dentcity_management_system/pages/patient_records/add_clinical_record.dart';
import '../../db/database.dart';
import 'package:flutter/material.dart';
import '../../widgets/main_buttons.dart';
import 'add_patient.dart';
import '../../widgets/attribute_read_view.dart';
import 'package:drift/drift.dart' as drift;

// enum of different patients view
// TODO: Add different Edit and View Patient Record Views
enum PatientsView {
  main,
  addPatient,
  addClinicalRecord,
}

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

  Widget _buildMainDashboard() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Records Index", style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          Button(
              label: "Add Patient",
              variant: ButtonVariant.primary,
              width: double.infinity,
              onPressed: _goToAddPatient),
        ],
      ),
    );
  }
}