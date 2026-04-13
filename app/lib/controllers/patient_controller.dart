import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';
import 'package:dentcity_management_system/db/database.dart'; // import database file

class PatientController extends StateNotifier<AsyncValue<void>> {
  final AppDatabase _database; //

  PatientController(this._database) : super(const AsyncValue.data(null));

  Future<void> addPatient({
    // Patient Entity

    required String name,
    required int age,
    required String sex,
    required String address,
    required String contactNumber,
  }) async {
    state = const AsyncValue.loading();

    List<String> errors = []; // gather all the mistakes at once 

    // Validate Name Attribute
    if (name.trim().isEmpty) {
      errors.add('Name cannot be empty.');
    } else if (name.trim().length < 2) {
      errors.add('Name must be at least 2 characters long.');
    }

    // Validate Age Attribute (must be greater than 0 and less than 125)
    if (age <= 0) {
      errors.add('Age must be a positive number.');
    } else if (age > 125) {
      errors.add('Age must be less than or equal to 150.');
    }

    // Validate sex (force input to be uppercase)
    String normalizedSex = sex.toUpperCase();
    if (normalizedSex != 'M' && normalizedSex != 'F') {
      errors.add('Sex must be either M or F.');
    }

    // Validate Address
    if (address.trim().isEmpty) {
      errors.add('Address cannot be empty.');
    }

    // Validate Contact Number
    if (contactNumber.length != 10 || // 10 for Philippine Standard
        !RegExp(r'^\d{10}$').hasMatch(contactNumber)) { // fancy for sure 10 characters
      errors.add('Contact number must be exactly 10 digits.');
    }

    if (errors.isNotEmpty) {
      state = AsyncValue.error(errors.join(' '), StackTrace.current);
      return;
    }

    try {
      await _database.into(_database.patient).insert(PatientCompanion(
            name: Value(name.trim()),
            age: Value(age),
            sex: Value(normalizedSex),
            address: Value(address.trim()),
            contactNumber: Value(contactNumber),
          ));
      state = const AsyncValue.data(null);
    } catch (e, stackTrace) {
      state = AsyncValue.error(
          'Failed to add patient: ${e.toString()}', stackTrace);
    }
  }
}
