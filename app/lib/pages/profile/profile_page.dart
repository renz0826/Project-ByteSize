import 'package:flutter/material.dart';
import '../../style/theme.dart';
import '../../widgets/page_header.dart';
import '../../widgets/input_field.dart'; 
import '../../widgets/main_buttons.dart'; 
import 'package:heroicons/heroicons.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Personal Information Controller
  final _firstNameController = TextEditingController(text: "Reynaldo");
  final _middleNameController = TextEditingController();
  final _lastNameController = TextEditingController(text: "Tu");

  // Security Controller
  final _currentPinController = TextEditingController();
  final _newPinController = TextEditingController();
  final _confirmPinController = TextEditingController();

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
  
  // Reusable card 
  Widget _buildSectionCard({required String title, required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppTheme.white500, // From your theme.dart
        borderRadius: BorderRadius.circular(24),
        boxShadow: AppTheme.floatShadow, // The soft shadow you defined
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTheme.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w500
            ),
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
        child: Center(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Account Settings", 
                  style: AppTheme.textTheme.headlineLarge),
                  const SizedBox(height: 32),
                  
                // Personal Info Card 
                Text("Personal Information",
                  style: AppTheme.textTheme.titleLarge),
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
                      heroIcon: HeroIcons.check,
                      onPressed: () {} // TO DO: Logic in updating Profile
                    ),
                  ),

                  const SizedBox(height: 40),
                  const Divider(color: AppTheme.gray200),
                  const SizedBox(height: 40),

                  // Security and Access Card
                  Text("Security and Access",
                    style: AppTheme.textTheme.titleLarge),
                    const SizedBox(height: 24),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: InputField(label: "CurrentPin",
                          controller: _currentPinController,
                          obscureText: true
                          )
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: InputField(label: "New PIN",
                          controller: _newPinController,
                          obscureText: true
                          )
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: InputField(label: "Confirm New PIN",
                          controller: _confirmPinController,
                          obscureText: true
                          )
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // Final button action
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Button(
                          label: "Update PIN",
                          width: 160,
                          variant: ButtonVariant.primary,
                          heroIcon: HeroIcons.lockClosed,
                          onPressed: () {} // TO DO: Logic for 
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    }