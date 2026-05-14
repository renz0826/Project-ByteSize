import 'package:dentcity_management_system/widgets/app_status_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';
import '/../style/theme.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/page_header.dart';
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

    return Transform.translate(
      offset: const Offset(0, -30),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
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
                        Text(
                          '$invoiceIdString | $formattedDate',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                        ),
                        const SizedBox(width: 16), // Fixed spacing per Figma
                        AppStatusBadge(status: _mapDatabaseStatusToBadge(inv.status)),
                      ],
                    ),
                    Row(
                      children: [
                        if (!isPaid)
                          Button(
                            label: "Edit Invoice",
                            heroIcon: HeroIcons.pencilSquare,
                            variant: ButtonVariant.secondary,
                            onPressed: widget.onEditInvoice,
                          ),
                        const SizedBox(width: 10),
                        Button(
                          label: isPaid ? "Fully Paid" : "Process Payment",
                          variant: isPaid
                              ? ButtonVariant.secondary
                              : ButtonVariant.primary,
                          onPressed: isPaid ? () {} : widget.onProcessPayment,
                        ),
                      ],
                    )
                  ],
                ),
              ),

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
                    Row(
                      children: [
                        Text(
                          "${widget.invoiceData.patientNameReverse}’s Bill",
                          style:
                              Theme.of(context).textTheme.headlineLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(width: 16),
                        if (hasDiscount)
                          const AppStatusBadge(status: BadgeStatus.discount),
                      ]
                    ),
                    const SizedBox(height: 32),

                    _buildTableHeaders(),
                    const SizedBox(height: 12),
                    ..._procedures
                        .map((proc) => _buildProcedureRow(proc, hasDiscount)),

                    const SizedBox(height: 48),

                    Align(
                      alignment: Alignment.centerRight,
                      child: IntrinsicWidth(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppTheme.gray400),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Amount to be Paid',
                                style: AppTheme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.gray400),
                              ),
                              const SizedBox(width: 40),
                              Text(
                                '₱ ${(inv.totalBalance).toStringAsFixed(2)}',
                                style: AppTheme.textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

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

  Widget _buildTransactionHistory(bool hasDiscount) {
    double runningBalance = widget.invoiceData.grandTotal * (hasDiscount ? 0.8 : 1.0);

    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Text('Date',
                    style: AppTheme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold, color: AppTheme.gray400))), const SizedBox(width: 70,),
            Expanded(
                flex: 2,
                child: Text('Mode of Payment',
                    style: AppTheme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold, color: AppTheme.gray400))),
            Expanded(
                flex: 2,
                child: Text('Amount Paid',
                    style: AppTheme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold, color: AppTheme.gray400))),
            Expanded(
                flex: 2,
                child: Text('Change',
                    style: AppTheme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold, color: AppTheme.gray400))),
          ],
        ),
        const SizedBox(height: 8),
        ...List.generate(_transactions.length, (index) {
          final trans = _transactions[index];

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
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text((trans.paymentDate.toString().split(' ')[0]).toString(),
                        style: AppTheme.textTheme.bodyMedium)), const SizedBox(width: 70,),
                Expanded(
                    flex: 2,
                    child: Text(trans.modeOfPayment,
                        style: AppTheme.textTheme.bodyMedium)),
                Expanded(
                    flex: 2,
                    child: Text('₱ ${trans.amountReceived.toStringAsFixed(2)}',
                        style: AppTheme.textTheme.bodyMedium?.copyWith(
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.bold))),
                Expanded(
                    flex: 2,
                    child: Text(changeText,
                        style: AppTheme.textTheme.bodyMedium?.copyWith(
                            color: Colors.blue.shade700,
                            fontWeight: FontWeight.bold))),
              ],
            ),
          );
        }),
      ],
    );
  }

 Widget _buildTableHeaders() {
    final headerStyle = AppTheme.textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.bold,
      color: AppTheme.gray400,
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
    final rowStyle = AppTheme.textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w600,
    );
    
    final amountToBePaid = proc.totalProcedureCharge * (hasDiscount ? 0.8 : 1.0);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(flex: 4, child: Text(proc.procedureName, style: rowStyle)),
          Expanded(
              flex: 2,
              child: Text('₱ ${proc.procedureCharge.toStringAsFixed(2)}',
                  style: rowStyle)), const SizedBox(width: 50,),
          Expanded(
              flex: 1, child: Text(proc.quantity.toString(), style: rowStyle)), const SizedBox(width: 50,),
          Expanded(
              flex: 3,
              child: Text('₱ ${amountToBePaid.toStringAsFixed(2)}',
                  style: rowStyle)),
        ],
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