import 'package:flutter/material.dart';
import '/../style/theme.dart';

class StatusToast extends StatelessWidget {
  final bool isSuccess; // Determines if it's green/check or red/x
  final String title;
  final String message;
  final VoidCallback? onClose;

  const StatusToast({
    super.key,
    required this.isSuccess,
    required this.title,
    required this.message,
    this.onClose,
  });

  Widget _buildIcon() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSuccess ? AppTheme.green300 : AppTheme.red600,
        shape: BoxShape.circle,
      ),
      child: Icon(
        isSuccess ? Icons.check : Icons.close,
        color: Colors.white,
        size: 28,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 32,
      right: 32,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
            color: AppTheme.white500,
            borderRadius: BorderRadius.circular(24),
            boxShadow: AppTheme.cardShadow),
        child: Row(
          spacing: 16,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildIcon(),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text(message, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: onClose,
              child: const Icon(
                Icons.close,
                color: AppTheme.gray500,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
