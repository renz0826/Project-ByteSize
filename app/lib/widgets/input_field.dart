import 'package:flutter/material.dart';
import '../../style/theme.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

// Define Input Field Variants
enum InputVariant {
  primary,
  dropdown,
  counter,
}

class InputField extends StatelessWidget {
  final InputVariant variant;
  final String label;
  final String? hintText;
  final int maxLines;
  final bool isRequired;
  final bool isHidden;

  // Props for standard text input
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;

  // Props for dropdown input
  final List<String>? dropdownItems;
  final String? dropdownValue;
  final Function(String?)? onDropdownChanged;
  final TextEditingController? searchController;

  // Props for dropdown input
  final int counterValue;
  final Function(int)? onCounterChanged;
  final int counterMin;
  final int counterMax;

  const InputField(
      {super.key,
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
      this.counterMin = 0, // Prevents negative numbers by default
      this.counterMax = 100,
      this.isHidden = false,
      this.isRequired = false});

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
      // SAMPLE USE CASE:
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

      // SAMPLE USE CASE:
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
          enabled: !isHidden,
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

      // SAMPLE USE CASE:
      // RadioGroupField(
      //   label: "Presence of Dentofacial Anomaly",
      //   options: const ["Present", "None"],
      //   selectedValue: _defaultSelection,
      //   onChanged: (String value) {
      //     setState(() {
      //       _defaultSelection = value;
      //     });
      //   },
      // ),
      case InputVariant.counter:
        inputContent = SpinBox(
            enabled: !isHidden,
            min: counterMin.toDouble(),
            max: counterMax.toDouble(),
            value: counterValue.toDouble(),
            // Automatically handles typing and button clicks
            onChanged: (value) {
              if (onCounterChanged != null) onCounterChanged!(value.toInt());
            },
            decoration: inputStyle);
        break;
    }

    // Main input with label
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!isRequired) ...[
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: AppTheme.gray500),
          ),
        ] else
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppTheme.gray500),
              ),
              Text(
                "  *",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppTheme.red600),
              ),
            ],
          ),
        SizedBox(height: 8),
        inputContent,
      ],
    );
  }
}
