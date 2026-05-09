class DateService {
  static int getDaysInMonth(String? monthName, String? yearString) {
    if (monthName == null) return 31;

    int year = int.tryParse(yearString ?? '') ?? 0;
    String month = monthName.trim().toLowerCase();

    switch (month) {
      case "february":
        // Leap Year Logic
        if (year != 0 && (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0))) {
          return 29;
        }
        return 28;
      case "april":
      case "june":
      case "september":
      case "november":
        return 30;
      default:
        return 31;
    }
  }

  static List<String> get months => [
        "January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
      ];
}