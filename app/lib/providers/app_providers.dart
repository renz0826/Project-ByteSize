import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../db/database.dart';
import '../repositories/patient_repository.dart';
import '../repositories/appointment_repository.dart';
import '../repositories/clinical_record_repository.dart';
import '../repositories/invoice_repository.dart';

// Database Provider
final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

// Patient Repository Provider
final patientRepositoryProvider = Provider<PatientRepository>((ref) {
  return PatientRepository(ref.watch(databaseProvider));
});

// Appointment Repository Provider
final appointmentRepositoryProvider = Provider<AppointmentRepository>((ref) {
  return AppointmentRepository(ref.watch(databaseProvider));
});

// Clinical Repository Provider
final clinicalRecordRepositoryProvider =
    Provider<ClinicalRecordRepository>((ref) {
  return ClinicalRecordRepository(ref.watch(databaseProvider));
});

// Current Staff Provider
final currentStaffProvider = StreamProvider((ref) {
  final db = ref.watch(databaseProvider);
  // Fetches the primary doctor (staffId 1)
  return (db.select(db.clinicalStaff)..limit(1)).watchSingle();
});

// --- DATA MODELS ---
class DashboardQueueItem {
  final int appointmentId;
  final String patientName;
  final String timeSlot;
  final String reason;
  final String status;

  DashboardQueueItem({
    required this.appointmentId,
    required this.patientName,
    required this.timeSlot,
    required this.reason,
    required this.status,
  });
}

// Provides a live stream of today's patient queue.
final todayQueueProvider =
    StreamProvider.autoDispose<List<DashboardQueueItem>>((ref) {
  final apptRepo = ref.watch(appointmentRepositoryProvider);

  return apptRepo.watchTodayQueue();
});

// Invoice Repository Provider
final invoiceRepositoryProvider = Provider<InvoiceRepository>((ref) {
  return InvoiceRepository(ref.watch(databaseProvider));
});

// All Invoices Provider
final allInvoicesProvider = FutureProvider<List<JoinedInvoice>>((ref) {
  return ref.watch(invoiceRepositoryProvider).getAllInvoices();
});

// Create invoice provider
final createInvoiceProvider = FutureProvider.family<int, Map<String, dynamic>>(
  (ref, params) async {
    final repo = ref.read(invoiceRepositoryProvider);
    final invoiceId = await repo.createInvoice(
      patientId: params['patientId'] as int,
      procedures: params['procedures'] as List<Map<String, dynamic>>,
      amountReceived: (params['amountReceived'] as num?)?.toDouble() ?? 0.0,
      modeOfPayment: params['modeOfPayment'] as String? ?? 'Cash',
    );
    ref.invalidate(allInvoicesProvider);
    return invoiceId;
  },
);