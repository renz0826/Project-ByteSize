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
  PatientCompanion? _draftPatient;
  ClinicalRecordCompanion? _draftClinicalRecord;
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

  // TODO: Make the save button functional and return to the main dashboard.
  // Update this in patient_dashboard.dart
  void _goBackToMain(ClinicalRecordCompanion clinicalData) async {
    final db = AppDatabase();

    try {
      final newPatientId = await db.into(db.patient).insert(_draftPatient!);
      final recordWithId = clinicalData.copyWith(
        patientId: drift.Value(newPatientId),
      );

      await db.into(db.clinicalRecord).insert(recordWithId);

      setState(() {
        _draftClinicalRecord = clinicalData;
        _currentView = PatientsView.main;
      });
    } catch (e) {
      print("Database Error: $e");
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
          onNext: (data) => _goToAddClinicalRecord(data),
          onBack: () => setState(() => _currentView = PatientsView.main),
        );
        break;
      case PatientsView.addClinicalRecord:
        activeScreen = AddClinicalRecordForm(
          patientId: 0,
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
