import 'package:drift/drift.dart';
import '../db/database.dart';
import '../services/patient_onboarding.dart';

class PatientRepository {
  final AppDatabase db;
  final PatientOnboardingService onboardingService;

  PatientRepository(this.db) : onboardingService = PatientOnboardingService(db);

// Get All Patients Function
  Future<List<PatientData>> getAllPatients() => // Get All Patients Function
      db.select(db.patient).get();

// Search Patient Function
  Future<List<PatientData>> searchPatients(String query) =>
      (db.select(db.patient)
            ..where((p) =>
                p.firstName.contains(query) |
                p.middleName.contains(query) |
                p.lastName.contains(query) |
                p.contactNumber.contains(query)))
          .get();

// Add Patients Function
  Future<int> addPatient(PatientCompanion patient) =>
      db.into(db.patient).insert(patient);

// Update Patients Function
  Future<bool> updatePatient(PatientCompanion patient) =>
      db.update(db.patient).replace(patient);

// Archive Patients Function
  Future<int> archivePatient(int id) =>
      (db.update(db.patient)..where((t) => t.patientId.equals(id)))
          .write(PatientCompanion(isArchived: Value(true)));

// Uses the onboarding service for the multi-step save process
  Future<void> registerPatient(PatientCompanion p, ClinicalRecordCompanion c) =>
      onboardingService.registerNewPatient(patientData: p, clinicalData: c);

// Duplicate Patient Name Detector Function 
  Future<bool> isDuplicatePatient(String firstName, String lastName) async {
    final query = db.select(db.patient)
      ..where((t) => 
          t.firstName.equals(firstName) & 
          t.lastName.equals(lastName)
      );
    final results = await query.get();
    return results.isNotEmpty;  // returns true if a duplicate is found, if list is empty
  }
}

