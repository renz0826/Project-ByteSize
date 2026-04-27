import 'package:drift/drift.dart';
import '../db/database.dart';

class ClinicalRecordRepository {
  final AppDatabase db;
  ClinicalRecordRepository(this.db);

// Add New Clinical Record
Future<int> addClinicalRecord(ClinicalRecordCompanion record) =>
    db.into(db.clinicalRecord).insert(record);

// Read All Clinical Records (Get Function)
Future<List<ClinicalRecordData>> getAllClinicalRecords() =>
  db.select(db.clinicalRecord).get();

// Read only a SINGLE clinical record by id
Future<ClinicalRecordData> getClinicalRecord(int id) => 
  (db.select(db.clinicalRecord) ..where((c) => c.id.equals(id))) .getSingle();

// Read Clinical Records by a PATIENT (many can be called here)
Future<List<ClinicalRecordData>> getClinicalRecordsByPatient(int patientId) => 
  (db.select(db.clinicalRecord) ..where((c) => c.id.equals(patientId))) .get(); 

// Update full Clinical Record
Future<bool> updateClinicalRecord(ClinicalRecordCompanion record) => 
  db.update(db.clinicalRecord).replace(record);

// Update Medical Background Only
Future<int> updateMedicalBackground({
    required int id,
    String? pastIllnesses,
    String? presentIllnesses,
    String? allergies,
    String? currentMedication,
  }) =>(db.update(db.clinicalRecord) ..where((c) => c.id.equals(id)))
        .write(ClinicalRecordCompanion(
          pastIllnesses: Value(pastIllnesses),
          presentIllnesses: Value(presentIllnesses),
          allergies: Value(allergies),
          currentMedication: Value(currentMedication),
        ));

// Update Treatment Section 
Future<int> updateTreatmentSection({
    required int id,
    required bool hasOralDebris,
    required bool hasCalculus,
    required bool hasGingivitis,
    required bool hasPeriodontalPocket,
    required bool hasDentofacialAnomaly,
  }) =>
      (db.update(db.clinicalRecord)
        ..where((c) => c.id.equals(id)))
        .write(ClinicalRecordCompanion(
          hasOralDebris: Value(hasOralDebris),
          hasCalculus: Value(hasCalculus),
          hasGingivitis: Value(hasGingivitis),
          hasPeriodontalPocket: Value(hasPeriodontalPocket),
          hasDentofacialAnomaly: Value(hasDentofacialAnomaly),
        ));

// Update Tooth Count
Future<int> updateToothCount({
    required int id,
    required int carriesForFilling,
    required int carriesForExtraction,
    required int rootFragment,
    required int missingDueToCaries,
    required int filledOrRestored,
  }) =>
      (db.update(db.clinicalRecord)
        ..where((c) => c.id.equals(id)))
        .write(ClinicalRecordCompanion(
          carriesForFilling: Value(carriesForFilling),
          carriesForExtraction: Value(carriesForExtraction),
          rootFragment: Value(rootFragment),
          missingDueToCaries: Value(missingDueToCaries),
          filledOrRestored: Value(filledOrRestored),
        ));

// Delete Clinical Record
Future<int> deleteClinicalRecord(int id) =>
      (db.delete(db.clinicalRecord)
        ..where((c) => c.id.equals(id)))
        .go();
}