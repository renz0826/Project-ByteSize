import 'package:dentcity_management_system/style/theme.dart';
import 'package:flutter/material.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/input_field.dart';
import '/../widgets/radio_buttons.dart';
import '../../services/locations_ph.dart';
import '../../services/date_service.dart';

// TODO: For the add patient onNext, make sure that the data is saved temporarily where it does not restart.

class ScheduleAppointmentForm extends StatefulWidget {
  final VoidCallback onSave;
  final Map<String, dynamic>? existingPatient;

  const ScheduleAppointmentForm(
      {super.key, this.existingPatient, required this.onSave});

  @override
  State<ScheduleAppointmentForm> createState() =>
      _ScheduleAppointmentFormState();
}

class _ScheduleAppointmentFormState extends State<ScheduleAppointmentForm> {
  bool get isEditing => widget.existingPatient != null;

  // State for selected patient
  String? _selectedPatient;

  // State for Month/Day Dynamic System
  String? _selectedMonth; // selected month to change days
  String? _selectedDay; // selected day

  // State for selected patient
  String? _selectedTimeSlot; // selected day

  // TODO : Connect all text fields to the appropriate db
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      margin: const EdgeInsets.all(24),
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
          Text("Schedule an Appointment",
              style: Theme.of(context).textTheme.headlineLarge),

          const SizedBox(height: 32),

          // --- PATIENT NAME ---
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: InputField(
                  hintText: "Select a patient",
                  label: "Patient Full Name",
                  variant: InputVariant.dropdown,
                  dropdownValue: _selectedPatient,
                  isRequired: true,
                  dropdownItems: ["Renz", "Alfonso"],
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          // --- APPOINTMENT SCHEDULE ---
          const SizedBox(height: 12),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: InputField(
                  hintText: "Select a month",
                  label: "Month",
                  variant: InputVariant.dropdown,
                  dropdownValue: _selectedMonth,
                  isRequired: true,
                  dropdownItems: DateService.months,
                  onDropdownChanged: (value) {
                    setState(() {
                      _selectedMonth = value;
                      _selectedDay = null;
                    });
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: InputField(
                  key: ValueKey(_selectedMonth),
                  hintText: "Select a day",
                  label: "Day",
                  variant: InputVariant.dropdown,
                  dropdownValue: _selectedDay,
                  isRequired: true,
                  dropdownItems: List.generate(
                    DateService.getDaysInMonth(_selectedMonth),
                    (index) => (index + 1).toString(),
                  ),
                  onDropdownChanged: (value) {
                    setState(() {
                      _selectedDay = value;
                    });
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: InputField(
                  key: ValueKey(_selectedMonth),
                  hintText: "Select a time slot",
                  label: "Time Slot",
                  variant: InputVariant.dropdown,
                  dropdownValue: _selectedTimeSlot,
                  isRequired: true,
                  dropdownItems: [""],
                  onDropdownChanged: (value) {
                    setState(() {
                      _selectedTimeSlot = value;
                    });
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: InputField(
                  hintText: "Enter reason for visit",
                  label: "Reason for visit",
                  isRequired: true,
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          // --- ACTION BUTTON ---
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // ! A temporary button that returns to back to main
              // SizedBox(
              //   width: 160,
              //   child: Button(
              //     label: "Back",
              //     width: double.infinity,
              //     icon: Icons.arrow_forward,
              //     iconPlacement: IconPlacement.right,
              //     onPressed: widget.onBack,
              //   ),
              // ),
              SizedBox(
                width: 140,
                child: Button(
                  label: "Next",
                  width: double.infinity,
                  icon: Icons.arrow_forward,
                  iconPlacement: IconPlacement.right,
                  onPressed: widget.onSave,
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
