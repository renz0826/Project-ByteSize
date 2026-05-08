import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/../style/theme.dart';
import '/../widgets/search_bar.dart';
import '/../widgets/app_pagination.dart';
import '/../widgets/main_buttons.dart';
import '/../widgets/page_header.dart';
import 'package:heroicons/heroicons.dart';
import '../../db/database.dart';
import '../../db/database_provider.dart';
import '../../repositories/invoice_repository.dart';
import 'newBill_form.dart';

class BillingDashboard extends ConsumerStatefulWidget {
  const BillingDashboard({super.key});

  @override
  ConsumerState<BillingDashboard> createState() => _BillingDashboardState();
}

class _BillingDashboardState extends ConsumerState<BillingDashboard> {
  late InvoiceRepository _repository;
  
  // Real Database Lists
  List<JoinedInvoice> _allInvoices = [];
  List<JoinedInvoice> _filteredRecords = [];

  // State Management
  int _currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  int _currentPage = 1;
  final int _recordsPerPage = 8;
  String _selectedStatus = 'All'; 
  int _formSessionId = 0; 

  @override
  void initState() {
    super.initState();
    final db = ref.read(dbProvider);
    _repository = InvoiceRepository(db);
    _loadInvoices();
  }

  // Fetch real data from the database
  Future<void> _loadInvoices() async {
    final invoices = await _repository.getAllInvoices();
    // Sort newest first
    invoices.sort((a, b) => b.invoice.issuedDate.compareTo(a.invoice.issuedDate));
    
    setState(() {
      _allInvoices = invoices;
      _filteredRecords = invoices;
      _applyFilters();
    });
  }

  // Filter and Search Logic
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

  // Navigation Logic
  void _goToAddBill() {
    setState(() {
      _formSessionId++; // Reset form state
      _currentIndex = 1;
    });
  }

  Future<void> _confirmReturnToDashboard() async {
    final bool? shouldDiscard = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Discard Changes?'),
          content: const Text('Are you sure you want to return to the dashboard? Any unsaved data will be lost.'),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancel')),
            TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Discard', style: TextStyle(color: Colors.red))),
          ],
        );
      },
    );

    if (shouldDiscard == true) {
      setState(() => _currentIndex = 0);
    }
  }

  // Pagination Logic
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
              SliverPadding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _buildSearchBar(),
                    const SizedBox(height: 8),
                    _buildTableHeader(),
                  ]),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(left: 24, right: 24),
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

        // INDEX 1: ADD NEW BILL FORM
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageHeader(
                title: 'Back to Billings & Invoices',
                type: PageHeaderType.withBack,
                onBack: _confirmReturnToDashboard,
              ),
              Transform.translate(
                offset: const Offset(0, -30),
                child: InvoiceForm(
                  key: ValueKey(_formSessionId),
                  onPrevious: _confirmReturnToDashboard,
                  onFinish: () {
                    _loadInvoices(); // INSTANT REFRESH FIX
                    setState(() => _currentIndex = 0);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Column(
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
                  elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(padding: EdgeInsets.zero)),
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
              variant: isSelected ? ButtonVariant.smallPrimary : ButtonVariant.smallSecondary,
              onPressed: () => _onFilter(filter),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTableHeader() {
    // If you implemented the global text size reduction, keep this as is.
    // If you used the local reduction, add .copyWith(fontSize: 12) here!
    final headerStyle = AppTheme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: AppTheme.gray400);
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 20),
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
          Expanded(
            flex: 3, 
            child: Text(
              invoiceInfo.patientName, 
              maxLines: 1, 
              overflow: TextOverflow.ellipsis, 
              style: AppTheme.textTheme.bodyMedium
            )
          ),
          Expanded(
            flex: 3, 
            child: Text(
              invoiceInfo.procedureNames, 
              maxLines: 1, 
              overflow: TextOverflow.ellipsis, 
              style: AppTheme.textTheme.bodyMedium
            )
          ),
          Expanded(flex: 2, child: Text('₱ ${invoiceInfo.grandTotal.toStringAsFixed(2)}', style: AppTheme.textTheme.bodyMedium)),
          Expanded(flex: 2, child: Text(inv.issuedDate.toString().substring(0, 10), style: AppTheme.textTheme.bodyMedium)),
          Expanded(
            flex: 2, 
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isPaid ? Colors.green.shade50 : Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  inv.status,
                  style: TextStyle(color: isPaid ? Colors.green.shade700 : Colors.orange.shade700, fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            )
          ),
          
          // --- THE NEW ACTION MENU ---
          SizedBox(
            width: 70, 
            child: PopupMenuButton<String>(
              icon: const Icon(Icons.more_horiz, color: AppTheme.gray400),
              color: Colors.white,
              elevation: 6, // Gives it that soft drop shadow
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16), // Rounded corners like the mockup
              ),
              offset: const Offset(0, 45), // Pushes the menu right below the three dots
              onSelected: (String action) {
                if (action == 'process_payment') {
                  // TODO: Logic for Process Payment
                  print("Processing payment for Invoice ID: ${inv.invoiceId}");
                } else if (action == 'view_bill') {
                  // TODO: Logic for View Bill
                  print("Viewing bill for Invoice ID: ${inv.invoiceId}");
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'process_payment',
                  child: Row(
                    children: [
                      Icon(Icons.payments_outlined, color: Colors.grey.shade700, size: 22),
                      const SizedBox(width: 12),
                      Text('Process Payment', style: AppTheme.textTheme.bodyMedium?.copyWith(color: Colors.black87)),
                    ],
                  ),
                ),
                const PopupMenuDivider(height: 1), // Optional: Adds a subtle line between items
                PopupMenuItem<String>(
                  value: 'view_bill',
                  child: Row(
                    children: [
                      Icon(Icons.description_outlined, color: Colors.grey.shade700, size: 22),
                      const SizedBox(width: 12),
                      Text('View Bill', style: AppTheme.textTheme.bodyMedium?.copyWith(color: Colors.black87)),
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

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: Text(
          _searchController.text.isNotEmpty ? "Sorry, We couldn't find anything that matches '${_searchController.text}'" : 'No records found',
          style: AppTheme.textTheme.bodyMedium?.copyWith(color: AppTheme.gray400),
        ),
      ),
    );
  }
}