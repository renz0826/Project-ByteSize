class DateHelper {
  static final Map<String, int> _monthMap = {
    'January': 1,
    'February': 2,
    'March': 3,
    'April': 4,
    'May': 5,
    'June': 6,
    'July': 7,
    'August': 8,
    'September': 9,
    'October': 10,
    'November': 11,
    'December': 12
  };

  static DateTime convertToDateTime(String month, String day, String year) {
    return DateTime(
      int.parse(year),
      _monthMap[month] ?? 1,
      int.parse(day),
    );
  }
}
