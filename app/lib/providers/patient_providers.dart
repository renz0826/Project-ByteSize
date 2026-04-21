import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dentcity_management_system/db/database.dart';
import '../controllers/patient_controller.dart';


final databaseProvider= Provider<AppDatabase>((ref) {
  return AppDatabase(); 
});


final patientControllerProvider = 
    StateNotifierProvider<PatientController, AsyncValue<void>>((ref) {
  final db = ref.watch(databaseProvider);
  return PatientController(db);
});

final patientListProvider = StreamProvider<List<PatientData>>((ref) {
  final db = ref.watch(databaseProvider);
  
  return db.watchAllPatients(); 
});