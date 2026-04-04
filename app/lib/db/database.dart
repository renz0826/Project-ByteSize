import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Patient, Dentist, Appointment, Billing, DentalChart, TreatmentRecord, PatientRecord])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'dentcity'));

  @override
  int get schemaVersion => 1;
}