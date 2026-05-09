import 'package:dentcity_management_system/db/database.dart';
import 'package:dentcity_management_system/repositories/patient_repository.dart';
import 'package:dentcity_management_system/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/services.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/input_field.dart';
import '/../widgets/radio_buttons.dart';
import '../../widgets/missing_info_dialog.dart';
import '../../services/locations_ph.dart';
import '../../services/date_service.dart';
import '../../services/date_helper.dart';
import '../../services/form_validator.dart';
import '../../providers/app_providers.dart';

class AddPatientForm extends ConsumerStatefulWidget {
  final Function(PatientCompanion) onNext;
  final VoidCallback onBack;
  final Map<String, dynamic>? existingPatient;

  const AddPatientForm(
      {super.key,
      this.existingPatient,
      required this.onNext,
      required this.onBack});

  @override
  ConsumerState<AddPatientForm> createState() => _AddPatientFormState();
}

class _AddPatientFormState extends ConsumerState<AddPatientForm> {
  bool get isEditing => widget.existingPatient != null;

  final _firstNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _contactNumberController = TextEditingController();
  final _emergencyContactController = TextEditingController();
  final _referredByController = TextEditingController();
  final _relationshipController = TextEditingController();
  final _emergencyContactRelationshipController = TextEditingController();
  final _streetController = TextEditingController();
  final _zipController = TextEditingController();
  final _barangayController = TextEditingController();
  final _cityController = TextEditingController();
  final _provinceController = TextEditingController();

  String? _selectedSuffix;
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
      _contactNumberController.clear();
      _emergencyContactController.clear();
      _referredByController.clear();
      _relationshipController.clear();
      _emergencyContactRelationshipController.clear();
      _streetController.clear();
      _zipController.clear();
      _barangayController.clear();
      _provinceController.clear();
      _selectedSuffix = null;
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
      MissingInfoDialog.show(context, missing);
      return;
    }

    

    // TODO: @Frontend, please refactor this, thank you - Fons
    final db = ref.read(databaseProvider);
    final repository = PatientRepository(db);
    if (await repository.isExactDuplicate(
        _firstNameController.text, _lastNameController.text, birthDate!)) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Patient Already Exists'),
          content: const Text('This patient is already in the system.'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'))
          ],
        ),
      );
      return;
    }

    final patientEntry = PatientCompanion.insert(
      firstName: _firstNameController.text.trim(),
      middleName: drift.Value(_middleNameController.text.trim()),
      lastName: _lastNameController.text.trim(),
      suffix: drift.Value(_selectedSuffix ?? ""), // Using dropdown value
      birthDate: birthDate,
      sex: _selectedSex!,
      civilStatus: _selectedStatus ?? "Single",
      contactNumber: _contactNumberController.text.trim(),
      emergencyContactNo: drift.Value(_emergencyContactController.text.trim()),
      relationshipEmergency:
          drift.Value(_emergencyContactRelationshipController.text.trim()),
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
          Text("Personal Details",
              style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(height: 32),
          Text("Full Name", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 3,
                  child: InputField(
                    label: "First Name",
                    hintText: "Enter First Name",
                    isRequired: true,
                    controller: _firstNameController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(
                          r'[a-zA-Z\s]')), // Added \s back to allow spaces
                    ],
                  )),
              const SizedBox(width: 20),
              Expanded(
                  flex: 2,
                  child: InputField(
                    label: "Middle Name",
                    hintText: "Enter Middle Name",
                    controller: _middleNameController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                    ],
                  )),
              const SizedBox(width: 20),
              Expanded(
                  flex: 3,
                  child: InputField(
                    label: "Last Name",
                    hintText: "Enter Last Name",
                    isRequired: true,
                    controller: _lastNameController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[a-zA-Z\s\-]')),
                    ],
                  )),
              const SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: InputField(
                  label: "Suffix",
                  hintText: "Enter Suffix",
                  variant: InputVariant.dropdown,
                  dropdownValue: _selectedSuffix,
                  dropdownItems: const ["Jr.", "Sr.", "II", "III", "IV", "V"],
                  onDropdownChanged: (value) {
                    setState(() {
                      _selectedSuffix = value == "None" ? null : value;
                    });
                  },
                ),
              ),
            ], // <-- Added missing closing bracket for the Row
          ), // <-- Added missing closing parenthesis for the Row
          const SizedBox(height: 32),
          Text("Demographic", style: Theme.of(context).textTheme.titleLarge),
          if (!isEditing) ...[
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: InputField(
                    hintText: "Select Year",
                    label: "Year",
                    variant: InputVariant.dropdown,
                    dropdownValue: _selectedYear,
                    isRequired: true,
                    dropdownItems: List.generate(
                        125, (i) => (DateTime.now().year - i).toString()),
                    onDropdownChanged: (value) {
                      setState(() {
                        _selectedYear = value;
                        _selectedMonth = null;
                        _selectedDay = null;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: InputField(
                    hintText: _selectedYear == null
                        ? "Select a Year first"
                        : "Select Month",
                    label: "Month",
                    variant: InputVariant.dropdown,
                    dropdownValue: _selectedMonth,
                    isRequired: true,
                    dropdownItems:
                        _selectedYear == null ? [] : DateService.months,
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
                    key: ValueKey('$_selectedYear-$_selectedMonth'),
                    hintText: _selectedMonth == null
                        ? "Select a Month first"
                        : "Select Day",
                    label: "Day",
                    variant: InputVariant.dropdown,
                    dropdownValue: _selectedDay,
                    isRequired: true,
                    dropdownItems:
                        (_selectedYear == null || _selectedMonth == null)
                            ? []
                            : List.generate(
                                DateService.getDaysInMonth(
                                    _selectedMonth, _selectedYear),
                                (index) => (index + 1).toString(),
                              ),
                    onDropdownChanged: (value) =>
                        setState(() => _selectedDay = value),
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
                      label: "Sex",
                      variant: InputVariant.dropdown,
                      dropdownValue: _selectedSex,
                      dropdownItems: const ["Male", "Female"],
                      isRequired: true,
                      onDropdownChanged: (v) =>
                          setState(() => _selectedSex = v))),
              const SizedBox(width: 20),
              Expanded(
                  child: InputField(
                      label: "Civil Status",
                      variant: InputVariant.dropdown,
                      dropdownValue: _selectedStatus,
                      dropdownItems: const [
                        "Single",
                        "Married",
                        "Widowed",
                        "Annulled"
                      ],
                      isRequired: true,
                      onDropdownChanged: (v) =>
                          setState(() => _selectedStatus = v))),
              const SizedBox(width: 20),
              Expanded(
                  child: RadioGroupField(
                      label: "PWD Status",
                      options: const ["Applicable", "Not Applicable"],
                      selectedValue: _isPWD ? "Applicable" : "Not Applicable",
                      onChanged: (v) =>
                          setState(() => _isPWD = v == "Applicable"))),
            ],
          ),
          const SizedBox(height: 32),
          Text("Contact Information",
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                  child: InputField(
                label: "Mobile Number",
                isRequired: true,
                hintText: "Enter Mobile Number",
                controller: _contactNumberController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(11),
                ],
              )),
              const SizedBox(width: 20),
              Expanded(
                  child: InputField(
                label: "Emergency Contact Number",
                hintText: "Enter Emergency Contact Number",
                controller: _emergencyContactController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(11),
                ],
              )),
              const SizedBox(width: 20),
              Expanded(
                  child: InputField(
                label: "Relation to Patient",
                hintText: "Enter Relation to Patient",
                controller: _emergencyContactRelationshipController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))
                ],
              )),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                  child: InputField(
                label: "Referred By",
                hintText: "Enter Referred By",
                controller: _referredByController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))
                ],
              )),
              const SizedBox(width: 20),
              Expanded(
                  child: InputField(
                label: "Relationship",
                hintText: "Enter Referred Relationship",
                controller: _relationshipController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))
                ],
              )),
            ],
          ),
          const SizedBox(height: 32),
          Text("Address", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          InputField(
              label: "Street Address",
              hintText: "Enter Street Address",
              isRequired: true,
              controller: _streetController),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                  child: InputField(
                      label: "Province",
                      hintText: "Select A Province",
                      variant: InputVariant.dropdown,
                      dropdownValue: _selectedProvince,
                      dropdownItems: PhAddressService.getAllProvinceNames(),
                      isRequired: true,
                      onDropdownChanged: (v) => setState(() {
                            _selectedProvince = v;
                            _selectedCity = null;
                            _selectedBarangay = null;
                          }))),
              const SizedBox(width: 20),
              Expanded(
                  child: InputField(
                      key: ValueKey(_selectedProvince),
                      label: "City/Municipality",
                      hintText: _selectedProvince == null
                      ? "Select A Province First"
                      : "Select A City",
                      variant: InputVariant.dropdown,
                      dropdownValue: _selectedCity,
                      dropdownItems: _selectedProvince != null
                          ? PhAddressService.getCitiesByProvince(
                              _selectedProvince!)
                          : [],
                      isRequired: true,
                      onDropdownChanged: (v) => setState(() {
                            _selectedCity = v;
                            _selectedBarangay = null;
                          }))),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                  child: InputField(
                      key: ValueKey(_selectedCity),
                      label: "Barangay",
                      hintText: _selectedCity == null
                      ? "Select a city first"
                      : "Select a Barangay",
                      variant: InputVariant.dropdown,
                      dropdownValue: _selectedBarangay,
                      dropdownItems:
                          (_selectedProvince != null && _selectedCity != null)
                              ? PhAddressService.getBarangaysByLocation(
                                  provinceName: _selectedProvince!,
                                  cityName: _selectedCity!)
                              : [],
                      isRequired: true,
                      onDropdownChanged: (v) =>
                          setState(() => _selectedBarangay = v))),
              const SizedBox(width: 20),
              Expanded(
                  flex: 1,
                  child: InputField(
                    label: "ZIP Code",
                    hintText: "Enter ZIP Code",
                    isRequired: true,
                    controller: _zipController,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
                  )),
            ],
          ),
          const SizedBox(height: 32),
          Align(
            alignment: Alignment
                .centerRight, 
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment
                  .end, 
              children: [
                SizedBox(
                  width: 100,
                  child: Button(
                      variant: ButtonVariant.secondary,
                      label: "Clear",
                      onPressed: _clearFormPatientRecord),
                ),
                SizedBox(
                  width: 140,
                  child: Button(
                      label: "Next",
                      icon: Icons.arrow_forward,
                      iconPlacement: IconPlacement.right,
                      onPressed: _handleNext),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
