import 'package:flutter/material.dart';
import '../../style/theme.dart';
import 'package:heroicons/heroicons.dart';

// Define Button enums
enum ButtonVariant {
  primary,
  secondary,
  smallPrimary,
  smallSecondary,
  dangerPrimary,
  dangerSecondary,
  revert,
  text,
  dangerText
}

enum IconPlacement { left, right }

class Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final ButtonVariant variant;
  final IconData? icon;
  final HeroIcons? heroIcon;
  final HeroIconStyle heroIconStyle;
  final IconPlacement iconPlacement;
  final double width;
  final bool isLoading;
  final double? fontSize;

  const Button({
    super.key,
    required this.onPressed,
    this.label = "",
    this.variant = ButtonVariant.primary,
    this.icon,
    this.heroIcon,
    this.heroIconStyle = HeroIconStyle.outline,
    this.iconPlacement = IconPlacement.left,
    this.width = 0,
    this.isLoading = false,
    this.fontSize,
  });

  // shared icon builder
  Widget _buildIcon() {
    if (heroIcon != null) {
      return HeroIcon(heroIcon!, style: heroIconStyle, size: 20);
    }
    if (icon != null) {
      return Icon(icon, size: 20);
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final isTextVariant =
        variant == ButtonVariant.text || variant == ButtonVariant.dangerText;

    Widget buttonContent = Row(
      mainAxisAlignment:
          isTextVariant ? MainAxisAlignment.start : MainAxisAlignment.center,
      mainAxisSize: isTextVariant ? MainAxisSize.max : MainAxisSize.min,
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
          if ((icon != null || heroIcon != null) &&
              iconPlacement == IconPlacement.left) ...[
            _buildIcon(),
            const SizedBox(
              width: 12,
            )
          ],

          Text(
            label,
            style: TextStyle(
                fontSize: fontSize ?? 16, fontWeight: FontWeight.w600),
          ),

          // Places the icon on the right
          if ((icon != null || heroIcon != null) &&
              iconPlacement == IconPlacement.right) ...[
            const SizedBox(
              width: 12,
            ),
            _buildIcon(),
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
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24))),
            child: buttonContent);
        break;

      // Danger Button
      case ButtonVariant.dangerPrimary:
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

      // Secondary Button
      case ButtonVariant.dangerSecondary:
        buttonWidget = ElevatedButton(
            onPressed: action,
            style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.white500,
                foregroundColor: AppTheme.red600,
                side: BorderSide(color: AppTheme.red600, width: 1),
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

      // Text Button
      case ButtonVariant.text:
        buttonWidget = ElevatedButton(
            onPressed: action,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.white500,
              foregroundColor: AppTheme.gray500,
              elevation: 0,
              padding: const EdgeInsets.all(0),
            ),
            child: buttonContent);
        break;

      // Danger Text Button
      case ButtonVariant.dangerText:
        buttonWidget = ElevatedButton(
            onPressed: action,
            style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.white500,
                foregroundColor: AppTheme.red600,
                elevation: 0,
                padding: const EdgeInsets.all(0)),
            child: buttonContent);
    }

    return width == 0
        ? buttonWidget
        : SizedBox(
            width: width,
            child: buttonWidget,
          );
  }
}
