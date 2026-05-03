import 'package:dentcity_management_system/db/database.dart';
import 'package:dentcity_management_system/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import '/../widgets/main_buttons.dart';
import '/../widgets/input_field.dart';
import '/../widgets/radio_buttons.dart';
import '../../services/locations_ph.dart';
import '../../services/date_service.dart';
import '../../services/date_helper.dart';


class AddPatientForm extends StatefulWidget {
  final Function(PatientCompanion) onNext; // pass the data object itself
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

  // Name controllers
  final _firstNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  // Contact controllers
  final _contactNumberController = TextEditingController();
  final _emergencyContactController = TextEditingController();
  final _referredByController = TextEditingController();
  final _relationshipController = TextEditingController();

  // Address controllers
  final _streetController = TextEditingController();
  final _zipController = TextEditingController();
  final _barangayController = TextEditingController();
  final _cityController = TextEditingController();
  final _provinceController = TextEditingController();

  // Dropdown state variables (already have these)
  String? _selectedMonth;
  String? _selectedDay;
  String? _selectedYear;
  String? _selectedSex;
  String? _selectedStatus;
  String? _selectedProvince;
  String? _selectedCity;
  String? _selectedBarangay;

  void _handleNext() {
    DateTime birthDate = DateTime.now();

    if (_selectedYear != null &&
        _selectedMonth != null &&
        _selectedDay != null) {
      birthDate = DateHelper.convertToDateTime(
          _selectedMonth!, _selectedDay!, _selectedYear!);
    }

    final patientEntry = PatientCompanion.insert(
      firstName: _firstNameController.text,
      middleName: drift.Value(_middleNameController.text), // keep this nullable
      lastName: _lastNameController.text,
      birthDate: birthDate,
      sex: _selectedSex ?? "Other",
      civilStatus: _selectedStatus ?? "Single",
      contactNumber: _contactNumberController.text,
      emergencyContactNo: drift.Value(_emergencyContactController.text),
      referredBy: drift.Value(_referredByController.text),
      relationship: drift.Value(_relationshipController.text),

      // Address - using your dropdown values or controllers
      streetAddress: _streetController.text,
      barangay: _selectedBarangay ?? _barangayController.text,
      cityMunicipality: _selectedCity ?? _cityController.text,
      province: _selectedProvince ?? _provinceController.text,
      zipCode: _zipController.text,

      // Metadata
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    // 3. Send the data to the PatientDashboard
    widget.onNext(patientEntry);
  }

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
                controller: _firstNameController, // first name controller
              )),
              const SizedBox(width: 20),
              Expanded(
                  child: InputField(
                label: "Middle Name",
                hintText: "Enter middle name",
                controller: _middleNameController, // middle name controller
              )),
              const SizedBox(width: 20),
              Expanded(
                  child: InputField(
                label: "Last Name",
                hintText: "Enter last name",
                isRequired: true,
                controller: _lastNameController, // last name controller
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
                    dropdownValue: _selectedYear,
                    isHidden: isEditing,
                    isRequired: true,
                    dropdownItems: List.generate(
                      (DateTime.now().year - 1900) + 1,
                      (index) => (DateTime.now().year - index)
                          .toString(), // function to use PC's datetime to add when a new year comes
                    ),
                    onDropdownChanged: (value) {
                      setState(() {
                        _selectedYear = value;
                      });
                    },
                  ),
                ),
              ], // This bracket closes the Row
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
                  dropdownValue: _selectedSex,
                  onDropdownChanged: (value) {
                    setState(() {
                      _selectedSex = value;
                    });
                  },
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
                  dropdownValue: _selectedStatus,
                  onDropdownChanged: (value) {
                    setState(() {
                      _selectedStatus = value;
                    });
                  },
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
                controller: _contactNumberController,
              )),
              const SizedBox(width: 20),
              Expanded(
                  child: InputField(
                label: "Emergency Contact Number",
                hintText: "Enter emergency number",
                isRequired: true,
                controller:
                    _emergencyContactController, // Emergency Contact Controller
              )),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: InputField(
                label: "Referred By",
                hintText: "Enter referral",
                controller: _referredByController,
              )),
              const SizedBox(width: 20),
              Expanded(
                  child: InputField(
                label: "Relationship",
                hintText: "Relationship with referral",
                controller: _relationshipController,
              )),
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
              // Row 1: Street Address

              InputField(
                hintText: "Enter Patient Street Address",
                label: "Street Address",
                controller: _streetController,
              ),
              const SizedBox(height: 20),

              // Row 2: Barangay and City/Municipality

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: InputField(
                      hintText: "Select a Province",
                      label: "Province",
                      variant: InputVariant.dropdown,
                      dropdownValue:
                          _selectedProvince, // dropdown all provinces
                      dropdownItems: PhAddressService
                          .getAllProvinceNames(), // call function from services
                      onDropdownChanged: (value) {
                        setState(() {
                          // set state everytime user changes province (reset query function basically)
                          _selectedProvince = value;
                          _selectedCity = null;
                          _selectedBarangay = null;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: InputField(
                      key: ValueKey(
                          _selectedProvince), // this key resets ALL queries on new province selection
                      hintText: "Select a City/Municipality",
                      label: "City/Municipality",
                      variant: InputVariant.dropdown,
                      dropdownValue:
                          _selectedCity, // dropdown cities from the province selected
                      dropdownItems: _selectedProvince !=
                              null // only display if there is an answer to the query
                          ? PhAddressService.getCitiesByProvince(
                              // call from services
                              _selectedProvince!)
                          : [],
                      onDropdownChanged: (value) {
                        setState(() {
                          // set state everytime user changes province (reset query)
                          _selectedCity = value;
                          _selectedBarangay = null;
                        });
                      },
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
                    child: InputField(
                      key: ValueKey(
                          _selectedCity), // this key resets ALL queries on new province selection
                      hintText: "Select a Barangay",
                      label: "Barangay",
                      variant: InputVariant.dropdown,
                      dropdownValue:
                          _selectedBarangay, // dropdown barangays from city/municipality selected
                      dropdownItems:
                          (_selectedProvince != null && _selectedCity != null)
                              ? PhAddressService.getBarangaysByLocation(
                                  // call from services
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
                      controller: _zipController, // Zip Code Controller
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
                  onPressed: _handleNext, // changed to handle atomic saving
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}