import 'package:dentcity_management_system/pages/patients-record_page.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import '../style/theme.dart';
import '../pages/login_page.dart';
import 'billing/billing_dashboard.dart';
import 'main_dashboard.dart';
import 'schedule/schedule_dashboard.dart';
import 'patient_records/patient_dashboard.dart';
import '../widgets/horizontal_logo.dart';
import '../widgets/page_header.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _SidebarState();
}

class _SidebarState extends State<MainLayout> {
  late SidebarXController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize controller state
    _controller = SidebarXController(selectedIndex: 0, extended: true);
  }

  @override
  void dispose() {
    // Dispose widget to prevent memory leaks
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SidebarX(
            controller: _controller,
            showToggleButton: false,
            theme: SidebarXTheme(
              decoration: BoxDecoration(
                color: AppTheme.white500,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    bottomRight: Radius.circular(24)),
              ),
              itemPadding: EdgeInsets.all(16),
              selectedItemPadding: EdgeInsets.all(16),
              selectedItemDecoration: BoxDecoration(
                  color: AppTheme.blue200,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              textStyle: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: AppTheme.gray500),
              selectedTextStyle: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: AppTheme.blue500),
              hoverTextStyle: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: AppTheme.gray500),
              itemTextPadding: const EdgeInsets.only(left: 18),
              selectedItemTextPadding: const EdgeInsets.only(left: 18),
              iconTheme: const IconThemeData(color: AppTheme.gray500, size: 24),
              hoverIconTheme: const IconThemeData(color: AppTheme.gray500),
              selectedIconTheme:
                  const IconThemeData(color: AppTheme.blue500, size: 24),
            ),
            extendedTheme: const SidebarXTheme(
              width: 342,
              padding: EdgeInsets.symmetric(horizontal: 42, vertical: 32),
              decoration: BoxDecoration(
                color: AppTheme.white500,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    bottomRight: Radius.circular(24)),
              ),
            ),
            headerBuilder: (context, extended) {
              return Column(
                children: [
                  Row(
                    children: [
                      HorizontalLogo(
                        logoHeight: 40,
                        textStyle: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: AppTheme.blue500),
                      ),
                    ],
                  ),
                  SizedBox(height: 28),
                ],
              );
            },
            items: const [
              SidebarXItem(icon: Icons.home_rounded, label: 'Dashboard'),
              SidebarXItem(icon: Icons.group_rounded, label: 'Records'),
              SidebarXItem(icon: Icons.receipt_rounded, label: 'Billings'),
              SidebarXItem(
                  icon: Icons.calendar_month_rounded, label: 'Scheduling'),
            ],
            footerBuilder: (context, extended) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Row(
                    children: [
                      const Icon(Icons.logout, color: AppTheme.gray500),
                      const SizedBox(width: 18),
                      Text(
                        'Logout',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: AppTheme.gray500),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                //logic for selecting the page
                final pages = [
                  (title: 'Dashboard',       screen: DashboardPage()),
                  (title: 'Patient Records', screen: PatientRecordsScreen()),
                  (title: 'Billings',        screen: BillingDashboard()),
                  (title: 'Scheduling',      screen: ScheduleDashboard()),
                ];

                final index = _controller.selectedIndex;
                // Handle out-of-range index (e.g., when no item is selected)
                if (index >= pages.length) return const Center(child: Text('Not Found'));

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PageHeader(title: pages[index].title,
                    type: PageHeaderType.plain,),
                    
                    Expanded(child: pages[index].screen),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
