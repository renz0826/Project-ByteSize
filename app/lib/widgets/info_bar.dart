import 'package:flutter/material.dart';
import '../style/theme.dart';
import 'status_badge.dart';
import 'package:heroicons/heroicons.dart';
import './icon_buttons.dart';

/// Centralized Date Formatter
String formatDate(DateTime date) {
  final mm = date.month.toString().padLeft(2, '0');
  final dd = date.day.toString().padLeft(2, '0');
  final yy = date.year.toString().substring(2);
  return '$mm/$dd/$yy';
}

TextStyle? barTextStyle(BuildContext context) {
  return Theme.of(context).textTheme.bodySmall?.copyWith(
        color: AppTheme.black500,
      );
}

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

class _BarContainer extends StatelessWidget {
  final List<Widget> children;
  final VoidCallback? onTap;

  const _BarContainer({required this.children, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppTheme.white500,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          // Explicitly added native mouseCursor tracking to InkWell to force the hand pointer pointer
          mouseCursor: onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SizedBox(
              height: 36,
              child: Row(
                children: children,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BarMenuItem {
  final String value;
  final HeroIcons icon;
  final String label;
  final Color? color;
  final bool enable;

  const BarMenuItem({
    required this.value,
    required this.icon,
    required this.label,
    this.color,
    this.enable = true,
  });
}

class _MoreOptions extends StatelessWidget {
  final List<BarMenuItem> items;
  final ValueChanged<String>? onSelected;

  const _MoreOptions({required this.items, this.onSelected});

  @override
  Widget build(BuildContext context) {
    // Use MouseRegion envelope to bypass version constraints cleanly on PopupMenuButton
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: PopupMenuButton<String>(
        constraints: const BoxConstraints(),
        color: AppTheme.white500,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsetsGeometry.zero,
        icon: const HeroIcon(HeroIcons.ellipsisHorizontal,
            color: AppTheme.gray500, size: 30),
        onSelected: onSelected,
        itemBuilder: (_) => items.map(_buildItem).toList(),
      ),
    );
  }

  PopupMenuItem<String> _buildItem(BarMenuItem item) {
    return PopupMenuItem<String>(
      value: item.value,
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
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
  final VoidCallback?
      onPrimaryAction; // action depends on status (e.g. cancel / done)
  final ValueChanged<String>? onMenuSelected;
  final VoidCallback? onTap; 

  const AppointmentBar({
    super.key,
    required this.fullName,
    required this.time,
    required this.reason,
    required this.status,
    this.onPrimaryAction,
    this.onMenuSelected,
    this.onTap,
  });

  Widget _actionButton() {
    final isWaiting = status == BadgeStatus.waiting;
    return IconButtons(
      onPressed: onPrimaryAction,
      variant: isWaiting ? IconButtonVariant.cancel : IconButtonVariant.finish,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isWaiting =
        status == BadgeStatus.waiting || status == BadgeStatus.pending;
    return _BarContainer(
      onTap: onTap, 
      children: [
        _BarText(fullName, flex: 3, ellipsis: true), 
        _BarText(time, flex: 2), 
        _BarText(reason, flex: 2, ellipsis: true), 
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: AppStatusBadge(status: status),
          ),
        ),
        _actionButton(),
        SizedBox(
          child: _MoreOptions(
            onSelected: onMenuSelected,
            items: isWaiting
                // Menu for WAITING patients
                ? [
                    const BarMenuItem(
                      value: 'admit',
                      icon: HeroIcons.arrowRight,
                      label: 'Admit Patient',
                    ),
                    const BarMenuItem(
                        value: 'reschedule',
                        icon: HeroIcons.pencilSquare,
                        label: 'Reschedule Patient'),
                  ]
                // Menu for IN PROGRESS patients
                : [
                    const BarMenuItem(
                        value: 'send_back',
                        icon: HeroIcons.arrowLeft,
                        label: 'Send back to Waiting'),
                    const BarMenuItem(
                        value: 'reschedule',
                        icon: HeroIcons.pencilSquare,
                        label: 'Reschedule Patient'),
                  ],
          ),
        )
      ],
    );
  }
}

class PatientsTreatedBar extends StatelessWidget {
  final String fullName;
  final String procedure;
  final VoidCallback? onTap; 

  const PatientsTreatedBar({
    super.key,
    required this.fullName,
    required this.procedure,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _BarContainer(
      onTap: onTap, 
      children: [
        _BarText(fullName, flex: 3, ellipsis: true),
        _BarText(procedure),
      ],
    );
  }
}

class PatientRecordBar extends StatelessWidget {
  final String fullName;
  final String sex;
  final int age;
  final String address;
  final String contact;
  final ValueChanged<String>? onMenuSelected;
  final bool isArchived;
  final VoidCallback? onTap; 

  const PatientRecordBar({
    super.key,
    required this.fullName,
    required this.sex,
    required this.age,
    required this.address,
    required this.contact,
    required this.isArchived,
    this.onMenuSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _BarContainer(
      onTap: onTap, 
      children: [
        _BarText(fullName, flex: 3, ellipsis: true),
        _BarText(sex, flex: 2),
        _BarText('$age yo', flex: 2),
        _BarText(address, flex: 5, ellipsis: true),
        _BarText(contact, flex: 3),
        const Expanded(flex: 2, child: SizedBox()),
        SizedBox(
          width: 70,
          child: _MoreOptions(
            onSelected: onMenuSelected,
            items: [
              if (isArchived) ...[
                const BarMenuItem(
                    value: 'view_record',
                    icon: HeroIcons.eye,
                    label: 'View Record'),
                const BarMenuItem(
                    value: 'unarchive',
                    icon: HeroIcons.arrowPath,
                    label: 'Restore Record',
                    color: AppTheme.blue500),
              ] else ...[
                const BarMenuItem(
                    value: 'add_clinical_record',
                    icon: HeroIcons.documentPlus,
                    label: 'Add New Clinical Record'),
                const BarMenuItem(
                    value: 'add_schedule',
                    icon: HeroIcons.calendar,
                    label: 'Add Schedule'),
                const BarMenuItem(
                    value: 'view_record',
                    icon: HeroIcons.eye,
                    label: 'View Record'),
                const BarMenuItem(
                    value: 'edit_details',
                    icon: HeroIcons.pencilSquare,
                    label: 'Edit Personal Details'),
                const BarMenuItem(
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

class InvoiceBar extends StatelessWidget {
  final String invoiceId;
  final String fullName;
  final String procedure;
  final double amount;
  final DateTime date;
  final BadgeStatus status;
  final ValueChanged<String>? onMenuSelected;
  final bool isPaid;
  final VoidCallback? onTap; 

  const InvoiceBar({
    super.key,
    required this.invoiceId,
    required this.fullName,
    required this.procedure,
    required this.amount,
    required this.date,
    required this.status,
    required this.isPaid,
    this.onMenuSelected,
    this.onTap,
  });

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
      onTap: onTap,
      children: [
        _BarText(invoiceId, flex: 2),
        _BarText(fullName, flex: 3, ellipsis: true),
        _BarText(procedure, flex: 4, ellipsis: true),
        _BarText(_formattedAmount, flex: 2),
        _BarText(formatDate(date), flex: 2),
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: AppStatusBadge(status: status),
          ),
        ),
        Expanded(
          flex: 1,
          child: _MoreOptions(
            onSelected: onMenuSelected,
            items: [
              const BarMenuItem(value: 'view_bill', icon: HeroIcons.eye, label: 'View Bill'),
              const BarMenuItem(value: 'edit_invoice', icon: HeroIcons.pencilSquare, label: 'Edit Invoice'),
              const BarMenuItem(value: 'process_payment', icon: HeroIcons.banknotes, label: 'Process Payment'),
            ],
          ),
        ),
      ],
    );
  }
}

class ScheduleBar extends StatelessWidget {
  final String fullName;
  final DateTime date;
  final String time;
  final String procedure;
  final ValueChanged<String>? onMenuSelected;
  final VoidCallback? onTap; 

  const ScheduleBar({
    super.key,
    required this.fullName,
    required this.date,
    required this.time,
    required this.procedure,
    this.onMenuSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _BarContainer(
      onTap: onTap, 
      children: [
        _BarText(fullName, flex: 3, ellipsis: true),
        _BarText(formatDate(date)),
        _BarText(time),
        _BarText(procedure, ellipsis: true),
        _MoreOptions(
          onSelected: onMenuSelected,
          items: [
            const BarMenuItem(
                value: 'view_appointment',
                icon: HeroIcons.eye,
                label: 'View Appointment'),
            const BarMenuItem(
                value: 'edit_appointment',
                icon: HeroIcons.pencilSquare,
                label: 'Edit Appointment'),
            const BarMenuItem(
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