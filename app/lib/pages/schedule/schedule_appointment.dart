// file: schedule_appointment.dart
import 'package:dentcity_management_system/services/scheduling_service.dart';
import 'package:dentcity_management_system/style/theme.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../db/database.dart';
import '../../providers/app_providers.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/input_field.dart';
import '../../repositories/appointment_repository.dart';
import 'schedule_dashboard.dart'; // Allows us to use the JoinedAppointment class

class ScheduleAppointmentForm extends ConsumerStatefulWidget {
  final VoidCallback onSave;
  final List<PatientData> activePatients;
  
  // The trigger for Edit Mode:
  final JoinedAppointment? appointmentToEdit; 

  const ScheduleAppointmentForm({
    super.key,
    this.appointmentToEdit,
    required this.onSave,
    required this.activePatients,
  });

  @override
  ConsumerState<ScheduleAppointmentForm> createState() =>
      _ScheduleAppointmentFormState();
}

class _ScheduleAppointmentFormState extends ConsumerState<ScheduleAppointmentForm> {
  // Simple check to see if we are creating or updating
  bool get isEditing => widget.appointmentToEdit != null;

  String? _selectedPatient;
  String? _selectedMonth;
  String? _selectedDay;
  String? _selectedTimeSlot;
  List<String> _availableTimeSlots = [];
  
  final TextEditingController _reasonController = TextEditingController();

  @override
  void initState() {
    super.initState();
    
    // PRE-FILL FORM: If we are editing, grab the data from the database object
    if (isEditing) {
      final appt = widget.appointmentToEdit!.appointment;
      final patient = widget.appointmentToEdit!.patient;

      // 1. Set Patient Name
      _selectedPatient = '${patient.lastName}, ${patient.firstName}';
      
      // 2. Set Date (Extracting strings from DateTime)
      _selectedMonth = SchedulingService.months[appt.scheduleDateTime.month - 1];
      _selectedDay = appt.scheduleDateTime.day.toString();
      
      // 3. Set Time and Reason
      _selectedTimeSlot = appt.timeSlot;
      _reasonController.text = appt.reasonForVisit ?? "";
      
      // 4. Load the slots so the dropdown populates!
      _refreshTimeSlots();
    }
  }

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  Future<void> _refreshTimeSlots() async {
    final date = SchedulingService.parseSelectedDate(_selectedMonth, _selectedDay);
    if (date != null) {
      final repo = AppointmentRepository(ref.read(databaseProvider));
      final booked = await repo.getBookedSlots(date);
      final allSlots = SchedulingService.generateAllSlots();
      
      setState(() {
        // Filter out slots that are already booked
        _availableTimeSlots = allSlots.where((slot) => !booked.contains(slot)).toList();

        // EDIT MODE MAGIC: 
        // If we are looking at the exact same day as our original appointment,
        // we need to add our current time slot back into the list (since it counts as "booked").
        if (isEditing) {
          final originalAppt = widget.appointmentToEdit!.appointment;
          final originalMonth = SchedulingService.months[originalAppt.scheduleDateTime.month - 1];
          final originalDay = originalAppt.scheduleDateTime.day.toString();

          if (_selectedMonth == originalMonth && _selectedDay == originalDay) {
            if (originalAppt.timeSlot != null && !_availableTimeSlots.contains(originalAppt.timeSlot)) {
              _availableTimeSlots.add(originalAppt.timeSlot!);
              
              // Sort the list so the re-added time isn't stuck at the bottom
              _availableTimeSlots.sort((a, b) => 
                allSlots.indexOf(a).compareTo(allSlots.indexOf(b))
              );
            }
          }
        }

        if (!_availableTimeSlots.contains(_selectedTimeSlot)) {
          _selectedTimeSlot = null;
        }
      });
    } else {
      setState(() {
        _availableTimeSlots = [];
        _selectedTimeSlot = null;
      });
    }
  }

  Future<void> _saveAppointment() async {
    // Basic Validation Check
    if (_selectedPatient == null || _selectedMonth == null || _selectedDay == null || _selectedTimeSlot == null) {
       ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please fill in all required fields."), backgroundColor: Colors.red),
       );
       return;
    }

    final db = ref.read(databaseProvider);
    final repo = AppointmentRepository(db);
    final date = SchedulingService.parseSelectedDate(_selectedMonth, _selectedDay);
    
    final patient = widget.activePatients.firstWhere(
      (p) => '${p.lastName}, ${p.firstName}' == _selectedPatient
    );

    // Create the secure database object
    final companion = AppointmentCompanion(
      patientId: drift.Value(patient.patientId),
      scheduleDateTime: drift.Value(date!),
      timeSlot: drift.Value(_selectedTimeSlot!),
      reasonForVisit: drift.Value(_reasonController.text.trim()),
      status: drift.Value(isEditing ? widget.appointmentToEdit!.appointment.status : "Pending"),
      staffId: const drift.Value(1),
    );

    try {
      if (isEditing) {
        // UPDATE RECORD: Targeting the exact ID in the database
        await (db.update(db.appointment)
          ..where((t) => t.appointmentId.equals(widget.appointmentToEdit!.appointment.appointmentId))
        ).write(companion);
        
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Appointment Updated Successfully!")));
      } else {
        // INSERT RECORD: Creating a brand new appointment
        await repo.addAppointment(companion);
        
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Appointment Scheduled Successfully!")));
      }

      widget.onSave();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: $e"), backgroundColor: Colors.red));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        padding: const EdgeInsets.all(32),
        margin: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppTheme.white500,
          borderRadius: BorderRadius.circular(24),
          boxShadow: AppTheme.floatShadow,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(isEditing ? "Edit Appointment" : "Schedule Appointment", 
                 style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 32),
            InputField(
              label: "Patient Name", 
              hintText: "Select patient",
              variant: InputVariant.dropdown,
              dropdownValue: _selectedPatient,
              isRequired: true,
              // Block the user from changing the patient if they are just editing the schedule!
              onDropdownChanged: isEditing ? null : (v) => setState(() => _selectedPatient = v),
              dropdownItems: widget.activePatients.map((p) => '${p.lastName}, ${p.firstName}').toList(),
            ),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: InputField(
                  label: "Month", 
                  hintText: "Select month",
                  variant: InputVariant.dropdown, 
                  dropdownValue: _selectedMonth, 
                  isRequired: true,
                  dropdownItems: SchedulingService.months, 
                  onDropdownChanged: (v) { setState(() { _selectedMonth = v; _selectedDay = null; }); _refreshTimeSlots(); }
                )),
                const SizedBox(width: 12),
                Expanded(child: InputField(
                  key: ValueKey('$_selectedMonth-${SchedulingService.getInferredYear(_selectedMonth)}'),
                  label: "Day", 
                  hintText: "DD",
                  variant: InputVariant.dropdown, 
                  dropdownValue: _selectedDay, 
                  isRequired: true,
                  dropdownItems: SchedulingService.getDaysInMonth(_selectedMonth, SchedulingService.getInferredYear(_selectedMonth)), 
                  onDropdownChanged: (v) { setState(() => _selectedDay = v); _refreshTimeSlots(); }
                )),
                const SizedBox(width: 12),
                Expanded(child: InputField(
                  key: ValueKey('$_selectedMonth-$_selectedDay'),
                  label: "Time Slot", 
                  hintText: "Select time",
                  variant: InputVariant.dropdown, 
                  dropdownValue: _selectedTimeSlot, 
                  isRequired: true,
                  dropdownItems: _availableTimeSlots.isEmpty ? ["Select a date first"] : _availableTimeSlots, 
                  onDropdownChanged: (v) {
                    if (v != "Select a date first") setState(() => _selectedTimeSlot = v);
                  }
                )),
              ],
            ),
            const SizedBox(height: 24),
            InputField(
              label: "Reason for visit", 
              hintText: "Enter reason for visit",
              controller: _reasonController,
              isRequired: true,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 280,
                  child: Button(
                    label: isEditing ? "Update Schedule" : "Schedule Appointment", 
                    icon: isEditing ? Icons.save_alt_outlined : Icons.check, 
                    iconPlacement: IconPlacement.left,
                    width: double.infinity, 
                    onPressed: _saveAppointment
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}