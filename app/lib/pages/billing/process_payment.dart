import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';
import '/../style/theme.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/page_header.dart';
import '/../widgets/app_status_badge.dart';
import '../../db/database.dart';
import '../../providers/app_providers.dart';
import '../../repositories/invoice_repository.dart';

class ProcessPaymentScreen extends ConsumerStatefulWidget {
  final JoinedInvoice invoiceData;
  final VoidCallback onBack;

  const ProcessPaymentScreen({
    super.key,
    required this.invoiceData,
    required this.onBack,
  });

  @override
  ConsumerState<ProcessPaymentScreen> createState() =>
      _ProcessPaymentScreenState();
}

class _ProcessPaymentScreenState extends ConsumerState<ProcessPaymentScreen> {
  List<ProcedureChargeData> _procedures = [];
  List<PaymentTransactionData> _transactions = [];
  PatientData? _patient;
  
  final TextEditingController _amountController = TextEditingController();
  String _selectedMode = 'Cash';
  bool _isLoading = true;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final db = ref.read(databaseProvider);
    final invoiceId = widget.invoiceData.invoice.invoiceId;

    final charges = await (db.select(db.procedureCharge)..where((c) => c.invoiceId.equals(invoiceId))).get();
    final payments = await (db.select(db.paymentTransaction)..where((t) => t.invoiceId.equals(invoiceId))).get();
    final patient = await (db.select(db.patient)..where((p) => p.patientId.equals(widget.invoiceData.invoice.patientId))).getSingle();

    if (mounted) {
      setState(() {
        _procedures = charges;
        _transactions = payments.where((p) => p.amountReceived > 0).toList();
        _patient = patient;
        _isLoading = false;
      });
    }
  }

  bool _isDiscountApplicable(PatientData? p) {
    if (p == null) return false;
    if (p.isSeniorOrPWD) return true; 
    final today = DateTime.now();
    int age = today.year - p.birthDate.year;
    if (today.month < p.birthDate.month || (today.month == p.birthDate.month && today.day < p.birthDate.day)) age--;
    return age >= 60;
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _submitPayment() async {
    final amountText = _amountController.text.replaceAll(',', '').trim();
    final amountPaid = double.tryParse(amountText) ?? 0.0;

    if (amountPaid <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid amount.'), backgroundColor: Colors.red),
      );
      return;
    }

    setState(() => _isProcessing = true);

    try {
      final db = ref.read(databaseProvider);
      final repo = InvoiceRepository(db);

      await repo.processPayment(
        invoiceId: widget.invoiceData.invoice.invoiceId,
        amountPaidNow: amountPaid,
        modeOfPayment: _selectedMode,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Payment processed successfully!'), backgroundColor: Colors.green),
        );
        widget.onBack(); 
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error processing payment: $e'), backgroundColor: Colors.red),
        );
        setState(() => _isProcessing = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          title: 'Back to View Bill',
          type: PageHeaderType.withBack,
          onBack: widget.onBack,
        ),
        
        if (_isLoading)
          const Padding(
            padding: EdgeInsets.all(48.0),
            child: Center(child: CircularProgressIndicator()),
          )
        else
          _buildPaymentContent(),
      ],
    );
  }

  Widget _buildPaymentContent() {
    final inv = widget.invoiceData.invoice;
    final grandTotal = _procedures.fold(0.0, (sum, p) => sum + p.totalProcedureCharge);
    final hasDiscount = _isDiscountApplicable(_patient);
    final discountAmount = hasDiscount ? (grandTotal * 0.20) : 0.0;
    final netTotal = grandTotal - discountAmount;
    final totalPaid = _transactions.fold(0.0, (sum, t) => sum + t.amountReceived);
    final remainingBalance = (netTotal - totalPaid).clamp(0.0, double.infinity);

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        margin: const EdgeInsets.all(24),
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
                Text("Process Payment", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(width: 16),
                if (hasDiscount)
                  const AppStatusBadge(status: BadgeStatus.discount),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "Patient: ${widget.invoiceData.patientName}  |  INV-${inv.invoiceId.toString().padLeft(3, '0')}",
              style: AppTheme.textTheme.bodyMedium?.copyWith(color: AppTheme.gray500),
            ),
            const SizedBox(height: 32),

            Text("Itemized Charges", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildTableHeaders(),
            const SizedBox(height: 8),
            ..._procedures.map((proc) => _buildProcedureRow(proc, hasDiscount)),

            const SizedBox(height: 32),
            const Divider(color: AppTheme.gray400),
            const SizedBox(height: 32),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        children: [
                          Expanded(flex: 2, child: Text("Subtotal:", style: AppTheme.textTheme.bodyMedium)),
                          Expanded(flex: 3, child: Text("₱ ${grandTotal.toStringAsFixed(2)}", style: AppTheme.textTheme.bodyMedium)),
                        ],
                      ),
                      if (hasDiscount) ...[
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(flex: 2, child: Text("Discount (20%):", style: AppTheme.textTheme.bodyMedium?.copyWith(color: Colors.green.shade700))),
                            Expanded(flex: 3, child: Text("-₱ ${discountAmount.toStringAsFixed(2)}", style: AppTheme.textTheme.bodyMedium?.copyWith(color: Colors.green.shade700, fontWeight: FontWeight.bold))),
                          ],
                        ),
                      ],
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(flex: 2, child: Text("Net Total:", style: AppTheme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold))),
                          Expanded(flex: 3, child: Text("₱ ${netTotal.toStringAsFixed(2)}", style: AppTheme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold))),
                        ],
                      ),

                      const SizedBox(height: 48),

                      Text("Previous Payments", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      if (_transactions.isEmpty)
                        Text("No previous payments have been made.", style: TextStyle(color: Colors.grey.shade600, fontStyle: FontStyle.italic))
                      else
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(flex: 2, child: Text('Particulars', style: AppTheme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: AppTheme.gray400))),
                                Expanded(flex: 2, child: Text('Mode', style: AppTheme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: AppTheme.gray400))),
                                Expanded(flex: 2, child: Text('Amount', style: AppTheme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: AppTheme.gray400))),
                              ],
                            ),
                            const SizedBox(height: 8),
                            ...List.generate(_transactions.length, (index) {
                              final trans = _transactions[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    Expanded(flex: 2, child: Text(trans.paymentDate.toString().split(" ")[0].toString(), style: AppTheme.textTheme.bodyMedium)),
                                    Expanded(flex: 2, child: Text(trans.modeOfPayment, style: AppTheme.textTheme.bodyMedium)),
                                    Expanded(flex: 2, child: Text('₱ ${trans.amountReceived.toStringAsFixed(2)}', style: AppTheme.textTheme.bodyMedium?.copyWith(color: Colors.green.shade700, fontWeight: FontWeight.bold))),
                                  ],
                                ),
                              );
                            }),
                          ],
                        )
                    ],
                  ),
                ),
                
                const SizedBox(width: 48),

                SizedBox(
                  width: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppTheme.gray400),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Remaining Balance', style: AppTheme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: AppTheme.gray400)),
                            Text('₱ ${remainingBalance.toStringAsFixed(2)}', style: AppTheme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      Text("Amount Received", style: AppTheme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _amountController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          prefixText: "₱ ",
                          prefixStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                          hintText: "0.00",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: AppTheme.blue500, width: 2),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        ),
                      ),
                      
                      const SizedBox(height: 16),

                      Text("Mode of Payment", style: AppTheme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: _selectedMode,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        ),
                        items: const ["Cash", "G-Cash", "Card"].map((mode) {
                          return DropdownMenuItem(value: mode, child: Text(mode));
                        }).toList(),
                        onChanged: (val) {
                          if (val != null) setState(() => _selectedMode = val);
                        },
                      ),

                      const SizedBox(height: 32),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 15,),
                          Button(
                            onPressed: _isProcessing ? null : widget.onBack,
                            label: 'Cancel', 
                            variant: ButtonVariant.secondary,
                          ),
                          const SizedBox(width: 16),
                          SizedBox(
                            width: 220,
                            child: Button(
                              label: _isProcessing ? "Processing..." : "Process Payment",
                              variant: ButtonVariant.primary,
                              heroIcon: HeroIcons.check,
                              onPressed: _isProcessing ? () {} : _submitPayment,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
        Expanded(flex: 2, child: Text('Charge', style: headerStyle)),
        Expanded(flex: 1, child: Text('Qty', style: headerStyle)),
        Expanded(flex: 2, child: Text('Amount to be Paid', style: headerStyle)),
      ],
    );
  }

  Widget _buildProcedureRow(ProcedureChargeData proc, bool hasDiscount) {
    final rowStyle = AppTheme.textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w600,
    );

    final amountToBePaid = proc.totalProcedureCharge * (hasDiscount ? 0.8 : 1.0);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(proc.procedureName, style: rowStyle)),
          Expanded(flex: 2, child: Text('₱ ${proc.procedureCharge.toStringAsFixed(2)}', style: rowStyle)),
          Expanded(flex: 1, child: Text(proc.quantity.toString(), style: rowStyle)),
          Expanded(flex: 2, child: Text('₱ ${amountToBePaid.toStringAsFixed(2)}', style: rowStyle)),
        ],
      ),
    );
  }
}