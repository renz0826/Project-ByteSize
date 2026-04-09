import 'package:flutter/material.dart';
import '../style/theme.dart';
import 'package:heroicons/heroicons.dart';

// sidebar item class
class _SidebarItem extends StatelessWidget {
  final HeroIcons icon;
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  // sidebar item constructor
  const _SidebarItem({
    required this.icon,
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  // sidebar item design
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isActive ? AppTheme.green200 : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            HeroIcon(
              icon,
              style: isActive ? HeroIconStyle.solid : HeroIconStyle.outline,
              color: isActive ? AppTheme.green700 : AppTheme.gray500,
              size: 24,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: isActive ? AppTheme.green700 : AppTheme.gray500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

// sidebar class
class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

// sidebar state class
class _SidebarState extends State<Sidebar> {
  // tracks the current selected page
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    // white bg container of sidebar
    return Container(
      width: 342,
      padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 32),
      decoration: BoxDecoration(
        color: AppTheme.white500,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: AppTheme.shadow300,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // add logo here (I added a temporary green circle so you can see it)
              Container(
                width: 44,
                height: 44,
                decoration: const BoxDecoration(
                  color: AppTheme.green500,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'DENTCITY',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppTheme.green500,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),

          // dashboard navbar item
          const SizedBox(height: 48),
          _SidebarItem(
            icon: HeroIcons.home,
            title: 'Dashboard',
            isActive: _selectedPage == 0,
            onTap: () => setState(() => _selectedPage = 0),
          ),

          // records navbar item
          const SizedBox(height: 18),
          _SidebarItem(
            icon: HeroIcons.userGroup,
            title: 'Records',
            isActive: _selectedPage == 1,
            onTap: () => setState(() => _selectedPage = 1),
          ),

          // billings navbar item
          const SizedBox(height: 18),
          _SidebarItem(
            icon: HeroIcons.documentCurrencyDollar,
            title: 'Billings',
            isActive: _selectedPage == 2,
            onTap: () => setState(() => _selectedPage = 2),
          ),

          // scheduling navbar item
          const SizedBox(height: 18),
          _SidebarItem(
            icon: HeroIcons.calendar,
            title: 'Scheduling',
            isActive: _selectedPage == 3,
            onTap: () => setState(() => _selectedPage = 3),
          ),

          const Spacer(),
          _SidebarItem(
              icon: HeroIcons.arrowRightStartOnRectangle,
              title: 'Logout',
              isActive: false,
              onTap: () {
                print('User has logged out.');
              })
        ],
      ),
    );
  }
