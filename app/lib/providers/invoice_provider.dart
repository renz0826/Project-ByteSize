import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../db/database.dart';
import '../db/database_provider.dart';
import '../repositories/invoice_repository.dart';

// Database provider (reuse from db_provider, don't duplicate)
// If you have a global dbProvider in database_provider.dart, use it.
// Here we use the one from that file.
final databaseProvider = Provider<AppDatabase>((ref) => AppDatabase());

final invoiceRepositoryProvider = Provider<InvoiceRepository>((ref) {
  return InvoiceRepository(ref.watch(databaseProvider));
});

final allInvoicesProvider = FutureProvider<List<JoinedInvoice>>((ref) {
  return ref.watch(invoiceRepositoryProvider).getAllInvoices();
});

// Provider to create an invoice; accepts a map with the new required parameters
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