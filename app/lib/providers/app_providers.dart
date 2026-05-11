import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../db/database.dart';
import '../repositories/patient_repository.dart';
import '../repositories/appointment_repository.dart';
import '../repositories/clinical_record_repository.dart';

// Database - single instance
final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

// Repositories
final patientRepositoryProvider = Provider<PatientRepository>((ref) {
  return PatientRepository(ref.watch(databaseProvider));
});

final appointmentRepositoryProvider = Provider<AppointmentRepository>((ref) {
  return AppointmentRepository(ref.watch(databaseProvider));
});

final clinicalRecordRepositoryProvider =
    Provider<ClinicalRecordRepository>((ref) {
  return ClinicalRecordRepository(ref.watch(databaseProvider));
});


// --- DASHBOARD QUEUE PROVIDER ---

class DashboardQueueItem {
  final int appointmentId;
  final String patientName;
  final String timeSlot;
  final String status;

  DashboardQueueItem({
    required this.appointmentId,
    required this.patientName,
    required this.timeSlot,
    required this.status,
  });
}

// autoDispose ensures it refreshes cleanly when you leave and come back to the dashboard
final todayQueueProvider = FutureProvider.autoDispose<List<DashboardQueueItem>>((ref) async {
  final apptRepo = ref.watch(appointmentRepositoryProvider);
  final patientRepo = ref.watch(patientRepositoryProvider);

  final today = DateTime.now();
  // Uses your exact method from appointment_repository.dart
  final todayAppointments = await apptRepo.getAppointmentByDate(today);

  List<DashboardQueueItem> queueList = [];

  for (var appt in todayAppointments) {
    // IMPORTANT: Make sure getPatientById is inside your patient_repository.dart!
    // If it's not, add this line to PatientRepository: 
    // Future<PatientData> getPatientById(int id) => (db.select(db.patient)..where((p) => p.patientId.equals(id))).getSingle();
    final patient = await patientRepo.getPatientById(appt.patientId); 

    queueList.add(
      DashboardQueueItem(
        appointmentId: appt.appointmentId,
        patientName: '${patient.firstName} ${patient.lastName}',
        timeSlot: appt.timeSlot ?? "TBD",
        status: appt.status,
      )
    );
  }

  return queueList;
});
