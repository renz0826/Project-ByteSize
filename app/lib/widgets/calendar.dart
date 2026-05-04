import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../style/theme.dart';

class AppCalendar extends StatefulWidget {
  final DateTime? selectedDay;
  final ValueChanged<DateTime>? onDaySelected;

  const AppCalendar({
    super.key,
    this.selectedDay,
    this.onDaySelected,
  });

  @override
  State<AppCalendar> createState() => _AppCalendarState();
}

class _AppCalendarState extends State<AppCalendar> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    // Initialize with provided day or current date
    _focusedDay = widget.selectedDay ?? DateTime.now();
    _selectedDay = widget.selectedDay ?? DateTime.now();
  }

  @override
  void didUpdateWidget(AppCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Sync internal state if parent provides a new selected day
    if (widget.selectedDay != oldWidget.selectedDay && widget.selectedDay != null) {
      setState(() {
        _selectedDay = widget.selectedDay!;
        _focusedDay = widget.selectedDay!;
      });
    }
  }

  void _previousMonth() {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year, _focusedDay.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.white500,
        borderRadius: BorderRadius.circular(24),
        boxShadow: AppTheme.floatShadow, 
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header: "Month Day, Year" and Navigation Arrows
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat.yMMMMd().format(_focusedDay),
                style: AppTheme.textTheme.headlineLarge?.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: _previousMonth,
                    icon: const Icon(Icons.keyboard_arrow_up, size: 28),
                    color: AppTheme.black500,
                    splashRadius: 24,
                  ),
                  IconButton(
                    onPressed: _nextMonth,
                    icon: const Icon(Icons.keyboard_arrow_down, size: 28),
                    color: AppTheme.black500,
                    splashRadius: 24,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.black500, width: 1),
              borderRadius: BorderRadius.circular(32),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TableCalendar(
              firstDay: DateTime(2020),
              lastDay: DateTime(2030),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              headerVisible: false, 
              
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
                widget.onDaySelected?.call(selectedDay);
              },
              
              onPageChanged: (focusedDay) {
                setState(() => _focusedDay = focusedDay);
              },

              // Days of Week (Sun, Mon, etc.)
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: AppTheme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                weekendStyle: AppTheme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              calendarStyle: CalendarStyle(
                // Selected Day styling
                selectedDecoration: const BoxDecoration(
                  color: AppTheme.blue500,
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: AppTheme.textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                
                // Today styling: Outline only to distinguish from Selected
                todayDecoration: BoxDecoration(
                  border: Border.all(color: AppTheme.blue500, width: 1.5),
                  shape: BoxShape.circle,
                ),
                todayTextStyle: const TextStyle(
                  color: AppTheme.blue500,
                  fontWeight: FontWeight.bold,
                ),
                
                defaultTextStyle: AppTheme.textTheme.bodyMedium!,
                weekendTextStyle: AppTheme.textTheme.bodyMedium!,
                
                // Keep the UI clean by hiding days from other months
                outsideDaysVisible: false,
                cellMargin: const EdgeInsets.all(4),
              ),

              // Month view only
              calendarFormat: CalendarFormat.month,
              availableCalendarFormats: const {
                CalendarFormat.month: 'Month',
              },
            ),
          ),
        ],
      ),
    );
  }
}