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
  final double width;
  final bool isLoading;

  const Button({
    super.key,
    required this.onPressed,
    required this.label,
    this.variant = ButtonVariant.primary,
    this.icon,
    this.iconPlacement = IconPlacement.left,
    this.width = 0,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    Widget buttonContent = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Loading state of button
        if (isLoading) ...[
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppTheme.white500,
            ),
          ),
        ] else ...[
          // Places the icon on the left
          if (icon != null && iconPlacement == IconPlacement.left) ...[
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
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),

          // Places the icon on the right
          if (icon != null && iconPlacement == IconPlacement.right) ...[
            const SizedBox(
              width: 12,
            ),
            Icon(
              icon,
              size: 20,
            ),
          ],
        ]
      ],
    );

    // Disables the button if it's loading.
    final action = isLoading ? null : onPressed;
    Widget buttonWidget;

    switch (variant) {
      // Main button
      case ButtonVariant.primary:
        buttonWidget = ElevatedButton(
            onPressed: action,
            style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: AppTheme.white500,
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24))),
            child: buttonContent);

      case ButtonVariant.secondary:
        buttonWidget =
            ElevatedButton(onPressed: onPressed, child: buttonContent);
    }

    return SizedBox(
      width: width,
      child: buttonWidget,
    );
  }
}
