import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/../style/theme.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/page_header.dart';
import '../../db/database.dart';
import '../../db/database_provider.dart';
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

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final db = ref.read(dbProvider);
    final invoiceId = widget.invoiceData.invoice.invoiceId;

    final charges = await (db.select(db.procedureCharge)
          ..where((c) => c.invoiceId.equals(invoiceId)))
        .get();

    final payments = await (db.select(db.paymentTransaction)
          ..where((t) => t.invoiceId.equals(invoiceId)))
        .get();

    setState(() {
      _procedures = charges;
      _transactions = payments.where((p) => p.amountReceived > 0).toList();
      _isLoading = false;
    });
  }

  String _formatDate(DateTime date) {
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');
    final y = date.year.toString();
    return '$m/$d/$y';
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
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                decoration: BoxDecoration(
                  color: AppTheme.white500,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: AppTheme.floatShadow,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        '$invoiceIdString | $formattedDate',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 16),
                    
                    Button(
                      label: isPaid ? "Fully Paid" : "Process Payment",
                      variant: isPaid ? ButtonVariant.secondary : ButtonVariant.primary,
                      onPressed: isPaid ? () {} : widget.onProcessPayment, 
                    ),
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
                    Text(
                      "${widget.invoiceData.patientName}’s Bill",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 32),

                    _buildTableHeaders(),
                    const SizedBox(height: 12),
                    ..._procedures.map((proc) => _buildProcedureRow(proc, inv.status)),

                    const SizedBox(height: 48),

                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 300,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppTheme.gray400),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Balance', 
                                style: AppTheme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: AppTheme.gray400)
                              ),
                              Text(
                                '₱ ${inv.totalBalance.toStringAsFixed(2)}', 
                                style: AppTheme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // --- TRANSACTION HISTORY ---
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
                      _buildTransactionHistory(),
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

  Widget _buildTransactionHistory() {
    // 1. Initialize running balance to calculate historical change dynamically
    double runningBalance = widget.invoiceData.grandTotal;

    return Column(
      children: [
        Row(
          children: [
            Expanded(flex: 1, child: Text('#', style: AppTheme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: AppTheme.gray400))),
            Expanded(flex: 2, child: Text('Mode of Payment', style: AppTheme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: AppTheme.gray400))),
            Expanded(flex: 2, child: Text('Amount Paid', style: AppTheme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: AppTheme.gray400))),
            // ADDED NEW COLUMN HEADER
            Expanded(flex: 2, child: Text('Change', style: AppTheme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: AppTheme.gray400))),
          ],
        ),
        const SizedBox(height: 8),
        
        ...List.generate(_transactions.length, (index) {
          final trans = _transactions[index];
          
          // 2. Logic to calculate change
          double change = trans.amountReceived - runningBalance;
          String changeText = "";
          
          if (change > 0) {
            changeText = "₱ ${change.toStringAsFixed(2)}";
            runningBalance = 0; // Paid off
          } else if (change == 0) {
            changeText = "₱ 0.00";
            runningBalance = 0; // Paid off exactly
          } else {
            changeText = ""; // Leave blank
            runningBalance -= trans.amountReceived; // Deduct partial payment
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Expanded(flex: 1, child: Text((index + 1).toString(), style: AppTheme.textTheme.bodyMedium)),
                Expanded(flex: 2, child: Text(trans.modeOfPayment, style: AppTheme.textTheme.bodyMedium)),
                Expanded(
                  flex: 2, 
                  child: Text(
                    '₱ ${trans.amountReceived.toStringAsFixed(2)}', 
                    style: AppTheme.textTheme.bodyMedium?.copyWith(color: Colors.green.shade700, fontWeight: FontWeight.bold)
                  )
                ),
                // ADDED NEW COLUMN ROW DATA
                Expanded(
                  flex: 2, 
                  child: Text(
                    changeText, 
                    style: AppTheme.textTheme.bodyMedium?.copyWith(color: Colors.blue.shade700, fontWeight: FontWeight.bold)
                  )
                ),
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
        Expanded(flex: 3, child: Text('Procedure', style: headerStyle)),
        Expanded(flex: 2, child: Text('Procedure Charge', style: headerStyle)),
        Expanded(flex: 1, child: Text('Quantity', style: headerStyle)),
        Expanded(flex: 2, child: Text('Amount to be Paid', style: headerStyle)),
        Expanded(flex: 2, child: Text('Status', style: headerStyle)),
      ],
    );
  }

  Widget _buildProcedureRow(ProcedureChargeData proc, String status) {
    final rowStyle = AppTheme.textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w600,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(proc.procedureName, style: rowStyle)),
          Expanded(flex: 2, child: Text('₱ ${proc.procedureCharge.toStringAsFixed(0)}', style: rowStyle)),
          Expanded(flex: 1, child: Text(proc.quantity.toString(), style: rowStyle)),
          Expanded(flex: 2, child: Text('₱ ${proc.totalProcedureCharge.toStringAsFixed(0)}', style: rowStyle)),
          Expanded(
            flex: 2, 
            child: Align(
              alignment: Alignment.centerLeft,
              child: _buildStatusBadge(status),
            )
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    final isPaid = status.toLowerCase() == 'paid';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isPaid ? Colors.green.shade50 : Colors.orange.shade50,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isPaid ? Colors.green.shade200 : Colors.orange.shade200)
      ),
      child: Text(
        status,
        style: TextStyle(
          color: isPaid ? Colors.green.shade800 : Colors.orange.shade800,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}