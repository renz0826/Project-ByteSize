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
  final Function(PatientCompanion) onNext; 
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
  final _suffixController = TextEditingController();

  // Contact controllers
  final _contactNumberController = TextEditingController(); 
  final _emergencyContactController = TextEditingController();
  final _referredByController = TextEditingController();
  final _relationshipController = TextEditingController();
  final _emergencyContactRelationshipController = TextEditingController();

  // Address controllers
  final _streetController = TextEditingController();
  final _zipController = TextEditingController(); 
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

  bool _isPWD = false;

  void _clearFormPatientRecord() { 
    setState(() {
      _firstNameController.clear();
      _middleNameController.clear();
      _lastNameController.clear();
      _suffixController.clear();
      _contactNumberController.clear();
      _emergencyContactController.clear();
      _referredByController.clear();
      _relationshipController.clear();
      _emergencyContactRelationshipController.clear();
      _streetController.clear();
      _zipController.clear();
      _barangayController.clear();
      _provinceController.clear();

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

    // Validation
    List<String> missing = FormValidator.getMissingPatientFields(
      firstName: _firstNameController.text.trim(),
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

    if (missing.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Missing Information'),
            content: Text(
                'Please fill out the following required fields:\n\n• ${missing.join('\n• ')}'),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    // Duplicate Check
    final db = AppDatabase();
    final repository = PatientRepository(db);
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final isDuplicate = await repository.isExactDuplicate(firstName, lastName, birthDate!);

    if (isDuplicate) {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Patient Already Exists'),
            content: Text('A patient named "$firstName $lastName" is already in the system.'),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Understood'),
              ),
            ],
          );
        },
      );
      return;
    }

    final patientEntry = PatientCompanion.insert(
      firstName: _firstNameController.text.trim(),
      middleName: drift.Value(_middleNameController.text.trim()),
      lastName: _lastNameController.text.trim(),
      suffix: drift.Value(_suffixController.text.trim()), 
      birthDate: birthDate,
      sex: _selectedSex!,
      civilStatus: _selectedStatus ?? "Single",
      contactNumber: _contactNumberController.text.trim(),
      emergencyContactNo: drift.Value(_emergencyContactController.text.trim()),
      relationshipEmergency: drift.Value(_emergencyContactRelationshipController.text.trim()),
      referredBy: drift.Value(_referredByController.text.trim()),
      relationship: drift.Value(_relationshipController.text.trim()),
      streetAddress: _streetController.text.trim(),
      barangay: _selectedBarangay ?? _barangayController.text.trim(),
      cityMunicipality: _selectedCity ?? _cityController.text.trim(),
      province: _selectedProvince ?? _provinceController.text.trim(),
      zipCode: _zipController.text.trim(),
      isSeniorOrPWD: drift.Value(_isPWD),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

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
          Text("Personal Details", style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(height: 32),

          // --- FRONTEND: FULL NAME ROW ---
          Text("Full Name", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 3,
                  child: InputField(
                    label: "First Name",
                    hintText: "Enter first name",
                    isRequired: true,
                    controller: _firstNameController,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))], 
              )),
              const SizedBox(width: 20),
              Expanded(
                  flex: 2,
                  child: InputField(
                    label: "Middle Name",
                    hintText: "Enter middle name",
                    controller: _middleNameController,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))], 
              )),
              const SizedBox(width: 20),
              Expanded(
                  flex: 3,
                  child: InputField(
                    label: "Last Name",
                    hintText: "Enter last name",
                    isRequired: true,
                    controller: _lastNameController,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s\-]'))],
              )),
              const SizedBox(width: 20),
              // TODO: @Frontend, please balance these input boxes - Fons
              Expanded(
                  flex: 1,
                  child: InputField(
                    label: "Suffix",
                    hintText: "Enter Suffix",
                    controller: _suffixController,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s.]'))],
              )),
            ],
          ),

          const SizedBox(height: 32),

          // --- DEMOGRAPHIC SECTION ---
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
                    isRequired: true,
                    dropdownItems: List.generate(
                      DateService.getDaysInMonth(_selectedMonth),
                      (index) => (index + 1).toString(),
                    ),
                    onDropdownChanged: (value) {
                      setState(() => _selectedDay = value);
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
                    isRequired: true,
                    dropdownItems: List.generate(
                      (DateTime.now().year - 1900) + 1,
                      (index) => (DateTime.now().year - index).toString(),
                    ),
                    onDropdownChanged: (value) {
                      setState(() => _selectedYear = value);
                    },
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
                  dropdownValue: _selectedSex,
                  onDropdownChanged: (value) => setState(() => _selectedSex = value),
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
                  onDropdownChanged: (value) => setState(() => _selectedStatus = value),
                  dropdownItems: const ["Single", "Married", "Widowed", "Annulled"],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: RadioGroupField(
                  label: "PWD Status",
                  options: const ["Applicable", "Not Applicable"],
                  selectedValue: _isPWD ? "Applicable" : "Not Applicable",
                  onChanged: (value) => setState(() => _isPWD = value == "Applicable"),
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          // --- FRONTEND: CONTACT INFO SECTION ---
          Text("Contact Information", style: Theme.of(context).textTheme.titleLarge),
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
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(11)
                    ], 
              )),
              const SizedBox(width: 20),
              Expanded(
                  child: InputField(
                    label: "Emergency Contact Number",
                    hintText: "Enter emergency number",
                    controller: _emergencyContactController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(11)
                    ],
              )),
              // TODO: @Frontend, please balance these input boxes - Fons
              const SizedBox(width: 20),
              Expanded(
                  child: InputField(
                    label: "Relation to Patient",
                    hintText: "Relationship with patient",
                    controller: _emergencyContactRelationshipController,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
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
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
              )),
              const SizedBox(width: 20),
              Expanded(
                  child: InputField(
                label: "Relationship",
                hintText: "Relationship with referral",
                controller: _relationshipController,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
              )),
            ],
          ),

          const SizedBox(height: 32),

          // --- ADDRESS SECTION ---
          Text("Address", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputField(
                hintText: "Enter Patient Street Address",
                label: "Street Address",
                isRequired: true,
                controller: _streetController,
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: InputField(
                      hintText: "Select a Province",
                      label: "Province",
                      isRequired: true,
                      variant: InputVariant.dropdown,
                      dropdownValue: _selectedProvince,
                      dropdownItems: PhAddressService.getAllProvinceNames(),
                      onDropdownChanged: (value) {
                        setState(() {
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
                      key: ValueKey(_selectedProvince),
                      hintText: "Select a City/Municipality",
                      label: "City/Municipality",
                      isRequired: true,
                      variant: InputVariant.dropdown,
                      dropdownValue: _selectedCity,
                      dropdownItems: _selectedProvince != null
                          ? PhAddressService.getCitiesByProvince(_selectedProvince!)
                          : [],
                      onDropdownChanged: (value) {
                        setState(() {
                          _selectedCity = value;
                          _selectedBarangay = null;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: InputField(
                      key: ValueKey(_selectedCity),
                      hintText: "Select a Barangay",
                      label: "Barangay",
                      isRequired: true,
                      variant: InputVariant.dropdown,
                      dropdownValue: _selectedBarangay,
                      dropdownItems: (_selectedProvince != null && _selectedCity != null)
                          ? PhAddressService.getBarangaysByLocation(
                              provinceName: _selectedProvince!,
                              cityName: _selectedCity!,
                            )
                          : [],
                      onDropdownChanged: (value) => setState(() => _selectedBarangay = value),
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
                      controller: _zipController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 32),

          // --- ACTION BUTTONS ---
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
                  onPressed: _clearFormPatientRecord,
                ),
              ),
              SizedBox(
                width: 140,
                child: Button(
                  label: "Next",
                  width: double.infinity,
                  icon: Icons.arrow_forward,
                  iconPlacement: IconPlacement.right,
                  onPressed: _handleNext,
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}