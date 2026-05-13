import 'package:drift/drift.dart';
import '../db/database.dart';
import '../services/patient_service.dart';

class PatientRepository {
  final AppDatabase db;
  final PatientOnboardingService onboardingService;

  PatientRepository(this.db) : onboardingService = PatientOnboardingService(db);

  // Get All Patients Function
  Future<List<PatientData>> getAllPatients() =>
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
          .write(const PatientCompanion(isArchived: Value(true)));

  // Restore Function (Unarchive)
  Future<int> unarchivePatient(int id) =>
      (db.update(db.patient)..where((t) => t.patientId.equals(id)))
          .write(const PatientCompanion(isArchived: Value(false)));

  // Uses the onboarding service for the multi-step save process
  Future<void> registerPatient(PatientCompanion p, ClinicalRecordCompanion c) =>
      onboardingService.registerNewPatient(patientData: p, clinicalData: c);

  // Strict Check: Duplicate First Name, Last Name, and DOB entry (Used in Add Patient)
  Future<bool> isExactDuplicate(String firstName, String lastName, DateTime birthDate) async {
    final query = db.select(db.patient)
      ..where((t) => 
          t.firstName.equals(firstName) & 
          t.lastName.equals(lastName) &
          t.birthDate.equals(birthDate)
      );
      
    final results = await query.get();
    return results.isNotEmpty; 
  }

  // Check if another patient (with a different ID) already has this name and birthdate (Used in Edit Patient)
  Future<bool> isDuplicateForUpdate(int currentPatientId, String first, String last, DateTime dob) async {
    final query = db.select(db.patient)
      ..where((t) => 
          t.firstName.equals(first) & 
          t.lastName.equals(last) & 
          t.birthDate.equals(dob) & 
          t.patientId.equals(currentPatientId).not()
      );
    
    final match = await query.getSingleOrNull();
    return match != null;
  }

  // Soft Check: Duplicate First Name, and Last Name
  Future<bool> isNameDuplicate(String firstName, String lastName) async {
    final query = db.select(db.patient)
      ..where((t) => 
          t.firstName.equals(firstName) & 
          t.lastName.equals(lastName)
      );
    final results = await query.get();
    return results.isNotEmpty; 
  }

  // Gets all non-archived patients
  Future<List<PatientData>> getActivePatients() =>
      (db.select(db.patient)
            ..where((p) => p.isArchived.equals(false) | p.isArchived.isNull()))
          .get();
}