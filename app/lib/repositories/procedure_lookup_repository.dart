import 'package:drift/drift.dart';
import '../db/database.dart';

// THIS PAGE IS TO BE USED FOR PROCEDURE CHARGE (PRE-DEFINED PROCEDURES AND MONEY)
class ProcedureLookupRepository {
  final AppDatabase db;
  ProcedureLookupRepository(this.db);

// Read all procedures to be used for the dropdown menu ()
  Future<List<ProcedureLookupData>> getAllProcedures() =>
      db.select(db.procedureLookup).get();

// Get only a SINGLE procedure
  Future<ProcedureLookupData> getProcedure(int id) =>
      (db.select(db.procedureLookup)..where((p) => p.id.equals(id)))
          .getSingle();

// Nothing here yet, but seed procedures here so tables are populated pre-launch
}
