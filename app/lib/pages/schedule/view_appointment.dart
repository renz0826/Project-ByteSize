import 'package:dentcity_management_system/style/theme.dart';
import 'package:flutter/material.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/attribute_read_view.dart';

class ViewAppointment extends StatefulWidget {
  final Map<String, dynamic>? appointmentData;
  final VoidCallback onEdit;

  const ViewAppointment(
      {super.key, this.appointmentData, required this.onEdit});

  @override
  State<ViewAppointment> createState() => _ViewAppointmentState();
}

class _ViewAppointmentState extends State<ViewAppointment> {
  // TODO: Make functions usable.
  bool wasButtonPressed = false;

  // TODO : Connect all reads to the approriate db
  @override
  Widget build(BuildContext context) {
    // Extract data with fallback values
    final appointment = widget.appointmentData ?? {};
    final patientName = appointment['patientName'] ?? 'Unknown Patient';
    final timeStr = appointment['time'] ?? '-';
    final reason = appointment['reason'] ?? '-';

    // !Basic date formatting (You can replace this with your DateService later)
    final rawDate = appointment['date'];
    final dateStr = rawDate != null
        ? "${rawDate.year}-${rawDate.month.toString().padLeft(2, '0')}-${rawDate.day.toString().padLeft(2, '0')}"
        : 'N/A';

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
                  Text("$patientName's Appointment",
                      style: Theme.of(context).textTheme.headlineLarge),
                  Row(
                    spacing: 16,
                    children: [
                      Button(
                          variant: ButtonVariant.secondary,
                          label: "Edit Appointment",
                          icon: Icons.edit_calendar,
                          onPressed: () {
                            widget.onEdit();
                          }),
                      Button(
                          variant: ButtonVariant.dangerSecondary,
                          label: "Cancel Appointment",
                          onPressed: () {
                            wasButtonPressed =
                                true; // TODO: create a cancel function
                          }),
                    ],
                  )
                ]),
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 1200),
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
                  SizedBox(height: 12),
                  Row(
                    spacing: 300,
                    children: [
                      // TODO: Connect these info to the approriate db.
                      AttributeReadView(label: "Date", content: dateStr),
                      AttributeReadView(label: "Time Slot", content: timeStr),
                      AttributeReadView(
                          label: "Reason for Visit", content: reason)
                    ],
                  )
                ]),
          ),
        ],
      ),
    ));
  }
}
