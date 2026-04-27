import 'package:dentcity_management_system/style/theme.dart';
import 'package:flutter/material.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/input_field.dart';
import '/../widgets/radio_buttons.dart';

class AddPatientForm extends StatefulWidget {
  final VoidCallback onNext;

  const AddPatientForm({super.key, required this.onNext});

  @override
  State<AddPatientForm> createState() => _AddPatientFormState();
}

class _AddPatientFormState extends State<AddPatientForm> {
  String? _defaultSelection;

  // TODO : Connect all text fields to the approriate db
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppTheme.white500,
        borderRadius: BorderRadius.circular(24),
        boxShadow: AppTheme.floatShadow,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Personal Details",
              style: Theme.of(context).textTheme.headlineLarge),

          const SizedBox(height: 22),

          // --- FULL NAME ---
          Text("Full Name", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: InputField(
                      label: "First Name", hintText: "Enter first name")),
              const SizedBox(width: 20),
              Expanded(
                  child: InputField(
                      label: "Middle Name", hintText: "Enter middle name")),
              const SizedBox(width: 20),
              Expanded(
                  child: InputField(
                      label: "Last Name", hintText: "Enter last name")),
            ],
          ),

          const SizedBox(height: 22),

          // --- DEMOGRAPHIC ---
          Text("Demographic", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          SizedBox(
            width: 800,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      "May"
                    ])), // TODO: Link the valid months to a calendar
                const SizedBox(width: 20),
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
                      "5"
                    ])), // TODO: Add the list for all valid Days. Create an error handling state by setting a max depending on each month
                const SizedBox(width: 20),
                Expanded(
                    child: InputField(
                        hintText: "Select a year",
                        label: "Year",
                        variant: InputVariant.dropdown,
                        dropdownValue: _defaultSelection,
                        dropdownItems: const [
                      "2001",
                      "2002",
                      "2006"
                    ])), // TODO: Add the list for all valid Dates setting 2026 as a max
              ],
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: 800,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: InputField(
                        hintText: "Select a sex",
                        label: "Sex",
                        variant: InputVariant.dropdown,
                        dropdownValue: _defaultSelection,
                        dropdownItems: const ["Male", "Female"])),
                const SizedBox(width: 20),
                Expanded(
                    child: InputField(
                        hintText: "Select a civil status",
                        label: "Civil Status",
                        variant: InputVariant.dropdown,
                        dropdownValue: _defaultSelection,
                        dropdownItems: const [
                      // TODO: Determine if amo lang ni ang need for this section
                      "Single",
                      "Married",
                      "Widowed",
                      "Annulled"
                    ])),
              ],
            ),
          ),

          const SizedBox(height: 22),

          // --- CONTACT INFO ---
          Text("Contact Information",
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: InputField(
                      label: "Mobile Number", hintText: "Enter mobile number")),
              const SizedBox(width: 20),
              Expanded(
                  child: InputField(
                      label: "Emergency Contact Number",
                      hintText: "Enter emergency number")),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: InputField(
                      label: "Referred By", hintText: "Enter referral")),
              const SizedBox(width: 20),
              Expanded(
                  child: InputField(
                      label: "Relationship",
                      hintText: "Relationship with referral")),
            ],
          ),

          const SizedBox(height: 22),

          // --- ADDRESS ---
          Text("Address", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: InputField(
                      hintText: "Select a Street",
                      label: "Street Address",
                      variant: InputVariant.dropdown,
                      dropdownValue: _defaultSelection,
                      dropdownItems: const [
                    "Luna St."
                  ])), // TODO: Add the list for all valid Street Addresses in the Philippines
              const SizedBox(width: 20),
              Expanded(
                  child: InputField(
                      hintText: "Select a Barangay",
                      label: "Barangay",
                      variant: InputVariant.dropdown,
                      dropdownValue: _defaultSelection,
                      dropdownItems: const [
                    "Brgy. Magsaysay"
                  ])), // TODO: Add the list for all valid Barangays in the Philippines
              const SizedBox(width: 20),
              Expanded(
                  child: InputField(
                      hintText: "Select a City/Municipality",
                      label: "City/Municipality",
                      variant: InputVariant.dropdown,
                      dropdownValue: _defaultSelection,
                      dropdownItems: const [
                    "La Paz, Iloilo City"
                  ])), // TODO: Add the list for all valid City/Municipalities in the Philippines
              const SizedBox(width: 20),
              Expanded(
                  child: InputField(
                      hintText: "Select a Province",
                      label: "Province",
                      variant: InputVariant.dropdown,
                      dropdownValue: _defaultSelection,
                      dropdownItems: const [
                    "Iloilo"
                  ])), // TODO: Add the list for all valid Provinces in the Philippines
              const SizedBox(width: 20),
              SizedBox(
                width: 150,
                child: InputField(
                    hintText: "Select a ZIP",
                    label: "ZIP Code",
                    variant: InputVariant.dropdown,
                    dropdownValue: _defaultSelection,
                    dropdownItems: const [
                      "5000"
                    ]), // TODO: Add the list for all valid ZIP Codes in the Philippines
              ),
            ],
          ),

          const SizedBox(height: 32),

          // --- ACTION BUTTON ---
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
                  onPressed: widget.onNext,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
