import 'package:dentcity_management_system/pages/patient_records/add_clinical_record.dart';
import 'package:flutter/material.dart';
import '/../widgets/main_buttons.dart';
import 'add_patient.dart';
import '/../widgets/attribute_read_view.dart';

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
