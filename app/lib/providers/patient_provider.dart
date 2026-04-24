import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../db/database.dart';
import '../db/database_provider.dart';
import '../repositories/patient_repository.dart';
import '../main.dart';

// Repository Provider
final patientRepositoryProvider = Provider <PatientRepository> ((ref){
  final db = ref.watch(dbProvider);
  return PatientRepository(db);
});

// All Patients Provider
final patientsProvider = FutureProvider<List<PatientData>> ((ref){
  return ref.watch(patientRepositoryProvider).getAllPatients();
});

// Search Query Provider (For the search bar)
final searchQueryProvider = StateProvider<String>((ref) => '');

// Filtered Patients Provider
final filteredPatientsProvider = FutureProvider<List<PatientData>>((ref) {
  final query = ref.watch(searchQueryProvider);
  final repo = ref.watch(patientRepositoryProvider);

  if (query.isEmpty) {
    return repo.getAllPatients();
  }
  return repo.searchPatients(query);
});