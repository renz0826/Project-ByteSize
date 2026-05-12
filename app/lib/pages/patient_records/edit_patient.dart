import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import '../../style/theme.dart';
import '../../db/database.dart';
import 'package:flutter/services.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/input_field.dart';
import '/../widgets/radio_buttons.dart';
import '../../services/locations_ph.dart';
import '../../services/date_service.dart';
import '../../services/date_helper.dart';

class EditPatientForm extends StatefulWidget {
  final PatientData patient;
  final Function(PatientCompanion) onSave;
  final VoidCallback onBack;

  const EditPatientForm({
    super.key,
    required this.patient,
    required this.onSave,
    required this.onBack,
  });

  @override
  State<EditPatientForm> createState() => _EditPatientFormState();
}

class _EditPatientFormState extends State<EditPatientForm>{
  bool get isEditing => true;

  late final TextEditingController _firstNameController;
  late final TextEditingController _middleNameController;
  late final TextEditingController _lastNameController;

  late final TextEditingController _contactNumberController;
  late final TextEditingController _emergencyContactController;
  late final TextEditingController _referredByController;
  late final TextEditingController _relationshipController;
  late final TextEditingController _emergencyContactRelationshipController;

  late final TextEditingController _streetController;
  late final TextEditingController _zipController;
  late final TextEditingController _barangayController;
  late final TextEditingController _cityController;
  late final TextEditingController _provinceController; 

  String? _selectedSuffix;
  String? _selectedMonth;
  String? _selectedDay;
  String? _selectedYear;
  String? _selectedSex;
  String? _selectedCivilStatus;   
  String? _selectedProvince;
  String? _selectedCity;
  String? _selectedBarangay;

  bool _isPWD = false;

  @override
  void initState(){
    super.initState();

    _firstNameController = TextEditingController(text: widget.patient.firstName);
    _middleNameController = TextEditingController(text: widget.patient.middleName ?? '');
    _lastNameController = TextEditingController(text: widget.patient.lastName);
    _contactNumberController = TextEditingController(text: widget.patient.contactNumber);
    _emergencyContactController = TextEditingController(text: widget.patient.emergencyContactNo);
    _referredByController = TextEditingController(text: widget.patient.referredBy);
    _relationshipController = TextEditingController(text: widget.patient.relationship);
    _emergencyContactRelationshipController = TextEditingController(text: widget.patient.relationshipEmergency);
    _streetController = TextEditingController(text: widget.patient.streetAddress);
    _zipController = TextEditingController(text: widget.patient.zipCode);
    _barangayController = TextEditingController(text: widget.patient.barangay);
    _cityController = TextEditingController(text: widget.patient.cityMunicipality);
    _provinceController = TextEditingController(text: widget.patient.province);

    _selectedSuffix = widget.patient.suffix;
    _selectedYear = widget.patient.birthDate.year.toString();
    _selectedMonth = DateService.months[widget.patient.birthDate.month - 1]; // converts int month to name e.g. "January"
    _selectedDay = widget.patient.birthDate.day.toString();
    _selectedSex = widget.patient.sex;
    _selectedCivilStatus = widget.patient.civilStatus;
    _selectedProvince = widget.patient.province;
    _selectedCity = widget.patient.cityMunicipality;
    _selectedBarangay = widget.patient.barangay;
    _isPWD = widget.patient.isSeniorOrPWD;
  }

  @override
  void dispose(){
  _firstNameController.dispose();
  _middleNameController.dispose();
  _lastNameController.dispose();
  _contactNumberController.dispose();
  _emergencyContactController.dispose();
  _referredByController.dispose();
  _relationshipController.dispose();
  _emergencyContactRelationshipController.dispose(); 
  _streetController.dispose();
  _zipController.dispose();
  _barangayController.dispose();   
  _cityController.dispose();       
  _provinceController.dispose();   
  super.dispose();
  }
  void _handleSave() {
  final birthDate = DateHelper.convertToDateTime(
    _selectedMonth!,
    _selectedDay!,
    _selectedYear!,
  );

  final updatedPatient = PatientCompanion(
    patientId: drift.Value(widget.patient.patientId),
    firstName: drift.Value(_firstNameController.text),
    middleName: drift.Value(_middleNameController.text),
    lastName: drift.Value(_lastNameController.text),
    suffix: drift.Value(_selectedSuffix),
    birthDate: drift.Value(birthDate), // ← add this
    sex: drift.Value(_selectedSex ?? widget.patient.sex),
    civilStatus: drift.Value(_selectedCivilStatus ?? widget.patient.civilStatus),
    contactNumber: drift.Value(_contactNumberController.text),
    emergencyContactNo: drift.Value(_emergencyContactController.text),
    relationshipEmergency: drift.Value(_relationshipController.text),
    referredBy: drift.Value(_referredByController.text),
    relationship: drift.Value(_relationshipController.text),
    streetAddress: drift.Value(_streetController.text),
    barangay: drift.Value(_selectedBarangay ?? _barangayController.text),
    cityMunicipality: drift.Value(_selectedCity ?? _cityController.text),
    province: drift.Value(_selectedProvince ?? _provinceController.text),
    zipCode: drift.Value(_zipController.text),
    isSeniorOrPWD: drift.Value(_isPWD),
    updatedAt: drift.Value(DateTime.now()),
  );
  widget.onSave(updatedPatient);
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
            // HEADER 
            Text("Edit ${widget.patient.firstName}'s Personal Details",
                style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 32),
            // FULL NAME 
            Text('Full Name', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: InputField(
                    label: 'First Name',
                    hintText: 'Enter first name',
                    isRequired: true,
                    controller: _firstNameController,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 2,
                  child: InputField(
                    label: 'Middle Name',
                    hintText: 'Enter middle name',
                    controller: _middleNameController,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 3,
                  child: InputField(
                    label: 'Last Name',
                    hintText: 'Enter last name',
                    isRequired: true,
                    controller: _lastNameController,
                  ),
                ),
                const SizedBox(width:20),
                Expanded(
                  flex: 1,
                  child: InputField(
                    label:'Suffix',
                    hintText: 'e.g. Jr',
                    variant: InputVariant.dropdown,
                    dropdownValue: _selectedSuffix,
                    dropdownItems: const ["Jr.", "Sr.", "II", "III", "IV", "V"], 
                    onDropdownChanged: (value) {
                      setState(() {
                        _selectedSuffix = value == "None" ? null : value;
                      });
                    }
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // DEMOGRAPHIC 
            Text('Demographic', style: Theme.of(context).textTheme.titleLarge), 
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isEditing)
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
                      setState(() {
                        _selectedYear = value;
                        _selectedMonth = null;
                        _selectedDay = null;
                      });
                    },
                  ),
                ),
                if (!isEditing)
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
                if (!isEditing)
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
                Expanded(
                  child: InputField(
                    hintText: 'Select a sex',
                    label: 'Sex',
                    variant: InputVariant.dropdown,
                    dropdownValue: _selectedSex,
                    isRequired: true,
                    dropdownItems: const ['Male', 'Female'],
                    onDropdownChanged: (value) {
                      setState(() => _selectedSex = value);
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: InputField(
                    hintText: 'Select a civil status',
                    label: 'Civil Status',
                    variant: InputVariant.dropdown,
                    dropdownValue: _selectedCivilStatus,
                    dropdownItems: const [
                      'Single',
                      'Married',
                      'Widowed',
                      'Annulled',
                    ],
                    isRequired: true,
                    onDropdownChanged: (value) {
                      setState(() => _selectedCivilStatus = value);
                    },
                  ),
                ),
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

            // CONTACTS 
            Text('Contacts', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: InputField(
                    label: 'Mobile No.',
                    hintText: 'Enter mobile number',
                    isRequired: true,
                    controller: _contactNumberController,
                    inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                  ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: InputField(
                    label: 'Emergency Contact No.',
                    hintText: 'Enter emergency number',
                    controller: _emergencyContactController,
                    inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                  ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: InputField(
                    label: 'Relationship to Patient',
                    hintText: 'Enter relationship to patient',
                    controller: _emergencyContactRelationshipController,
                    inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))
                  ],
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
                    label: 'Referred By',
                    hintText: 'Enter referral name',
                    controller: _referredByController,
                    inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')) 
                  ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: InputField(
                    label: 'Relationship to Referral',
                    hintText: 'Enter relationship to referral',
                    controller: _relationshipController,
                    inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')) 
                  ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // ADDRESS
            Text('Address', style: Theme.of(context).textTheme.titleLarge),
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
                    hintText: "Enter ZIP code",
                    isRequired: true,
                    controller: _zipController, 
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
                  )),
              ],
            ),
            const SizedBox(height: 40),

            // UPDATE BUTTON 
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 200,
                  child: Button(
                    label: "Update Details",
                    icon: Icons.save_alt_outlined,
                    iconPlacement: IconPlacement.left,
                    width: double.infinity,
                    onPressed: _handleSave,
                  ),
                ),
              ],
            )
          ]
      ),
    )
    );
  }
}