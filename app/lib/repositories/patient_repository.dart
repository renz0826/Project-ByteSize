import 'package:drift/drift.dart';
import '../db/database.dart';

class PatientRepository {
  final AppDatabase db;
  PatientRepository(this.db);

// Get All Patients Function
  Future<List<PatientData>> getAllPatients() => // Get All Patients Function
      db.select(db.patient).get();

// Search Patient Function
  Future<List<PatientData>> searchPatients(String query) =>
      (db.select(db.patient)
        ..where((p) => 
            p.firstName.contains(query) | 
            p.middleName.contains(query) | 
            p.lastName.contains(query)
        ))
        .get();

// Add Patients Function
  Future<int> addPatient(PatientCompanion patient) =>
      db.into(db.patient).insert(patient);

// Update Patients Function
  Future<bool> updatePatient(PatientCompanion patient) =>
      db.update(db.patient).replace(patient);

// Archive Patients Function
  Future<int> archivePatient(int id) => 
    (db.update(db.patient)..where((t) => t.id.equals(id)))
    .write(PatientCompanion(isArchived: Value(true)));
}
