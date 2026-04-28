import 'package:flutter/material.dart';
import '/../widgets/main_buttons.dart';
import 'add_patient.dart';

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

  void _goBackToMain() {
    setState(() => _currentView = PatientsView.main);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: _showDetails
              ? AddPatientForm(
                  onNext: () {
                    setState(() {
                      _showDetails = false;
                    });
                  },
                )
              : _buildMainDashboard(),
        ),
      ),
    );
  }

  Widget _buildMainDashboard() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Text("Records Index", style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          Button(
            label: "Add Patient",
            variant: ButtonVariant.primary,
            width: double.infinity,
            onPressed: () {
              setState(() {
                _showDetails = true;
              });
            },
          ),
        ],
      ),
    );
  }
}
