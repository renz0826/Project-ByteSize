import 'package:dentcity_management_system/style/theme.dart';
import 'package:flutter/material.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/input_field.dart';
import '/../widgets/page_header.dart';

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
        borderRadius: BorderRadius.circular(24),
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
              const SizedBox(height: 22),

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

              const SizedBox(height: 22),

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

                  const SizedBox(height: 22),

                  // Fetch patient contact info
                  Text(
                    "Contact Information",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Column(
                    spacing: 18,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        spacing: 20,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: InputField(
                              label: "Mobile Number",
                              hintText: "Enter patient's mobile number",
                              controller: null,
                            ),
                          ),
                          Expanded(
                            child: InputField(
                              label: "Emergency Contact Number",
                              hintText:
                                  "Enter patient's emergency contact number",
                              controller: null,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 20,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: InputField(
                              label: "Reffered By",
                              hintText: "Enter patient's referral",
                              controller: null,
                            ),
                          ),
                          Expanded(
                            child: InputField(
                              label: "Relationship",
                              hintText:
                                  "Enter patient's relationship with referral",
                              controller: null,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 22),

                      // Fetch patient address
                      Text(
                        "Address",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Row(
                        spacing: 20,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: InputField(
                              hintText: "Select a Street",
                              label: "Street Address",
                              variant: InputVariant.dropdown,
                              dropdownValue: _defaultSelection,
                              dropdownItems: const [
                                "Luna St.",
                              ],
                            ),
                          ),
                          Expanded(
                            child: InputField(
                              hintText: "Select a Barangay",
                              label: "Barangay",
                              variant: InputVariant.dropdown,
                              dropdownValue: _defaultSelection,
                              dropdownItems: const [
                                "Brgy. Magsaysay",
                              ],
                            ),
                          ),
                          Expanded(
                            child: InputField(
                              hintText: "Select a City/Municipality",
                              label: "City/Municipality",
                              variant: InputVariant.dropdown,
                              dropdownValue: _defaultSelection,
                              dropdownItems: const [
                                "la Paz, Iloilo City",
                              ],
                            ),
                          ),
                          Expanded(
                            child: InputField(
                              hintText: "Select a Province",
                              label: "Province",
                              variant: InputVariant.dropdown,
                              dropdownValue: _defaultSelection,
                              dropdownItems: const [
                                "Iloilo",
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: Expanded(
                              child: InputField(
                                hintText: "Select a ZIP",
                                label: "ZIP Code",
                                variant: InputVariant.dropdown,
                                dropdownValue: _defaultSelection,
                                dropdownItems: const [
                                  "5000",
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 22),
                    ],
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 160,
                child: Button(
                  label: "Next",
                  width: double.infinity,
                  icon: Icons.arrow_forward,
                  iconPlacement: IconPlacement.right,
                  onPressed: () {
                    // 4. Flip the switch back to return to the list!
                    setState(() {
                      _showDetails = false;
                    });
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
