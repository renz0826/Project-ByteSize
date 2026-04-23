import 'package:flutter/material.dart';
import '../../style/theme.dart';

// Icon Buttons enums
enum IconButtonVariant { finish, cancel, remove }

class IconButtons extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconButtonVariant variant;

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
        case IconButtonVariant.finish:
          return Icons.check;
        case IconButtonVariant.cancel:
          return Icons.cancel;
        case IconButtonVariant.remove:
          return Icons.remove;
      }
    }

    // Colors Mapping
    Color getColor() {
      switch (variant) {
        case IconButtonVariant.finish:
          return AppTheme.green300;
        case IconButtonVariant.cancel:
        case IconButtonVariant.remove:
          return AppTheme.red600;
      }
    }

    final color = getColor();

    return const Placeholder();
  }
}
