import 'package:drift/drift.dart';
import '../db/database.dart';

class PatientOnboardingService {
  final AppDatabase db;

  PatientOnboardingService(this.db);

  Future<void> registerNewPatient({
    // features atomic saving -> save the two pages or none at all
    required PatientCompanion patientData,
    required ClinicalRecordCompanion clinicalData,
  }) async {
    await db.transaction(() async {
      final newId = await db.into(db.patient).insert(patientData);

      final linkedRecord = clinicalData.copyWith(
        patientId: Value(newId),
      );

      await db.into(db.clinicalRecord).insert(linkedRecord);
    });
  }
}
