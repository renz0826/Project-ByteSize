import 'package:flutter/material.dart';
import '../style/theme.dart';

class AppPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChanged;

  const AppPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  // build list of page items to display
  // returns either a page number or -1 to represent ellipsis
  List<int> _buildPageItems() {
    // if 10 or fewer pages, show all
    if (totalPages <= 10) {
      return List.generate(totalPages, (i) => i + 1);
    }

    final items = <int>{};

    // Always show first 3 and last 3 items
    items.addAll([1, 2, 3]);
    items.addAll([totalPages - 2, totalPages - 1, totalPages]);

    // Show neighbours around current page
    for (int i = currentPage - 1; i <= currentPage + 1; i++) {
      if (i >= 1 && i <= totalPages) items.add(i);
    }

    final sorted = items.toList()..sort();

    // Insert -1 as ellipsis marker where there are gaps
    final result = <int>[];
    for (int i = 0; i < sorted.length; i++) {
      if (i > 0 && sorted[i] - sorted[i - 1] > 1) {
        result.add(-1); // ellipsis
      }
      result.add(sorted[i]);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final pageItems = _buildPageItems();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Previous arrow
        _PageArrow(
          icon: Icons.chevron_left,
          enabled: currentPage > 1,
          onTap: () => onPageChanged(currentPage - 1),
        ),
        const SizedBox(width: 4),

        // Page number buttons + ellipses
        ...pageItems.map((page) {
          // Ellipsis
          if (page == -1) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 3),
              child: SizedBox(
                width: 36,
                height: 36,
                child: Center(
                  child: Text(
                    '...',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.gray400,
                    ),
                  ),
                ),
              ),
            );
          }

          // Page Button
          final isSelected = page == currentPage;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: GestureDetector(
              onTap: () => onPageChanged(page),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? AppTheme.white500 : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: isSelected
                      ? Border.all(color: AppTheme.blue500, width: 1.5)
                      : null,
                ),
                child: Text(
                  '$page',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected ? AppTheme.blue500 : AppTheme.gray500,
                  ),
                ),
              ),
            ),
          );
        }),

        const SizedBox(width: 4),

        // Next Arrow
        _PageArrow(
          icon: Icons.chevron_right,
          enabled: currentPage < totalPages,
          onTap: () => onPageChanged(currentPage + 1),
        ),
      ],
    );
  }
}

// Arrow button

class _PageArrow extends StatelessWidget {
  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;

  const _PageArrow({
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Icon(
        icon,
        size: 22,
        color: enabled ? AppTheme.black500 : AppTheme.gray400,
      ),
    );
  }
}