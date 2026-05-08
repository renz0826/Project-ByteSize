import 'package:drift/drift.dart' hide Column;
import '../db/database.dart';

class InvoiceRepository {
  final AppDatabase _db;

  InvoiceRepository(this._db);

  // --------------------------------------------------
  // READ – all invoices with patient name, procedure
  //        names, and computed grand total
  // --------------------------------------------------
  Future<List<JoinedInvoice>> getAllInvoices() async {
    // 1. Fetch invoices joined with patient
    final query = _db.select(_db.invoice).join([
      innerJoin(
          _db.patient, _db.patient.patientId.equalsExp(_db.invoice.patientId)),
    ]);

    final rows = await query.map((row) {
      final invoice = row.readTable(_db.invoice);
      final patient = row.readTable(_db.patient);
      return {
        'invoice': invoice,
        'patientName': '${patient.firstName} ${patient.lastName}',
      };
    }).get();

    // 2. For each invoice, fetch its procedure charges
    final results = <JoinedInvoice>[];
    for (final row in rows) {
      final invoice = row['invoice'] as InvoiceData;
      final patientName = row['patientName'] as String;

      final charges = await (_db.select(_db.procedureCharge)
            ..where((c) => c.invoiceId.equals(invoice.invoiceId)))
          .get();

      final procedureNames =
          charges.map((c) => c.procedureName).join(', ');
      final grandTotal =
          charges.fold<double>(0, (sum, c) => sum + c.totalProcedureCharge);

      results.add(JoinedInvoice(
        invoice: invoice,
        patientName: patientName,
        procedureNames:
            procedureNames.isEmpty ? 'No procedures' : procedureNames,
        grandTotal: grandTotal,
      ));
    }

    return results;
  }

  // --------------------------------------------------
  // READ – single invoice by ID
  // --------------------------------------------------
  Future<InvoiceData?> getInvoiceById(int id) {
    return (_db.select(_db.invoice)
          ..where((t) => t.invoiceId.equals(id)))
        .getSingleOrNull();
  }

  // --------------------------------------------------
  // CREATE – invoice with multiple procedures and
  //          an initial payment (can be 0)
  // --------------------------------------------------
  Future<int> createInvoice({
    required int patientId,
    required List<Map<String, dynamic>> procedures, // [{name, charge, qty}]
    required double amountReceived,
    required String modeOfPayment,
  }) async {
    return _db.transaction(() async {
      // 1. Insert the invoice first (we need its ID)
      //    We'll update totalBalance after we know the procedure charges
      final invoiceId = await _db.into(_db.invoice).insert(
            InvoiceCompanion.insert(
              patientId: patientId,
              totalBalance: 0, // temporary, will update after
              status: 'Pending',
            ),
          );

      // 2. Insert each procedure charge, linked to this invoice
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

      // 3. Insert a payment transaction (even if amountReceived is 0)
      await _db.into(_db.paymentTransaction).insert(
            PaymentTransactionCompanion.insert(
              invoiceId: invoiceId,
              amountReceived: amountReceived,
              modeOfPayment: modeOfPayment,
            ),
          );

      // 4. Update the invoice with the real totalBalance and status
      final remainingBalance = totalCharges - amountReceived;
      final status = remainingBalance <= 0 ? 'Paid' : 'Pending';

      await (_db.update(_db.invoice)
            ..where((t) => t.invoiceId.equals(invoiceId)))
          .write(InvoiceCompanion(
        totalBalance: Value(remainingBalance > 0 ? remainingBalance : 0),
        status: Value(status),
      ));

      return invoiceId;
    });
  }
}

// --------------------------------------------------
// Data class for displaying invoices
// --------------------------------------------------
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