// file: schedule_appointment.dart
import 'package:dentcity_management_system/style/theme.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../db/database.dart';
import '../../providers/app_providers.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/input_field.dart';
import '../../services/date_service.dart';
import '../../services/time_slot_helper.dart';
import '../../repositories/appointment_repository.dart';

class ScheduleAppointmentForm extends ConsumerStatefulWidget {
  final VoidCallback onSave;
  final Map<String, dynamic>? existingPatient;
  final List<PatientData> activePatients;

  const ScheduleAppointmentForm(
      {super.key,
      this.existingPatient,
      required this.onSave,
      required this.activePatients});

  @override
  ConsumerState<ScheduleAppointmentForm> createState() =>
      _ScheduleAppointmentFormState();
}

class _ScheduleAppointmentFormState
    extends ConsumerState<ScheduleAppointmentForm> {
  bool get isEditing => widget.existingPatient != null;

  // Selected Patient
  String? _selectedPatient;

  // Month/Day System
  String? _selectedMonth;
  String? _selectedDay;

  // Selected Timeslot
  String? _selectedTimeSlot;
  List<String> _availableTimeSlots = [];

  // Controller for Reason for Visit text box
  final TextEditingController _reasonController = TextEditingController();

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  String _getInferredYear() {
    int year = DateTime.now().year;
    if (_selectedMonth == null) return year.toString();

    final currentMonth = DateTime.now().month;
    final selectedMonthIndex = DateService.months.indexOf(_selectedMonth!) + 1;

    if (selectedMonthIndex < currentMonth) {
      year += 1;
    }
    return year.toString();
  }

  DateTime? _parseSelectedDate() {
    if (_selectedMonth == null || _selectedDay == null) return null;

    int year = int.parse(_getInferredYear());
    final selectedMonthIndex = DateService.months.indexOf(_selectedMonth!) + 1;
    final day = int.tryParse(_selectedDay!);

    if (selectedMonthIndex <= 0 || day == null) return null;

    return DateTime(year, selectedMonthIndex, day);
  }

  Future<void> _refreshTimeSlots() async {
    final selectedDate = _parseSelectedDate();

    if (selectedDate != null) {
      final db = ref.read(databaseProvider);
      final appointmentRepository = AppointmentRepository(db);
      
      final allSlots = TimeSlotService.generateAllSlots();
      final bookedSlots =
          await appointmentRepository.getBookedSlots(selectedDate);

      setState(() {
        _availableTimeSlots = TimeSlotService.filterAvailableSlots(
          allSlots: allSlots,
          bookedSlots: bookedSlots,
        );

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
    // 1. Validation (Your code here is perfect!)
    if (_selectedPatient == null ||
        _selectedMonth == null ||
        _selectedDay == null ||
        _selectedTimeSlot == null ||
        _reasonController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Missing Information"),
            content: const Text(
                "Please fill in all fields before scheduling the appointment."),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
      return;
    }

    // Wrap the database logic in a try-catch!
    try {
      // 2. FIX: Match the exact format used in your dropdown (LastName, FirstName)
      final patient = widget.activePatients.firstWhere(
        (p) => '${p.lastName}, ${p.firstName}' == _selectedPatient, 
        // Add an 'orElse' just in case, to prevent a hard crash
        orElse: () => throw Exception("Patient not found in the list!"),
      );

      final scheduleDate = _parseSelectedDate();
      if (scheduleDate == null) return;

      // 3. Prepare the data
      final newAppointment = AppointmentCompanion( 
        patientId: drift.Value(patient.patientId),
        scheduleDateTime: drift.Value(scheduleDate),
        timeSlot: drift.Value(_selectedTimeSlot!),
        reasonForVisit: drift.Value(_reasonController.text.trim()),
        status: const drift.Value("Pending"),
        staffId: const drift.Value(1),
      );

      // 4. Save to Database
      final db = ref.read(databaseProvider);
      final appointmentRepository = AppointmentRepository(db);
      await appointmentRepository.addAppointment(newAppointment);

      // 5. Success actions
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Appointment Scheduled Successfully!")),
        );
      }

      // 6. Reset and return
      // _resetForm(); // Note: If widget.onSave() closes the page, resetting isn't strictly necessary, but it doesn't hurt!
      widget.onSave();

    } catch (e) {
      // IF ANYTHING FAILS, SHOW THIS ERROR INSTEAD OF FREEZING!
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error saving appointment: $e"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _resetForm() {
    setState(() {
      _selectedPatient = null;
      _selectedMonth = null;
      _selectedDay = null;
      _selectedTimeSlot = null;
      _availableTimeSlots = [];
      _reasonController.clear();
    });
  }

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
                        .map((p) => '${p.lastName}, ${p.firstName}')
                        .toList(),
                    onDropdownChanged: (value) {
                      setState(() => _selectedPatient = value);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
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
                    _refreshTimeSlots();
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: InputField(
                  key: ValueKey('$_selectedMonth-${_getInferredYear()}'),
                  hintText: "Select a day",
                  label: "Day",
                  variant: InputVariant.dropdown,
                  dropdownValue: _selectedDay,
                  isRequired: true,
                  dropdownItems: List.generate(
                    DateService.getDaysInMonth(
                        _selectedMonth, _getInferredYear()),
                    (index) => (index + 1).toString(),
                  ),
                  onDropdownChanged: (value) {
                    setState(() => _selectedDay = value);
                    _refreshTimeSlots();
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: InputField(
                  key: ValueKey('$_selectedMonth-$_selectedDay'),
                  hintText: "Select a time slot",
                  label: "Time Slot",
                  variant: InputVariant.dropdown,
                  dropdownValue: _selectedTimeSlot,
                  isRequired: true,
                  dropdownItems: _availableTimeSlots.isEmpty
                      ? ["Select a month or date first"]
                      : _availableTimeSlots,
                  onDropdownChanged: (value) {
                    if (value != "Select a date first") {
                      setState(() => _selectedTimeSlot = value);
                    }
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: InputField(
                  controller: _reasonController,
                  hintText: "Enter reason for visit",
                  label: "Reason for visit",
                  isRequired: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 280,
                child: Button(
                  label: !isEditing
                      ? "Schedule Appointment"
                      : "Update Schedule",
                  width: double.infinity,
                  icon: !isEditing ? Icons.check : Icons.save_alt_outlined,
                  iconPlacement: IconPlacement.left,
                  onPressed: _saveAppointment,
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}