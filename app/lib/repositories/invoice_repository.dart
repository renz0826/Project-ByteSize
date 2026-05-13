import 'package:drift/drift.dart' hide Column;
import '../db/database.dart';

class InvoiceRepository {
  final AppDatabase _db;

  InvoiceRepository(this._db);

  bool _isDiscountApplicable(PatientData patient) {
    if (patient.isSeniorOrPWD) return true;
    final today = DateTime.now();
    int age = today.year - patient.birthDate.year;
    if (today.month < patient.birthDate.month ||
        (today.month == patient.birthDate.month &&
            today.day < patient.birthDate.day)) {
      age--;
    }
    return age >= 60;
  }

  Future<List<JoinedInvoice>> getAllInvoices() async {
    try {
      final invoices = await _db.select(_db.invoice).get();
      final results = <JoinedInvoice>[];

      for (final inv in invoices) {
        final patient = await (_db.select(_db.patient)
              ..where((p) => p.patientId.equals(inv.patientId)))
            .getSingleOrNull();
        final patientName = patient != null
            ? '${patient.lastName}, ${patient.firstName} ${patient.suffix}'
            : 'Unknown Patient';
        final patientNameReverse = patient != null
            ? '${patient.firstName} ${patient.lastName} ${patient.suffix}'
            : 'Unkown Patient';

        final charges = await (_db.select(_db.procedureCharge)
              ..where((c) => c.invoiceId.equals(inv.invoiceId)))
            .get();
        final procedureNames = charges.map((c) => c.procedureName).join(', ');
        final grandTotal =
            charges.fold<double>(0, (sum, c) => sum + c.totalProcedureCharge);

        results.add(JoinedInvoice(
          invoice: inv,
          patientName: patientName,
          patientNameReverse: patientNameReverse,
          procedureNames:
              procedureNames.isEmpty ? 'No procedures' : procedureNames,
          grandTotal: grandTotal,
        ));
      }
      return results;
    } catch (e) {
      return [];
    }
  }

  Future<InvoiceData?> getInvoiceById(int id) {
    return (_db.select(_db.invoice)..where((t) => t.invoiceId.equals(id)))
        .getSingleOrNull();
  }

  Future<int> createInvoice({
    required int patientId,
    required List<Map<String, dynamic>> procedures,
    required double amountReceived,
    required String modeOfPayment,
  }) async {
    return _db.transaction(() async {
      final patient = await (_db.select(_db.patient)
            ..where((p) => p.patientId.equals(patientId)))
          .getSingle();
      final hasDiscount = _isDiscountApplicable(patient);

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

      final netTotal = hasDiscount ? (totalCharges * 0.80) : totalCharges;
      final remainingBalance = netTotal - amountReceived;
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

  Future<void> processPayment({
    required int invoiceId,
    required double amountPaidNow,
    required String modeOfPayment,
  }) async {
    return _db.transaction(() async {
      final invoice = await (_db.select(_db.invoice)
            ..where((t) => t.invoiceId.equals(invoiceId)))
          .getSingle();
      final patient = await (_db.select(_db.patient)
            ..where((t) => t.patientId.equals(invoice.patientId)))
          .getSingle();

      // 1. Insert new payment
      await _db.into(_db.paymentTransaction).insert(
            PaymentTransactionCompanion.insert(
              invoiceId: invoiceId,
              amountReceived: amountPaidNow,
              modeOfPayment: modeOfPayment,
            ),
          );

      // 2. Fetch all procedures & calculate precise Net Total
      final charges = await (_db.select(_db.procedureCharge)
            ..where((t) => t.invoiceId.equals(invoiceId)))
          .get();
      final grandTotal =
          charges.fold(0.0, (sum, c) => sum + c.totalProcedureCharge);
      final hasDiscount = _isDiscountApplicable(patient);
      final netTotal = hasDiscount ? (grandTotal * 0.80) : grandTotal;

      // 3. Fetch all payments for total paid so far
      final payments = await (_db.select(_db.paymentTransaction)
            ..where((t) => t.invoiceId.equals(invoiceId)))
          .get();
      final totalPaidSoFar =
          payments.fold(0.0, (sum, p) => sum + p.amountReceived);

      // 4. Calculate exact absolute balance (Fixes any old buggy data instantly)
      final newRemainingBalance =
          (netTotal - totalPaidSoFar).clamp(0.0, double.infinity);
      final status = newRemainingBalance <= 0 ? 'Paid' : 'Pending';

      await (_db.update(_db.invoice)
            ..where((t) => t.invoiceId.equals(invoiceId)))
          .write(InvoiceCompanion(
        totalBalance: Value(newRemainingBalance),
        status: Value(status),
      ));
    });
  }

  Future<void> updateInvoiceProcedures({
    required int invoiceId,
    required List<Map<String, dynamic>> procedures,
  }) async {
    return _db.transaction(() async {
      final invoice = await (_db.select(_db.invoice)
            ..where((t) => t.invoiceId.equals(invoiceId)))
          .getSingle();
      final patient = await (_db.select(_db.patient)
            ..where((t) => t.patientId.equals(invoice.patientId)))
          .getSingle();

      await (_db.delete(_db.procedureCharge)
            ..where((t) => t.invoiceId.equals(invoiceId)))
          .go();

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

      final payments = await (_db.select(_db.paymentTransaction)
            ..where((t) => t.invoiceId.equals(invoiceId)))
          .get();
      double totalPaidSoFar =
          payments.fold(0.0, (sum, p) => sum + p.amountReceived);

      final hasDiscount = _isDiscountApplicable(patient);
      final netTotal = hasDiscount ? (totalCharges * 0.80) : totalCharges;

      final newRemainingBalance =
          (netTotal - totalPaidSoFar).clamp(0.0, double.infinity);
      final status = newRemainingBalance <= 0 ? 'Paid' : 'Pending';

      await (_db.update(_db.invoice)
            ..where((t) => t.invoiceId.equals(invoiceId)))
          .write(InvoiceCompanion(
        totalBalance: Value(newRemainingBalance),
        status: Value(status),
      ));
    });
  }
}

class JoinedInvoice {
  final InvoiceData invoice;
  final String patientName;
  final String procedureNames;
  final double grandTotal;
  final String patientNameReverse;

  JoinedInvoice({
    required this.invoice,
    required this.patientName,
    required this.procedureNames,
    required this.grandTotal,
    required this.patientNameReverse,
  });
}
