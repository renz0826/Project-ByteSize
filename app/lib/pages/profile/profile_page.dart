import 'package:flutter/material.dart';
import '../../style/theme.dart';
import '../../widgets/page_header.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: const [
                   Text("Hello"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}