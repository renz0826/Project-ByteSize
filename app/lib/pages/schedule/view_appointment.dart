import 'package:dentcity_management_system/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/attribute_read_view.dart';
import '../../services/scheduling_service.dart';

class ViewAppointment extends StatelessWidget {
  final Map<String, dynamic>? appointmentData;
  final VoidCallback onEdit;
  final VoidCallback onCancel; 

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
    final patientName = data['patientName'] ?? 'Unknown Patient';
    final timeStr = data['time'] ?? '-';
    final reason = data['reason'] ?? '-';

    final date = data['date'] as DateTime?;
    final dateStr = date != null ? SchedulingService.formatDate(date) : 'N/A';

    return Center(
      child: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          spacing: 32,
          children: [
            Container(
              constraints: const BoxConstraints(minWidth: 1200),
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: AppTheme.white500,
                borderRadius: BorderRadius.circular(24),
                boxShadow: AppTheme.floatShadow,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Patient Information",
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 12),
                      Row(
                        spacing: 300,
                        children: [
                          AttributeReadView(label: "Patient Name", content: patientName),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Button(
                          variant: ButtonVariant.secondary,
                          icon: Icons.edit_calendar,
                          iconPlacement: IconPlacement.left,
                          label: "Edit Details",
                          onPressed: onEdit),
                      const SizedBox(width: 12),
                      Button(
                          variant: ButtonVariant.dangerSecondary,
                          iconPlacement: IconPlacement.left,
                          label: "Cancel Appointment",
                          onPressed: onCancel), 
                    ],
                  )
                ]),
            ),
            Container(
              constraints: const BoxConstraints(minWidth: 1200),
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: AppTheme.white500,
                borderRadius: BorderRadius.circular(24),
                boxShadow: AppTheme.floatShadow,
              ),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Appointment Schedule",
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 12),
                    Row(
                      spacing: 300,
                      children: [
                        AttributeReadView(label: "Date", content: dateStr),
                        AttributeReadView(label: "Time Slot", content: timeStr),
                        AttributeReadView(label: "Reason for Visit", content: reason)
                      ],
                    )
                  ]),
            ),
          ],
        ),
      )
    );
  }
}