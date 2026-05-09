import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/../style/theme.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/input_field.dart';
import '../../db/database.dart';
import '../../db/database_provider.dart';
import '../../repositories/invoice_repository.dart';
import '../../widgets/icon_buttons.dart';

class InvoiceForm extends ConsumerStatefulWidget {
  final VoidCallback onFinish;
  final VoidCallback onPrevious;
  final JoinedInvoice? invoiceToEdit; // NEW: Pass data if editing

  const InvoiceForm({
    super.key, 
    required this.onFinish, 
    required this.onPrevious,
    this.invoiceToEdit,
  });

  @override
  ConsumerState<InvoiceForm> createState() => _InvoiceFormState();
}

class _InvoiceFormState extends ConsumerState<InvoiceForm> {
  final List<_ProcedureRow> _procedures = [];
  Map<String, int> _patientMap = {};
  String? _selectedPatientName;
  bool _isLoading = false;

  bool get isEditing => widget.invoiceToEdit != null;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    setState(() => _isLoading = true);
    await _loadPatients();

    if (isEditing) {
      _selectedPatientName = widget.invoiceToEdit!.patientName;
      await _loadExistingProcedures();
    } else {
      _addProcedure();
    }
    setState(() => _isLoading = false);
  }

  Future<void> _loadPatients() async {
    final db = ref.read(dbProvider);
    final patients = await (db.select(db.patient)..where((p) => p.isArchived.equals(false))).get();
    _patientMap = {for (var p in patients) '${p.firstName} ${p.lastName}': p.patientId};
  }

  Future<void> _loadExistingProcedures() async {
    final db = ref.read(dbProvider);
    final charges = await (db.select(db.procedureCharge)
          ..where((c) => c.invoiceId.equals(widget.invoiceToEdit!.invoice.invoiceId)))
        .get();

    for (var c in charges) {
      final row = _ProcedureRow(notifyParent: () => setState(() {}));
      row.nameController.text = c.procedureName;
      row.priceController.text = c.procedureCharge.toStringAsFixed(2);
      row.quantityController.text = c.quantity.toString();
      _procedures.add(row);
    }
  }

  @override
  void dispose() {
    for (final row in _procedures) row.dispose();
    super.dispose();
  }

  void _addProcedure() {
    setState(() => _procedures.add(_ProcedureRow(notifyParent: () => setState(() {}))));
  }

  void _removeProcedure(int index) {
    // Prevent removal of the last remaining row
    if (_procedures.length <= 1) return;
    setState(() {
      _procedures[index].dispose();
      _procedures.removeAt(index);
    });
  }

  void _clearForm() {
    if (isEditing) return; // Don't allow clear in edit mode
    setState(() {
      _selectedPatientName = null;
      for (final row in _procedures) row.dispose();
      _procedures.clear();
      _addProcedure(); // always leave one row
    });
  }

  double get _grandTotal {
    double sum = 0;
    for (final row in _procedures) {
      final price = double.tryParse(row.priceController.text) ?? 0;
      final qty = int.tryParse(row.quantityController.text) ?? 0;
      sum += price * qty;
    }
    return sum;
  }

  Future<void> _saveInvoice() async {
    if (_selectedPatientName == null || !_patientMap.containsKey(_selectedPatientName)) return;
    if (_procedures.isEmpty) return;

    final procedures = <Map<String, dynamic>>[];
    for (final row in _procedures) {
      final name = row.nameController.text.trim();
      final price = double.tryParse(row.priceController.text) ?? 0;
      final qty = int.tryParse(row.quantityController.text) ?? 0;
      if (name.isEmpty || price <= 0 || qty <= 0) return;
      procedures.add({'name': name, 'charge': price, 'qty': qty});
    }

    final db = ref.read(dbProvider);
    final repo = InvoiceRepository(db);

    try {
      if (isEditing) {
        await repo.updateInvoiceProcedures(
          invoiceId: widget.invoiceToEdit!.invoice.invoiceId,
          procedures: procedures,
        );
      } else {
        await repo.createInvoice(
          patientId: _patientMap[_selectedPatientName]!,
          procedures: procedures,
          amountReceived: 0.0,
          modeOfPayment: 'Not Paid',
        );
      }
      widget.onFinish();
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const Center(child: CircularProgressIndicator());

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
            Text(isEditing ? "Edit Invoice" : "Billing Entry", style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 32),

            Text(isEditing ? "Patient Name" : "Select Patient by Name", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            SizedBox(
              width: 500,
              child: isEditing
                  // THE FIX: Use a locked-looking Container instead of InputField
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Patient Name", 
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200, // Grey background indicates it's disabled
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppTheme.gray400),
                          ),
                          child: Text(
                            _selectedPatientName ?? '',
                            style: const TextStyle(fontSize: 14, color: Colors.black54), // Faded text
                          ),
                        ),
                      ],
                    )
                  // The standard dropdown for adding new bills
                  : InputField(
                      hintText: "Choose a patient...",
                      label: "Patient Name",
                      isRequired: true,
                      variant: InputVariant.dropdown,
                      dropdownValue: _selectedPatientName,
                      dropdownItems: _patientMap.keys.toList(),
                      onDropdownChanged: (value) => setState(() => _selectedPatientName = value),
                    ),
            ),
            const SizedBox(height: 40),

            Text("Procedure Charge", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),

            ...List.generate(_procedures.length, (index) {
              return _ProcedureRowWidget(index: index, row: _procedures[index], onRemove: () => _removeProcedure(index));
            }),
            
            Button(
              onPressed: _addProcedure,
              label: "Add Charge",
              variant: ButtonVariant.smallSecondary,
              icon: Icons.add,
              ),

            Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 350, 
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.gray400),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Balance',
                            style: AppTheme.textTheme.titleLarge?.copyWith(
                              color: AppTheme.gray400),
                          ),
                          Text(
                            '₱ ${_grandTotal.toStringAsFixed(2)}',
                            style: AppTheme.textTheme.titleLarge?.copyWith(
                              color: Colors.black
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.end,
                    children: [
                      if (!isEditing)
                        SizedBox(
                          width: 100,
                          child: Button(variant: ButtonVariant.secondary, label: "Clear", width: double.infinity, onPressed: _clearForm),
                        ),
                      Button(
                        variant: ButtonVariant.secondary,
                        label: isEditing ? "Cancel" : "Previous",
                        width: 160,
                        icon: isEditing ? Icons.close : Icons.arrow_back,
                        iconPlacement: IconPlacement.left,
                        onPressed: widget.onPrevious,
                      ),
                      Button(
                        label: isEditing ? "Update" : "Save",
                        width: 160, // Slightly wider for new text
                        icon: isEditing ? Icons.update : Icons.save_alt_outlined,
                        iconPlacement: IconPlacement.left,
                        onPressed: _saveInvoice,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------- Internal helper classes (UNCHANGED) ----------
class _ProcedureRow {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController(text: '1');
  final VoidCallback notifyParent;

  _ProcedureRow({required this.notifyParent}) {
    nameController.addListener(notifyParent);
    priceController.addListener(notifyParent);
    quantityController.addListener(notifyParent);
  }
  void dispose() {
    nameController.removeListener(notifyParent);
    priceController.removeListener(notifyParent);
    quantityController.removeListener(notifyParent);
    nameController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }
}

class _ProcedureRowWidget extends StatelessWidget {
  final int index;
  final _ProcedureRow row;
  final VoidCallback onRemove;
  final bool canDelete;

  const _ProcedureRowWidget({required this.index, required this.row, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    final labelStyle = AppTheme.textTheme.bodyMedium?.copyWith(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87) ?? const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87);
    final price = double.tryParse(row.priceController.text) ?? 0;
    final qty = int.tryParse(row.quantityController.text) ?? 0;
    final subtotal = price * qty;

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Procedure Name Input
          Expanded(
            flex: 3,
            child: InputField(
              label: 'Procedure',
              hintText: 'e.g. Tooth Extraction',
              controller: row.nameController,
              isRequired: true,   // red asterisk now shown
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Procedure Charge', style: labelStyle),
                const SizedBox(height: 8),
                Container(
                  height: 48,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: AppTheme.gray400)),
                  child: Row(
                    children: [
                      const Padding(padding: EdgeInsets.only(left: 16, right: 4), child: Text('₱', style: TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w600))),
                      Expanded(
                        child: TextField(
                          controller: row.priceController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
                          decoration: const InputDecoration(hintText: '0.00', border: InputBorder.none, enabledBorder: InputBorder.none, focusedBorder: InputBorder.none, isDense: true, contentPadding: EdgeInsets.symmetric(vertical: 12)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(flex: 1, child: InputField(label: 'Quantity', hintText: '1', controller: row.quantityController, keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly])),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total Procedure Charge', style: labelStyle),
                const SizedBox(height: 8),
                Container(
                  height: 48, width: double.infinity, padding: const EdgeInsets.symmetric(horizontal: 16), alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8), border: Border.all(color: AppTheme.gray400)),
                  child: Text('₱ ${subtotal.toStringAsFixed(2)}', style: const TextStyle(fontSize: 14, color: Colors.black87)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Padding(
            padding: const EdgeInsets.only(top: 26), 
            child: IconButtons(
              variant: IconButtonVariant.remove, 
              onPressed: onRemove,
            ),
          )
        ],
      ),
    );
  }
}