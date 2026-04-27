import 'package:dentcity_management_system/style/theme.dart';
import 'package:flutter/material.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/input_field.dart';

String? _defaultSelection;

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
          child: _showDetails ? _buildDetailsView() : _buildMainDashboard(),
        ),
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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Personal Details",
              style: Theme.of(context).textTheme.headlineLarge),
          Column(
            spacing: 12,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 36),

              // Fetch patient full name
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

              const SizedBox(height: 36),

              // Fetch patient demographics
              Text(
                "Demographic",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Column(
                spacing: 18,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 800,
                    child: Row(
                      spacing: 20,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: InputField(
                            hintText: "Select a month",
                            label: "Month",
                            variant: InputVariant.dropdown,
                            dropdownValue: _defaultSelection,
                            dropdownItems: const [
                              "January",
                              "February",
                              "March",
                              "April",
                              "May",
                            ],
                          ),
                        ),
                        Expanded(
                          child: InputField(
                            hintText: "Select a day",
                            label: "Day",
                            variant: InputVariant.dropdown,
                            dropdownValue: _defaultSelection,
                            dropdownItems: const [
                              "1",
                              "2",
                              "3",
                              "4",
                              "5",
                            ],
                          ),
                        ),
                        Expanded(
                          child: InputField(
                            hintText: "Select a year",
                            label: "Year",
                            variant: InputVariant.dropdown,
                            dropdownValue: _defaultSelection,
                            dropdownItems: const [
                              "2001",
                              "2002",
                              "2006",
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 525,
                    child: Row(
                      spacing: 20,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: InputField(
                            hintText: "Select a sex",
                            label: "Sex",
                            variant: InputVariant.dropdown,
                            dropdownValue: _defaultSelection,
                            dropdownItems: const [
                              "Male",
                              "Female",
                            ],
                          ),
                        ),
                        Expanded(
                          child: InputField(
                            hintText: "Select a civil status",
                            label: "Civil Status",
                            variant: InputVariant.dropdown,
                            dropdownValue: _defaultSelection,
                            dropdownItems: const [
                              "Single",
                              "Married",
                              "Widowed",
                              "Annulled",
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
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
