class DateService {
  static int getDaysInMonth(String? monthName) {
    if (monthName == null) return 31;

    String month = monthName.trim().toLowerCase(); // trim to lowercase (to centralize the inputs to be read)

    switch (month) {
      case "february": // february having 28 days in a year
        return 28;
      case "april": // these 4 having 30 days in a year
      case "june":
      case "september":
      case "november":
        return 30;
      default:
        return 31; // everything else having 31
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
