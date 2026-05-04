import 'package:flutter/material.dart';
import '/../widgets/main_buttons.dart';
import 'schedule_appointment.dart';
import 'view_appointment.dart';

// enum of different schedule views
// TODO: Add different Edit and View Patient Record Views
enum SchedulesView { main, scheduleAppointment, viewAppointment }

class ScheduleDashboard extends StatefulWidget {
  const ScheduleDashboard({super.key});

  @override
  State<ScheduleDashboard> createState() => _ScheduleDashboardState();
}

class _ScheduleDashboardState extends State<ScheduleDashboard> {
  // Functions to change schedule screen states
  SchedulesView _currentView = SchedulesView.main;

  void _goToScheduleAppointment() {
    setState(() => _currentView = SchedulesView.scheduleAppointment);
  }

  void _goToViewAppointment() {
    setState(() => _currentView = SchedulesView.viewAppointment);
  }

  void _goBackToMain() {
    setState(() => _currentView = SchedulesView.main);
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen;

    // Switches the view for each screen
    // TODO: Add View and Edit States
    switch (_currentView) {
      case SchedulesView.scheduleAppointment:
        activeScreen = ScheduleAppointmentForm(
          onSave: _goBackToMain,
        );
      case SchedulesView.viewAppointment:
        activeScreen = ViewAppointment(onSave: _goBackToMain);
      case SchedulesView.main:
        activeScreen = _buildMainDashboard();
        break;
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: activeScreen,
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
              onPressed: _goToScheduleAppointment),
          SizedBox(height: 20),
          Button(
              label: "View Appointment",
              variant: ButtonVariant.primary,
              width: double.infinity,
              onPressed: _goToViewAppointment),
        ],
      ),
    );
  }
}
