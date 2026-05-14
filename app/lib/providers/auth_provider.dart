import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import '../db/database.dart';
import 'app_providers.dart';

// State Notifier 
class AuthController extends StateNotifier<AsyncValue<bool>> {
  final Ref ref;
  String _cachedPin = "0000"; // Fallback default PIN

  // Pass ref into the controller so it can read the database
  AuthController(this.ref) : super(const AsyncValue.data(false)) {
    _loadPinFromDb();
  }

  // 1. Fetch PIN from database on startup
  Future<void> _loadPinFromDb() async {
    final db = ref.read(databaseProvider);
    final staff = await (db.select(db.clinicalStaff)..limit(1)).getSingleOrNull();
    if (staff != null) {
      _cachedPin = staff.pin;
    }
  }

  Future<void> login(String enteredPin, Function onSuccess) async {
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(milliseconds: 300)); 
    
    await _loadPinFromDb(); // Fetch fresh just in case

    if (enteredPin == _cachedPin) {
      state = const AsyncValue.data(true);
      onSuccess(); 
    } else {
      state = AsyncValue.error("Incorrect PIN", StackTrace.current);
    }
  }

  bool verifyPin(String pin) {
    return pin == _cachedPin;
  }

  // 2. Save the new PIN to the database
  Future<void> updatePin(String newPin) async {
    _cachedPin = newPin;
    
    final db = ref.read(databaseProvider);
    final existingStaff = await (db.select(db.clinicalStaff)..limit(1)).getSingleOrNull();

    if (existingStaff != null) {
      // Update existing record
      await (db.update(db.clinicalStaff)
            ..where((t) => t.staffId.equals(existingStaff.staffId)))
          .write(ClinicalStaffCompanion(pin: drift.Value(newPin)));
    } else {
      // Edge case: If no profile exists yet, create a default one with the new PIN
      await db.into(db.clinicalStaff).insert(
        ClinicalStaffCompanion(
          staffId: const drift.Value(1),
          firstName: const drift.Value('Reynaldo'),
          lastName: const drift.Value('Tu'),
          pin: drift.Value(newPin),
        )
      );
    }

    state = const AsyncValue.data(false);
  }
}

final authControllerProvider = StateNotifierProvider<AuthController, AsyncValue<bool>>((ref) {
  return AuthController(ref);
});