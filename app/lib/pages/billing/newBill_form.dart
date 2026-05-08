import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/../style/theme.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/input_field.dart';
import '../../db/database.dart';
import '../../db/database_provider.dart';
import '../../repositories/invoice_repository.dart';

class InvoiceForm extends ConsumerStatefulWidget {
  final VoidCallback onFinish;
  final VoidCallback onPrevious;

  const InvoiceForm({super.key, required this.onFinish, required this.onPrevious});

  @override
  ConsumerState<InvoiceForm> createState() => _InvoiceFormState();
}

class _InvoiceFormState extends ConsumerState<InvoiceForm> {
  final List<_ProcedureRow> _procedures = [];
  
  Map<String, int> _patientMap = {};
  String? _selectedPatientName;

  @override
  void initState() {
    super.initState();
    _loadPatients();
    _addProcedure(); // Add one empty procedure row by default
  }

  Future<void> _loadPatients() async {
    final db = ref.read(dbProvider);
    final patients = await (db.select(db.patient)..where((p) => p.isArchived.equals(false))).get();
    
    setState(() {
      _patientMap = {
        for (var p in patients) '${p.firstName} ${p.lastName}': p.patientId
      };
    });
  }

  @override
  void dispose() {
    for (final row in _procedures) {
      row.dispose();
    }
    super.dispose();
  }

  void _addProcedure() {
    setState(() {
      _procedures.add(_ProcedureRow(notifyParent: () => setState(() {})));
    });
  }

  void _removeProcedure(int index) {
    setState(() {
      _procedures[index].dispose();
      _procedures.removeAt(index);
    });
  }

  void _clearForm() {
    setState(() {
      _selectedPatientName = null;
      for (final row in _procedures) {
        row.dispose();
      }
      _procedures.clear();
      _addProcedure();
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
    if (_selectedPatientName == null || !_patientMap.containsKey(_selectedPatientName)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select a valid patient.')));
      return;
    }
    if (_procedures.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Add at least one procedure.')));
      return;
    }

    final procedures = <Map<String, dynamic>>[];
    for (final row in _procedures) {
      final name = row.nameController.text.trim();
      final price = double.tryParse(row.priceController.text) ?? 0;
      final qty = int.tryParse(row.quantityController.text) ?? 0;
      if (name.isEmpty || price <= 0 || qty <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill all procedure fields correctly.')));
        return;
      }
      procedures.add({'name': name, 'charge': price, 'qty': qty});
    }

    final db = ref.read(dbProvider);
    final repo = InvoiceRepository(db);

    try {
      final patientId = _patientMap[_selectedPatientName]!;
      await repo.createInvoice(
        patientId: patientId,
        procedures: procedures,
        amountReceived: 0.0,
        modeOfPayment: 'Not Paid',
      );
      
      widget.onFinish(); // Instantly returns to dashboard and triggers refresh
      
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error creating invoice: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Billing Entry", style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 32),

            // ---- Patient Selection ----
            Text("Select Patient by Name", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            SizedBox(
              width: 500,
              child: InputField(
                hintText: "Choose a patient...",
                label: "Patient Name",
                isRequired: true,
                variant: InputVariant.dropdown,
                dropdownValue: _selectedPatientName,
                dropdownItems: _patientMap.keys.toList(),
                onDropdownChanged: (value) {
                  setState(() => _selectedPatientName = value);
                },
              ),
            ),

            const SizedBox(height: 40),

            // ---- Procedures Section ----
            Text("Procedure Charge", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),

            ...List.generate(_procedures.length, (index) {
              return _ProcedureRowWidget(
                index: index,
                row: _procedures[index],
                onRemove: () => _removeProcedure(index),
              );
            }),

            const SizedBox(height: 16),
            
            // Replaced default OutlinedButton with custom styling
            OutlinedButton.icon(
              onPressed: _addProcedure,
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Add Charge'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.blue500, // Assuming your primary blue is here
                side: const BorderSide(color: AppTheme.blue500),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),

            const SizedBox(height: 60),

            // ---- Grand Total Box & Save Button ----
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Total Balance Box (Keeps the 350px width restriction)
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
                          const Text('Total Balance', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.gray400)),
                          Text('₱ ${_grandTotal.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  // Standardized Buttons (Using Wrap to prevent overflow on any screen size)
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.end,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Button(
                          variant: ButtonVariant.secondary,
                          label: "Clear",
                          width: double.infinity,
                          onPressed: _clearForm,
                        ),
                      ),
                      Button(
                        variant: ButtonVariant.secondary,
                        label: "Previous",
                        width: 160,
                        icon: Icons.arrow_back,
                        iconPlacement: IconPlacement.left,
                        onPressed: widget.onPrevious,
                      ),
                      Button(
                        label: "Save",
                        width: 140,
                        icon: Icons.save_alt_outlined,
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

// ---------- Internal helper classes ----------

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

  const _ProcedureRowWidget({
    required this.index,
    required this.row,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    
    // --- THE FIX: Label Style Matcher ---
    // Change fontSize, fontWeight, or color here to perfectly 
    // match your custom InputField widget's internal code!
    final labelStyle = AppTheme.textTheme.bodyMedium?.copyWith(
      fontSize: 12, 
      fontWeight: FontWeight.w600,
      color: Colors.black87, 
    ) ?? const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87);

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
            ),
          ),
          const SizedBox(width: 16),
          
          // 2. Procedure Charge Input
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Procedure Charge', style: labelStyle),
                const SizedBox(height: 8),
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppTheme.gray400),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 16, right: 4),
                        child: Text(
                          '₱', 
                          style: TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w600)
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: row.priceController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
                          decoration: const InputDecoration(
                            hintText: '0.00',
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          
          // 3. Quantity Input
          Expanded(
            flex: 1,
            child: InputField(
              label: 'Quantity',
              hintText: '1',
              controller: row.quantityController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ),
          const SizedBox(width: 16),
          
          // 4. Total Procedure Charge (Read Only)
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total Procedure Charge', style: labelStyle),
                const SizedBox(height: 8),
                Container(
                  height: 48, 
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100, 
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppTheme.gray400),
                  ),
                  child: Text(
                    '₱ ${subtotal.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(width: 16),
          
          // 5. Delete Row Button
          Padding(
            padding: const EdgeInsets.only(top: 26), 
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                icon: Icon(Icons.remove, color: Colors.red.shade400),
                onPressed: onRemove,
              ),
            ),
          )
        ],
      ),
    );
  }
}