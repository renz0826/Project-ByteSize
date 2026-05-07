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

final clinicalRecordRepositoryProvider = Provider<ClinicalRecordRepository>((ref) {
  return ClinicalRecordRepository(ref.watch(databaseProvider));
});