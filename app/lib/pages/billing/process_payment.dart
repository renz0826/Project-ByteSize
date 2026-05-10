import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/../style/theme.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/page_header.dart';
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
  final List<TextEditingController> _receivedControllers = [];
  final List<String> _selectedModes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchProcedures();
  }

  Future<void> _fetchProcedures() async {
    final db = ref.read(databaseProvider);
    final invoiceId = widget.invoiceData.invoice.invoiceId;

    final charges = await (db.select(db.procedureCharge)
          ..where((c) => c.invoiceId.equals(invoiceId)))
        .get();

    setState(() {
      _procedures = charges;
      for (var _ in _procedures) {
        _receivedControllers.add(TextEditingController(text: "0.00"));
        _selectedModes.add("Cash");
      }
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
    if (_isLoading) return const Center(child: CircularProgressIndicator());

    final inv = widget.invoiceData.invoice;
    final subtotal = widget.invoiceData.grandTotal.toDouble();
    final currentDebt = inv.totalBalance.toDouble();

    double totalPaidNow = 0;
    for (var controller in _receivedControllers) {
      totalPaidNow += double.tryParse(controller.text) ?? 0.0;
    }

    final previouslyPaid = subtotal - currentDebt;
    final newRemainingBalance = (currentDebt - totalPaidNow).clamp(0.0, double.infinity);
    final change = (totalPaidNow - currentDebt).clamp(0.0, double.infinity);

    final invoiceIdString = 'INV-${inv.invoiceId.toString().padLeft(3, '0')}';
    final formattedDate = _formatDate(inv.issuedDate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          title: 'Back to Billing Record',
          type: PageHeaderType.withBack,
          onBack: widget.onBack,
        ),
        Center(
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
                    Expanded(
                      child: Text(
                        "${widget.invoiceData.patientName}’s Bill",
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      invoiceIdString,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600, color: AppTheme.gray500),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text("Issued: $formattedDate",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppTheme.gray500)),
                const Divider(height: 32),

                const SizedBox(height: 16),
                Text("Payment Transaction", style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 16),
                _buildTableHeaders(),
                const SizedBox(height: 12),
                ...List.generate(_procedures.length, (index) => _buildPaymentRow(index, currentDebt)),
                const SizedBox(height: 32),

                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bill Breakdown", style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 16),
                        _buildBreakdownRow("Subtotal", subtotal),
                        _buildBreakdownRow("Previously Paid", previouslyPaid, color: Colors.green.shade700),
                        _buildBreakdownRow("Paying Now", totalPaidNow, color: AppTheme.blue500, bold: true),
                        
                        if (change > 0) ...[
                          const Divider(height: 24),
                          _buildBreakdownRow("Change", change, color: Colors.blue.shade700, bold: true),
                        ],
                        
                        const SizedBox(height: 24),
                        
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppTheme.gray400),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Remaining Balance",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.gray400)),
                              Text("₱ ${newRemainingBalance.toStringAsFixed(2)}",
                                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: Button(
                            label: "Process Payment",
                            variant: ButtonVariant.primary,
                            icon: Icons.check,
                            iconPlacement: IconPlacement.left,
                            onPressed: () async {
                              final db = ref.read(databaseProvider);
                              final repo = InvoiceRepository(db);
                              
                              if (totalPaidNow <= 0) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Please enter an amount to pay.'))
                                );
                                return;
                              }

                              try {
                                await repo.processPayment(
                                  invoiceId: widget.invoiceData.invoice.invoiceId,
                                  amountPaidNow: totalPaidNow,
                                  modeOfPayment: _selectedModes.isNotEmpty ? _selectedModes[0] : 'Cash',
                                );

                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Payment Processed Successfully!'))
                                  );
                                  widget.onBack(); 
                                }
                              } catch (e) {
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBreakdownRow(String label, double amount, {bool bold = false, Color? color}) {
    final textStyle = bold
        ? Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: color ?? AppTheme.black500)
        : Theme.of(context).textTheme.bodyMedium?.copyWith(color: color ?? AppTheme.black500);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: textStyle),
          Text("₱ ${amount.toStringAsFixed(2)}", style: textStyle),
        ],
      ),
    );
  }

  Widget _buildTableHeaders() {
    final style = AppTheme.textTheme.bodyMedium?.copyWith(color: AppTheme.gray400, fontWeight: FontWeight.bold);
    return Row(
      children: [
        Expanded(flex: 3, child: Text("Procedure", style: style)),
        Expanded(flex: 2, child: Text("Amount to be Paid", style: style)),
        Expanded(flex: 2, child: Text("Amount Received", style: style)),
        Expanded(flex: 2, child: Text("Mode of Payment", style: style)),
      ],
    );
  }

  Widget _buildPaymentRow(int index, double currentRemaining) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(_procedures[index].procedureName, style: AppTheme.textTheme.bodyLarge)),
          Expanded(flex: 2, child: Text("₱ ${currentRemaining.toStringAsFixed(2)}", style: AppTheme.textTheme.bodyLarge)),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: TextField(
                controller: _receivedControllers[index],
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  prefixText: "₱ ",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: DropdownButtonFormField<String>(
              initialValue: _selectedModes[index],
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppTheme.gray400, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppTheme.blue500, width: 1),
                ),
              ),
              items: const ["Cash", "G-Cash", "Card"].map((mode) {
                return DropdownMenuItem(value: mode, child: Text(mode));
              }).toList(),
              onChanged: (val) => setState(() => _selectedModes[index] = val!),
            ),
          ),
        ],
      ),
    );
  }
}