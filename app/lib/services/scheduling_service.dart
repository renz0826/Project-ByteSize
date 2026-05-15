import 'package:intl/intl.dart';

class SchedulingService {
  
  static const List<String> months = [ // array for the months (dropdown menu)
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
  ];

  static List<String> getDaysInMonth(String? month, String yearStr) { // how many days are in a selected month? (counts leap-years)
    if (month == null) return [];
    int year = int.tryParse(yearStr) ?? DateTime.now().year;
    int monthIndex = months.indexOf(month) + 1;
    if (monthIndex == 0) return [];

    int days = DateTime(year, monthIndex + 1, 0).day;
    return List.generate(days, (index) => (index + 1).toString());
  }

  // Infer function to prevent past booking
  static String getInferredYear(String? selectedMonth) {
    int year = DateTime.now().year;
    if (selectedMonth == null) return year.toString();

    final currentMonth = DateTime.now().month;
    final selectedMonthIndex = months.indexOf(selectedMonth) + 1;

    // Logic: if a past month is selected, this means the month the next year
    if (selectedMonthIndex < currentMonth) {
      year += 1;
    }
    return year.toString();
  }

  // Converts the dropdown choices into strings
  static DateTime? parseSelectedDate(String? selectedMonth, String? selectedDay) {
    if (selectedMonth == null || selectedDay == null) return null;

    int year = int.parse(getInferredYear(selectedMonth));
    final selectedMonthIndex = months.indexOf(selectedMonth) + 1;
    final day = int.tryParse(selectedDay);

    if (selectedMonthIndex <= 0 || day == null) return null;

    return DateTime(year, selectedMonthIndex, day);
  }

  // Combines a date and time String
  static DateTime applyTimeToDate(DateTime date, String timeStr) {
    final parsedTime = DateFormat("hh:mm a").parse(timeStr);
    return DateTime(date.year, date.month, date.day, parsedTime.hour, parsedTime.minute);
  }

  // Formats the date function to a specified format
  static String formatDate(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  // Formats the DateTime to make it look pleasing to the UI
  static String formatTime(DateTime date) {
    return DateFormat('hh:mm a').format(date);
  }

  static List<String> generateAllSlots() {
    return [
      "08:00 AM", "08:30 AM", "09:00 AM", "09:30 AM",
      "10:00 AM", "10:30 AM", "11:00 AM", "11:30 AM",
      "01:00 PM", "01:30 PM", "02:00 PM", "02:30 PM",
      "03:00 PM", "03:30 PM", "04:00 PM", "04:30 PM", "05:00 PM" // to be changed on the clinic's wishes
    ];
  }

  /// Takes the full list and removes the ones already booked
  static List<String> filterAvailableSlots({
    required List<String> allSlots,
    required List<String> bookedSlots,
  }) {
    return allSlots.where((slot) => !bookedSlots.contains(slot)).toList();
  }

   static int timeToMinutes(String? timeSlot) { 
    if (timeSlot == null || timeSlot.isEmpty || timeSlot == '-') return 0;
    try {
      final parts = timeSlot.split(' ');
      final time = parts[0];
      final amPm = parts[1];
      final timeParts = time.split(':');
      int hour = int.parse(timeParts[0]);
      int minute = int.parse(timeParts[1]);

      if (amPm == 'PM' && hour != 12) hour += 12;
      if (amPm == 'AM' && hour == 12) hour = 0;
      return (hour * 60) + minute;
    } catch (e) {
      return 0;
    }
  }
}