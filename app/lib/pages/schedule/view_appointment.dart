import 'package:dentcity_management_system/style/theme.dart';
import 'package:flutter/material.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/attribute_read_view.dart';

class ViewAppointment extends StatefulWidget {
  final Map<String, dynamic>? existingPatient;

  const ViewAppointment({super.key, this.existingPatient});

  @override
  State<ViewAppointment> createState() => _ViewAppointmentState();
}

class _ViewAppointmentState extends State<ViewAppointment> {
  // TODO: Make functions usable.
  bool wasButtonPressed = false;

  // TODO : Connect all reads to the approriate db
  @override
  Widget build(BuildContext context) {
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
                  Text("Renz Bedonia's Appointment",
                      style: Theme.of(context).textTheme.headlineLarge),
                  Row(
                    spacing: 16,
                    children: [
                      Button(
                          variant: ButtonVariant.secondary,
                          label: "Edit Appointment",
                          icon: Icons.edit_calendar,
                          onPressed: () {
                            wasButtonPressed = true;
                          }),
                      Button(
                          variant: ButtonVariant.dangerSecondary,
                          label: "Cancel Appointment",
                          onPressed: () {
                            wasButtonPressed = true;
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
                      AttributeReadView(
                          label: "Date", content: "February 27, 2026"),
                      AttributeReadView(
                          label: "Time Slot", content: "10:00 AM"),
                      AttributeReadView(
                          label: "Reason for Visit", content: "Toothache")
                    ],
                  )
                ]),
          ),
        ],
      ),
    ));
  }
}
