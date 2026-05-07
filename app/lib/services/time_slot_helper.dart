class TimeSlotService {
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
}