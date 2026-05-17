import 'package:dentcity_management_system/style/theme.dart';
import 'package:flutter/material.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/attribute_read_view.dart';
import '../../services/scheduling_service.dart';

class ViewAppointment extends StatelessWidget {
  final Map<String, dynamic>? appointmentData;
  final VoidCallback onEdit;
  final VoidCallback onCancel; // added to dashboard integration

  const ViewAppointment({
    super.key,
    this.appointmentData,
    required this.onEdit,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    // Extract data with fallback values
    final data = appointmentData ?? {};
    
    // Initialize First Name, Last Name 
    String firstName = 'Unknown';
    String lastName = 'Patient';

    // Map the first name and last name to these variables
    if (data.containsKey('firstName') || data.containsKey('lastName')) {
      firstName = data['firstName'] ?? 'Unknown';
      lastName = data['lastName'] ?? 'Patient';
    } else if (data.containsKey('patientName')) {
      final rawName = data['patientName'] as String? ?? '';
      
      if (rawName.contains(',')) {
        final parts = rawName.split(',');
        lastName = parts[0].trim();
        firstName = parts.length > 1 ? parts[1].trim() : 'Unknown';
      } else {
        //
        final parts = rawName.trim().split(' ');
        if (parts.isNotEmpty) {
          firstName = parts.first;
          lastName = parts.length > 1 ? parts.sublist(1).join(' ') : 'Patient';
        }
      }
    }

    final patientFullName = "$firstName $lastName";
    final timeStr = data['time'] ?? '-';
    final reason = data['reason'] ?? '-';

    // Using your SchedulingService for consistent date formatting
    final date = data['date'] as DateTime?;
    final dateStr = date != null ? SchedulingService.formatDate(date) : 'N/A';

    return Center(
      child: Container(
        margin: const EdgeInsets.all(24),
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          spacing: 32,
          children: [
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: AppTheme.white500,
                borderRadius: BorderRadius.circular(24),
                boxShadow: AppTheme.floatShadow,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$patientFullName's Appointment",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Row(
                    spacing: 16,
                    children: [
                      Button(
                          variant: ButtonVariant.secondary,
                          icon: Icons.edit_calendar,
                          iconPlacement: IconPlacement.left,
                          label: "Edit Appointment",
                          onPressed: onEdit),
                      Button(
                          variant: ButtonVariant.dangerSecondary,
                          iconPlacement: IconPlacement.left,
                          label: "Cancel Appointment",
                          onPressed: onCancel),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: AppTheme.white500,
                borderRadius: BorderRadius.circular(24),
                boxShadow: AppTheme.floatShadow,
              ),
              child: Column(
                spacing: 12,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Appointment Schedule",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child:
                            AttributeReadView(label: "Date", content: dateStr),
                      ),
                      Expanded(
                        child: AttributeReadView(
                            label: "Time Slot", content: timeStr),
                      ),
                      Expanded(
                        child: AttributeReadView(
                            label: "Reason for Visit", content: reason),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}