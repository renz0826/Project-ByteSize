import 'package:drift/drift.dart';
import 'package:philippines_rpcmb/philippines_rpcmb.dart';
import '../db/database.dart';

// 1. Location and Address Service
class PhAddressService {
  static List<String>? _cachedProvinces; 

  // All 82 Provinces in the Philippines 
  static List<String> getAllProvinceNames() {
    _cachedProvinces ??= philippineRegions
        .expand((r) => r.provinces) 
        .map((p) => p.name)
        .toList() 
      ..sort(); 
    return _cachedProvinces!;
  }

  // 1600 Cities/Municipalities in the Philippines
  static List<String> getCitiesByProvince(String provinceName) {
    try {
      return philippineRegions
          .expand((r) => r.provinces)
          .firstWhere((p) => p.name == provinceName) 
          .municipalities
          .map((m) => m.name) 
          .toList() 
        ..sort(); 
    } catch (e) {
      return []; // Error Handling: In case no province has been selected
    }
  }

  // All 42,000 Barangays in the Philippines
  static List<String> getBarangaysByLocation(
      {required String provinceName, required String cityName}) {
    try {
      return philippineRegions
          .expand((r) => r.provinces)
          .firstWhere((p) => p.name == provinceName) 
          .municipalities
          .firstWhere((m) => m.name == cityName) 
          .barangays
          .map((b) => b.toString()) 
          .toList() 
        ..sort(); 
    } catch (e) {
      return [];
    }
  }
}

// 2. Patient Onboarding Service
class PatientOnboardingService {
  final AppDatabase db;

  PatientOnboardingService(this.db);

  Future<void> registerNewPatient({
    // features atomic saving -> save the two pages or none at all
    required PatientCompanion patientData,
    required ClinicalRecordCompanion clinicalData,
  }) async {
    await db.transaction(() async {
      final newId = await db.into(db.patient).insert(patientData);

      final linkedRecord = clinicalData.copyWith(
        patientId: Value(newId),
      );

      await db.into(db.clinicalRecord).insert(linkedRecord);
    });
  }
}

// 3. Date Helper Service
class DateHelper {
  static final Map<String, int> _monthMap = {
    'January': 1,
    'February': 2,
    'March': 3,
    'April': 4,
    'May': 5,
    'June': 6,
    'July': 7,
    'August': 8,
    'September': 9,
    'October': 10,
    'November': 11,
    'December': 12
  };

  static DateTime convertToDateTime(String month, String day, String year) {
    return DateTime(
      int.parse(year),
      _monthMap[month] ?? 1,
      int.parse(day),
    );
  }

  static int calculateAge(DateTime birthDate) {
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;

    // If the birth month/day hasn't happened yet this year, subtract 1
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return age;
  }
}

// 4. Dropdown Validation Service (for showing specific days in months)
class DateService {
  static int getDaysInMonth(String? monthName, String? yearString) {
    if (monthName == null) return 31;

    int year = int.tryParse(yearString ?? '') ?? 0;
    String month = monthName.trim().toLowerCase();

    switch (month) {
      case "february":
        // Leap Year Logic
        if (year != 0 && (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0))) {
          return 29;
        }
        return 28;
      case "april":
      case "june":
      case "september":
      case "november":
        return 30;
      default:
        return 31;
    }
  }

  static List<String> get months => [
        "January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
      ];
}

// 5. Form Validator Service
class FormValidator {
  static List<String> getMissingPatientFields({ 
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

    return missing;
  }
}