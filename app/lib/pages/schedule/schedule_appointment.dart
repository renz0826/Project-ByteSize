import 'package:dentcity_management_system/services/scheduling_service.dart';
import 'package:dentcity_management_system/style/theme.dart';
import 'package:dentcity_management_system/widgets/requirement_dialog.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../db/database.dart';
import '../../providers/app_providers.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/input_field.dart';
import '../../repositories/appointment_repository.dart';
import 'schedule_dashboard.dart';
import '/../widgets/status_toast.dart';
import '/../widgets/warning_dialog.dart';

class ScheduleAppointmentForm extends ConsumerStatefulWidget {
  final VoidCallback onSave;
  final List<PatientData> activePatients;
  final JoinedAppointment? appointmentToEdit;
  final PatientData? preSelectedPatient; 

  const ScheduleAppointmentForm({
    super.key,
    this.appointmentToEdit,
    required this.onSave,
    required this.activePatients,
    this.preSelectedPatient,
  });

  @override
  ConsumerState<ScheduleAppointmentForm> createState() =>
      _ScheduleAppointmentFormState();
}

class _ScheduleAppointmentFormState
    extends ConsumerState<ScheduleAppointmentForm> {
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

    if (isEditing) {
      final appt = widget.appointmentToEdit!.appointment;
      final patient = widget.appointmentToEdit!.patient;

      _selectedPatient = '${patient.lastName}, ${patient.firstName} ${patient.suffix ?? ""}'; 
      _selectedMonth = SchedulingService.months[appt.scheduleDateTime.month - 1]; 
      _selectedDay = appt.scheduleDateTime.day.toString();
      _selectedTimeSlot = appt.timeSlot;
      _reasonController.text = appt.reasonForVisit;

      if (_selectedTimeSlot != null) {
        _availableTimeSlots = [_selectedTimeSlot!];
      }

      _refreshTimeSlots(); 
    } else if (widget.preSelectedPatient != null) {
      _selectedPatient =
          '${widget.preSelectedPatient!.lastName}, ${widget.preSelectedPatient!.firstName}';
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

      if (mounted) {
        setState(() {
          _availableTimeSlots =
              allSlots.where((slot) => !booked.contains(slot)).toList();

          if (isEditing) {
            final originalAppt = widget.appointmentToEdit!.appointment;
            final originalMonth = SchedulingService.months[originalAppt.scheduleDateTime.month - 1]; 
            final originalDay = originalAppt.scheduleDateTime.day.toString();

            if (_selectedMonth == originalMonth && _selectedDay == originalDay) {
              if (!_availableTimeSlots.contains(originalAppt.timeSlot)) {
                _availableTimeSlots.add(originalAppt.timeSlot);
                _availableTimeSlots.sort((a, b) =>
                    allSlots.indexOf(a).compareTo(allSlots.indexOf(b)));
              }
            }
          }

          if (!_availableTimeSlots.contains(_selectedTimeSlot)) {
            _selectedTimeSlot = null;
          }
        });
      }
    } else {
      if (mounted) {
        setState(() {
          _availableTimeSlots = [];
          _selectedTimeSlot = null;
        });
      }
    }
  }

  // Function to format a warning for next year bookings
  Future<bool> _showNextYearWarningIfNeeded(DateTime selectedDate) async {
    final currentYear = DateTime.now().year;
    
    if (selectedDate.year > currentYear) {
      
      // Formats Month to number if needed, or displays month selection name natively
      final dateString = "${_selectedMonth} ${_selectedDay}, ${selectedDate.year}";

      final bool? proceed = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext dialogContext) {
          return WarningDialog(
            isCaution: true, 
            title: "Next Year Schedule Warning", // warning itself
            content: "You are booking this appointment for next year on $dateString. Are you sure you want to lock in this date?",
            secondaryAction: "Review Date",
            primaryAction: "Proceed Anyway",
          );
        },
      );
      return proceed ?? false;
    }
    return true; 
  }

  Future<void> _saveAppointment() async { // save appointment function
    List<String> missing = SchedulingValidator.getMissingAppointmentFields(
      patientName: _selectedPatient,
      month: _selectedMonth,
      day: _selectedDay,
      timeSlot: _selectedTimeSlot,
      reason: _reasonController.text,
    );
    if (missing.isNotEmpty) { // popup to show missing information from required fields
      RequirementDialog.show(context, "Missing Information",
          "Please provide the following details.", missing);
      return;
    }

    final date = SchedulingService.parseSelectedDate(_selectedMonth, _selectedDay); // parse date with scheduling service

    if (date != null) {
      final bool shouldProceed = await _showNextYearWarningIfNeeded(date); // check if the appointment is less than current date
      if (!shouldProceed) {
        return; 
      }
    }

    final db = ref.read(databaseProvider); // set db variables
    final repo = AppointmentRepository(db);

    final patient = widget.activePatients.firstWhere(
      (p) {
        final dropdownName = "${p.lastName}, ${p.firstName} ${p.suffix ?? ""}".trim();
        final initName = "${p.lastName}, ${p.firstName} ${p.suffix ?? ""}".trim();
        
        return dropdownName == _selectedPatient?.trim() || 
               initName == _selectedPatient?.trim();
      },
      orElse: () => widget.activePatients.first, 
    );

    final companion = AppointmentCompanion( // create companion and prepare to send to the database
      patientId: drift.Value(patient.patientId),
      scheduleDateTime: drift.Value(date!),
      timeSlot: drift.Value(_selectedTimeSlot!),
      reasonForVisit: drift.Value(_reasonController.text.trim()),
      status: drift.Value(isEditing
          ? widget.appointmentToEdit!.appointment.status
          : "Upcoming"),
      staffId: const drift.Value(1),
    );

    try {
      if (isEditing) {
        await (db.update(db.appointment)
              ..where((t) => t.appointmentId
                  .equals(widget.appointmentToEdit!.appointment.appointmentId)))
            .write(companion);

        if (mounted) { // show toast that patient appointment has been updated successfully
          StatusToast.show(context,
              isSuccess: true,
              title: "Appointment Updated",
              message: "Patient appointment has been updated successfully!");
        }
      } else {
        await repo.addAppointment(companion);

        if (mounted) { // show toast that patient appointment has been successfully created
          StatusToast.show(context,
              isSuccess: true,
              title: "Appointment Scheduled",
              message: "Patient appointment has been scheduled successfully!");
        }
      }

      widget.onSave();
    } catch (e) {
      if (mounted) { // show an error message
        StatusToast.show(context,
            isSuccess: false,
            title: "Error",
            message: "Failed to process appointment. Please try again.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppTheme.white500,
          borderRadius: BorderRadius.circular(24),
          boxShadow: AppTheme.floatShadow,
        ),
        child: Column(
          spacing: 32,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                isEditing // edit state
                    ? "Edit ${widget.appointmentToEdit?.patient.firstName} ${widget.appointmentToEdit?.patient.lastName}'s Schedule"
                    : "Schedule An Appointment",
                style: Theme.of(context).textTheme.headlineLarge),
            if (!isEditing)
              Column(
                spacing: 12,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Patient Name",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  InputField(
                    label: "Select Patient by Name",
                    variant: InputVariant.dropdown,
                    dropdownValue: _selectedPatient,
                    isRequired: true,
                    dropdownItems: widget.activePatients
                        .map((p) => "${p.lastName}, ${p.firstName}") // map the patients by lastName firstName
                        .toList(),
                    onDropdownChanged: (v) =>
                        setState(() => _selectedPatient = v), // 
                  ), 
                ],
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Appointment Schedule", 
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 12),
                Row(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: InputField(
                            label: "Month",
                            hintText: "Select month",
                            variant: InputVariant.dropdown,
                            dropdownValue: _selectedMonth,
                            isRequired: true,
                            dropdownItems: SchedulingService.months, // use scheduling service here again
                            onDropdownChanged: (v) {
                              setState(() {
                                _selectedMonth = v;
                                _selectedDay = null;
                              });
                              _refreshTimeSlots();
                            })),
                    Expanded(
                        child: InputField(
                            key: ValueKey( // use get inferred year to adjust based on month selected
                                '$_selectedMonth-${SchedulingService.getInferredYear(_selectedMonth)}'),
                            label: "Day",
                            hintText: "Select day",
                            variant: InputVariant.dropdown,
                            dropdownValue: _selectedDay,
                            isRequired: true,
                            dropdownItems: SchedulingService.getDaysInMonth(
                                _selectedMonth,
                                SchedulingService.getInferredYear(
                                    _selectedMonth)),
                            onDropdownChanged: (v) {
                              setState(() => _selectedDay = v);
                              _refreshTimeSlots();
                            })),
                    Expanded(
                        child: InputField(
                            key: ValueKey('$_selectedMonth-$_selectedDay'),
                            label: "Time Slot", // choose time slot (8-5)
                            hintText: "Select time",
                            variant: InputVariant.dropdown,
                            dropdownValue: _selectedTimeSlot,
                            isRequired: true,
                            dropdownItems: _availableTimeSlots.isEmpty
                                ? (_selectedTimeSlot != null
                                    ? [_selectedTimeSlot!]
                                    : ["Select a date first"])
                                : _availableTimeSlots,
                            onDropdownChanged: (v) {
                              if (v != "Select a date first") {
                                setState(() => _selectedTimeSlot = v);
                              }
                            })),
                    Expanded(
                      flex: 2,
                      child: InputField(
                        label: "Reason for visit", // enter the reason of visit here
                        hintText: "Enter reason for visit",
                        controller: _reasonController,
                        isRequired: true,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 280,
                  child: Button(
                      label: isEditing
                          ? "Update Schedule"
                          : "Schedule Appointment",
                      icon: isEditing ? Icons.save_alt_outlined : Icons.check,
                      iconPlacement: IconPlacement.left,
                      width: double.infinity,
                      onPressed: _saveAppointment),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}