import 'package:dentcity_management_system/style/theme.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import '../../db/database.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/input_field.dart';
import '../../services/date_service.dart';
import '../../services/time_slot_helper.dart';
import '../../repositories/appointment_repository.dart';

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

  // Database & Repository
  final AppDatabase _db = AppDatabase();
  late AppointmentRepository _appointmentRepository;

  // Selected Patient
  String? _selectedPatient;

  // Month/Day System
  String? _selectedMonth;
  String? _selectedDay;

  // Selected Timeslot
  String? _selectedTimeSlot;
  List<String> _availableTimeSlots = []; // This list holds the filtered boxes

  // Controller for Reason for Visit text box
  final TextEditingController _reasonController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _appointmentRepository =
        AppointmentRepository(_db); // Initialize Repository
  }

  // Dispose the controller to prevent memory leaks
  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  // Time Slot Logic
  DateTime? _parseSelectedDate() {
    if (_selectedMonth == null || _selectedDay == null) return null;

    int year = DateTime.now().year;
    final currentMonth = DateTime.now().month;
    final selectedMonthIndex = DateService.months.indexOf(_selectedMonth!) + 1;
    final day = int.tryParse(_selectedDay!);

    if (selectedMonthIndex <= 0 || day == null) return null;

    if (selectedMonthIndex < currentMonth) {
      year +=
          1; // if month selected is lesser than current month, this means appointment is booked for next year
      // this logic was created so that if the month is December, but staff selects January.
    }

    return DateTime(year, selectedMonthIndex, day);
  }

  Future<void> _refreshTimeSlots() async {
    final selectedDate = _parseSelectedDate();

    if (selectedDate != null) {
      final allSlots = TimeSlotService.generateAllSlots();
      // Ensure getBookedSlots is in your repository!
      final bookedSlots =
          await _appointmentRepository.getBookedSlots(selectedDate);

      setState(() {
        _availableTimeSlots = TimeSlotService.filterAvailableSlots(
          allSlots: allSlots,
          bookedSlots: bookedSlots,
        );

        if (!_availableTimeSlots.contains(_selectedTimeSlot)) {
          _selectedTimeSlot = null; // Clear if slot is no longer available
        }
      });
    } else {
      setState(() {
        _availableTimeSlots = [];
        _selectedTimeSlot = null;
      });
    }
  }

  // Save Appointment Logic
  Future<void> _saveAppointment() async {
    // Step 1: Validating all not-null fields
    // TODO: @Frontend, please edit this to match our app's theme - Fons
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
              borderRadius:
                  BorderRadius.circular(16), 
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
      return; // Stops the save process
    }

    // Step 2: Find all non-archived patients from the database
    final patient = widget.activePatients.firstWhere(
      (p) => '${p.firstName} ${p.lastName}' == _selectedPatient,
    );

    // Step 3: Get the parsed DateTime here
    final scheduleDate = _parseSelectedDate();
    if (scheduleDate == null) return;

    // Step 4: Create the Appointment Companion
    final newAppointment = AppointmentCompanion(
      patientId: drift.Value(patient.patientId),
      scheduleDateTime: drift.Value(scheduleDate),
      timeSlot: drift.Value(_selectedTimeSlot!),
      reasonForVisit: drift.Value(_reasonController.text.trim()),
      status: const drift.Value("Pending"), // Default status
    );

    await _appointmentRepository.addAppointment(newAppointment);

    // Step 5: Show a success message
    // TODO: @Frontend, try to fit this snackbar to our theme please - Fons
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Appointment Scheduled Successfully!")),
      );
    }

    // Step 6: Clean up the form and save
    _resetForm();
    widget.onSave();
  }

  void _resetForm() {
    setState(() {
      _selectedPatient = null;
      _selectedMonth = null;
      _selectedDay = null;
      _selectedTimeSlot = null;
      _availableTimeSlots = [];
      _reasonController.clear(); // Clear the text field
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
                        .map((p) => '${p.firstName} ${p.lastName}')
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
                      _selectedDay = null; // Reset day when month changes
                    });
                    _refreshTimeSlots(); // Trigger scan!
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
                    _refreshTimeSlots(); // Trigger scan!
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: InputField(
                  key: ValueKey(
                      '$_selectedMonth-$_selectedDay'), // Update key to force UI refresh
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
                      setState(() {
                        _selectedTimeSlot = value;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: InputField(
                  controller:
                      _reasonController, // reason controller 
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
                  onPressed:
                      _saveAppointment, // save function is created
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
