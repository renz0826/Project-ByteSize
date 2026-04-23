import 'package:flutter/material.dart';
import '../../style/theme.dart';

// Define Button enums
enum ButtonVariant { primary, secondary }

enum IconPlacement { left, right }

class Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final ButtonVariant variant;
  final IconData? icon;
  final IconPlacement iconPlacement;

  const Button({
    super.key,
    required this.onPressed,
    required this.label,
    this.variant = ButtonVariant.primary,
    this.icon,
    this.iconPlacement = IconPlacement.left,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    Widget buttonContent = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Places the icon on the left
        if (icon != null && IconPlacement == IconPlacement.left) ...[
          Icon(
            icon,
            size: 20,
          ),
          const SizedBox(
            width: 12,
          )
        ],

        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium,
        ),

        // Places the icon on the right
        if (icon != null && IconPlacement == IconPlacement.right) ...[
          Icon(
            icon,
            size: 20,
          ),
          const SizedBox(
            width: 12,
          )
        ],
      ],
    );

    switch (variant) {
      // Main button
      case ButtonVariant.primary:
        return ElevatedButton(onPressed: onPressed, child: buttonContent);

      case ButtonVariant.secondary:
        return ElevatedButton(onPressed: onPressed, child: buttonContent);
    }
  }
}
