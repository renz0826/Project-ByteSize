import 'package:flutter/material.dart';
import 'style/theme.dart';
import 'widgets/app_status_badge.dart';
import 'widgets/app_info_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Appointment Bar
              const Text('Appointment Bar'),
              const SizedBox(height: 8),
              AppointmentBar(
                fullName: 'Juan dela Cruz',
                time: '10:00 am',
                procedure: 'Tooth Removal',
                status: BadgeStatus.waiting,
                onAction: () {},
              ),
              const SizedBox(height: 8),
              AppointmentBar(
                fullName: 'Maria Santos',
                time: '11:00 am',
                procedure: 'Braces Adjustment',
                status: BadgeStatus.inProgress,
                onAction: () {},
              ),
              const SizedBox(height: 24),

              // 2. Patients Treated Bar
              const Text('Patients Treated Bar'),
              const SizedBox(height: 8),
              PatientsTreatedBar(
                fullName: 'Juan dela Cruz',
                procedure: 'Braces Adjustment',
              ),
              const SizedBox(height: 24),

              // 3. Patient Record Bar
              const Text('Patient Record Bar'),
              const SizedBox(height: 8),
              PatientRecordBar(
                fullName: 'Juan dela Cruz',
                gender: 'Male',
                age: 25,
                address: 'Luna St., La Paz, Iloilo City',
                contact: '09123456780',
                procedure: 'Teeth Removal',
                onMenuSelected: (val) {},
              ),
              const SizedBox(height: 24),

              // 4. Billing Bar
              const Text('Billing Bar'),
              const SizedBox(height: 8),
              BillingBar(
                invoiceId: 'INV-001',
                fullName: 'Juan dela Cruz',
                procedure: 'Teeth Removal',
                amount: 2500,
                date: DateTime(2024, 1, 15),
                status: BadgeStatus.paid,
                onMenuSelected: (val) {},
              ),
              const SizedBox(height: 24),

              // 5. Schedule Bar
              const Text('Schedule Bar'),
              const SizedBox(height: 8),
              ScheduleBar(
                fullName: 'Juan dela Cruz',
                date: DateTime(2024, 1, 15),
                time: '10:00 am',
                procedure: 'Teeth Removal',
                onMenuSelected: (val) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}