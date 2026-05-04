class FormValidator {
  static List<String> getMissingPatientFields({ // form validator for missing patient fields
    required String firstName,
    required String lastName,
    required DateTime? birthDate,
    required String? sex,
    required String? civilStatus,
    required String contactNumber,
    required String streetAddress,
    required String barangay,
    required String cityMunicipality,
    required String province,
    required String zipCode,
  }) {
    List<String> missing = [];
    
    // Personal Info
    if (firstName.isEmpty) missing.add('First Name');
    if (lastName.isEmpty) missing.add('Last Name');
    if (birthDate == null) missing.add('Date of Birth');
    if (sex == null || sex.isEmpty) missing.add('Sex');
    if (civilStatus == null || civilStatus.isEmpty) missing.add('Civil Status');
    
    // Contacts
    if (contactNumber.isEmpty) missing.add('Contact Number');
    
    // Address (All are strictly required by your DB!)
    if (streetAddress.isEmpty) missing.add('Street Address');
    if (barangay.isEmpty) missing.add('Barangay');
    if (cityMunicipality.isEmpty) missing.add('City/Municipality');
    if (province.isEmpty) missing.add('Province');
    if (zipCode.isEmpty) missing.add('ZIP Code');

    return missing;
  }
}