import 'package:flutter_riverpod/flutter_riverpod.dart';

// State Notifier 
class AuthController extends StateNotifier<AsyncValue<bool>> {
  AuthController() : super(const AsyncValue.data(false)); // should always start at false

  // Made this not hardcoded (to be changed in the update function)
  String _correctPin = "6767";

  Future<void> login(String enteredPin, Function onSuccess) async {
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(milliseconds: 300)); // put a system delay

    if (enteredPin == _correctPin) {
      state = const AsyncValue.data(true);
      onSuccess(); // move to dashboard
    } else {
      
      // Error Message 
      state = AsyncValue.error("Incorrect PIN", StackTrace.current);
    }
  }

  // Function to synchronously check to verify the current PIN
  bool verifyPin(String pin) {
    return pin == _correctPin;
  }

  // Function to update the PIN
  Future<void> updatePin(String newPin) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _correctPin = newPin;
    state = const AsyncValue.data(false);
  }
}

final authControllerProvider = StateNotifierProvider<AuthController, AsyncValue<bool>>((ref) {
  return AuthController();
});