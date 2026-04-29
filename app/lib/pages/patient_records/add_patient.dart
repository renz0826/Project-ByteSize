import 'package:dentcity_management_system/style/theme.dart';
import 'package:flutter/material.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/input_field.dart';
import '/../widgets/radio_buttons.dart';
import '../../services/locations_ph.dart';

// TODO: For the add patient onNext, make sure that the data is saved temporarily where it does not restart.
class AddPatientForm extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;
  final Map<String, dynamic>? existingPatient;

  const AddPatientForm(
      {super.key,
      this.existingPatient,
      required this.onNext,
      required this.onBack});

  @override
  State<AddPatientForm> createState() => _AddPatientFormState();
}

class _AddPatientFormState extends State<AddPatientForm> {
  bool get isEditing => widget.existingPatient != null;
  String? _defaultSelection;

  // TODO : Connect all text fields to the appropriate db
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      constraints: const BoxConstraints(maxWidth: 1200),
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

          const SizedBox(height: 32),

          // --- FULL NAME ---
          Text("Full Name", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: InputField(
                label: "First Name",
                hintText: "Enter first name",
                isRequired: true,
              )),
              const SizedBox(width: 20),
              Expanded(
                  child: InputField(
                      label: "Middle Name", hintText: "Enter middle name")),
              const SizedBox(width: 20),
              Expanded(
                  child: InputField(
                label: "Last Name",
                hintText: "Enter last name",
                isRequired: true,
              )),
            ],
          ),

          const SizedBox(height: 32),

          // --- DEMOGRAPHIC ---
          Text("Demographic", style: Theme.of(context).textTheme.titleLarge),

          if (!isEditing) ...[
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: InputField(
                    hintText: "Select a month",
                    label: "Month",
                    variant: InputVariant.dropdown,
                    dropdownValue: _defaultSelection,
                    isHidden: isEditing,
                    isRequired: true,
                    dropdownItems: const [
                      "January",
                      "February",
                      "March",
                      "April",
                      "May",
                      "June",
                      "July",
                      "August",
                      "September",
                      "October",
                      "November",
                      "December",
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: InputField(
                    hintText: "Select a day",
                    label: "Day",
                    variant: InputVariant.dropdown,
                    dropdownValue: _defaultSelection,
                    isHidden: isEditing,
                    isRequired: true,
                    dropdownItems: List.generate(31, (i) => (i + 1).toString()),
                    // TODO: add a feature to only display limited days on specific months
                    // TODO: February(28 or 29) April,June,September,November(30)
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: InputField(
                    hintText: "Select a year",
                    label: "Year",
                    variant: InputVariant.dropdown,
                    dropdownValue: _defaultSelection,
                    isHidden: isEditing,
                    isRequired: true,
                    dropdownItems: List.generate(
                      // dynamic list, updates using the DateTime of the client's PC
                      (DateTime.now().year - 1900) +
                          1, // adds 2027 to the option list, and so on with other years
                      (index) => (DateTime.now().year - index).toString(),
                    ),
                  ),
                ),
              ],
            ),
          ],

          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: InputField(
                  hintText: "Select a sex",
                  label: "Sex",
                  variant: InputVariant.dropdown,
                  dropdownValue: _defaultSelection,
                  isRequired: true,
                  dropdownItems: const ["Male", "Female"],
                ),
              ),
              const SizedBox(width: 20),
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
                    "Annulled"
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: RadioGroupField(
                  label: "PWD Status",
                  options: const ["Applicable", "Not Applicable"],
                  selectedValue: _defaultSelection,
                  isRequired: true,
                  onChanged: (String value) {
                    setState(() {
                      _defaultSelection = value;
                    });
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          // --- CONTACT INFO ---
          Text("Contact Information",
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: InputField(
                label: "Mobile Number",
                hintText: "Enter mobile number",
                isRequired: true,
              )),
              const SizedBox(width: 20),
              Expanded(
                  child: InputField(
                label: "Emergency Contact Number",
                hintText: "Enter emergency number",
                isRequired: true,
              )),
            ],
          ),
          const SizedBox(height: 20),
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

          const SizedBox(height: 32),

          // --- ADDRESS ---
          Text("Address", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),

          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row 1: Full width Street Address
              InputField(
                hintText: "Enter Patient Street Address",
                label: "Street Address",
              ),

              const SizedBox(height: 20),

              // Row 2: Barangay and City
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: InputField(
                      hintText: "Select a Barangay",
                      label: "Barangay",
                      variant: InputVariant.dropdown,
                      dropdownValue: _defaultSelection,
                      dropdownItems: PhAddressService.getAllBarangayNames(),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: InputField(
                      hintText: "Select a City/Municipality",
                      label: "City/Municipality",
                      variant: InputVariant.dropdown,
                      dropdownValue: _defaultSelection,
                      dropdownItems: PhAddressService.getAllCityNames(),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Row 3: Province and ZIP Code
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: InputField(
                      hintText: "Select a Province",
                      label: "Province",
                      variant: InputVariant.dropdown,
                      dropdownValue: _defaultSelection,
                      dropdownItems: PhAddressService.getAllProvinceNames(),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 1,
                    child: InputField(
                      hintText: "e.g. 5000",
                      label: "ZIP Code",
                      variant: InputVariant.primary,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 32),

          // --- ACTION BUTTON ---
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // ! A temporary button that returns to back to main
              // SizedBox(
              //   width: 160,
              //   child: Button(
              //     label: "Back",
              //     width: double.infinity,
              //     icon: Icons.arrow_forward,
              //     iconPlacement: IconPlacement.right,
              //     onPressed: widget.onBack,
              //   ),
              // ),
              SizedBox(
                width: 140,
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
    ));
  }
}
