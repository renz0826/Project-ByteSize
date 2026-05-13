import 'package:dentcity_management_system/style/theme.dart';
import 'package:flutter/material.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/attribute_read_view.dart';
import '../../services/scheduling_service.dart';

class ViewAppointment extends StatelessWidget {
  final Map<String, dynamic>? appointmentData;
  final VoidCallback onEdit;
  final VoidCallback onCancel; // Added for dashboard integration

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

    // Using your SchedulingService for consistent date formatting
    final date = data['date'] as DateTime?;
    final dateStr = date != null ? SchedulingService.formatDate(date) : 'N/A';

    return Center(
      child: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          spacing: 32,
          children: [
            // TOP CARD: Header and Action Buttons
            Container(
              constraints: const BoxConstraints(minWidth: 1200),
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
                    "$patientName's Appointment",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Row(
                    spacing: 16,
                    children: [
                      Button(
                          variant: ButtonVariant.secondary,
                          icon: Icons.edit_outlined,
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
                ],
              ),
            ),

            // BOTTOM CARD: Appointment Details
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
                  Text(
                    "Appointment Schedule",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: AttributeReadView(label: "Date", content: dateStr),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        flex: 1,
                        child: AttributeReadView(label: "Time Slot", content: timeStr),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        flex: 2, // Reason gets more space
                        child: AttributeReadView(label: "Reason for Visit", content: reason),
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