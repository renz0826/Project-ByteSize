import 'package:flutter/material.dart';
import '../style/theme.dart';

class MissingInfoDialog extends StatelessWidget {
  final List<String> missingFields;

  const MissingInfoDialog({
    super.key,
    required this.missingFields,
  });

  /// A handy static method to call this dialog instantly
  static Future<void> show(BuildContext context, List<String> missingFields) {
    return showDialog<void>(
      context: context,
      builder: (context) => MissingInfoDialog(missingFields: missingFields),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isMassiveList = missingFields.length > 3;

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
            'Missing Information',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
      content: SizedBox(
        width: 380,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isMassiveList
                ? Text(
                    'Please fill out all required fields marked with a red asterisk (*) before proceeding.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(
                          'Please provide the following details:',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 8),
                        ...missingFields
                            .map((field) => Text('• $field'))
                            .toList(),
                      ]),
          ],
        ),
      ),
      backgroundColor: AppTheme.white500,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.blue500,
          ),
          child: Text('Got it', style: Theme.of(context).textTheme.labelMedium),
        ),
      ],
    );
  }
}
