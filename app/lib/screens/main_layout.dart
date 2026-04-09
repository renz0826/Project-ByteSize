// used as a constant layout that holds the sidebar
import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../style/theme.dart';

class MainLayoutScreen extends StatelessWidget {
  const MainLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.gray200,
      body: Row(
        children: [
          // custom nav
          const Sidebar(),

          // main content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Center(
                child: Text(
                  'DentCity Dashboard Content\nWill Go Here',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
