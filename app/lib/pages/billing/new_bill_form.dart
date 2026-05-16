import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/../style/theme.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/input_field.dart';
import '/../widgets/app_status_badge.dart';
import '../../db/database.dart';
import '../../providers/app_providers.dart';
import '../../repositories/invoice_repository.dart';
import '../../widgets/icon_buttons.dart';
import '../../widgets/status_toast.dart';

class InvoiceForm extends ConsumerStatefulWidget {
  final VoidCallback onFinish;
  final VoidCallback onPrevious;
  final JoinedInvoice? invoiceToEdit; 

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
  Map<String, PatientData> _patientMap = {};
  PatientData? _editingPatient;
  String? _selectedPatientName;
  bool _isLoading = false;

  bool get isEditing => widget.invoiceToEdit != null;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  bool _isDiscountApplicable(PatientData? p) {
    if (p == null) return false;
    if (p.isSeniorOrPWD) return true; 
    final today = DateTime.now();
    int age = today.year - p.birthDate.year;
    if (today.month < p.birthDate.month || (today.month == p.birthDate.month && today.day < p.birthDate.day)) age--;
    return age >= 60;
  }

  Future<void> _loadInitialData() async {
    setState(() => _isLoading = true);
    await _loadPatients();

    if (isEditing) {
      _selectedPatientName = widget.invoiceToEdit!.patientName;
      final db = ref.read(databaseProvider);
      _editingPatient = await (db.select(db.patient)..where((p) => p.patientId.equals(widget.invoiceToEdit!.invoice.patientId))).getSingle();
      await _loadExistingProcedures();
    } else {
      _addProcedure();
    }
    setState(() => _isLoading = false);
  }

  Future<void> _loadPatients() async {
    final db = ref.read(databaseProvider);
    final patients = await (db.select(db.patient)..where((p) => p.isArchived.equals(false))).get();
    _patientMap = {for (var p in patients) '${p.firstName} ${p.lastName}': p};
  }

  Future<void> _loadExistingProcedures() async {
    final db = ref.read(databaseProvider);
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
    for (final row in _procedures) {
      row.dispose();
    }
    super.dispose();
  }

  void _addProcedure() {
    setState(() => _procedures.add(_ProcedureRow(notifyParent: () => setState(() {}))));
  }

  void _removeProcedure(int index) {
    setState(() {
      _procedures[index].dispose();
      _procedures.removeAt(index);
    });
  }

  void _clearForm() {
    if (isEditing) return; 
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
    if (!isEditing) {
      if (_selectedPatientName == null || !_patientMap.containsKey(_selectedPatientName)) {
        StatusToast.show(
          context,
          title: "Error",
          message: "Please select a valid patient.",
          isSuccess: false,
        );
        return;
      }
    }
    
    if (_procedures.isEmpty) {
      StatusToast.show(
        context,
        title: "Error",
        message: "Failed to create invoice. Please try again.",
        isSuccess: false,
      );
      return;
    }

    final procedures = <Map<String, dynamic>>[];
    for (final row in _procedures) {
      final name = row.nameController.text.trim();
      final price = double.tryParse(row.priceController.text) ?? 0;
      final qty = int.tryParse(row.quantityController.text) ?? 0;

      if (name.isEmpty || price <= 0 || qty <= 0) {
        StatusToast.show(
          context,
          title: "Error",
          message: "Failed to create invoice. Please try again.",
          isSuccess: false,
        );
        return;
      }
      procedures.add({'name': name, 'charge': price, 'qty': qty});
    }

    final db = ref.read(databaseProvider);
    final repo = InvoiceRepository(db);

    try {
      if (isEditing) {
        await repo.updateInvoiceProcedures(
          invoiceId: widget.invoiceToEdit!.invoice.invoiceId,
          procedures: procedures,
        );
        if (mounted) {
          StatusToast.show(
            context,
            title: "Success",
            message: "INV-${widget.invoiceToEdit!.invoice.invoiceId.toString().padLeft(3, '0')} has been updated.",
            isSuccess: true,
          );
        }
      } else {
        final newInvoiceId = await repo.createInvoice(
          patientId: _patientMap[_selectedPatientName]!.patientId,
          procedures: procedures,
          amountReceived: 0.0,
          modeOfPayment: 'Not Paid',
        );
        if (mounted) {
          StatusToast.show(
            context,
            title: "Success",
            message: "INV-${newInvoiceId.toString().padLeft(3, '0')} has been created.",
            isSuccess: true,
          );
        }
      }
      widget.onFinish();
    } catch (e) {
      if (mounted) {
        StatusToast.show(
          context,
          title: "Error",
          message: "Failed to create invoice. Please try again.",
          isSuccess: false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const Center(child: CircularProgressIndicator());

    final currentPatient = isEditing ? _editingPatient : (_selectedPatientName != null ? _patientMap[_selectedPatientName] : null);
    final hasDiscount = _isDiscountApplicable(currentPatient);

    final rawTotal = _grandTotal;
    final discount = hasDiscount ? rawTotal * 0.20 : 0.0;
    final netTotal = rawTotal - discount;

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(isEditing ? "Edit Invoice" : "Billing Entry", style: Theme.of(context).textTheme.headlineLarge),
                    if (isEditing)
                      Text(
                        "Patient: ${widget.invoiceToEdit!.patientName}  |  INV-${widget.invoiceToEdit!.invoice.invoiceId.toString().padLeft(3, '0')}",
                        style: AppTheme.textTheme.bodyMedium?.copyWith(
                          color: AppTheme.gray500,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 16),
                if (hasDiscount)
                  const AppStatusBadge(status: BadgeStatus.discount),
              ],
            ),
            const SizedBox(height: 32),

            if (!isEditing) ...[
              Text(
                "Select Patient by Name", 
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: 500,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    textTheme: Theme.of(context).textTheme.copyWith(
                      bodySmall: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  child: InputField(
                    hintText: "Choose a patient...",
                    label: "Patient Name",
                    isRequired: true,
                    variant: InputVariant.dropdown,
                    dropdownValue: _selectedPatientName,
                    dropdownItems: _patientMap.keys.toList(),
                    onDropdownChanged: (value) => setState(() => _selectedPatientName = value),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],

            Text(
              "Procedure Charge", 
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),

            ...List.generate(_procedures.length, (index) {
              return _ProcedureRowWidget(
                index: index, 
                row: _procedures[index], 
                hasDiscount: hasDiscount,
                onRemove: () => _removeProcedure(index),
                canRemove: _procedures.length > 1, 
              );
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
                  Padding(
                    padding: const EdgeInsets.only(right: 24, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Subtotal:', style: AppTheme.textTheme.titleLarge?.copyWith(color: AppTheme.gray500, fontWeight: FontWeight.normal)),
                            const SizedBox(width: 32),
                            Text('₱ ${rawTotal.toStringAsFixed(2)}', style: AppTheme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.normal))
                          ],
                        ),
                        if (hasDiscount) ...[
                          const SizedBox(height: 8),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Discount (20%):', style: AppTheme.textTheme.titleLarge?.copyWith(color: Colors.green.shade700, fontWeight: FontWeight.normal)),
                              const SizedBox(width: 32),
                              Text('-₱ ${discount.toStringAsFixed(2)}', style: AppTheme.textTheme.titleLarge?.copyWith(color: Colors.green.shade700, fontWeight: FontWeight.normal)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Grand Total:', style: AppTheme.textTheme.titleLarge?.copyWith(color: AppTheme.gray500, fontWeight: FontWeight.normal)),
                              const SizedBox(width: 32),
                              Text('₱ ${netTotal.toStringAsFixed(2)}', style: AppTheme.textTheme.titleLarge?.copyWith(color: Colors.black, fontWeight: FontWeight.normal)),
                            ],
                          )
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.end,
                    children: [
                      if (!isEditing) ...[
                        SizedBox(
                          width: 100,
                          child: Button(variant: ButtonVariant.secondary, label: "Clear", width: double.infinity, onPressed: _clearForm),
                        ),
                      ],
                      if (isEditing)
                        Button(
                          variant: ButtonVariant.secondary,
                          label: "Cancel",
                          iconPlacement: IconPlacement.left,
                          onPressed: widget.onPrevious,
                        ),
                      Button(
                        label: isEditing ? "Update" : "Save Entry",
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
  final bool hasDiscount;
  final VoidCallback onRemove;
  final bool canRemove;

  const _ProcedureRowWidget({
    required this.index, 
    required this.row, 
    required this.hasDiscount,
    required this.onRemove,
    required this.canRemove,
  });

  @override
  Widget build(BuildContext context) {
    final price = double.tryParse(row.priceController.text) ?? 0;
    final qty = int.tryParse(row.quantityController.text) ?? 0;
    final subtotal = price * qty;
    final amountToBePaid = subtotal * (hasDiscount ? 0.8 : 1.0);

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: InputField(
              label: 'Procedure',
              hintText: 'Enter Procedure',
              controller: row.nameController,
              isRequired: true,
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Procedure Charge", style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(width: 4),
                    const Text("*", style: TextStyle(color: AppTheme.red600)),
                  ],
                ),
                const SizedBox(height: 4,),
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(11.5), 
                    border: Border.all(color: AppTheme.gray400),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 12, right: 4),
                        child: Text(
                          '₱',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: row.priceController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          style: const TextStyle(fontWeight: FontWeight.w500),
                          decoration: const InputDecoration(
                            hintText: '0.00',
                            border: InputBorder.none,
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
          const SizedBox(width: 12),

          Expanded(
            flex: 1,
            child: InputField(
              label: 'Quantity',
              controller: row.quantityController,
              isRequired: true,
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Amount to be Paid', style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppTheme.gray500),),
                const SizedBox(height: 8),
                Container(
                  height: 48,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white, 
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppTheme.gray400),
                  ),
                  child: Text(
                    '₱ ${amountToBePaid.toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),
          
          if (canRemove)
            Padding(
              padding: const EdgeInsets.only(top: 28),
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