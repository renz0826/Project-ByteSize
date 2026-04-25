import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../db/database.dart';
import '../db/database_provider.dart';
import '../repositories/appointment_repository.dart';

// Repository Provider
final appointmentRepositoryProvider = Provider<AppointmentRepository>((ref) {
  final db = ref.watch(dbProvider);
  return AppointmentRepository(db);
});

// All Appointments Provider
final appointmentProvider = FutureProvider<List<AppointmentData>>((ref){
  return ref.watch(appointmentRepositoryProvider).getAllAppointments();
});

// Appointment by DATE Provider
final appointmentByPatientProvider =
  FutureProvider.family<List<AppointmentData>, int>((ref, patientID) {
  return ref
      .watch(appointmentRepositoryProvider)
      .getAppointmentByPatient(patientID);
});

// Appointment by STATUS Provider
final appointmentsByStatusProvider =
  FutureProvider.family<List<AppointmentData>, String>((ref, status) {
  return ref .watch(appointmentRepositoryProvider) .getAppointmentByStatus(status);
});

// Provider for SELECTED DATE (Calendar Widget)
final selectedDateProvider = StateProvider<DateTime>((ref) => DateTime.now());