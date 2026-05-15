import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import '../db/database.dart';
import 'app_providers.dart';

class AuthController extends StateNotifier<AsyncValue<bool>> {
  final Ref ref;
  String _cachedPin = "0000"; 

  AuthController(this.ref) : super(const AsyncValue.data(false)) {
    _loadPinFromDb();
  }

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
    
    final db = ref.read(databaseProvider);
    final staff = await (db.select(db.clinicalStaff)..limit(1)).getSingleOrNull();

    if (staff == null) {
      state = AsyncValue.error("No user profile found.", StackTrace.current);
      return;
    }

    // FIX: Check if lockoutUntil is NOT null (instead of staff.isLockedOut)
    if (staff.lockoutUntil != null) {
      final now = DateTime.now();
      if (now.isBefore(staff.lockoutUntil!)) {
        final diff = staff.lockoutUntil!.difference(now);
        state = AsyncValue.error(
          "Account locked. Try again in ${diff.inMinutes}m ${diff.inSeconds % 60}s.", 
          StackTrace.current
        );
        return; 
      }
    }

    // Verify PIN
    if (enteredPin == staff.pin) {
      // Success: Reset their failures and tiers
      await (db.update(db.clinicalStaff)..where((t) => t.staffId.equals(staff.staffId))).write(
        const ClinicalStaffCompanion(
          failedAttempts: drift.Value(0),
          lockoutTier: drift.Value(0),
          lockoutUntil: drift.Value(null),
        )
      );
      
      _cachedPin = staff.pin;
      state = const AsyncValue.data(true);
      onSuccess(); 
    } else {
      // Failure: Apply penalties to this staff member
      int attempts = staff.failedAttempts + 1;
      int tier = staff.lockoutTier;
      DateTime? lockoutTime;

      if (attempts >= 3) {
        // Escalate timer based on tier
        int penaltyMinutes = 1; 
        
        if (tier == 1) {
          penaltyMinutes = 5;
        } else if (tier == 2) {
          penaltyMinutes = 10;
        } else if (tier >= 3) {
          penaltyMinutes = 20;
        } 
        else if (tier >= 4) {
          penaltyMinutes = 60; 
        }
        else if (tier >= 5) {
          penaltyMinutes = 120; 
        }

        lockoutTime = DateTime.now().add(Duration(minutes: penaltyMinutes));
        attempts = 0; // Reset attempts to 0 for the next window
        tier += 1;    // Escalate tier
        
        state = AsyncValue.error("Too many failed attempts. Locked out for $penaltyMinutes minutes.", StackTrace.current);
      } else {
        int remaining = 3 - attempts;
        state = AsyncValue.error("Incorrect PIN. $remaining attempts remaining.", StackTrace.current);
      }

      // Save the penalty to the database
      await (db.update(db.clinicalStaff)..where((t) => t.staffId.equals(staff.staffId))).write(
        ClinicalStaffCompanion(
          failedAttempts: drift.Value(attempts),
          lockoutTier: drift.Value(tier),
          lockoutUntil: drift.Value(lockoutTime),
        )
      );
    }
  }

  bool verifyPin(String pin) {
    return pin == _cachedPin;
  }

  Future<void> updatePin(String newPin) async {
    _cachedPin = newPin;
    final db = ref.read(databaseProvider);
    final existingStaff = await (db.select(db.clinicalStaff)..limit(1)).getSingleOrNull();

    if (existingStaff != null) {
      await (db.update(db.clinicalStaff)
            ..where((t) => t.staffId.equals(existingStaff.staffId)))
          .write(ClinicalStaffCompanion(pin: drift.Value(newPin)));
    } else {
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

  // Refresh Lockout Feature (Once timer ends)
  Future<void> refreshLockoutStatus() async {
    final db = ref.read(databaseProvider);
    final staff = await (db.select(db.clinicalStaff)..limit(1)).getSingleOrNull();

    if (staff != null && staff.lockoutUntil != null) {
      final now = DateTime.now();
      if (now.isBefore(staff.lockoutUntil!)) {
        return; 
      } else {
        // Time IS up! Clear the lockout timestamp in the database.
        await (db.update(db.clinicalStaff)..where((t) => t.staffId.equals(staff.staffId))).write(
          const ClinicalStaffCompanion(lockoutUntil: drift.Value(null))
        );
      }
    }
    // Clear the error state, which instantly re-enables the text box!
    state = const AsyncValue.data(false); 
  }
}

final authControllerProvider = StateNotifierProvider<AuthController, AsyncValue<bool>>((ref) {
  return AuthController(ref);
});