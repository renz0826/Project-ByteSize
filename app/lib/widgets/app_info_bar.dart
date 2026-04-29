import 'package:flutter/material.dart';
import '../style/theme.dart';
import './app_status_badge.dart';

// Bar container
class _BarContainer extends StatelessWidget {
  final List<Widget> children;

  const _BarContainer({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: AppTheme.white500,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppTheme.floatShadow, 
        ),
        child: Row(
        children: children,
      ),
    );
  }
}

// Shared options button
class _MoreOptions extends StatelessWidget {
  final List<PopupMenuEntry<String>> items;
  final ValueChanged<String>? onSelected;

  const _MoreOptions({required this.items, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_horiz, color: AppTheme.gray400),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onSelected: onSelected,
      itemBuilder: (_) => items,
    );
  }
}

// Appointment Bar - Patient in Queue
// Displays: Name | Time | Procedure | Status Badge | Action Button
class AppointmentBar extends StatelessWidget {
  final String fullName;
  final String time;
  final String procedure;
  final BadgeStatus status;
  final VoidCallback? onAction; // action depends on status (e.g. cancel / done)

  const AppointmentBar({
    super.key,
    required this.fullName,
    required this.time,
    required this.procedure,
    required this.status,
    this.onAction,
  });

  // Action icon depends on status
  Widget _actionButton() {
    final isWaiting = status == BadgeStatus.waiting;
    return GestureDetector(
      onTap: onAction,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          border: Border.all(
            color: isWaiting ? AppTheme.red600 : AppTheme.green300,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          isWaiting ? Icons.close : Icons.check,
          size: 16,
          color: isWaiting ? AppTheme.red600 : AppTheme.green300,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _BarContainer(
      children: [
        // name
        Expanded(
          flex: 3,
          child: Text(
            fullName, 
            style: Theme.of(context).textTheme.bodyMedium, 
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),

        // time
        Expanded(
          flex: 2,
          child: Text(time, style: Theme.of(context).textTheme.bodySmall),
        ),

        // procedure
        Expanded(
          flex: 3,
          child: Text(procedure, style: Theme.of(context).textTheme.bodySmall),
        ),

        // status badge + action button pushed to right
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppStatusBadge(status: status),
            const SizedBox(width: 8),
            _actionButton(),
          ],
        ),
      ],
    );
  }
}

// Patients treated bar (Dashboard - Patient treated)
class PatientsTreatedBar extends StatelessWidget {
  final String fullName;
  final String procedure;

  const PatientsTreatedBar({
    super.key,
    required this.fullName,
    required this.procedure,
  });

  @override
  Widget build(BuildContext context) {
    return _BarContainer(
      children: [
        // name
        Expanded(
          flex: 3,
          child: Text(fullName, style: Theme.of(context).textTheme.bodySmall),
        ),

        // procedure
        Expanded(
          flex: 3,
          child: Text(procedure, style: Theme.of(context).textTheme.bodySmall),
        ),
      ],
    );
  }
}

// Patients Record Bar
class PatientRecordBar extends StatelessWidget {
  final String fullName;
  final String gender;
  final int age;
  final String address;
  final String contact;
  final String procedure;
  final ValueChanged<String>? onMenuSelected;

  const PatientRecordBar({
    super.key,
    required this.fullName,
    required this.gender,
    required this.age,
    required this.address,
    required this.contact,
    required this.procedure,
    this.onMenuSelected,
  });

  @override
  Widget build(BuildContext context) {
    return _BarContainer(
      children: [
        // name
        Expanded(
          flex: 3,
          child: Text(
            fullName, 
            style: Theme.of(context).textTheme.bodyMedium, 
            overflow: TextOverflow.ellipsis, 
            maxLines: 1,
          ),
        ),

        // gender
        Expanded(
          flex: 2,
          child: Text(gender, style: Theme.of(context).textTheme.bodySmall),
        ),

        // age
        Expanded(
          flex: 1,
          child: Text('$age yo', style: Theme.of(context).textTheme.bodySmall),
        ),

        // address
        Expanded(
          flex: 4,
          child: Text(
            address, 
            style: Theme.of(context).textTheme.bodySmall, 
            overflow: TextOverflow.ellipsis, 
            maxLines: 1,
          ),
        ),

        // contact
        Expanded(
          flex: 3,
          child: Text(contact, style: Theme.of(context).textTheme.bodySmall),
        ),

        // procedure
        Expanded(
          flex: 3,
          child: Text(procedure, style: Theme.of(context).textTheme.bodySmall),
        ),

        // more options: Add New Clinical Record, Add Schedule, View Record, Edit Personal Details, Archive Record
        _MoreOptions(
          onSelected: onMenuSelected,
          items: const [
            PopupMenuItem(
              value: 'add_clinical_record',
              child: Row(children: [
                Icon(Icons.add_circle_outline, size: 18),
                SizedBox(width: 10),
                Text('Add New Clinical Record'),
              ]),
            ),
            PopupMenuItem(
              value: 'add_schedule',
              child: Row(children: [
                Icon(Icons.calendar_today_outlined, size: 18),
                SizedBox(width: 10),
                Text('Add Schedule'),
              ]),
            ),
            PopupMenuItem(
              value: 'view_record',
              child: Row(children: [
                Icon(Icons.file_copy_outlined, size: 18),
                SizedBox(width: 10),
                Text('View Record'),
              ]),
            ),
            PopupMenuItem(
              value: 'edit_details',
              child: Row(children: [
                Icon(Icons.edit_outlined, size: 18),
                SizedBox(width: 10),
                Text('Edit Personal Details'),
              ]),
            ),
            PopupMenuItem(
              value: 'archive',
              child: Row(children: [
                Icon(Icons.inventory_2_outlined, size: 18, color: AppTheme.red600),
                SizedBox(width: 10),
                Text('Archive Record', style: TextStyle(color: AppTheme.red600)),
              ]),
            ),
          ],
        ),
      ],
    );
  }
}

// Billings Bar
class BillingBar extends StatelessWidget {
  final String invoiceId;
  final String fullName;
  final String procedure;
  final double amount;
  final DateTime date;
  final BadgeStatus status;
  final ValueChanged<String>? onMenuSelected;

  const BillingBar({
    super.key,
    required this.invoiceId,
    required this.fullName,
    required this.procedure,
    required this.amount,
    required this.date,
    required this.status,
    this.onMenuSelected,
  });

  String get _formattedAmount {
    final formatted = amount.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (m) => '${m[1]},',
        );
    return '₱ $formatted';
  }

  String get _formattedDate {
    final mm = date.month.toString().padLeft(2, '0');
    final dd = date.day.toString().padLeft(2, '0');
    final yy = date.year.toString().substring(2);
    return '$mm/$dd/$yy';
  }

  @override
  Widget build(BuildContext context) {
    return _BarContainer(
      children: [
        // invoice id
        SizedBox(
          width: 72,
          child: Text(invoiceId, style: Theme.of(context).textTheme.bodySmall),
        ),

        // name
        Expanded(
          flex: 3,
          child: Text(fullName, style: Theme.of(context).textTheme.bodySmall),
        ),

        // procedure
        Expanded(
          flex: 3,
          child: Text(procedure, style: Theme.of(context).textTheme.bodySmall),
        ),

        // amount
        Expanded(
          flex: 2,
          child: Text(_formattedAmount, style: Theme.of(context).textTheme.bodySmall),
        ),

        // date
        Expanded(
          flex: 2,
          child: Text(_formattedDate, style: Theme.of(context).textTheme.bodySmall),
        ),

        // status badge
        AppStatusBadge(status: status),

        // more options: Process Payment, View Bill
        _MoreOptions(
          onSelected: onMenuSelected,
          items: const [
            PopupMenuItem(
              value: 'process_payment',
              child: Row(children: [
                Icon(Icons.payment_outlined, size: 18),
                SizedBox(width: 10),
                Text('Process Payment'),
              ]),
            ),
            PopupMenuItem(
              value: 'view_bill',
              child: Row(children: [
                Icon(Icons.file_copy_outlined, size: 18),
                SizedBox(width: 10),
                Text('View Bill'),
              ]),
            ),
          ],
        ),
      ],
    );
  }
}

// Schedule bar
class ScheduleBar extends StatelessWidget {
  final String fullName;
  final DateTime date;
  final String time;
  final String procedure;
  final ValueChanged<String>? onMenuSelected;

  const ScheduleBar({
    super.key,
    required this.fullName,
    required this.date,
    required this.time,
    required this.procedure,
    this.onMenuSelected,
  });

  String get _formattedDate {
    final mm = date.month.toString().padLeft(2, '0');
    final dd = date.day.toString().padLeft(2, '0');
    final yy = date.year.toString().substring(2);
    return '$mm/$dd/$yy';
  }

  @override
  Widget build(BuildContext context) {
    return _BarContainer(
      children: [
        // name
        Expanded(
          flex: 3,
          child: Text(fullName, style: Theme.of(context).textTheme.bodySmall),
        ),

        // date
        Expanded(
          flex: 2,
          child: Text(_formattedDate, style: Theme.of(context).textTheme.bodySmall),
        ),

        // time
        Expanded(
          flex: 2,
          child: Text(time, style: Theme.of(context).textTheme.bodySmall),
        ),

        // procedure
        Expanded(
          flex: 3,
          child: Text(procedure, style: Theme.of(context).textTheme.bodySmall),
        ),

        // more options: View Appointment, Edit Appointment, Cancel Appointment
        _MoreOptions(
          onSelected: onMenuSelected,
          items: const [
            PopupMenuItem(
              value: 'view_appointment',
              child: Row(children: [
                Icon(Icons.file_copy_outlined, size: 18),
                SizedBox(width: 10),
                Text('View Appointment'),
              ]),
            ),
            PopupMenuItem(
              value: 'edit_appointment',
              child: Row(children: [
                Icon(Icons.edit_outlined, size: 18),
                SizedBox(width: 10),
                Text('Edit Appointment'),
              ]),
            ),
            PopupMenuItem(
              value: 'cancel_appointment',
              child: Row(children: [
                Icon(Icons.close, size: 18, color: AppTheme.red600),
                SizedBox(width: 10),
                Text('Cancel Appointment', style: TextStyle(color: AppTheme.red600)),
              ]),
            ),
          ],
        ),
      ],
    );
  }
}