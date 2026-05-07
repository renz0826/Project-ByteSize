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
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now(); // Default selection is today
  }

  void _updateHeaderDate(DateTime day) {
    final DateTime now = DateTime.now();
    final bool isCurrentMonth = day.year == now.year && day.month == now.month;
    
    // Check if we are in the month where the user actually clicked a day
    final bool isSelectedMonth = _selectedDay != null && 
        day.year == _selectedDay!.year && 
        day.month == _selectedDay!.month;

    setState(() {
      if (isCurrentMonth) {
        _focusedDay = now;
      } else if (isSelectedMonth) {
        _focusedDay = _selectedDay!;
      } else {
        // Reset state for other months: header shows the 1st
        _focusedDay = DateTime(day.year, day.month, 1);
      }
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
                style: AppTheme.textTheme.titleLarge?.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: [
                  // Updated the arrows to left and right
                  IconButton(
                    onPressed: () => _updateHeaderDate(DateTime(_focusedDay.year, _focusedDay.month - 1, 1)),
                    icon: const Icon(Icons.chevron_left, size: 28), // Left Arrow
                    color: AppTheme.black500,
                    splashRadius: 24,
                  ),
                  IconButton(
                    onPressed: () => _updateHeaderDate(DateTime(_focusedDay.year, _focusedDay.month + 1, 1)),
                    icon: const Icon(Icons.chevron_right, size: 28), // Right Arrow
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
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
            child: TableCalendar(
              firstDay: DateTime(2020),
              lastDay: DateTime(2030),
              focusedDay: _focusedDay,
              // Only shows the blue circle if the month matches our selection
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              headerVisible: false,
              rowHeight: 52, // Fixed clipping
              daysOfWeekHeight: 32, // Fixed clipping
              onDaySelected: (selected, focused) {
                setState(() {
                  _selectedDay = selected;
                  _focusedDay = selected;
                });
                widget.onDaySelected?.call(selected);
              },
              onPageChanged: _updateHeaderDate,
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: AppTheme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                weekendStyle: AppTheme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              calendarStyle: CalendarStyle(
                selectedDecoration: const BoxDecoration(
                  color: AppTheme.blue500,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  border: Border.all(color: AppTheme.blue500, width: 1.5),
                  shape: BoxShape.circle,
                ),
                todayTextStyle: const TextStyle(
                  color: AppTheme.blue500,
                  fontWeight: FontWeight.bold,
                ),
                outsideDaysVisible: false,
                cellMargin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}