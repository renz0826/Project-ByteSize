import 'package:dentcity_management_system/widgets/app_status_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';
import '/../style/theme.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/page_header.dart';
import '/../widgets/attribute_read_view.dart';
import '../../db/database.dart';
import '../../providers/app_providers.dart';
import '../../repositories/invoice_repository.dart';

class ViewBillScreen extends ConsumerStatefulWidget {
  final JoinedInvoice invoiceData;
  final VoidCallback onBack;
  final VoidCallback onProcessPayment;
  final VoidCallback onEditInvoice;

  const ViewBillScreen({
    super.key,
    required this.invoiceData,
    required this.onBack,
    required this.onProcessPayment,
    required this.onEditInvoice,
  });

  @override
  ConsumerState<ViewBillScreen> createState() => _ViewBillScreenState();
}

class _ViewBillScreenState extends ConsumerState<ViewBillScreen> {
  List<ProcedureChargeData> _procedures = [];
  List<PaymentTransactionData> _transactions = [];
  bool _isLoading = true;
  PatientData? _patient;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final db = ref.read(databaseProvider);
    final invoiceId = widget.invoiceData.invoice.invoiceId;

    final charges = await (db.select(db.procedureCharge)
          ..where((c) => c.invoiceId.equals(invoiceId)))
        .get();

    final payments = await (db.select(db.paymentTransaction)
          ..where((t) => t.invoiceId.equals(invoiceId)))
        .get();
        
    final patient = await (db.select(db.patient)..where((p) => p.patientId.equals(widget.invoiceData.invoice.patientId))).getSingle();

    setState(() {
      _procedures = charges;
      _transactions = payments.where((p) => p.amountReceived > 0).toList();
      _patient = patient;
      _isLoading = false;
    });
  }

  String _formatDate(DateTime date) {
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');
    final y = date.year.toString();
    return '$m/$d/$y';
  }

  bool _isDiscountApplicable(PatientData? p) {
    if (p == null) return false;
    if (p.isSeniorOrPWD) return true; 
    final today = DateTime.now();
    int age = today.year - p.birthDate.year;
    if (today.month < p.birthDate.month ||
        (today.month == p.birthDate.month && today.day < p.birthDate.day))
      age--;
    return age >= 60;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          title: 'Back to Billings and Invoices',
          type: PageHeaderType.withBack,
          onBack: widget.onBack,
        ),
        if (_isLoading)
          const Padding(
            padding: EdgeInsets.all(48.0),
            child: Center(child: CircularProgressIndicator()),
          )
        else
          _buildBillContent(),
      ],
    );
  }

  Widget _buildBillContent() {
    final inv = widget.invoiceData.invoice;
    final invoiceIdString = 'INV-${inv.invoiceId.toString().padLeft(3, '0')}';
    final formattedDate = _formatDate(inv.issuedDate);
    final isPaid = inv.status.toLowerCase() == 'paid';
    final hasDiscount = _isDiscountApplicable(_patient);

    // Calculate totals for the summary
    final double rawTotal = _procedures.fold(0, (sum, item) => sum + item.totalProcedureCharge);
    final double discount = hasDiscount ? rawTotal * 0.20 : 0.0;
    final double netTotal = rawTotal - discount;

  return Transform.translate(
    offset: const Offset(0, -30),
    child: Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopStatusBar(invoiceIdString, formattedDate, inv.status, isPaid),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: AppTheme.white500,
                borderRadius: BorderRadius.circular(24),
                boxShadow: AppTheme.floatShadow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPatientBillHeader(hasDiscount),
                  const SizedBox(height: 32),
                  Text("Itemized Charges",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 24),
                  _buildTableHeaders(),
                  const SizedBox(height: 1),
                  ..._procedures.map((proc) => _buildProcedureRow(proc, hasDiscount)),
                  const SizedBox(height: 48),
                  
                  // Summary aligned to the right
                  _buildBillingSummary(rawTotal, discount, netTotal, hasDiscount),

                  // Transaction History correctly nested inside the Column
                  if (_transactions.isNotEmpty) ...[
                    const SizedBox(height: 48),
                    const Divider(color: AppTheme.gray400),
                    const SizedBox(height: 24),
                    Text(
                      "Transaction History",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    _buildTransactionHistory(hasDiscount),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildBillingSummary(double rawTotal, double discount, double netTotal, bool hasDiscount) {
  final valueStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
    color: AppTheme.gray500,
    fontWeight: FontWeight.w500,
  );

  final textStyle = Theme.of(context).textTheme.titleLarge;

  return Align(
    alignment: Alignment.centerRight,
    child: SizedBox(
      width: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Subtotal Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal:', style: valueStyle),
              Text('₱ ${rawTotal.toStringAsFixed(2)}', style: textStyle),
            ],
          ),
          
          if (hasDiscount) ...[
            const SizedBox(height: 12),
            // Discount Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Discount (20%):', 
                  style: valueStyle?.copyWith(color: Colors.green.shade700)),
                Text('- ₱ ${discount.toStringAsFixed(2)}', 
                  style: valueStyle?.copyWith(color: Colors.green.shade700)),
              ],
            ),
          ],

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(color: AppTheme.gray400),
          ),

          // Final Amount to be Paid
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Amount to be Paid:',
                style: valueStyle,
              ),
              Text(
                '₱ ${netTotal.toStringAsFixed(2)}',
                style: textStyle, 
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildTopStatusBar(String id, String date, String status, bool isPaid) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
    decoration: BoxDecoration(
      color: AppTheme.white500,
      borderRadius: BorderRadius.circular(24),
      boxShadow: AppTheme.floatShadow,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$id | $date', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(width: 16),
            AppStatusBadge(status: _mapDatabaseStatusToBadge(status)),
          ],
        ),
        Row(
          children: [
            if (!isPaid)
              Button(label: "Edit Invoice", heroIcon: HeroIcons.pencilSquare, variant: ButtonVariant.secondary, onPressed: widget.onEditInvoice),
            const SizedBox(width: 10),
            Button(label: isPaid ? "Fully Paid" : "Process Payment", variant: isPaid ? ButtonVariant.secondary : ButtonVariant.primary, onPressed: isPaid ? () {} : widget.onProcessPayment),
          ],
        )
      ],
    ),
  );
}

Widget _buildPatientBillHeader(bool hasDiscount) {
  return Row(
    children: [
      Text("${widget.invoiceData.patientNameReverse}’s Bill", style: Theme.of(context).textTheme.titleLarge),
      const SizedBox(width: 16),
      if (hasDiscount) const AppStatusBadge(status: BadgeStatus.discount),
    ],
  );
}

  Widget _buildTransactionHistory(bool hasDiscount) {
    // 1. Calculate the initial balance
    double runningBalance = widget.invoiceData.grandTotal * (hasDiscount ? 0.8 : 1.0);
    
    // 2. Set headers to bodySmall (14px, gray500) per your theme
    final headerStyle = Theme.of(context).textTheme.bodySmall;

    return Column(
      children: [
        Row(
          children: [
            Expanded(flex: 1, child: Text('Date', style: headerStyle)),
            const SizedBox(width: 70),
            Expanded(flex: 2, child: Text('Mode of Payment', style: headerStyle)),
            Expanded(flex: 2, child: Text('Amount Paid', style: headerStyle)),
            Expanded(flex: 2, child: Text('Change', style: headerStyle)),
          ],
        ),
        const SizedBox(height: 8),
        ...List.generate(_transactions.length, (index) {
          final trans = _transactions[index];

          // 3. Calculation for change vs running balance
          double change = trans.amountReceived - runningBalance;
          String changeText = "";

          if (change > 0) {
            changeText = "₱ ${change.toStringAsFixed(2)}";
            runningBalance = 0; 
          } else if (change == 0) {
            changeText = "₱ 0.00";
            runningBalance = 0; 
          } else {
            changeText = "₱ 0.00"; 
            runningBalance -= trans.amountReceived; 
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: _buildCroppedAttribute((trans.paymentDate.toString().split(' ')[0]).toString()),
                ),
                const SizedBox(width: 70),
                Expanded(
                  flex: 2,
                  child: _buildCroppedAttribute(trans.modeOfPayment),
                ),
                Expanded(
                  flex: 2,
                  // Amount Paid: Defaults to black500 (removes green)
                  child: _buildCroppedAttribute('₱ ${trans.amountReceived.toStringAsFixed(2)}'),
                ),
                Expanded(
                  flex: 2,
                  // Change: Applies the Blue color manually
                  child: _buildCroppedAttribute(changeText, textColor: AppTheme.blue500),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

 Widget _buildTableHeaders() {
    final headerStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      color: AppTheme.gray500,
      fontWeight: FontWeight.bold,
    );  

    return Row(
      children: [
        Expanded(flex: 4, child: Text('Procedure', style: headerStyle)),
        Expanded(flex: 2, child: Text('Procedure Charge', style: headerStyle)), const SizedBox(width: 50,),
        Expanded(flex: 1, child: Text('Quantity', style: headerStyle)), const SizedBox(width: 50,),
        Expanded(flex: 3, child: Text('Amount to be Paid', style: headerStyle)),
      ],
    );
  }

Widget _buildProcedureRow(ProcedureChargeData proc, bool hasDiscount) {
  final amountToBePaid = proc.totalProcedureCharge * (hasDiscount ? 0.8 : 1.0);

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0), 
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 4, child: _buildCroppedAttribute(proc.procedureName)),
        Expanded(flex: 2, child: _buildCroppedAttribute('₱ ${proc.procedureCharge.toStringAsFixed(2)}')),
        const SizedBox(width: 50),
        Expanded(flex: 1, child: _buildCroppedAttribute(proc.quantity.toString())),
        const SizedBox(width: 50),
        Expanded(flex: 3, child: _buildCroppedAttribute('₱ ${amountToBePaid.toStringAsFixed(2)}')),
      ],
    ),
  );
}

// This helper crops the top part of the widget to remove the empty label gap
Widget _buildCroppedAttribute(String content, {Color? textColor}) {
  return SizedBox(
    height: 32,
    child: textColor == null 
      ? ClipRect(
          child: OverflowBox(
            alignment: Alignment.bottomLeft,
            minHeight: 0,
            maxHeight: 60,
            child: AttributeReadView(
              label: '', 
              content: content,
              isCrucial: false, // Ensures text stays black
            ),
          ),
        )
      : Align(
          alignment: Alignment.centerLeft,
          child: Text(
            content.isNotEmpty ? content : '-',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: textColor, // Blue color for 'Change'
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
  );
}
  
  BadgeStatus _mapDatabaseStatusToBadge(String dbStatus) {
    switch (dbStatus.toLowerCase()) {
      case 'waiting':
        return BadgeStatus.waiting;
      case 'in progress':
        return BadgeStatus.inProgress;
      case 'finished':
      case 'paid':
        return BadgeStatus.paid; 
      case 'pending':
        return BadgeStatus.pending;
      default:
        return BadgeStatus.waiting;
    }
  }
}