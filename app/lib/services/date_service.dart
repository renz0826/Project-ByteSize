class DateService {
  static int getDaysInMonth(String? monthName) {
    if (monthName == null) return 31;

    String month = monthName.trim().toLowerCase();

    switch (month) {
      case "february":
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

  // Helper Function: All months in a year
  static List<String> get months => [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December"
      ];
}
