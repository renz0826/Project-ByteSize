import 'package:dentcity_management_system/style/theme.dart';
import 'package:flutter/material.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/input_field.dart';
import '/../widgets/radio_buttons.dart';
import '../../services/locations_ph.dart';
import '../../services/date_service.dart';

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

  // State for Month/Day Dynamic System
  String? _selectedMonth; // selected month to change days
  String? _selectedDay; // selected day

  // State for Barangay, Municipality, and Province
  String? _selectedProvince;
  String? _selectedCity;
  String? _selectedBarangay;

  Map<String, String> rowSelections = {
    // this is to ensure that they all don't use defaultSelection
    "PWD": "Not Applicable",
    "Senior": "Not Applicable",
  };

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
                    dropdownValue: _selectedMonth,
                    isHidden: isEditing,
                    isRequired: true,
                    dropdownItems: DateService.months,
                    onDropdownChanged: (value) {
                      setState(() {
                        _selectedMonth = value;
                        _selectedDay = null;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: InputField(
                    key: ValueKey(_selectedMonth),
                    hintText: "Select a day",
                    label: "Day",
                    variant: InputVariant.dropdown,
                    dropdownValue: _selectedDay,
                    isHidden: isEditing,
                    isRequired: true,
                    dropdownItems: List.generate(
                      DateService.getDaysInMonth(_selectedMonth),
                      (index) => (index + 1).toString(),
                    ),
                    onDropdownChanged: (value) {
                      setState(() {
                        _selectedDay = value;
                      });
                    },
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
                  options: const [
                    "Applicable",
                    "Not Applicable"
                  ], // edit this if u want tochange
                  selectedValue: rowSelections["PWD"]!,
                  onChanged: (value) {
                    setState(() {
                      rowSelections["PWD"] = value;
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
              InputField(
                hintText: "Enter Patient Street Address",
                label: "Street Address",
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: InputField(
                      hintText: "e.g Iloilo",
                      label: "Select A Province",
                      variant: InputVariant.dropdown,
                      dropdownValue: _selectedProvince, // dropdown all provinces
                      dropdownItems: PhAddressService.getAllProvinceNames(), // call function from services
                      onDropdownChanged: (value) {
                        setState(() { // set state everytime user changes province (reset query function basically)
                          _selectedProvince = value; 
                          _selectedCity = null;
                          _selectedBarangay = null;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: InputField(
                      key: ValueKey(_selectedProvince), // this key resets ALL queries on new province selection
                      hintText: "e.g. Iloilo City",
                      label: "Select a City/Municipality",
                      variant: InputVariant.dropdown,
                      dropdownValue: _selectedCity, // dropdown cities from the province selected
                      dropdownItems: _selectedProvince != null // only display if there is an answer to the query
                          ? PhAddressService.getCitiesByProvince( // call from services
                              _selectedProvince!) 
                          : [],
                      onDropdownChanged: (value) {
                        setState(() { // set state everytime user changes province (reset query)
                          _selectedCity = value;
                          _selectedBarangay = null;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Row 3: Province and ZIP Code
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: InputField(
                      key: ValueKey(_selectedCity), // this key resets ALL queries on new province selection
                      hintText: "e.g. Magsaysay",
                      label: "Select A Barangay",
                      variant: InputVariant.dropdown, 
                      dropdownValue: _selectedBarangay, // dropdown barangays from city/municipality selected
                      dropdownItems:
                          (_selectedProvince != null && _selectedCity != null)
                              ? PhAddressService.getBarangaysByLocation( // call from services
                                  provinceName: _selectedProvince!,
                                  cityName: _selectedCity!,
                                )
                              : [],
                      onDropdownChanged: (value) {
                        setState(() {
                          _selectedBarangay = value;
                        });
                      },
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
