import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    this.style,
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
    this.logoPath, // add this
  });

  final String text;
  final TextStyle? style;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final String? logoPath; // add this

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (logoPath != null) ...[
          Image.asset(logoPath!, height: style?.fontSize ?? 40),
          const SizedBox(width: 12),
        ],
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => LinearGradient(
            begin: begin,
            end: end,
            colors: const [
              Color(0xFF4FB44E),
              Color(0xFF214C21),
            ],
          ).createShader(bounds),
          child: Text(text, style: style),
        ),
      ],
    );
  }
}