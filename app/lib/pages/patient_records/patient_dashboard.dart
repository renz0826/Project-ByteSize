import 'package:dentcity_management_system/style/theme.dart';
import 'package:flutter/material.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/input_field.dart';

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
        child: _showDetails ? _buildDetailsView() : _buildMainDashboard(),
      ),
    );
  }

  Widget _buildMainDashboard() {
    return Container(
      child: Column(
        children: [
          const Text("Records Index", style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          Button(
            label: "View Patient Details",
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

  // --- VIEW 2: THE DETAILS SCREEN ---
  Widget _buildDetailsView() {
    return Container(
      margin: EdgeInsets.all(24),
      padding: EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppTheme.white500,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppTheme.floatShadow,
      ),
      child: Column(
        spacing: 36,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Personal Details",
              style: Theme.of(context).textTheme.headlineLarge),
          Column(
            spacing: 16,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Full Name",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Row(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: InputField(
                      label: "First Name",
                      hintText: "Enter patient's first name",
                      controller: null,
                    ),
                  ),
                  Expanded(
                    child: InputField(
                      label: "Middle Name",
                      hintText: "Enter patient's middle name",
                      controller: null,
                    ),
                  ),
                  Expanded(
                    child: InputField(
                      label: "Last Name",
                      hintText: "Enter patient's last name",
                      controller: null,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Button(
            label: "Back to Records",
            width: double.infinity,
            variant: ButtonVariant.secondary,
            icon: Icons.arrow_back,
            iconPlacement: IconPlacement.left,
            onPressed: () {
              // 4. Flip the switch back to return to the list!
              setState(() {
                _showDetails = false;
              });
            },
          ),
        ],
      ),
    );
  }
}
