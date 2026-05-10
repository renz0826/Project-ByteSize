import 'package:dentcity_management_system/pages/billing/view_bill.dart';
import 'package:dentcity_management_system/widgets/app_status_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/../style/theme.dart';
import '/../widgets/search_bar.dart';
import '/../widgets/app_pagination.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/page_header.dart';
import 'package:heroicons/heroicons.dart';

// --- THE FIX: Pointing to the unified providers ---
import '../../providers/app_providers.dart';
import '../../providers/auth_provider.dart';
import '../../repositories/invoice_repository.dart';

import 'new_bill_form.dart';
import 'process_payment.dart';
import '/../widgets/app_info_bar.dart';

class BillingDashboard extends ConsumerStatefulWidget {
  const BillingDashboard({super.key});

  @override
  ConsumerState<BillingDashboard> createState() => _BillingDashboardState();
}

class _BillingDashboardState extends ConsumerState<BillingDashboard> {
  late InvoiceRepository _repository;


  List<JoinedInvoice> _allInvoices = [];
  List<JoinedInvoice> _filteredRecords = [];

  int _currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  int _currentPage = 1;
  final int _recordsPerPage = 8;
  String _selectedStatus = 'All';
  
  // Session IDs to force screens to refresh with new data
  int _formSessionId = 0;
  int _paymentSessionId = 0; 
  int _viewSessionId = 0; 
  
  JoinedInvoice? _selectInvoiceToView;

  @override
  void initState() {
    super.initState();
    // THE FIX: Use the Single Source of Truth database provider
    final db = ref.read(databaseProvider);
    _repository = InvoiceRepository(db);
    _loadInvoices();
  }

  Future<void> _loadInvoices() async {
    try {
      final invoices = await _repository.getAllInvoices();
      
      // THE FIX: Safe sort prevents crashes if a date happens to be null
      invoices.sort((a, b) {
        final dateA = a.invoice.issuedDate;
        final dateB = b.invoice.issuedDate;
        if (dateA == null && dateB == null) return 0;
        if (dateA == null) return 1;
        if (dateB == null) return -1;
        return dateB.compareTo(dateA); 
      });

      if (mounted) {
        setState(() {
          _allInvoices = invoices;
          _filteredRecords = invoices;
          _applyFilters();
          
          // Automatically update the active View Bill data with fresh database data
          if (_selectInvoiceToView != null) {
            try {
              _selectInvoiceToView = invoices.firstWhere(
                (inv) => inv.invoice.invoiceId == _selectInvoiceToView!.invoice.invoiceId
              );
            } catch (e) {} // Failsafe if invoice was deleted
          }
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Dashboard Load Error: $e'), backgroundColor: Colors.red)
        );
      }
    }
  }

  void _applyFilters() {
    final query = _searchController.text.toLowerCase();
    _filteredRecords = _allInvoices.where((inv) {
      final matchesSearch = inv.patientName.toLowerCase().contains(query);
      final matchesStatus = _selectedStatus == 'All' ||
          inv.invoice.status.toLowerCase() == _selectedStatus.toLowerCase();
      return matchesSearch && matchesStatus;
    }).toList();
  }

  void _onSearch(String query) {
    setState(() {
      _currentPage = 1;
      _applyFilters();
    });
  }

  void _onFilter(String status) {
    setState(() {
      _currentPage = 1;
      _selectedStatus = status;
      _applyFilters();
    });
  }

  void _goToAddBill() {
    setState(() {
      _selectInvoiceToView = null; // THE FIX: Clear memory so the form is blank
      _formSessionId++;
      _currentIndex = 1;
    });
  }

  Future<void> _confirmReturnToDashboard() async {
    final bool? shouldDiscard = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Discard Changes?'),
        content: const Text('Are you sure you want to return to the dashboard? Any unsaved data will be lost.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Discard', style: TextStyle(color: Colors.red))),
        ],
      ),
    );
    if (shouldDiscard == true) setState(() => _currentIndex = 0);
  }

  // --- PIN AUTHENTICATION FOR EDITING ---
  Future<bool> _verifyPin() async {
    final TextEditingController pinController = TextEditingController();

    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)), 
          title: const Text('Admin Authentication', textAlign: TextAlign.center),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Enter your 4-digit PIN to edit this invoice.', textAlign: TextAlign.center),
              const SizedBox(height: 24),
              TextField(
                controller: pinController,
                obscureText: true,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                autofocus: true,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4)
                ],
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Color(0xFFB5B5B5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Color(0xFFB5B5B5), width: 2),
                  ),
                ),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              onPressed: () {
                pinController.dispose();
                Navigator.of(dialogContext).pop(false);
              },
              child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.blue500,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12)
              ),
              onPressed: () {
                final enteredPin = pinController.text.trim();
                
                if (enteredPin.length != 4) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('PIN must be exactly 4 digits.'))
                  );
                  return;
                }

                // THE FIX: Ask the AuthController if the PIN is correct
                final isValid = ref.read(authControllerProvider.notifier).verifyPin(enteredPin);

                if (isValid) { 
                  pinController.dispose();
                  Navigator.of(dialogContext).pop(true);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Incorrect PIN'))
                  );
                }
              },
              child: const Text('Verify', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    ) ?? false;
  }

  void _triggerEditInvoice(JoinedInvoice invoice) async {
    bool isAuthorized = await _verifyPin();
    if (isAuthorized) {
      setState(() {
        _selectInvoiceToView = invoice;
        _formSessionId++; 
        _currentIndex = 1;
      });
    }
  }

  List<JoinedInvoice> get _currentPageRecords {
    final start = (_currentPage - 1) * _recordsPerPage;
    final end = (start + _recordsPerPage).clamp(0, _filteredRecords.length);
    return _filteredRecords.sublist(start, end);
  }

  int get _totalPages => (_filteredRecords.length / _recordsPerPage).ceil();

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: _currentIndex,
      children: [
        // INDEX 0: MAIN DASHBOARD
        Scaffold(
          backgroundColor: AppTheme.gray200,
          body: CustomScrollView(
            slivers: [
                const SliverToBoxAdapter(
                  child: PageHeader(
                    title: 'Billings',
                    type: PageHeaderType.plain,
                  ),
                ),
                
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _buildSearchBar(),
                    const SizedBox(height: 8),
                    _buildTableHeader(),
                  ]),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: _currentPageRecords.isEmpty
                    ? SliverToBoxAdapter(child: _buildEmptyState())
                    : SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => _buildTableRow(_currentPageRecords[index]),
                          childCount: _currentPageRecords.length,
                        ),
                      ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 16),
                sliver: SliverToBoxAdapter(
                  child: _filteredRecords.isEmpty
                      ? const SizedBox.shrink()
                      : AppPagination(
                          currentPage: _currentPage,
                          totalPages: _totalPages,
                          onPageChanged: (newPage) => setState(() => _currentPage = newPage),
                        ),
                ),
              ),
            ],
          ),
        ),

        // INDEX 1: FORM (CREATE OR EDIT)
        SingleChildScrollView(
          child: Column(
            children: [
              PageHeader(title: 'Back to Billings & Invoices', type: PageHeaderType.withBack, onBack: _confirmReturnToDashboard),
              Transform.translate(
                offset: const Offset(0, -30),
                child: InvoiceForm(
                  key: ValueKey(_formSessionId),
                  invoiceToEdit: _currentIndex == 1 && _selectInvoiceToView != null ? _selectInvoiceToView : null,
                  onPrevious: () => setState(() => _currentIndex = 0),
                  onFinish: () {
                    _loadInvoices();
                    setState(() => _currentIndex = 0);
                  },
                ),
              ),
            ],
          ),
        ),

        // INDEX 2: VIEW BILL
        SingleChildScrollView(
          child: _selectInvoiceToView == null
              ? const SizedBox.shrink()
              : ViewBillScreen(
                  key: ValueKey('view-${_selectInvoiceToView!.invoice.invoiceId}-$_viewSessionId'),
                  invoiceData: _selectInvoiceToView!,
                  onBack: () {
                    _loadInvoices();
                    setState(() => _currentIndex = 0);
                  },
                  onProcessPayment: () {
                    setState(() {
                      _paymentSessionId++;
                      _currentIndex = 3;
                    });
                  },
                  onEditInvoice: () => _triggerEditInvoice(_selectInvoiceToView!),
                ),
        ),

        // INDEX 3: PROCESS PAYMENT
        SingleChildScrollView(
          child: _selectInvoiceToView == null
              ? const SizedBox.shrink()
              : ProcessPaymentScreen(
                  key: ValueKey('pay-${_selectInvoiceToView!.invoice.invoiceId}-$_paymentSessionId'),
                  invoiceData: _selectInvoiceToView!,
                  onBack: () {
                    _loadInvoices().then((_) {
                      setState(() {
                        _viewSessionId++; 
                        _currentIndex = 2; 
                      });
                    });
                  },
                ),
        ),
      ],
    );
  }

  // --- UI HELPER METHODS ---

  Widget _buildSearchBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: AppSearchBar(
                controller: _searchController,
                onChanged: _onSearch,
                hintText: 'Search for a Patient...',
                onFilter: () {},
                // TODO: FILTERING

              ),
            ),
            const SizedBox(width: 26),
            SizedBox(
              height: 48,
              child: Theme(
                data: Theme.of(context).copyWith(
                  elevatedButtonTheme: ElevatedButtonThemeData(
                      style: ElevatedButton.styleFrom(padding: EdgeInsets.zero)),
                ),
                child: Button(
                  label: 'Add New Bill',
                  variant: ButtonVariant.primary,
                  heroIcon: HeroIcons.documentPlus,
                  onPressed: _goToAddBill,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        _buildFilterChips(),
      ],
    );
  }

  Widget _buildFilterChips() {
    final filters = ['All', 'Pending', 'Paid'];
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: filters.map((filter) {
        final isSelected = _selectedStatus == filter;
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: SizedBox(
            height: 32,
            child: Button(
              fontSize: 14,
              label: filter,
              variant: isSelected
                  ? ButtonVariant.smallPrimary
                  : ButtonVariant.smallSecondary,
              onPressed: () => _onFilter(filter),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTableHeader() {
    final headerStyle = AppTheme.textTheme.bodyLarge;
    final headerStyle = AppTheme.textTheme.bodyLarge
        ?.copyWith(fontWeight: FontWeight.bold, color: AppTheme.black500);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12 ),
        child: Row(
          children: [
            Expanded(flex: 2, child: Text('Invoice ID', style: headerStyle)),
            Expanded(flex: 3, child: Text('Patient', style: headerStyle)),
            Expanded(flex: 3, child: Text('Procedure', style: headerStyle)),
            Expanded(flex: 2, child: Text('Amount', style: headerStyle)),
            Expanded(flex: 2, child: Text('Date', style: headerStyle)),
            Expanded(flex: 2, child: Text('Status', style: headerStyle)),
            SizedBox(width: 70, child: Text('Actions', style: headerStyle)),
          ],
        ),
      );
    }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: Text(
          _searchController.text.isNotEmpty
              ? "Sorry, We couldn't find anything that matches '${_searchController.text}'"
              : 'No records found',
          style: AppTheme.textTheme.bodyMedium?.copyWith(color: AppTheme.gray400),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: Text(
          _searchController.text.isNotEmpty
              ? "Sorry, We couldn't find anything that matches '${_searchController.text}'"
              : 'No records found',
          style: AppTheme.textTheme.bodyMedium?.copyWith(color: AppTheme.gray400),
        ),
      ),
    );
  }

  Widget _buildTableRow(JoinedInvoice invoiceInfo) {
    final inv = invoiceInfo.invoice;
    final isPaid = inv.status.toLowerCase() == 'paid';

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppTheme.white500,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppTheme.floatShadow,
      ),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text('INV-${inv.invoiceId.toString().padLeft(3, '0')}', style: AppTheme.textTheme.bodyMedium)),
          Expanded(flex: 3, child: Text(invoiceInfo.patientName, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTheme.textTheme.bodyMedium)),
          Expanded(flex: 3, child: Text(invoiceInfo.procedureNames, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTheme.textTheme.bodyMedium)),
          Expanded(flex: 2, child: Text('₱ ${inv.totalBalance.toStringAsFixed(2)}', style: AppTheme.textTheme.bodyMedium)),
          Expanded(flex: 3, child: Text(invoiceInfo.patientName, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTheme.textTheme.bodyMedium)),
          Expanded(flex: 3, child: Text(invoiceInfo.procedureNames, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTheme.textTheme.bodyMedium)),
          Expanded(flex: 2, child: Text('₱ ${inv.totalBalance.toStringAsFixed(2)}', style: AppTheme.textTheme.bodyMedium)),
          Expanded(flex: 2, child: Text(inv.issuedDate.toString().substring(0, 10), style: AppTheme.textTheme.bodyMedium)),
          Expanded(
            flex: 2,
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: isPaid ? Colors.green.shade50 : Colors.orange.shade50, borderRadius: BorderRadius.circular(20)),
                child: Text(inv.status, style: TextStyle(color: isPaid ? Colors.green.shade700 : Colors.orange.shade700, fontWeight: FontWeight.bold, fontSize: 12)),
              ),
            ),
          ),
          SizedBox(
            width: 70,
            child: PopupMenuButton<String>(
              icon: const Icon(Icons.more_horiz, color: AppTheme.gray400),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              onSelected: (String action) {
                if (action == 'edit_invoice') {
                  _triggerEditInvoice(invoiceInfo);
                } else {
                  setState(() {
                    _selectInvoiceToView = invoiceInfo;
                    if (action == 'process_payment') {
                      _paymentSessionId++; 
                      _currentIndex = 3;
                    } else if (action == 'view_bill') {
                      _viewSessionId++; 
                      _currentIndex = 2;
                    }
                  });
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'edit_invoice',
                  enabled: !isPaid,
                  child: Row(
                    children: [
                      Icon(Icons.edit_outlined, color:isPaid ? Colors.grey.shade400  : Colors.grey.shade700, size: 22),
                      const SizedBox(width: 12),
                      Text('Edit Invoice', style: AppTheme.textTheme.bodyMedium?.copyWith(color: isPaid ? Colors.grey.shade400 : Colors.black87)),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'process_payment', 
                  enabled: !isPaid,
                  child: Row(
                    children: [
                      Icon(Icons.payments_outlined, color: isPaid ? Colors.grey.shade400 : Colors.grey.shade700, size: 22),
                      const SizedBox(width: 12),
                      Text('Process Payment', style: AppTheme.textTheme.bodyMedium?.copyWith(color: isPaid ? Colors.grey.shade400 : Colors.black87)),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'view_bill', 
                  child: Row(
                    children: [
                      Icon(Icons.description_outlined, color: Colors.grey.shade700, size: 22),
                      const SizedBox(width: 12),
                      const Text('View Bill', style: TextStyle(color: Colors.black87)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}