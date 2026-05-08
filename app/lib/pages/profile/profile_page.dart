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
  // Initialize with the user's current data
  final _firstNameController = TextEditingController(text: "Reynaldo");
  final _middleNameController = TextEditingController();
  final _lastNameController = TextEditingController(text: "Tu");

  @override
  void dispose() {
    // Clean up controllers when the page is closed
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
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
      body: CustomScrollView(
        slivers: [
          // Header
          const SliverToBoxAdapter(
            child: PageHeader(
              title: 'Account Settings',
              type: PageHeaderType.plain,
            ),
          ),

          // Content Section
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Personal Info Card
                _buildSectionCard(
                  title: "Personal Information", 
                  children: [
                    Text ("Update Full Name",
                    style: AppTheme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500)
                    ),
                    const SizedBox(height: 24),

                    Row(
                      children: [
                        // Expanded for equal length
                        Expanded(
                          child: InputField(
                            label: "First Name",
                            controller: _firstNameController,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: InputField(
                            label: "Middle Name",
                            controller: _middleNameController,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: InputField(
                            label: "Last Name",
                            controller: _lastNameController,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Button(
                        label: "Update Profile",
                        variant: ButtonVariant.primary,
                        heroIcon: HeroIcons.check,
                        onPressed: () {
                          // TO DO: Link to Database
                        },
                      )
                    )
                  ],
                ),
                const SizedBox(height: 32),
                // Security Card
                _buildSectionCard(
                  title: "Security and Access", 
                  children: [
                    const Text (""),
                  ],
                )
              ])
            ),
          )
        ],
      ),
    );
  }
}