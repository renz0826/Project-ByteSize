import 'package:flutter/material.dart';
import 'package:easy_radio/easy_radio.dart'; // Import the library
import '../../style/theme.dart';

class RadioGroupField extends StatelessWidget {
  final String label;
  final List<String> options;
  final String? selectedValue;
  final Function(String) onChanged;
  final bool isRequired;

  const RadioGroupField(
      {super.key,
      required this.label,
      this.options = const ["Present", "None"],
      required this.selectedValue,
      required this.onChanged,
      this.isRequired = false});

// SAMPLE USE CASE:
//   RadioGroupField(
//   label: "Presence of Oral Debris",
//   options: const ["Present", "None"],
//   selectedValue: _oralDebris,
//   onChanged: (String value) {
//     setState(() {
//       _oralDebris = value;
//     });
//   },
// ),
  @override
  Widget build(BuildContext context) {
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
        const SizedBox(height: 18),
        Wrap(
          spacing: 24,
          runSpacing: 12,
          children: options.map((option) {
            return GestureDetector(
              onTap: () => onChanged(option),
              behavior: HitTestBehavior.opaque,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  EasyRadio<String>(
                    value: option,
                    groupValue: selectedValue,
                    onChanged: (String? value) {
                      if (value != null) {
                        onChanged(value);
                      }
                    },
                    inactiveBorderColor: AppTheme.gray400,
                    activeBorderColor: AppTheme.blue500,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    option,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppTheme.black500,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
