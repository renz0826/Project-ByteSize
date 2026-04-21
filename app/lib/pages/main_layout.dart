import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import '../style/theme.dart';

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
                  color: AppTheme.green200,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              textStyle: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: AppTheme.gray500),
              selectedTextStyle: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: AppTheme.green700),
              hoverTextStyle: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: AppTheme.gray500),
              itemTextPadding: const EdgeInsets.only(left: 18),
              selectedItemTextPadding: const EdgeInsets.only(left: 18),
              iconTheme: const IconThemeData(color: AppTheme.gray500, size: 24),
              hoverIconTheme: const IconThemeData(color: AppTheme.gray500),
              selectedIconTheme:
                  const IconThemeData(color: AppTheme.green700, size: 24),
            ),
            extendedTheme: const SidebarXTheme(
              width: 342,
              padding: EdgeInsets.symmetric(horizontal: 43, vertical: 32),
              decoration: BoxDecoration(
                color: AppTheme.white500,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    bottomRight: Radius.circular(24)),
              ),
            ),
            items: const [
              SidebarXItem(icon: Icons.dashboard, label: 'Dashboard'),
              SidebarXItem(icon: Icons.person, label: 'Records'),
            ],
          ),
          Expanded(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                switch (_controller.selectedIndex) {
                  case 0:
                    return const Center(
                        child: Text('Dashboard Page',
                            style: TextStyle(fontSize: 24)));
                  case 1:
                    return const Center(
                        child: Text('Profile Page',
                            style: TextStyle(fontSize: 24)));
                  default:
                    return const Center(child: Text('Not Found'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
