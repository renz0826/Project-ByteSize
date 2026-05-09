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
  final _firstNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _lastNameController = TextEditingController();

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
            style: AppTheme.textTheme.headlineLarge?.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w600
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
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PageHeader(
                  title: 'Account Settings',
                  type: PageHeaderType.plain,
                ),

                const SizedBox(height: 32),
                  
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
                            heroIcon: HeroIcons.check,
                            onPressed: () {} // TO DO: Logic in updating Profile
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
                              child: InputField(label: "Current PIN",
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
                        Align(
                          alignment: Alignment.centerRight,
                          child: Button(
                            label: "Update PIN",
                            variant: ButtonVariant.primary,
                            heroIcon: HeroIcons.check,
                            onPressed: () {} // TO DO: Logic for updating PIN
                          ),
                        ),
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