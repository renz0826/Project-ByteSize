import 'package:dentcity_management_system/widgets/page_header.dart';
import 'patient_records/patient_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import '../style/theme.dart';
import '../pages/login_page.dart';
import 'billing/billing_dashboard.dart';
import 'main_dashboard.dart';
import 'schedule/schedule_dashboard.dart';
import '../widgets/horizontal_logo.dart';
import '../pages/profile/profile_page.dart';
import '../services/offline_backup_service.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _SidebarState();
}

class _SidebarState extends State<MainLayout> {
  late SidebarXController _controller;
  bool _isBackingUp = false;

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
            extendedTheme: SidebarXTheme(
              margin: EdgeInsets.only(right: 32),
              width: 342,
              padding: EdgeInsets.symmetric(horizontal: 42, vertical: 32),
              decoration: BoxDecoration(
                color: AppTheme.white500,
                boxShadow: AppTheme.floatShadow,
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
              final isSettingsSelected = _controller.selectedIndex == 4;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () => _controller.selectIndex(4),
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: isSettingsSelected
                      ? BoxDecoration(color: AppTheme.blue200, borderRadius: BorderRadius.circular(16))
                        : null,
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings_outlined, 
                            size: 24, 
                            color: isSettingsSelected ? AppTheme.blue500 : AppTheme.gray500,
                          ),
                          const SizedBox(width: 18),
                          if (extended)
                          Text(
                            'Settings',
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: isSettingsSelected ? AppTheme.blue500 : AppTheme.gray500
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                 InkWell(
                        onTap: _isBackingUp ? null : () async {
                          setState(() {
                            _isBackingUp = true;
                          });


                          // Run the copy function
                          await OfflineBackupService.executeDualBackup();

                          setState(() {
                            _isBackingUp = false;
                          });

                            // TODO: @Frontend, refactor this to a popup (And change this to created maybe)
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Secured database backup to local and external storage'),
                              backgroundColor: AppTheme.blue500,
                              duration: Duration(seconds: 2),
                            ),
                          );

                          if (context.mounted) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          }
                        },
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          const Icon(Icons.logout, size: 24, color: AppTheme.gray500),
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
                    )
                  ),
                ],
              );
            },
          ),
          Expanded(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                //logic for selecting the page
                final pages = [
                  (title: 'Dashboard', screen: DashboardPage()),
                  (title: 'Patient Records', screen: PatientDashboard()),
                  (title: 'Billings', screen: BillingDashboard()),
                  (title: 'Scheduling', screen: ScheduleDashboard()),
                  (title: 'Settings', screen: ProfilePage())
                ];

                final index = _controller.selectedIndex;
                // Handle out-of-range index (e.g., when no item is selected)
                if (index >= pages.length) {
                  return const Center(child: Text('Not Found'));
                }

                return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Completely disable global headers for index 0 (Dashboard), 2 (Billings), and 3 (Scheduling)
                  // only show the header if it's not the patient records
                  if (_controller.selectedIndex != 0 &&
                      _controller.selectedIndex != 1 && 
                      _controller.selectedIndex != 2 &&
                      _controller.selectedIndex != 3)
                    PageHeader(
                      title: pages[index].title,
                      type: PageHeaderType.plain,
                    ),
                  
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
