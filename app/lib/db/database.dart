import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'tables.dart';
import 'package:drift/drift.dart' as drift;

part 'database.g.dart'; // connect database.g.dart here

@DriftDatabase(tables: [Patient, ClinicalStaff, Appointment, Invoice, ProcedureCharge, PaymentTransaction, ClinicalRecord ])
class AppDatabase extends _$AppDatabase { // registers all entity tables and attributes
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
  
  @override
  MigrationStrategy get migration => MigrationStrategy( // adds the data in the table immediately in first startup
        onCreate: (Migrator m) async {
          // 1. Create all the tables first
          await m.createAll();

          // 2. Insert the default Dr. Reynaldo Tu profile immediately
          await into(clinicalStaff).insert(
            const ClinicalStaffCompanion(
              staffId: drift.Value(1),
              firstName: drift.Value('Reynaldo'),
              lastName: drift.Value('Tu'),
              pin: drift.Value('0000'),
            ),
          );
        },
      );
}

LazyDatabase _openConnection() { // create the 'dentcity' file in the documents file
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'dentcity.db'));
    return NativeDatabase(file);
  });
}


