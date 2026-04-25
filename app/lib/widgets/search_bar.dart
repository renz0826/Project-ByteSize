import 'package:flutter/material.dart';
import '../style/theme.dart';

// usage (with filter and custom search button action):
//   AppSearchBar(
//     controller: _searchController,
//     onChanged: _onSearch,
//     hintText: 'Search for a Schedule...',
//     onFilter: () {
//       // e.g. show a bottom sheet with filter options
//     },
//     onSearch: () {
//       // e.g. perform search immediately instead of waiting for text change
//     },
//   ),
// to use in parent screen
// 1. declare TextEditingController:
//        final TextEditingController _searchController = TextEditingController();
//
//   2. declare filter function:
//        void _onSearch(String query) {
//          setState(() {
//            _filteredList = _fullList
//                .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
//                .toList();
//          });
//        }
//
//   3. dispose the controller when the screen is destroyed:
//        @override
//        void dispose() {
//          _searchController.dispose();
//          super.dispose();
//        }

class AppSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback? onSearch;
  final VoidCallback? onFilter;
  final String hintText;

  const AppSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    this.onSearch,
    this.onFilter,
    this.hintText = 'Search...',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodySmall,
          filled: true,
          fillColor: AppTheme.white500,
          contentPadding: const EdgeInsets.only(left: 20, right: 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(26),
            borderSide: const BorderSide(color: AppTheme.gray400),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(26),
            borderSide: const BorderSide(color: AppTheme.gray400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(26),
            borderSide: const BorderSide(color: AppTheme.blue500, width: 1.5),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.filter_alt_outlined, color: AppTheme.gray500),
                  onPressed: onFilter,
                  tooltip: 'Filter',
                ),
                TextButton(
                  onPressed: onSearch ?? () => onChanged(controller.text),
                  style: TextButton.styleFrom(
                    backgroundColor: AppTheme.blue500,
                    fixedSize: const Size(112, 37),
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.search, color: AppTheme.white500, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Search',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppTheme.white500,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}