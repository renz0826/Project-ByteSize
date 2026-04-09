import 'package:flutter/material.dart';
import '../style/theme.dart';
import 'package:heroicons/heroicons.dart';

// sidebar item class
class _SidebarItem extends StatelessWidget {
  final HeroIcon icon;
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
