import 'package:flutter/material.dart';
import '../style/theme.dart';

// Status badge variants
enum BadgeStatus {
  waiting,
  inProgress,
  finished,
  cancelled,
  paid,
  pending,
  discount,
}

class AppStatusBadge extends StatelessWidget {
  final BadgeStatus status;

  const AppStatusBadge({
    super.key,
    required this.status,
  });

  // Variabt labels
  String get _label {
    switch (status) {
      case BadgeStatus.waiting:
        return 'Waiting';
      case BadgeStatus.inProgress:
        return 'In Progress';
      case BadgeStatus.paid:
        return 'Paid';
      case BadgeStatus.pending:
        return 'Pending';
      case BadgeStatus.discount:
        return '20% Senior/PWD Eligible';
      case BadgeStatus.finished:
        return '';
      case BadgeStatus.cancelled:
        return '';
    }
  }

  // Background color per variant
  // Background color per variant
  Color get _backgroundColor {
    switch (status) {
      case BadgeStatus.waiting:
        return AppTheme.yellow200;
      case BadgeStatus.inProgress:
        return AppTheme.green200;
      case BadgeStatus.paid:
        return AppTheme.green200;
      case BadgeStatus.pending:
        return AppTheme.yellow200;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (status == BadgeStatus.finished || status == BadgeStatus.cancelled) {
      return const SizedBox.shrink();
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(_label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppTheme.black500,
              fontWeight: FontWeight.w600,
              fontSize: 13)),
    );
  }
}
