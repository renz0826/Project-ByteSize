import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';
import 'package:dentcity_management_system/pages/billing/billing_dashboard.dart';
import '/../style/theme.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/page_header.dart';
import '/../widgets/app_status_badge.dart';
import '/../widgets/attribute_read_view.dart';
import '/../widgets/status_toast.dart';
import '../../db/database.dart';
import '../../providers/app_providers.dart';
import '../../repositories/invoice_repository.dart';
import '../../widgets/warning_dialog.dart';

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

  // Dynamic Popup Guard when returning back to listing dashboard view layout frames
  Future<void> _confirmReturnToDashboard() async {
    final bool? shouldDiscard = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return const WarningDialog(
          isCaution: true,
          title: "Discard Unsaved Changes?",
          content: "Are you sure you want to return to the invoice? Any unsaved data will be lost.",
          secondaryAction: "Keep Editing",
          primaryAction: "Discard",
        );
      },
    );

    if (shouldDiscard == true && mounted) {
      widget.onBack();
    }
  }

  Future<void> _submitPayment() async {
    final amountText = _amountController.text.replaceAll(',', '').trim();
    final amountPaid = double.tryParse(amountText) ?? 0.0;

    if (amountPaid <= 0) {
      StatusToast.show(
        context,
        title: "Error",
        message: "Please enter a valid amount.",
        isSuccess: false,
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
        StatusToast.show(
          context,
          title: "Success",
          message: "Payment settled for INV-${widget.invoiceData.invoice.invoiceId.toString().padLeft(3, '0')}.",
          isSuccess: true,
        );
        widget.onBack(); 
      }
    } catch (e) {
      if (mounted) {
        StatusToast.show(
          context,
          title: "Error",
          message: "Failed to process payment. Please try again.",
          isSuccess: false,
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
          title: 'Back to Billings & Invoices',
          type: PageHeaderType.withBack,
          onBack: _confirmReturnToDashboard,
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

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Cancel Button
        SizedBox(
          width: 110, 
          child: Button(
            onPressed: _confirmReturnToDashboard,
            label: 'Cancel',
            variant: ButtonVariant.secondary,
          ),
        ),

        const SizedBox(width: 10),
        
        // Dominant Process Payment Button
        SizedBox(
          width: 220, 
          child: Button(
            label: _isProcessing ? "Wait..." : "Process Payment",
            variant: ButtonVariant.primary,
            heroIcon: HeroIcons.check,
            onPressed: _isProcessing ? () {} : _submitPayment,
          ),
        ),
      ],
    );
  }

  Widget _buildCroppedAttribute(String content) {
    return SizedBox(
      height: 28,
      child: ClipRect(
        child: OverflowBox(
          alignment: Alignment.bottomLeft,
          minHeight: 0,
          maxHeight: 60,
          child: AttributeReadView(label: '', content: content, isCrucial: false),
        ),
      ),
    );
  }

  Widget _buildTableHeaders() {
    final headerStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      color: AppTheme.gray500,
      fontWeight: FontWeight.bold,
    );

    return Row(
      children: [
        Expanded(flex: 3, child: Text('Procedure', style: headerStyle)),
        Expanded(flex: 2, child: Text('Procedure Charge', style: headerStyle)),
        Expanded(flex: 1, child: Text('Quantity', style: headerStyle)),
        Expanded(flex: 2, child: Text('Subtotal', style: headerStyle)),
      ],
    );
  }

  Widget _buildProcedureRow(ProcedureChargeData proc, bool hasDiscount) {
    final amountToBePaid = proc.totalProcedureCharge * (hasDiscount ? 0.8 : 1.0);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Expanded(flex: 3, child: _buildCroppedAttribute(proc.procedureName)),
          Expanded(flex: 2, child: _buildCroppedAttribute('₱ ${proc.procedureCharge.toStringAsFixed(2)}')),
          Expanded(flex: 1, child: _buildCroppedAttribute(proc.quantity.toString())),
          Expanded(flex: 2, child: _buildCroppedAttribute('₱ ${amountToBePaid.toStringAsFixed(2)}')),
        ],
      ),
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

    final amountInput = double.tryParse(_amountController.text.replaceAll(',', '')) ?? 0.0;
    final previewBalance = (remainingBalance - amountInput).clamp(0.0, double.infinity);

    final textStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
      color: AppTheme.gray500,
      fontWeight: FontWeight.w500,
    );
    
    return SingleChildScrollView(
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1300),
          margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          padding: const EdgeInsets.all(40),
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
                  Text("Process Payment",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(width: 16),
                  if (hasDiscount) const AppStatusBadge(status: BadgeStatus.discount),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                  "Patient: ${widget.invoiceData.patientName} | INV-${inv.invoiceId.toString().padLeft(3, '0')}",
                  style: AppTheme.textTheme.bodyMedium),
              const SizedBox(height: 32),
              Text("Itemized Charges",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              _buildTableHeaders(),
              ..._procedures.map((proc) => _buildProcedureRow(proc, hasDiscount)),
              const Divider(color: AppTheme.gray400),
              const SizedBox(height: 24),
              Row(
                children: [
                  const Spacer(),
                  SizedBox(
                    width: 340,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Invoice Total:', style: textStyle),
                            Text('₱ ${grandTotal.toStringAsFixed(2)}', style: Theme.of(context).textTheme.titleLarge),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Discount (20%):', style: textStyle?.copyWith(
                              color: Colors.green.shade700,
                            )),
                            Text(
                              '- ₱ ${discountAmount.toStringAsFixed(2)}',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.green.shade700,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Divider(color: AppTheme.gray400),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Remaining Balance:', style: textStyle),
                            Text(
                              '₱ ${remainingBalance.toStringAsFixed(2)}',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Amount Paid", style: AppTheme.textTheme.bodySmall)),
                        const SizedBox(height: 8),
                        _buildAmountField(),
                        const SizedBox(height: 16),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Mode of Payment", style: AppTheme.textTheme.bodySmall)),
                        const SizedBox(height: 8),
                        _buildModeDropdown(),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('New Balance:', style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: AppTheme.gray500,
                              fontWeight: FontWeight.w500,
                              )
                            ),
                            Text(
                              '₱ ${previewBalance.toStringAsFixed(2)}',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        _buildActionButtons(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAmountField() {
    return TextField(
      controller: _amountController,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        prefixText: "₱ ",
        prefixStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
        hintText: "0.00",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: AppTheme.blue500, width: 2)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }

  Widget _buildModeDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedMode,
      decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16)),
      items: const ["Cash", "G-Cash", "Card"].map((mode) => DropdownMenuItem(value: mode, child: Text(mode))).toList(),
      onChanged: (val) { if (val != null) setState(() => _selectedMode = val); },
    );
  }
}