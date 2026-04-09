import 'package:flutter_riverpod/flutter_riverpod.dart';

// State Notifier 
class AuthController extends StateNotifier<AsyncValue<bool>> {
  AuthController() : super(const AsyncValue.data(false)); // should always start at false

  // Hardcoded PIN (will be changed on the client's wishes)
  final String _correctPin = "6767";

  Future<void> login(String enteredPin, Function onSuccess) async {
    state = const AsyncValue.loading();

    // A small system delay
    await Future.delayed(const Duration(milliseconds: 300));

    if (enteredPin == _correctPin) {
      state = const AsyncValue.data(true);
      onSuccess(); // move to dashboard
    } else {
      
      // Error Message 
      state = AsyncValue.error("Incorrect PIN", StackTrace.current);
    }
  }
}

// The provider that makes this logic available to your pages
final authControllerProvider = StateNotifierProvider<AuthController, AsyncValue<bool>>((ref) {
  return AuthController();
});