import 'package:flutter/material.dart';
import '../../style/theme.dart';
import 'package:dropdown_search/dropdown_search.dart';

// Define Input Field Variants
enum InputVariant { primary, dropdown, counter }

class InputField extends StatelessWidget {
  final InputVariant variant;
  final String label;
  final String? hintText;
  final int maxLines;

  // Props for standard text input
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;

  // Props for dropdown input
  final List<String>? dropdownItems;
  final String? dropdownValue;
  final Function(String?)? onDropdownChanged;

  final TextEditingController? searchController;

  // Props specifically for the Counter input
  final int counterValue;
  final Function(int)? onCounterChanged;
  final int counterMin;
  final int counterMax;

  const InputField({
    super.key,
    required this.label,
    this.variant = InputVariant.primary,
    this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.dropdownItems,
    this.dropdownValue,
    this.onDropdownChanged,
    this.searchController,
    this.maxLines = 1,
    this.counterValue = 0,
    this.onCounterChanged,
    this.counterMin = 0,
    this.counterMax = 32,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Styling for the input fields
    final inputStyle = InputDecoration(
        hintText: hintText,
        hintStyle: theme.textTheme.bodySmall,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppTheme.gray400, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppTheme.blue500, width: 1),
        ));

    // Build specific input based on variant
    Widget inputContent;

    switch (variant) {
      // Sample Use Case
      // InputField(
      //           label: "First Name",
      //           hintText: "Enter patient's first name",
      //           controller: null, // connect to fetch logic
      //           maxLines: 7, // Use only for notes
      //         ),
      case InputVariant.primary:
        inputContent = TextFormField(
            maxLines: maxLines,
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            style:
                theme.textTheme.bodySmall?.copyWith(color: AppTheme.black500),
            decoration: inputStyle);
        break;

      // Sample Use Case
      // InputField(
      //           label: "Procedure Type",
      //           variant: InputVariant.dropdown, // Switches to the dropdown mode
      //           dropdownValue:
      //               _selectedProcedure, // The currently selected item
      //           dropdownItems: const [
      //             "Teeth Removal",
      //             "Cleaning",
      //             "Consultation",
      //             "Consultation",
      //             "Consultation",
      //           ],
      // controller: null // input fetching
      // ),
      case InputVariant.dropdown:
        inputContent = DropdownSearch<String>(
          items: (filter, loadProps) => dropdownItems ?? [],
          selectedItem: dropdownValue,
          decoratorProps: DropDownDecoratorProps(
            decoration: inputStyle.copyWith(
                hintText: hintText ?? "Select an option...",
                hintStyle: theme.textTheme.bodySmall),
          ),
          dropdownBuilder: (context, selectedItem) {
            return Text(selectedItem ?? "",
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: AppTheme.black500));
          },
          popupProps: PopupProps.menu(
            fit: FlexFit.loose,
            constraints: const BoxConstraints(maxHeight: 208),
            showSearchBox: true,
            searchFieldProps: TextFieldProps(
              style:
                  theme.textTheme.bodySmall?.copyWith(color: AppTheme.black500),
              decoration: InputDecoration(
                hintStyle: theme.textTheme.bodySmall,
                hintText: "Search...",
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),
            itemBuilder: (context, item, isDisabled, isSelected) {
              return Container(
                height: 36,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.centerLeft,
                child: Text(
                  item,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppTheme.black500,
                  ),
                ),
              );
            },
            emptyBuilder: (context, searchEntry) {
              return Container(
                height: 48,
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                alignment: Alignment.centerLeft,
                child: Text(
                  "No results found.",
                  style: theme.textTheme.bodySmall,
                ),
              );
            },
          ),
        );
        break;

      case InputVariant.counter:
        inputContent = Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.gray400, width: 1),
          ),
          // Slightly reduced vertical padding because IconButtons have their own built-in padding
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                color: counterValue > counterMin
                    ? AppTheme.black500
                    : AppTheme.gray400,
                onPressed: () {
                  // Only triggers if we are above the minimum
                  if (counterValue > counterMin && onCounterChanged != null) {
                    onCounterChanged!(counterValue - 1);
                  }
                },
              ),
              Text(
                counterValue.toString(),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppTheme.black500,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                color: counterValue < counterMax
                    ? AppTheme.blue500
                    : AppTheme.gray400,
                onPressed: () {
                  // Only triggers if we are below the maximum
                  if (counterValue < counterMax && onCounterChanged != null) {
                    onCounterChanged!(counterValue + 1);
                  }
                },
              ),
            ],
          ),
        );
        break;
    }

    // Main input with label
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: AppTheme.gray500),
        ),
        SizedBox(height: 8),
        inputContent,
      ],
    );
  }
}
