import 'package:flutter/material.dart';
import '../../db/database.dart'; 
import '../../repositories/patient_repository.dart'; 
import '/../widgets/main_buttons.dart'; 
import 'schedule_appointment.dart'; 
import 'view_appointment.dart'; 

// enum of different schedule views
enum SchedulesView { main, scheduleAppointment, viewAppointment } //

class ScheduleDashboard extends StatefulWidget {
  const ScheduleDashboard({super.key});

  @override
  State<ScheduleDashboard> createState() => _ScheduleDashboardState();
}

class _ScheduleDashboardState extends State<ScheduleDashboard> {
  late PatientRepository _repository; // setting up the patient repository to be used here
  final AppDatabase _db = AppDatabase(); 

  List<PatientData> _allPatients = []; // list all patients in the database
  SchedulesView _currentView = SchedulesView.main; //

  @override
  void initState() {
    super.initState();
    _repository = PatientRepository(_db); // initalize the repository and load patients
    _loadPatients();
  }

  // Fetch data from the database
  Future<void> _loadPatients() async {
    final patients = await _repository.getAllPatients(); 
    setState(() {
      _allPatients = patients;
    });
  }

  // Go to the schedule appointment page
  void _goToScheduleAppointment() {
    setState(() => _currentView = SchedulesView.scheduleAppointment); 
  }

  // Go to view appointment page
  void _goToViewAppointment() {
    setState(() => _currentView = SchedulesView.viewAppointment); 
  }

  // Go back to dashboard
  void _goBackToMain() {
    setState(() => _currentView = SchedulesView.main); 
  }

  // Function to get patients that are not archived
  List<PatientData> get _activePatients => _allPatients
      .where((p) => p.isArchived == false || p.isArchived == null) 
      .toList();

  @override
  Widget build(BuildContext context) {
    Widget activeScreen;

    switch (_currentView) {
      case SchedulesView.scheduleAppointment:
        activeScreen = ScheduleAppointmentForm(
          activePatients: _activePatients, // Passes the live database list
          onSave: _goBackToMain,
        );
        break;
      case SchedulesView.viewAppointment:
        activeScreen = ViewAppointment(onSave: _goBackToMain); 
        break;
      case SchedulesView.main:
        activeScreen = _buildMainDashboard(); 
        break;
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: activeScreen, //
        ),
      ),
    );
  }

  Widget _buildMainDashboard() {
    return Container(
      padding: const EdgeInsets.all(24), 
      child: Column(
        children: [
          const SizedBox(height: 20), 
          Button(
              label: "Schedule Patient",
              variant: ButtonVariant.primary,
              width: double.infinity,
              onPressed: _goToScheduleAppointment), //
          const SizedBox(height: 20), //
          Button(
              label: "View Appointment",
              variant: ButtonVariant.primary,
              width: double.infinity,
              onPressed: _goToViewAppointment), //
        ],
      ),
    );
  }
}