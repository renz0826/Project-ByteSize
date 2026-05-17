import 'package:dentcity_management_system/pages/invoice/view_invoice.dart';
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

import '../../providers/app_providers.dart';
import '../../providers/auth_provider.dart';
import '../../repositories/invoice_repository.dart';
import '../../db/database.dart';
import '../../widgets/warning_dialog.dart';

import 'invoice_entry.dart';
import 'process_payment.dart';
import '/../widgets/app_info_bar.dart';

class InvoiceDashboard extends ConsumerStatefulWidget {
  const InvoiceDashboard({super.key});

  @override
  ConsumerState<InvoiceDashboard> createState() => _InvoiceDashboardState();
}

class _InvoiceDashboardState extends ConsumerState<InvoiceDashboard> {
  late InvoiceRepository _repository;

  List<JoinedInvoice> _allInvoices = [];
  List<JoinedInvoice> _filteredRecords = [];
  Map<int, PatientData> _patientMap = {};

  int _currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  int _currentPage = 1;
  final int _recordsPerPage = 8;
  String _selectedStatus = 'All';
  
  int _formSessionId = 0;
  int _paymentSessionId = 0; 
  int _viewSessionId = 0; 
  
  JoinedInvoice? _selectInvoiceToView;

  @override
  void initState() {
    super.initState();
    final db = ref.read(databaseProvider);
    _repository = InvoiceRepository(db);
    _loadInvoices();
  }

  bool _isDiscountApplicable(PatientData? p) {
    if (p == null) return false;
    if (p.isSeniorOrPWD) return true; 
    final today = DateTime.now();
    int age = today.year - p.birthDate.year;
    if (today.month < p.birthDate.month || (today.month == p.birthDate.month && today.day < p.birthDate.day)) age--;
    return age >= 60;
  }

  Future<void> _loadInvoices() async {
    try {
      final db = ref.read(databaseProvider);
      final patients = await db.select(db.patient).get();
      _patientMap = {for (var p in patients) p.patientId: p};

      final invoices = await _repository.getAllInvoices();
      
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
          
          if (_selectInvoiceToView != null) {
            try {
              _selectInvoiceToView = invoices.firstWhere(
                (inv) => inv.invoice.invoiceId == _selectInvoiceToView!.invoice.invoiceId
              );
            } catch (e) {} 
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

  void _goToAddInvoice() {
    setState(() {
      _selectInvoiceToView = null; 
      _formSessionId++;
      _currentIndex = 1;
    });
  }

  Future<void> _confirmReturnToDashboard() async {
    final bool? shouldDiscard = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return const WarningDialog(
          isCaution: false,
          title: "Discard Unsaved Changes?",
          content: "Are you sure you want to return to the records dashboard? Any unsaved data will be lost.",
          secondaryAction: "Keep Editing",
          primaryAction: "Discard",
        );
      },
    );

    if (shouldDiscard == true && mounted) {
      setState(() => _currentIndex = 0);
    }
  }
  Future<bool> _verifyPin() async {
    final TextEditingController pinController = TextEditingController();
    final theme = Theme.of(context);

    return await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              backgroundColor: AppTheme.white500,
              actionsPadding: const EdgeInsets.only(bottom: 40),
              actionsAlignment: MainAxisAlignment.center,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'Admin Authentication',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.black500,
                  ),
                ),
              ),
              content: SizedBox(
                width: 440,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Enter your 4-digit PIN to edit this invoice.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: 340,
                      child: TextField(
                        controller: pinController,
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 4,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                        ],
                        style: theme.textTheme.titleLarge?.copyWith(
                          letterSpacing: 8,
                        ),
                        decoration: InputDecoration(
                          counterText: "", 
                          contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: AppTheme.gray400, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: AppTheme.blue500, width: 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 140,
                      child: Button(
                        label: 'Cancel',
                        variant: ButtonVariant.secondary,
                        onPressed: () {
                          pinController.dispose();
                          Navigator.of(dialogContext).pop(false);
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    SizedBox(
                      width: 140,
                      child: Button(
                        label: 'Verify',
                        variant: ButtonVariant.primary,
                        onPressed: () {
                          final enteredPin = pinController.text.trim();

                          if (enteredPin.length != 4) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('PIN must be exactly 4 digits.'))
                            );
                            return;
                          }

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
                      ),
                    ),
                  ],
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
        // Index 0: Main invoice Table Overview Dashboard
        Scaffold(
          backgroundColor: AppTheme.gray200,
          body: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: PageHeader(
                  title: 'Invoice',
                  type: PageHeaderType.plain,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      _buildSearchBar(),
                      const SizedBox(height: 8),
                      _buildTableHeader(),
                    ],
                  ),
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
        
        // Index 1: New Invoice Form Generation Screen View
        SingleChildScrollView(
          child: Column(
            children: [
              PageHeader(
                title: 'Back to Invoices', 
                type: PageHeaderType.withBack, 
                onBack: _confirmReturnToDashboard,
              ),
              Transform.translate(
                offset: const Offset(0, -30),
                child: InvoiceForm(
                  key: ValueKey(_formSessionId),
                  invoiceToEdit: _currentIndex == 1 && _selectInvoiceToView != null ? _selectInvoiceToView : null,
                  onPrevious: _confirmReturnToDashboard,
                  onFinish: () {
                    _loadInvoices();
                    setState(() => _currentIndex = 0);
                  },
                ),
              ),
            ],
          ),
        ),
        
        // Index 2: Itemized Statement Details View Screen (Header isolated internally)
        SingleChildScrollView(
          child: _selectInvoiceToView == null
              ? const SizedBox.shrink()
              : ViewInvoiceScreen(
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
        
        // Index 3: Ledger Processing Settlement Screen View (Header isolated internally)
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
                  label: 'Add New Invoice',
                  variant: ButtonVariant.primary,
                  heroIcon: HeroIcons.documentPlus,
                  onPressed: _goToAddInvoice,
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
      mainAxisAlignment: MainAxisAlignment.start,
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

  final Map<String, int> _columnFlex = {
    'id': 2,
    'patient': 3,
    'procedure': 4,
    'amount': 2,
    'date': 2,
    'status': 2,
    'actions': 1,
  };

  Widget _buildTableHeader() {
    final headerStyle = AppTheme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold);
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), 
      child: Row(
        children: [
          Expanded(flex: _columnFlex['id']!, child: Text('Invoice ID', style: headerStyle)),
          Expanded(flex: _columnFlex['patient']!, child: Text('Patient', style: headerStyle)),
          Expanded(flex: _columnFlex['procedure']!, child: Text('Procedure', style: headerStyle)),
          Expanded(flex: _columnFlex['amount']!, child: Text('Amount', style: headerStyle)),
          Expanded(flex: _columnFlex['date']!, child: Text('Date', style: headerStyle)),
          Expanded(flex: _columnFlex['status']!, child: Text('Status', style: headerStyle)),
          Expanded(flex: _columnFlex['actions']!, child: Center(child: Text('Actions', style: headerStyle))),
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

  Widget _buildTableRow(JoinedInvoice invoiceInfo) {
    final inv = invoiceInfo.invoice;
    final isFullyPaid = inv.status.toLowerCase() == 'paid';
    final badgeStatus = isFullyPaid ? BadgeStatus.paid : BadgeStatus.pending;
    final displayAmount = inv.totalBalance;

    return InvoiceBar(
      invoiceId: 'INV-${inv.invoiceId.toString().padLeft(3, '0')}',
      fullName: invoiceInfo.patientName,
      procedure: invoiceInfo.procedureNames,
      amount: displayAmount,
      isPaid: isFullyPaid, 
      date: inv.issuedDate, 
      status: badgeStatus,
      onTap: () {
        setState(() {
          _selectInvoiceToView = invoiceInfo;
          _viewSessionId++;
          _currentIndex = 2; 
        });
      },
      onMenuSelected: (action) {
        if (action == 'edit_invoice') {
          _triggerEditInvoice(invoiceInfo);
        } else {
          setState(() {
            _selectInvoiceToView = invoiceInfo;
            if (action == 'process_payment') {
              _paymentSessionId++;
              _currentIndex = 3;
            } else if (action == 'view_Invoice') {
              _viewSessionId++;
              _currentIndex = 2;
            }
          });
        }
      },
    );
  }
}