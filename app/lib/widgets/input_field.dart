import 'package:flutter/material.dart';
import '../../style/theme.dart';

// Define Input Field Variants
enum InputVariant {
  primary,
  dropdown,
}

class InputField extends StatelessWidget {
  final InputVariant variant;
  final String label;
  final String? hintText;

  // Props for standard text input
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;

  // Props for dropdown input
  final List<String>? dropdownItems;
  final String? dropdownValue;
  final Function(String?)? onDropdownChanged;

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
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Styling for the input fields
    final inputStyle = InputDecoration(
        hintText: hintText,
        hintStyle: theme.textTheme.bodySmall,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
      case InputVariant.primary:
        inputContent = TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          style: theme.textTheme.bodySmall?.copyWith(color: AppTheme.gray400),
          decoration: inputStyle,
        );
        break;

      case InputVariant.dropdown:
        inputContent = DropdownButtonFormField<String>(
          value: dropdownValue,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: AppTheme.gray500,
          ),
          decoration: inputStyle,
          items: dropdownItems?.map((String item) {
                return DropdownMenuItem(value: item, child: Text(item));
              }).toList() ??
              [],
          onChanged: onDropdownChanged,
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
              .bodyLarge
              ?.copyWith(color: AppTheme.gray500),
        ),
        SizedBox(height: 8),
        inputContent,
      ],
    );
  }
}
