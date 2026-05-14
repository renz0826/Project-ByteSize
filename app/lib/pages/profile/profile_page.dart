import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../style/theme.dart';
import '../../widgets/page_header.dart';
import '../../widgets/input_field.dart'; 
import '../../widgets/main_buttons.dart'; 
import '../../widgets/status_toast.dart';
import '../../widgets/warning_dialog.dart';
import '../../providers/auth_provider.dart';


class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key,});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  // Personal Information Controller
  final _firstNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  // Security Controller
  final _currentPinController = TextEditingController();
  final _newPinController = TextEditingController();
  final _confirmPinController = TextEditingController();

  bool _isCurrentPinObscured = true;
  bool _isNewPinObscured = true;
  bool _isConfirmPinObscured = true;

 // Pin Validation State
  bool _isCurrentPinVerified = false;
  bool _isPinError = false;
  String _pinErrorMessage = '';

  @override
  void dispose() {
    // Clean up controllers when the page is closed
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _currentPinController.dispose();
    _newPinController.dispose();
    _confirmPinController.dispose();
    super.dispose();
  }

 void _verifyCurrentPin() {
    final entered = _currentPinController.text.trim();
    final authController = ref.read(authControllerProvider.notifier);
    
    if (authController.verifyPin(entered)) {
      setState(() {
        _isCurrentPinVerified = true;
        _isPinError = false;
        _pinErrorMessage = '';
      });
    } else {
      setState(() {
        _isPinError = true;
        _pinErrorMessage = 'Incorrect PIN. Please try again.';
      });
    }
  }

  Future<void> _confirmUpdatePin() async {
    final bool? shouldUpdate = await showDialog<bool>(
      context: context,
      builder: (context) => const WarningDialog(
        isCaution: false, 
        title: 'Update PIN?', 
        content: 'For your security, you will be automatically logged out after changing your PIN. You will need to log back in using your new credentials.', 
        secondaryAction: 'Cancel', 
        primaryAction: 'Update PIN',
        ),
    );

    if (shouldUpdate == true && mounted){

      final newPin = _newPinController.text.trim();

      await ref.read(authControllerProvider.notifier).updatePin(newPin);

      if (mounted) {
        StatusToast.show(
          context,
          title: 'PIN Updated',
          message: 'Your login PIN has been updated successfully.',
          isSuccess: true,
        );

        // 4. Navigate back to login screen
        Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
      }
    }
  }
  
  // Reusable card 
  Widget _buildSectionCard({required String title, required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: AppTheme.white500, 
        borderRadius: BorderRadius.circular(24),
        boxShadow: AppTheme.floatShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTheme.textTheme.headlineLarge,
          ),
          const SizedBox(height: 32),
          ...children,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.gray200, 
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PageHeader(
              title: 'Account Settings',
              type: PageHeaderType.plain,
            ),

            Center(
              child: Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                
                // Personal Info Card
                _buildSectionCard(
                  title: "Personal Information", 
                  children: [
                    Text("Update Full Name",
                      style: AppTheme.textTheme.bodyLarge),
                      const SizedBox(height: 24),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: InputField(label: "First Name",
                            controller: _firstNameController)),
                            const SizedBox(width: 20),
                          Expanded(
                            child: InputField(label: "Middle Name",
                            controller: _middleNameController)),
                            const SizedBox(width: 20), 
                          Expanded(
                            child: InputField(label: "Last Name",
                            controller: _lastNameController)), 
                          ],
                        ),
                        const SizedBox(height: 32),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Button(
                            label: "Update Profile",
                            variant: ButtonVariant.primary,
                            icon: Icons.check,
                            onPressed: () async {
                              if (_firstNameController.text.trim().isEmpty || _lastNameController.text.trim().isEmpty) {
                                StatusToast.show(context, title: 'Error', message: 'First and Last name are required.', isSuccess: false);
                                return;
                              }
                              await Future.delayed(const Duration(milliseconds: 500));
                              
                              if (mounted) {
                                StatusToast.show(
                                  context, 
                                  title: 'Profile Updated', 
                                  message: 'Your personal information has been saved.', 
                                  isSuccess: true
                                );
                              }
                            } 
                          ),
                        ),
                    ],
                  ),

                  // Security and Access Card
                  _buildSectionCard(
                    title: "Security and Access",
                    children: [
                      Text("Update Login PIN",
                        style: AppTheme.textTheme.bodyLarge),
                        const SizedBox(height: 24),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InputField(label: "Current PIN",
                                  controller: _currentPinController,
                                  obscureText: _isCurrentPinObscured,
                                  suffixIcon: IconButton(
                                    icon: Icon(_isCurrentPinObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                                    onPressed: () => setState(
                                      () => _isCurrentPinObscured = !_isCurrentPinObscured),
                                  ),
                                ),
                                if (_isPinError)...[
                                  const SizedBox(height: 6),
                                  Text(
                                    _pinErrorMessage,
                                    style: AppTheme.textTheme.bodySmall?.copyWith(
                                      color: AppTheme.red600),
                                  ),
                                ],
                                if (_isCurrentPinVerified)...[
                                  const SizedBox(height: 6),
                                  Text(
                                    'Pin Verified',
                                    style: AppTheme.textTheme.bodySmall?.copyWith(
                                      color: AppTheme.green300
                                    )
                                  )
                                ]
                                ],
                              )
                          ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Opacity(
                                opacity: _isCurrentPinVerified ? 1.0 : 0.4,
                                child: IgnorePointer(
                                  ignoring: !_isCurrentPinVerified,
                                  child: InputField(label: "New PIN",
                                  controller: _newPinController,
                                  obscureText: _isNewPinObscured,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isNewPinObscured = !_isNewPinObscured;
                                      });
                                    }, 
                                    icon: Icon(_isNewPinObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined)),
                                  )
                                ),
                              ),
                            ),


                            const SizedBox(width: 20),
                            Expanded(
                              child: Opacity(
                                opacity: _isCurrentPinVerified ? 1.0 : 0.4,
                                child: IgnorePointer(
                                  ignoring: !_isCurrentPinVerified,
                                  child: InputField(
                                  label: "Confirm New PIN",
                                  controller: _confirmPinController,
                                  obscureText: _isConfirmPinObscured,
                                  suffixIcon: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        _isConfirmPinObscured = !_isConfirmPinObscured;
                                      });
                                    }, 
                                    icon: Icon(_isConfirmPinObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined)),
                                  )
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Align(
                          alignment: Alignment.centerRight,
                          child: _isCurrentPinVerified ?
                          Button(
                            label: "Update PIN",
                            variant: ButtonVariant.primary,
                            icon: Icons.check,
                            onPressed: () async {
                            if (_newPinController.text.trim().isEmpty){
                              
                              if (_newPinController.text.trim().isEmpty) {
                                StatusToast.show(context, title: 'Error', message: 'New PIN cannot be empty.', isSuccess: false);
                                return;
                              }
                              
                              if (_newPinController.text != _confirmPinController.text){
                                StatusToast.show(context, title: 'PIN Mismatch', message: 'New PIN and Confirm PIN do not match.', isSuccess: false);
                                return;
                              }
                            }
                            
                            final bool? shouldUpdate = await showDialog<bool>(
                              context: context, 
                              builder: (context) => const WarningDialog(
                                isCaution: false, 
                                title: 'Update PIN?', 
                                content: 'For your security, you will be automatically logged out after changing your PIN. You will need to log back in using your new credentials.', 
                                secondaryAction: 'Cancel', 
                                primaryAction: 'Update PIN')
                                );
                                if (shouldUpdate == true && mounted){
                                  await ref.read(authControllerProvider.notifier).updatePin(_newPinController.text);
                                  if (mounted) {
                                  StatusToast.show(
                                  context, 
                                  title: 'PIN Updated', 
                                  message: 'Your login PIN has been updated successfully.', 
                                  isSuccess: true,
                                  );

                                Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
                                  }
                                }
                              },
                            )
                            : Button (
                              label: 'Verify PIN',
                              variant: ButtonVariant.secondary,
                              icon: Icons.lock_open_outlined,
                              onPressed: _verifyCurrentPin,
                            )
                          ),
                      ],
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
}