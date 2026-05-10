import 'package:drift/drift.dart' hide Column;
import '../db/database.dart';

class InvoiceRepository {
  final AppDatabase _db;

  InvoiceRepository(this._db);

  // --------------------------------------------------
  // READ – all invoices with patient name, procedure
  //          names, and computed grand total
  // --------------------------------------------------
  Future<List<JoinedInvoice>> getAllInvoices() async {
    try {
      final invoices = await _db.select(_db.invoice).get();
      print("🦷 DEBUG: Found ${invoices.length} total invoices in database!");

      final results = <JoinedInvoice>[];

      for (final inv in invoices) {
        final patient = await (_db.select(_db.patient)..where((p) => p.patientId.equals(inv.patientId))).getSingleOrNull();
        final patientName = patient != null ? '${patient.lastName},` ${patient.firstName}' : 'Unknown Patient';
        final charges = await (_db.select(_db.procedureCharge)..where((c) => c.invoiceId.equals(inv.invoiceId))).get();
        final procedureNames = charges.map((c) => c.procedureName).join(', ');
        final grandTotal = charges.fold<double>(0, (sum, c) => sum + c.totalProcedureCharge);

        results.add(JoinedInvoice(
          invoice: inv,
          patientName: patientName,
          procedureNames: procedureNames.isEmpty ? 'No procedures' : procedureNames,
          grandTotal: grandTotal,
        ));
      }

      print("🦷 DEBUG: Successfully returning ${results.length} mapped invoices to dashboard.");
      return results;
    } catch (e) {
      print("🦷 DEBUG ERROR in getAllInvoices: $e");
      return [];
    }
  }

  //read a single invoice
  Future<InvoiceData?> getInvoiceById(int id) {
    return (_db.select(_db.invoice)..where((t) => t.invoiceId.equals(id))).getSingleOrNull();
  }

  //create a single invoice
  Future<int> createInvoice({
    required int patientId,
    required List<Map<String, dynamic>> procedures,
    required double amountReceived,
    required String modeOfPayment,
  }) async {
    return _db.transaction(() async {
      try {

        final invoiceId = await _db.into(_db.invoice).insert(
              InvoiceCompanion.insert(
                patientId: patientId,
                totalBalance: 0,
                status: 'Pending',
                issuedDate: Value(DateTime.now()),
              ),
            );

        double totalCharges = 0;
        for (final proc in procedures) {
          final charge = proc['charge'] as double;
          final qty = proc['qty'] as int? ?? 1;
          final subTotal = charge * qty;
          totalCharges += subTotal;

          await _db.into(_db.procedureCharge).insert(
                ProcedureChargeCompanion.insert(
                  invoiceId: invoiceId,
                  procedureName: proc['name'] as String,
                  procedureCharge: charge,
                  quantity: Value(qty),
                  totalProcedureCharge: subTotal,
                ),
              );
        }
        await _db.into(_db.paymentTransaction).insert(
              PaymentTransactionCompanion.insert(
                invoiceId: invoiceId,
                amountReceived: amountReceived,
                modeOfPayment: modeOfPayment,
              ),
            );

        final remainingBalance = totalCharges - amountReceived;
        final status = remainingBalance <= 0 ? 'Paid' : 'Pending';

        await (_db.update(_db.invoice)..where((t) => t.invoiceId.equals(invoiceId))).write(
          InvoiceCompanion(
            totalBalance: Value(remainingBalance > 0 ? remainingBalance : 0),
            status: Value(status),
          )
        );

        print("🦷 DEBUG: Save COMPLETELY SUCCESSFUL.");
        return invoiceId;
      } catch (e) {
        print("🦷 DEBUG CRITICAL SAVE ERROR: $e");
        rethrow; 
      }
    });
  }

  //payment processing
  Future<void> processPayment({
    required int invoiceId,
    required double amountPaidNow,
    required String modeOfPayment,
  }) async {
    return _db.transaction(() async {
      final invoice = await (_db.select(_db.invoice)..where((t) => t.invoiceId.equals(invoiceId))).getSingle();

      await _db.into(_db.paymentTransaction).insert(
            PaymentTransactionCompanion.insert(
              invoiceId: invoiceId,
              amountReceived: amountPaidNow,
              modeOfPayment: modeOfPayment,
            ),
          );

      final newBalance = (invoice.totalBalance - amountPaidNow).clamp(0.0, double.infinity);
      final newStatus = newBalance <= 0 ? 'Paid' : 'Pending';

      await (_db.update(_db.invoice)..where((t) => t.invoiceId.equals(invoiceId))).write(
        InvoiceCompanion(
          totalBalance: Value(newBalance),
          status: Value(newStatus),
        )
      );
    });
  }

  //update invoice
  Future<void> updateInvoiceProcedures({
    required int invoiceId,
    required List<Map<String, dynamic>> procedures,
  }) async {
    return _db.transaction(() async {
      await (_db.delete(_db.procedureCharge)..where((t) => t.invoiceId.equals(invoiceId))).go();

      double totalCharges = 0;
      for (final proc in procedures) {
        final charge = proc['charge'] as double;
        final qty = proc['qty'] as int? ?? 1;
        final subTotal = charge * qty;
        totalCharges += subTotal;

        await _db.into(_db.procedureCharge).insert(
              ProcedureChargeCompanion.insert(
                invoiceId: invoiceId,
                procedureName: proc['name'] as String,
                procedureCharge: charge,
                quantity: Value(qty),
                totalProcedureCharge: subTotal,
              ),
            );
      }

      final payments = await (_db.select(_db.paymentTransaction)..where((t) => t.invoiceId.equals(invoiceId))).get();
      double totalPaidSoFar = payments.fold(0.0, (sum, p) => sum + p.amountReceived);
      final newRemainingBalance = (totalCharges - totalPaidSoFar).clamp(0.0, double.infinity);
      final status = newRemainingBalance <= 0 ? 'Paid' : 'Pending';

      await (_db.update(_db.invoice)..where((t) => t.invoiceId.equals(invoiceId))).write(
        InvoiceCompanion(
          totalBalance: Value(newRemainingBalance),
          status: Value(status),
        )
      );
    });
  }
}

class JoinedInvoice {
  final InvoiceData invoice;
  final String patientName;
  final String procedureNames;
  final double grandTotal;

  JoinedInvoice({
    required this.invoice,
    required this.patientName,
    required this.procedureNames,
    required this.grandTotal,
  });
}