import 'package:flutter/material.dart';
import '../../style/theme.dart';
import '../../widgets/page_header.dart';

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
                    const Text (""), 
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