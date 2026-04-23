import 'package:flutter/material.dart';
import '../../style/theme.dart';

// Define Button enums
enum ButtonVariant {
  primary,
  secondary,
  smallPrimary,
  smallSecondary,
  danger,
  revert,
}

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
    this.label = "",
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
      // Primary Button
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
        break;

      // Secondary Button
      case ButtonVariant.secondary:
        buttonWidget = ElevatedButton(
            onPressed: action,
            style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.white500,
                foregroundColor: primaryColor,
                side: BorderSide(color: primaryColor, width: 1),
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24))),
            child: buttonContent);
        break;

      // Small Primary Button
      case ButtonVariant.smallPrimary:
        buttonWidget = ElevatedButton(
            onPressed: action,
            style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: AppTheme.white500,
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24))),
            child: buttonContent);
        break;

      // Small Secondary Button
      case ButtonVariant.smallSecondary:
        buttonWidget = ElevatedButton(
            onPressed: action,
            style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.white500,
                foregroundColor: primaryColor,
                side: BorderSide(color: primaryColor, width: 1),
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24))),
            child: buttonContent);
        break;

      // Danger Button
      case ButtonVariant.danger:
        buttonWidget = ElevatedButton(
            onPressed: action,
            style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.red600,
                foregroundColor: AppTheme.white500,
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24))),
            child: buttonContent);
        break;

      // Revert Button
      case ButtonVariant.revert:
        buttonWidget = ElevatedButton(
            onPressed: action,
            style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.white500,
                foregroundColor: AppTheme.gray500,
                side: BorderSide(color: AppTheme.gray500, width: 1),
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24))),
            child: buttonContent);
        break;
    }

    return SizedBox(
      width: width,
      child: buttonWidget,
    );
  }
}
