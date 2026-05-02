import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'database.dart';
import '../services/patient_onboarding.dart';

final dbProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

// Provider for the PatientOnboardingService
final onboardingServiceProvider = Provider<PatientOnboardingService>((ref) {
  final db = ref.watch(dbProvider);
  return PatientOnboardingService(db);
});