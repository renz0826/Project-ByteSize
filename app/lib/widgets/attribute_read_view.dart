import 'package:flutter/material.dart';
import '/../style/theme.dart';

class AttributeReadView extends StatelessWidget {
  final String label;
  final String? content;
  final bool isCrucial;

  const AttributeReadView(
      {super.key,
      required this.label,
      this.content,
      this.isCrucial = false});

  @override
  Widget build(BuildContext context) {
    // * SAMPLE USE CASE:
    //     AttributeReadView(label: "Presence of Oral Debris", content: "None"),
    // AttributeReadView(
    //   label: "Presence of Calculus",
    //   content: "Present",
    //   isCrucial: true,
    // ),
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 8),
          Text(
            content?.isNotEmpty == true? content! : '-',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: isCrucial ? AppTheme.red600 : AppTheme.black500,
                fontWeight: FontWeight.normal),
          ),
        ]);
  }
}
