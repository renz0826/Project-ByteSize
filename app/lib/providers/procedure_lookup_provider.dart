import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../db/database.dart';
import '../db/database_provider.dart';
import '../repositories/procedure_lookup_repository.dart';

// Repository Provider
final procedureLookupRepositoryProvider =
    Provider<ProcedureLookupRepository>((ref) {
  final db = ref.watch(dbProvider);
  return ProcedureLookupRepository(db);
});

// All Procedures Provider
final proceduresProvider =
    FutureProvider<List<ProcedureLookupData>>((ref) {
  return ref
      .watch(procedureLookupRepositoryProvider)
      .getAllProcedures();
});

// Single Procedure Provider
final procedureProvider =
    FutureProvider.family<ProcedureLookupData, int>((ref, id) {
  return ref
      .watch(procedureLookupRepositoryProvider)
      .getProcedure(id);
});