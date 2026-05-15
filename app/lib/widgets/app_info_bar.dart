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
  final int flex;
  final bool ellipsis;

  const _BarText(
    this.text, {
    this.flex = 2,
    this.ellipsis = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
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
        boxShadow: AppTheme.cardShadow,
      ),
      child: Row(
        spacing: 8,
        children: children,
      ),
    );
  }
}

//shared menu item widget
class BarMenuItem {
  final String value;
  final HeroIcons icon;
  final String label;
  final Color? color;

  const BarMenuItem({
    required this.value,
    required this.icon,
    required this.label,
    this.color,
  });
}

// Shared options button
class _MoreOptions extends StatelessWidget {
  final List<BarMenuItem> items;
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
      icon: const HeroIcon(HeroIcons.ellipsisHorizontal,
          color: AppTheme.gray500, size: 30),
      onSelected: onSelected,
      itemBuilder: (_) => items.map(_buildItem).toList(),
    );
  }

  PopupMenuItem<String> _buildItem(BarMenuItem item) {
    return PopupMenuItem<String>(
      value: item.value,
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          HeroIcon(
            item.icon,
            color: item.color ?? AppTheme.gray500,
            size: 20,
          ),
          const SizedBox(width: 10),
          Text(
            item.label,
            style: AppTheme.textTheme.bodySmall?.copyWith(
              color: item.color ?? AppTheme.black500,
            ),
          )
        ],
      ),
    );
  }
}

// Appointment Bar - Patient in Queue
// Displays: Name | Time | Reason | Status Badge | Action Button
class AppointmentBar extends StatelessWidget {
  final String fullName;
  final String time;
  final String reason;
  final BadgeStatus status;
  final VoidCallback? onAction; // action depends on status (e.g. cancel / done)

  const AppointmentBar({
    super.key,
    required this.fullName,
    required this.time,
    required this.reason,
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
        _BarText(
          fullName,
          flex: 3,
          ellipsis: true,
        ), // name
        _BarText(time), // time
        _BarText(reason), // reason
        AppStatusBadge(status: status),
        Expanded(child: const SizedBox()),
        _actionButton(),
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
        _BarText(
          fullName,
          flex: 3,
          ellipsis: true,
        ), // name
        _BarText(procedure), // procedure
      ],
    );
  }
}

// Patients Record Bar
class PatientRecordBar extends StatelessWidget {
  final String fullName;
  final String sex;
  final int age;
  final String address;
  final String contact;
  final ValueChanged<String>? onMenuSelected;
  final bool isArchived;

  const PatientRecordBar({
    super.key,
    required this.fullName,
    required this.sex,
    required this.age,
    required this.address,
    required this.contact,
    required this.isArchived,
    this.onMenuSelected,
  });

  @override
  Widget build(BuildContext context) {
    return _BarContainer(
      children: [
        _BarText(fullName, flex: 3, ellipsis: true),
        _BarText(sex, flex: 2),
        _BarText('$age yo', flex: 2),
        _BarText(address, flex: 5, ellipsis: true),
        _BarText(contact, flex: 3),
        Expanded(flex: 2, child: const SizedBox()),

        // more options: Add New Clinical Record, Add Schedule, View Record, Edit Personal Details, Archive Record
        SizedBox(
          width: 70,
          child: _MoreOptions(
            onSelected: onMenuSelected,
            items: [
              if (isArchived) ...[
                BarMenuItem(
                    value: 'view_record',
                    icon: HeroIcons.eye,
                    label: 'View Record'),
                BarMenuItem(
                    value: 'unarchive',
                    icon: HeroIcons.arrowPath,
                    label: 'Restore Record',
                    color: AppTheme.blue500),
              ] else ...[
                BarMenuItem(
                    value: 'add_clinical_record',
                    icon: HeroIcons.documentPlus,
                    label: 'Add New Clinical Record'),
                BarMenuItem(
                    value: 'add_schedule',
                    icon: HeroIcons.calendar,
                    label: 'Add Schedule'),
                BarMenuItem(
                    value: 'view_record',
                    icon: HeroIcons.eye,
                    label: 'View Record'),
                BarMenuItem(
                    value: 'edit_details',
                    icon: HeroIcons.pencilSquare,
                    label: 'Edit Personal Details'),
                BarMenuItem(
                    value: 'archive',
                    icon: HeroIcons.archiveBoxXMark,
                    label: 'Archive Record',
                    color: AppTheme.red600),
              ],
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
        _BarText(
          fullName,
          flex: 3,
          ellipsis: true,
        ),
        _BarText(
          procedure,
          ellipsis: true,
        ),
        _BarText(_formattedAmount),
        _BarText(formatDate(date)),
        AppStatusBadge(status: status),

        // more options: Process Payment, View Bill
        _MoreOptions(
          onSelected: onMenuSelected,
          items: [
            BarMenuItem(
                value: 'process_payment',
                icon: HeroIcons.banknotes,
                label: 'Process Payment'),
            BarMenuItem(
                value: 'view_bill', icon: HeroIcons.eye, label: 'View Bill')
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
        _BarText(
          fullName,
          flex: 3,
          ellipsis: true,
        ),
        _BarText(formatDate(date)),
        _BarText(time),
        _BarText(
          procedure,
          ellipsis: true,
        ),

        // more options: View Appointment, Edit Appointment, Cancel Appointment
        _MoreOptions(
          onSelected: onMenuSelected,
          items: [
            BarMenuItem(
                value: 'view_appointment',
                icon: HeroIcons.eye,
                label: 'View Appointment'),
            BarMenuItem(
                value: 'edit_appointment',
                icon: HeroIcons.pencilSquare,
                label: 'Edit Appointment'),
            BarMenuItem(
                value: 'cancel_appointment',
                icon: HeroIcons.xMark,
                label: 'Cancel Appointment',
                color: AppTheme.red600)
          ],
        ),
      ],
    );
  }
}
