import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Patient, Dentist, Appointment, Billing, DentalChart, TreatmentRecord, ClinicalRecord])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

 Stream<List<PatientData>> watchActivePatients() { // View non-archived patients only function
    return (select(patient)..where((t) => t.isArchived.equals(false))).watch();
  }

 Future<int> addPatient(PatientCompanion entry){ // Insert Function
  return into(patient).insert(entry);
 }

 Future<bool> updatePatient(PatientData entry){ // Update Function
  return update(patient).replace(entry);
 }

Future<void> archivePatient(int patientId) { // archieve patients function
    return (update(patient)..where((t) => t.id.equals(patientId)))
        .write(const PatientCompanion(isArchived: Value(true)));
  }

Stream<List<PatientData>> watchArchivedPatients() { // view archived patients function
    return (select(patient)..where((t) => t.isArchived.equals(true))).watch();
  }

  @override
  int get schemaVersion => 1;
}



LazyDatabase _openConnection() { // change this to create the file at %appdata% once testing is good
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'dentcity.db'));
    return NativeDatabase(file);
  });
}
