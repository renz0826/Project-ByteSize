import 'package:flutter/material.dart';
import '/../widgets/main_buttons.dart';
import 'add_patient.dart';

class PatientDashboard extends StatefulWidget {
  const PatientDashboard({super.key});

  @override
  State<PatientDashboard> createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  bool _showDetails = false;

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
