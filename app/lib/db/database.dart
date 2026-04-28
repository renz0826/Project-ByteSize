import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Patient, Dentist, Appointment, Billing, BillingItem, DentalChart, TreatmentRecord, ProcedureLookup, 
ClinicalRecord, ])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

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


