import 'package:flutter/material.dart';
import '../style/theme.dart';

class DiscardDialog extends StatelessWidget {
  final String title;
  final String content;

  const DiscardDialog({
    super.key,
    this.title = 'Discard Changes?',
    this.content =
        'Are you sure you want to return to the dashboard? Any unsaved data will be lost.',
  });

  /// A handy static method to call this dialog instantly from anywhere
  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => const DiscardDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: Theme.of(context).textTheme.titleLarge),
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
              'Cancel',
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
          child:
              Text('Discard', style: Theme.of(context).textTheme.labelMedium),
        ),
      ],
    );
  }
}
