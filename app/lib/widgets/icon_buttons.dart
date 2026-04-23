import 'package:flutter/material.dart';
import '../../style/theme.dart';

// Icon Buttons enums
enum ButtonVariant { finish, cancel, remove }

class IconButtons extends StatelessWidget {
  final VoidCallback? onPressed;
  final ButtonVariant variant;

  const IconButtons({
    super.key,
    required this.onPressed,
    required this.variant,
  });

  @override
  Widget build(BuildContext context) {
    // Icon mapping
    IconData getIcon() {
      switch (variant) {
        case ButtonVariant.finish:
          return Icons.check;
        case ButtonVariant.cancel:
          return Icons.cancel;
        case ButtonVariant.remove:
          return Icons.remove;
      }
    }

    // Colors Mapping
    Color getColor() {
      switch (variant) {
        case ButtonVariant.finish:
          return AppTheme.green300;
        case ButtonVariant.cancel:
        case ButtonVariant.remove:
          return AppTheme.red600;
      }
    }

    final color = getColor();

    return const Placeholder();
  }
}
