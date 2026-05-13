import 'package:dentcity_management_system/db/database.dart';
import 'package:dentcity_management_system/repositories/patient_repository.dart';
import 'package:dentcity_management_system/style/theme.dart';
import 'package:dentcity_management_system/widgets/warning_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/services.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/input_field.dart';
import '../../widgets/requirement_dialog.dart';
import '/../widgets/radio_buttons.dart';
import '../../services/patient_service.dart';
import '../../providers/app_providers.dart';
import '/../widgets/status_toast.dart';

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

  @override
  void initState() {
    super.initState();
    if (isEditing) {
      // Required fields
      _firstNameController.text =
          widget.existingPatient!['firstName'] as String;
      _lastNameController.text = widget.existingPatient!['lastName'] as String;
      _contactNumberController.text =
          widget.existingPatient!['contactNumber'] as String;
      _streetController.text =
          widget.existingPatient!['streetAddress'] as String;

      // Optional fields
      _middleNameController.text =
          widget.existingPatient!['middleName'] as String? ?? '';
      _emergencyContactController.text =
          widget.existingPatient!['emergencyContactNo'] as String? ?? '';
      _referredByController.text =
          widget.existingPatient!['referredBy'] as String? ?? '';
      _relationshipController.text =
          widget.existingPatient!['relationship'] as String? ?? '';
      _emergencyContactRelationshipController.text =
          widget.existingPatient!['relationshipEmergency'] as String? ?? '';
      _zipController.text = widget.existingPatient!['zipCode'] as String? ?? '';

      _selectedSuffix = widget.existingPatient!['suffix'] as String?;
      _selectedSex = widget.existingPatient!['sex'] as String?;
      _selectedStatus = widget.existingPatient!['civilStatus'] as String?;
      _selectedProvince = widget.existingPatient!['province'] as String?;
      _selectedCity = widget.existingPatient!['cityMunicipality'] as String?;
      _selectedBarangay = widget.existingPatient!['barangay'] as String?;
      _isPWD = widget.existingPatient!['isSeniorOrPWD'] as bool? ?? false;

      final birthDate = widget.existingPatient!['birthDate'] as DateTime;
      _selectedYear = birthDate.year.toString();
      _selectedMonth = DateService.months[birthDate.month - 1];
      _selectedDay = birthDate.day.toString();
    }
  }

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
      _cityController.clear(); // missing
      _barangayController.clear(); // missing
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

    // 1. Required Field Validation
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
    );

    if (missing.isNotEmpty) {
      RequirementDialog.show(context, "Missing Information",
          "Please provide the following details.", missing);
      return;
    }

    // 2. Format Validation
    List<String> formatErrors = [];
    final contact = _contactNumberController.text.trim();
    final emergencyContact = _emergencyContactController.text.trim();
    final zip = _zipController.text.trim();

    if (contact.isNotEmpty) {
      bool hasCorrectLength = contact.length == 11;
      bool hasCorrectPrefix = contact.startsWith('09');

      if (!hasCorrectLength && !hasCorrectPrefix) {
        formatErrors.add(
            "• Mobile Number must be exactly 11 digits and start with '09'.");
      } else if (!hasCorrectPrefix) {
        formatErrors.add("• Mobile Number must start with '09'.");
      } else if (!hasCorrectLength) {
        formatErrors.add("• Mobile Number must be exactly 11 digits.");
      }
    }

    if (emergencyContact.isNotEmpty) {
      bool hasCorrectLength = emergencyContact.length == 11;
      bool hasCorrectPrefix = emergencyContact.startsWith('09');

      if (!hasCorrectLength && !hasCorrectPrefix) {
        formatErrors.add(
            "• Mobile Number must be exactly 11 digits and start with '09'.");
      } else if (!hasCorrectPrefix) {
        formatErrors.add("• Mobile Number must start with '09'.");
      } else if (!hasCorrectLength) {
        formatErrors.add("• Mobile Number must be exactly 11 digits.");
      }
    }

    if (zip.isNotEmpty && zip.length != 4) {
      formatErrors.add("• ZIP Code must be exactly 4 digits.");
    }

    if (formatErrors.isNotEmpty) {
      if (mounted) {
        RequirementDialog.show(
          context,
          "Invalid Input Format",
          formatErrors.join('\n'),
          [],
        );
      }
      return;
    }

    final db = ref.read(databaseProvider);
    final repository = PatientRepository(db);

    // 3. Hard Check for the exact duplicate (Matching firstname and lastname + DOB)
    if (!isEditing) {
      if (await repository.isExactDuplicate(_firstNameController.text.trim(),
          _lastNameController.text.trim(), birthDate!)) {
        if (mounted) {
          StatusToast.show(
            context,
            isSuccess: false,
            title: 'Patient Already Exists',
            message:
                "A patient with this exact name and birthdate is already in the system.",
          );
        }
        return;
      }
    }

    // 4. Soft Check for matching first name and last name
    if (!isEditing) {
      bool nameExists = await repository.isNameDuplicate(
          _firstNameController.text.trim(), _lastNameController.text.trim());

      if (nameExists) {
        bool? confirm = await showDialog<bool>(
            context: context,
            builder: (BuildContext context) {
              return WarningDialog(
                isCaution: true,
                title: 'Similar Patient Found',
                content:
                    'A patient named "${_firstNameController.text} ${_lastNameController.text}" already exists. Are you sure this is a different person?',
                secondaryAction: "Go Back",
                primaryAction: "Proceed Anyway",
              );
            });

        if (confirm != true) return; // Stop if user clicks Cancel
      }
    }

    // 5. Proceed to create PatientCompanion and onNext
    // when isEditing, keep the existing patientId to update the correct record,
    // otherwise omit it so the database auto-assigns a new one on insert
    final patientEntry = PatientCompanion.insert(
      patientId: isEditing
          ? drift.Value(widget.existingPatient!['patientId'] as int)
          : const drift.Value.absent(),
      firstName: _firstNameController.text.trim(),
      middleName: drift.Value(_middleNameController.text.trim()),
      lastName: _lastNameController.text.trim(),
      suffix: drift.Value(_selectedSuffix ?? ""),
      birthDate: birthDate!,
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
      zipCode: drift.Value(_zipController.text.trim()),
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
                    hintText: "Enter first name",
                    isRequired: true,
                    controller: _firstNameController, // first name controller
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(// format to only allow letters in this field
                              r'[a-zA-Z\s]')),
                    ],
                  )),
              const SizedBox(width: 20),
              Expanded(
                  flex: 2,
                  child: InputField(
                    label: "Middle Name",
                    hintText: "Enter Middle Name",
                    controller: _middleNameController, // middle name controller
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                    ],
                  )),
              const SizedBox(width: 20),
              Expanded(
                  flex: 3,
                  child: InputField(
                    label: "Last Name",
                    hintText: "Enter last name",
                    isRequired: true,
                    controller: _lastNameController, // last name controller
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
                  hintText: "e.g. Jr.",
                  variant: InputVariant.dropdown,
                  dropdownValue: _selectedSuffix,
                  dropdownItems: const [
                    "Jr.",
                    "Sr.",
                    "II",
                    "III",
                    "IV",
                    "V"
                  ], // place common suffixes
                  onDropdownChanged: (value) {
                    setState(() {
                      _selectedSuffix = value == "None" ? null : value;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text("Demographic", style: Theme.of(context).textTheme.titleLarge),
          if (!isEditing) ...[
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: InputField(
                    hintText: "Select a year",
                    label: "Year",
                    variant: InputVariant.dropdown,
                    dropdownValue: _selectedYear,
                    isRequired: true,
                    dropdownItems: List.generate(
                        125, (i) => (DateTime.now().year - i).toString()),
                    onDropdownChanged: (value) {
                      // function to calculate the year based on the system data
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
                    hintText: _selectedYear ==
                            null // make sure this is dynamic, make user click year first
                        ? "Select a Year first"
                        : "Select Month",
                    label: "Month",
                    variant: InputVariant.dropdown,
                    dropdownValue: _selectedMonth,
                    isRequired: true,
                    dropdownItems: _selectedYear == null
                        ? []
                        : DateService.months, // use DateService file here
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
                        ? "Select a Month first" // makes the user select month first, in order to check to add or lessen days in the dropdown
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
                                    // service file to change the date based on the month selected
                                    _selectedMonth,
                                    _selectedYear),
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
                hintText: "Enter mobile number",
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
                hintText: "Enter emergency contact number",
                controller: _emergencyContactController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(11),
                ],
              )),
              const SizedBox(width: 20),
              Expanded(
                  child: InputField(
                label: "Relationship to Patient",
                hintText: "Enter relationship to patient",
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
                hintText: "Enter referral name",
                controller: _referredByController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'[a-zA-Z\s]')) // format to letters only
                ],
              )),
              const SizedBox(width: 20),
              Expanded(
                  child: InputField(
                label: "Relationship to Referral",
                hintText: "Enter relationship to referral",
                controller: _relationshipController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'[a-zA-Z\s]')) // format to letters only
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
              controller: _streetController), // street controller
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                  child: InputField(
                      label: "Province",
                      hintText: "Select a province",
                      variant: InputVariant.dropdown,
                      dropdownValue: _selectedProvince,
                      dropdownItems: PhAddressService
                          .getAllProvinceNames(), // use PhAddressService library
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
                          ? "Select A Province First" // make user select a province first
                          : "Select A City", // if province is selected, display this
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
                          ? "Select a city first" // make user select a city first
                          : "Select a Barangay", // if a city is selected, display this as the hintText
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
                    hintText: "Enter ZIP code",
                    controller: _zipController, // zip code controller
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(
                          4), // filter to allow only numbers and limit to 4 digits
                    ],
                  )),
            ],
          ),
          const SizedBox(height: 32),
          Align(
            alignment: Alignment.centerRight,
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.end,
              children: [
                SizedBox(
                  width: 100,
                  child: Button(
                      variant: ButtonVariant.secondary,
                      label: "Clear",
                      onPressed: _clearFormPatientRecord),
                ),
                SizedBox(
                  width: isEditing ? 200 : 140,
                  child: Button(
                      label: isEditing ? "Update Details" : "Next",
                      icon: isEditing
                          ? Icons.save_alt_outlined
                          : Icons.arrow_forward,
                      iconPlacement:
                          isEditing ? IconPlacement.left : IconPlacement.right,
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
