import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/auth_controller.dart';
import '../widgets/gradient_text.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() =>
      _LoginPageState(); // create a login state
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _pinController = TextEditingController();

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final isLoading = authState.isLoading;
    final errorMessage = authState.maybeWhen(
      error: (error, stack) => error.toString(),
      orElse: () => null,
    );

    return Scaffold(
      backgroundColor: Colors.white,
        body: Stack(
        children: [
          Positioned(bottom: 0, left: 0, right: 0, child: Image.asset('assets/images/bg-login.png', 
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter,
          ),
          ),

          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/logo.png', height: 75),
                      const SizedBox(width: 12),
                      const GradientText(
                        'DENTCITY',
                        logoPath: 'assets/images/logo.png', //the logo path here
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),

                  Container(
                    constraints: const BoxConstraints(maxWidth: 450),
                    padding: const EdgeInsets.all(32.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(26),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 25,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Login',
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Enter your PIN to continue',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 24),

                        TextField(
                          controller: _pinController,
                          obscureText: true,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(4)],
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: Color(0xFFB5B5B5)),
                              ),
                              focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: Color(0xFFB5B5B5), width: 2),
                            ),
                          ),
                        ),
                      if (errorMessage != null) ...[
                          const SizedBox(height: 12),
                          Text(
                            errorMessage,
                            style: const TextStyle(color: Colors.red, fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ],
                        const SizedBox(height: 24),  
                      // login button
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: isLoading ? null : _submitPin,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF388037),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 0,
                            ),
                            child: isLoading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Login', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                      SizedBox(width: 12),
                                      Icon(Icons.arrow_forward, size: 18),
                                    ],
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitPin() {
    // this function runs when the "enter pin" button is clicked
    final enteredPin = _pinController.text.trim();
    if (enteredPin.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your PIN.')),
      );
      return;
    }
    if (enteredPin.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('PIN must be exactly 4 digits.')),
      );
      return;
    }

    ref.read(authControllerProvider.notifier).login(
          // send pin to auth_controller
          enteredPin,
          () => Navigator.pushReplacementNamed(context, '/dashboard'),
        );
  }
}
