import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../db/database.dart';
import '../db/database_provider.dart';
import '../repositories/clinical_record_repository.dart';

// Repository Provider
final clinicalRecordRepositoryProvider =
    Provider<ClinicalRecordRepository>((ref) {
  final db = ref.watch(dbProvider);
  return ClinicalRecordRepository(db);
});

// All Clinical Records Provider
final clinicalRecordsProvider = FutureProvider<List<ClinicalRecordData>>((ref) {
  return ref.watch(clinicalRecordRepositoryProvider).getAllClinicalRecords();
});

// Single Clinical Record Provider
final clinicalRecordProvider =
    FutureProvider.family<ClinicalRecordData, int>((ref, id) {
  return ref.watch(clinicalRecordRepositoryProvider).getClinicalRecord(id);
});

// Clinical Records by PATIENT
final clinicalRecordsByPatientProvider =
    FutureProvider.family<List<ClinicalRecordData>, int>((ref, patientId) {
  return ref
      .watch(clinicalRecordRepositoryProvider)
      .getClinicalRecordsByPatient(patientId);
});
