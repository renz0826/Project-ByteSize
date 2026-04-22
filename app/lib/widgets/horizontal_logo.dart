import 'package:flutter/material.dart';
import '../style/theme.dart';

class HorizontalLogo extends StatelessWidget {
  // Declare dynamic variables
  final double logoHeight;
  final TextStyle? textStyle;

  const HorizontalLogo({
    super.key,
    this.logoHeight = 44,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    // Default theme
    final defaultStyle = Theme.of(context)
        .textTheme
        .headlineLarge
        ?.copyWith(color: AppTheme.blue500, fontWeight: FontWeight.bold);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/logo.png', height: logoHeight),
        SizedBox(width: 16),
        Text("DENTCITY", style: textStyle ?? defaultStyle),
      ],
    );
  }
}
