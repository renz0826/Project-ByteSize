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
  final PatientData?
      preSelectedPatient; // added to be used from the viewpatient page

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

      _selectedPatient =
          '${patient.lastName}, ${patient.firstName} ${patient.suffix}'; // display in this format always
      _selectedMonth = SchedulingService.months[appt.scheduleDateTime.month -
          1]; // logic if month is less than system month, it will assume that it is booking for next year
      _selectedDay = appt.scheduleDateTime.day.toString();
      _selectedTimeSlot = appt.timeSlot;
      _reasonController.text = appt.reasonForVisit;

      if (_selectedTimeSlot != null) {
        _availableTimeSlots = [_selectedTimeSlot!];
      }

      _refreshTimeSlots(); // refresh all time slots to remove those that are already booked
    }
    // Automatically select the patient if one was passed in
    else if (widget.preSelectedPatient != null) {
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
    // function of refreshing time slots
    final date =
        SchedulingService.parseSelectedDate(_selectedMonth, _selectedDay);
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
            final originalMonth = SchedulingService.months[
                originalAppt.scheduleDateTime.month -
                    1]; // use schedule_service
            final originalDay = originalAppt.scheduleDateTime.day.toString();

            if (_selectedMonth == originalMonth &&
                _selectedDay == originalDay) {
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

  Future<void> _saveAppointment() async {
    // function to save appointments to the database
    // TODO: Needs form validator map for specific unentered fields
    if (_selectedPatient == null ||
        _selectedMonth == null ||
        _selectedDay == null ||
        _selectedTimeSlot == null) {
      RequirementDialog.show(
          context,
          "Missing Information",
          "Please provide the following details.",
          []); // if form validator is already finished, replace the "[]" with the variable name of the map
      return;
    }

    final db = ref.read(databaseProvider);
    final repo = AppointmentRepository(db);
    final date =
        SchedulingService.parseSelectedDate(_selectedMonth, _selectedDay);

    // always show patients that are booked earliest
    final patient = widget.activePatients.firstWhere((p) {
      final formattedName =
          '${p.lastName}, ${p.firstName} ${p.suffix ?? ""}'.trim();
      return formattedName == _selectedPatient?.trim();
    });

    final companion = AppointmentCompanion(
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

        if (mounted) {
          StatusToast.show(context,
              isSuccess: true,
              title: "Success",
              message: "Appointment Updated Successfully!");
        }
      } else {
        await repo.addAppointment(companion);

        if (mounted) {
          StatusToast.show(context,
              isSuccess: true,
              title: "Success",
              message: "Appointment Scheduled Successfully!");
        }
      }

      widget.onSave();
    } catch (e) {
      if (mounted) {
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
                isEditing
                    ? "Edit ${widget.appointmentToEdit?.patient.lastName}, ${widget.appointmentToEdit?.patient.firstName}'s Schedule"
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
                        .map((p) => "${p.lastName}, ${p.firstName}")
                        .toList(),
                    onDropdownChanged: (v) =>
                        setState(() => _selectedPatient = v),
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
                            dropdownItems: SchedulingService.months,
                            onDropdownChanged: (v) {
                              setState(() {
                                _selectedMonth = v;
                                _selectedDay = null;
                              });
                              _refreshTimeSlots();
                            })),
                    Expanded(
                        child: InputField(
                            key: ValueKey(
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
                            label: "Time Slot",
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
                        label: "Reason for visit",
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
