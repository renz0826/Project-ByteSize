import 'package:flutter/material.dart';
import '../style/theme.dart';

class WarningDialog extends StatelessWidget {
  final String title;
  final String content;
  final String secondaryAction;
  final String primaryAction;

  const WarningDialog(
      {super.key,
      required this.title,
      required this.content,
      required this.secondaryAction,
      required this.primaryAction});

  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => const WarningDialog(
          title: "", content: " ", secondaryAction: " ", primaryAction: ""),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            color: AppTheme.red600,
            size: 36,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
      content: SizedBox(
        width: 420,
        child: Text(content, style: Theme.of(context).textTheme.bodyMedium),
      ),
      backgroundColor: AppTheme.white500,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      actions: [
        OutlinedButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              secondaryAction,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: AppTheme.gray500),
            )),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.red600,
          ),
          child: Text(primaryAction,
              style: Theme.of(context).textTheme.labelMedium),
        ),
      ],
    );
  }
}
