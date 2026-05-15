import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../db/database.dart';
import '../repositories/patient_repository.dart';
import '../repositories/appointment_repository.dart';
import '../repositories/clinical_record_repository.dart';

// --- DATABASE & REPOSITORY PROVIDERS ---

// Provides a single instance of the AppDatabase throughout the app
final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

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

// --- DATA MODELS ---

class DashboardQueueItem {
  final int appointmentId;
  final String patientName;
  final String timeSlot;
  final String reason;
  final String status;

  DashboardQueueItem({
    required this.appointmentId,
    required this.patientName,
    required this.timeSlot,
    required this.reason,
    required this.status,
  });
}

// --- REACTIVE QUEUE PROVIDER ---

// Provides a live stream of today's patient queue.
final todayQueueProvider =
    StreamProvider.autoDispose<List<DashboardQueueItem>>((ref) {
  final apptRepo = ref.watch(appointmentRepositoryProvider);

  return apptRepo.watchTodayQueue();
});
