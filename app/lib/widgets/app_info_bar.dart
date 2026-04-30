import 'package:flutter/material.dart';
import '../style/theme.dart';
import './app_status_badge.dart';
import 'package:heroicons/heroicons.dart';
import './icon_buttons.dart';

// NOTE: This file can be lighter if we were to use a helper for the text design,
// namely by predefining the styles and layout. This ensures efficient code
// reusability and reduces the boilerplate of each block.

/// Centralized Date Formatter to avoid repetition
String formatDate(DateTime date) {
  final mm = date.month.toString().padLeft(2, '0');
  final dd = date.day.toString().padLeft(2, '0');
  final yy = date.year.toString().substring(2);
  return '$mm/$dd/$yy';
}

// shared text style helper
TextStyle? barTextStyle(BuildContext context) {
  return Theme.of(context).textTheme.bodySmall?.copyWith(
    color: AppTheme.black500,
  );
}

// shared bar text widget - handles style and flex dynamically
class _BarText extends StatelessWidget {
  final String text;
  final bool isName;   
  final bool ellipsis; 

  const _BarText(
    this.text, {
    this.isName = false,
    this.ellipsis = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: isName ? 3 : 2,
      child: Text(
        text,
        style: barTextStyle(context),
        overflow: ellipsis ? TextOverflow.ellipsis : null,
        maxLines: ellipsis ? 1 : null,
      ),
    );
  }
}

// Bar container
class _BarContainer extends StatelessWidget {
  final List<Widget> children;

  const _BarContainer({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
      color: AppTheme.white500,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsetsGeometry.zero,
      icon: const HeroIcon(HeroIcons.ellipsisHorizontal, color: AppTheme.gray500, size: 30),
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

  // action icon depends on status — uses IconButtons widget
  Widget _actionButton() {
    final isWaiting = status == BadgeStatus.waiting;
    return IconButtons(
      onPressed: onAction,
      variant: isWaiting ? IconButtonVariant.cancel : IconButtonVariant.finish,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _BarContainer(
      children: [
        _BarText(fullName, isName: true, ellipsis: true,), // name
        _BarText(time), // time
        _BarText(procedure), // procedure

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
        _BarText(fullName, isName: true, ellipsis: true,), // name
        _BarText(procedure), // procedure
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
        _BarText(fullName, isName: true, ellipsis: true,),
        _BarText(gender),
        _BarText(address),
        _BarText(contact),
        _BarText(procedure),

        // more options: Add New Clinical Record, Add Schedule, View Record, Edit Personal Details, Archive Record
        SizedBox(
          width: 70,
          child: _MoreOptions(
              onSelected: onMenuSelected,
              items: const [
                PopupMenuItem(
                  value: 'add_clinical_record',
                  child: Row(children: [
                    HeroIcon(HeroIcons.documentPlus, size: 20),
                    SizedBox(width: 10),
                    Text('Add New Clinical Record'),
                  ]),
                ),
                PopupMenuItem(
                  value: 'add_schedule',
                  child: Row(children: [
                    HeroIcon(HeroIcons.calendar, size: 20),
                    SizedBox(width: 10),
                    Text('Add Schedule'),
                  ]),
                ),
                PopupMenuItem(
                  value: 'view_record',
                  child: Row(children: [
                    HeroIcon(HeroIcons.eye, size: 20),
                    SizedBox(width: 10),
                    Text('View Record'),
                  ]),
                ),
                PopupMenuItem(
                  value: 'edit_details',
                  child: Row(children: [
                    HeroIcon(HeroIcons.pencilSquare, size: 20),
                    SizedBox(width: 10),
                    Text('Edit Personal Details'),
                  ]),
                ),
                PopupMenuItem(
                  value: 'archive',
                  child: Row(children: [
                    HeroIcon(HeroIcons.archiveBox, size: 20, color: AppTheme.red600),
                    SizedBox(width: 10),
                    Text('Archive Record', style: TextStyle(color: AppTheme.red600)),
                  ]),
                ),
              ],
            ),
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

  // Amount Getter
  String get _formattedAmount {
    final formatted = amount.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (m) => '${m[1]},',
        );
    return '₱ $formatted';
  }

  @override
  Widget build(BuildContext context) {
    return _BarContainer(
      children: [

        _BarText(invoiceId),
        _BarText(fullName, isName: true, ellipsis: true,),
        _BarText(procedure, ellipsis: true,),
        _BarText(_formattedAmount),
        _BarText(formatDate(date)),
        AppStatusBadge(status: status),

        // more options: Process Payment, View Bill
        _MoreOptions(
          onSelected: onMenuSelected,
          items: const [
            PopupMenuItem(
              value: 'process_payment',
              child: Row(children: [
                HeroIcon(HeroIcons.banknotes, size: 20),
                SizedBox(width: 10),
                Text('Process Payment'),
              ]),
            ),
            PopupMenuItem(
              value: 'view_bill',
              child: Row(children: [
                HeroIcon(HeroIcons.eye, size: 20),
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

  @override
  Widget build(BuildContext context) {
    return _BarContainer(
      children: [
        _BarText(fullName, isName: true, ellipsis: true,),
        _BarText(formatDate(date)),
        _BarText(time),
        _BarText(procedure, ellipsis: true,),

        // more options: View Appointment, Edit Appointment, Cancel Appointment
        _MoreOptions(
          onSelected: onMenuSelected,
          items: const [
            PopupMenuItem(
              value: 'view_appointment',
              child: Row(children: [
                HeroIcon(HeroIcons.eye, size: 20),
                SizedBox(width: 10),
                Text('View Appointment'),
              ]),
            ),
            PopupMenuItem(
              value: 'edit_appointment',
              child: Row(children: [
                HeroIcon(HeroIcons.pencilSquare, size: 20),
                SizedBox(width: 10),
                Text('Edit Appointment'),
              ]),
            ),
            PopupMenuItem(
              value: 'cancel_appointment',
              child: Row(children: [
                HeroIcon(HeroIcons.xMark, size: 20, color: AppTheme.red600),
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