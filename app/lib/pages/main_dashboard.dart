import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // build using AI for testing purposes, don't edit this yet
    return Scaffold(
        appBar: AppBar(title: const Text('Dashboard')),
        body: Row(
          children: [
            const SizedBox(height: 20),
            Expanded(child: Text("Hello")),
          ],
        ));
  }
}
