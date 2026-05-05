import 'package:dentcity_management_system/db/database.dart';
import 'package:dentcity_management_system/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/services.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/input_field.dart';
import '/../widgets/radio_buttons.dart';
import '../../services/locations_ph.dart';
import '../../services/date_service.dart';
import '../../services/date_helper.dart';
import '../../services/form_validator.dart';
import '../../repositories/patient_repository.dart';

class AddPatientForm extends StatefulWidget {
  final Function(PatientCompanion) onNext; // pass the data object itself
  final VoidCallback onBack;
  final Map<String, dynamic>? existingPatient;

  const AddPatientForm(
      // Constructor
      {super.key,
      this.existingPatient,
      required this.onNext,
      required this.onBack});

  @override
  State<AddPatientForm> createState() =>
      _AddPatientFormState(); // add patient form state
}

class _AddPatientFormState extends State<AddPatientForm> {
  bool get isEditing => widget.existingPatient != null;

  // Name controllers
  final _firstNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  // Contact controllers
  final _contactNumberController = TextEditingController(); // TODO: Limit to numeric string input only.
  final _emergencyContactController =TextEditingController(); // TODO: Limit to numeric string input only.
  final _referredByController = TextEditingController();
  final _relationshipController = TextEditingController();

  // Address controllers
  final _streetController = TextEditingController();
  final _zipController = TextEditingController(); // TODO: Limit to numeric string input only.
  final _barangayController = TextEditingController();
  final _cityController = TextEditingController();
  final _provinceController = TextEditingController();

  // Dropdown state variables
  String? _selectedMonth;
  String? _selectedDay;
  String? _selectedYear;
  String? _selectedSex;
  String? _selectedStatus;
  String? _selectedProvince;
  String? _selectedCity;
  String? _selectedBarangay;

  // PWD
  bool _isPWD = false;

  void _clearFormPatientRecord() { // clears all the text editing controllers
    setState(() {
      // Clear all text controllers
      _firstNameController.clear();
      _middleNameController.clear();
      _lastNameController.clear();
      _contactNumberController.clear();
      _emergencyContactController.clear();
      _referredByController.clear();
      _relationshipController.clear();
      _streetController.clear();
      _zipController.clear();
      _barangayController.clear();
      _provinceController.clear();

      // Reset all dropdowns & booleans
      _selectedMonth = null;
      _selectedDay = null;
      _selectedYear = null;
      _selectedSex = null;
      _selectedStatus = null;
      _selectedProvince = null;
      _selectedCity = null;
      _selectedBarangay = null;

      _isPWD = false;
    });
  }

  void _handleNext() async {
    // What happens when the user clicks the NEXT button

    // Step 1: Calculate Patient's Age based on User Input
    DateTime? birthDate;

    if (isEditing &&
        widget.existingPatient != null &&
        widget.existingPatient!['birthDate'] != null) {
      birthDate = widget.existingPatient!['birthDate'] as DateTime;
    } else if (_selectedMonth != null &&
        _selectedDay != null &&
        _selectedYear != null) {
      birthDate = DateHelper.convertToDateTime(
          _selectedMonth!, _selectedDay!, _selectedYear!);
    }

    // Step 2: Use FormValidator.dart in the services folder to check for missing NOT NULL data
    List<String> missing = FormValidator.getMissingPatientFields(
      firstName: _firstNameController.text
          .trim(), // checks all required controllers to see if theres anything missing
      lastName: _lastNameController.text.trim(),
      birthDate: birthDate,
      sex: _selectedSex,
      civilStatus: _selectedStatus,
      contactNumber: _contactNumberController.text.trim(),
      streetAddress: _streetController.text.trim(),
      barangay: _selectedBarangay ?? _barangayController.text.trim(),
      cityMunicipality: _selectedCity ?? _cityController.text.trim(),
      province: _selectedProvince ?? _provinceController.text.trim(),
      zipCode: _zipController.text.trim(),
    );

    // Step 3: If there is any missing data, it will be displayed in a popup
    // TODO: @Frontend, if you can make this look better, or make this a widget, better. - Fons
    if (missing.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Missing Information'), // header
            content: Text(
                'Please fill out the following required fields:\n\n• ${missing.join('\n• ')}'),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pop(); // This closes the popup (Prompt lang ni ang frontend)
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return; // Stops the function from saving
    }

    // Step 4: Strict Check
    // TODO: @Frontend, improve this popup please - Fons
    final db = AppDatabase();
    final repository = PatientRepository(db);
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final isDuplicate = await repository.isExactDuplicate(
        // updated repository function
        firstName,
        lastName,
        birthDate!);

    if (isDuplicate) {
      // shows a warning popup when first name, last name, and dob already match an existing record
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Patient Already Exists'),
            content: Text(
                'A patient named "$firstName $lastName" born on ${birthDate!.month}/${birthDate.day}/${birthDate.year} is already in the system.\n\nPlease search for this patient in the dashboard to edit their existing profile or add a new clinical record.'),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style:
                    ElevatedButton.styleFrom(backgroundColor: AppTheme.blue200),
                child: const Text('Understood',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          );
        },
      );
      return; // use return to stop the function
    }

    // Step 5: Soft Check
    final isNameDuplicate =
        await repository.isNameDuplicate(firstName, lastName);

    if (isNameDuplicate) {
      bool proceedAnyway = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Similar Name Found'),
                content: Text(
                    'Another patient named "$firstName $lastName" already exists in the system (with a different birth date).\n\nAre you sure this is a different person?'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false), // Cancel
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(true), // Proceed
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.white500),
                    child: const Text('Yes, Proceed',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              );
            },
          ) ??
          false;

      if (!proceedAnyway) {
        return; // Stop saving if they clicked Cancel
      }
    }

    // Step 6: Once all error checks have been completed -> Insert data to Patient Companion and move to add clinical page.
    final patientEntry = PatientCompanion.insert(
      firstName: _firstNameController.text.trim(),
      middleName: drift.Value(_middleNameController.text
          .trim()), // ones with drift.Value means null values are allowed
      lastName: _lastNameController.text.trim(),
      birthDate: birthDate,
      sex: _selectedSex!,
      civilStatus: _selectedStatus ?? "Single",
      contactNumber: _contactNumberController.text.trim(),
      emergencyContactNo: drift.Value(_emergencyContactController.text.trim()),
      referredBy: drift.Value(_referredByController.text.trim()),
      relationship: drift.Value(_relationshipController.text.trim()),

      // Address
      streetAddress: _streetController.text.trim(),
      barangay: _selectedBarangay ?? _barangayController.text.trim(),
      cityMunicipality: _selectedCity ?? _cityController.text.trim(),
      province: _selectedProvince ?? _provinceController.text.trim(),
      zipCode: _zipController.text.trim(),

      // PWD
      isSeniorOrPWD: drift.Value(_isPWD),

      // Metadata
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    // Step 7: Send data to the Patient Dashboard
    widget.onNext(patientEntry);
  }

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
                  isRequired: true,
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
                  // If _isPwd is true, select "Applicable", otherwise "Not Applicable"
                  selectedValue: _isPWD ? "Applicable" : "Not Applicable",
                  onChanged: (value) {
                    setState(() {
                      // Convert the string back to a boolean for your logic
                      _isPWD = value == "Applicable";
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
                keyboardType: TextInputType.number, 
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // Filters out character inputs 
                  LengthLimitingTextInputFormatter(11)], // Only 11 digits are allowed
              )),
              const SizedBox(width: 20),
              Expanded(
                  child: InputField(
                label: "Emergency Contact Number",
                hintText: "Enter emergency number",
                controller: _emergencyContactController, // Emergency Contact Controller
                keyboardType: TextInputType.number, 
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // numerical inputs only
                  LengthLimitingTextInputFormatter(11)], // Limited to 11 digits only
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
                isRequired: true,
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
                      isRequired: true,
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
                      isRequired: true,
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
                      isRequired: true,
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
                      isRequired: true,
                      variant: InputVariant.primary,
                      controller: _zipController, // Zip Code Controller
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4)
                      ], // numerical inputs only
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 32),

          // --- ACTION BUTTON ---
          Row(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 100,
                child: Button(
                  variant: ButtonVariant.secondary,
                  label: "Clear",
                  width: double.infinity,
                  onPressed: _clearFormPatientRecord, // Calls the new clear form function
                ),
              ),
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
