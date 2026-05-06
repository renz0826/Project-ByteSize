import 'package:dentcity_management_system/style/theme.dart';
import 'package:flutter/material.dart';
import '../../db/database.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/input_field.dart';
import '../../services/date_service.dart';

class ScheduleAppointmentForm extends StatefulWidget {
  final VoidCallback onSave;
  final Map<String, dynamic>? existingPatient;

  final List<PatientData> activePatients;

  const ScheduleAppointmentForm(
      {super.key,
      this.existingPatient,
      required this.onSave,
      required this.activePatients});

  @override
  State<ScheduleAppointmentForm> createState() =>
      _ScheduleAppointmentFormState();
}

class _ScheduleAppointmentFormState extends State<ScheduleAppointmentForm> {
  bool get isEditing => widget.existingPatient != null;

  // Selected Patient
  String? _selectedPatient;

  // Month/Day System
  String? _selectedMonth; 
  String? _selectedDay; 

  // Selected Timeslot
  String? _selectedTimeSlot; 

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
          Text(
              !isEditing
                  ? "Schedule an Appointment"
                  : ("Edit ${widget.existingPatient?['fullName']}'s Schedule "),
              style: Theme.of(context).textTheme.headlineLarge),

          const SizedBox(height: 32),

          // --- PATIENT NAME ---
          if (!isEditing) ...[
            Row(
              children: [
                Expanded(
                  child: InputField(
                    hintText: "Select a patient",
                    label: "Patient Full Name",
                    variant: InputVariant.dropdown,
                    dropdownValue: _selectedPatient,
                    isRequired: true,
                    dropdownItems: widget.activePatients
                        .map((p) => '${p.firstName} ${p.lastName}') // turns the patient entity into these strings
                        .toList(), // list on the dropdown menu
                    onDropdownChanged: (value) {
                      setState(() => _selectedPatient = value);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
          // --- APPOINTMENT SCHEDULE ---
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
              SizedBox(
                width: 280,
                child: Button(
                  label:
                      !isEditing ? "Schedule Appointment" : "Update Schedule",
                  width: double.infinity,
                  icon: !isEditing ? Icons.check : Icons.save_alt_outlined,
                  iconPlacement: IconPlacement.left,
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
