import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import '../style/theme.dart';

class AppSortDropdown extends StatefulWidget {
  final Function(String) onSortChanged;

  const AppSortDropdown({super.key, required this.onSortChanged});

  @override
  State<AppSortDropdown> createState() => _AppSortDropdownState();
}

  class _AppSortDropdownState extends State<AppSortDropdown> {
  bool isExpanded = false; 
  String selectedSort = "Name (A-Z)";

  final List<String> sortOptions = [
    "Name (A-Z)",
    "Name (Z-A)",
    "Oldest First",
    "Youngest First",
    "Male",
    "Female"
  ];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: AppTheme.white500,
      constraints: const BoxConstraints(minWidth: 150, maxWidth: 150),
      offset: const Offset(0, 10),
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppTheme.gray400),
      ),
      //dropdown open/close state
      onOpened: () => setState(() => isExpanded = true),
      onCanceled: () => setState(() => isExpanded = false),
      //dropdown item selection
      onSelected: (value) {
        setState(() => isExpanded = false);
        widget.onSortChanged(value);
      },
      //dropdown button
      child: Container(
        width: 150,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: AppTheme.white500,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppTheme.gray400),
        ),
        child: Row(
          children: [
            const HeroIcon(HeroIcons.funnel, size: 20, color: AppTheme.gray500),
            const SizedBox(width: 12),
            Text(
              'Sort by',
              style: AppTheme.textTheme.bodySmall?.copyWith(
                color: AppTheme.gray500,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),

            HeroIcon(
              isExpanded ? HeroIcons.chevronUp : HeroIcons.chevronDown,
              size: 24,
              color: AppTheme.gray500,
            ),
          ],
        ),
      ),
      itemBuilder: (context) {
        final sortItems = ["Name (A-Z)", "Name (Z-A)", "Oldest First", "Youngest First"];
        final filterItems = ["Male", "Female"];
        //transform string lists into widgets
        return [
          ...sortItems.map(_buildSortItem),
          const PopupMenuDivider(),
          ...filterItems.map(_buildSortItem),
        ];
      },
    );
  }

  PopupMenuItem<String> _buildSortItem(String title) {
    return PopupMenuItem(
      value: title,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Text(title, style: AppTheme.textTheme.bodySmall),
    );
  }
}