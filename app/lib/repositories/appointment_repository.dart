import 'package:drift/drift.dart';
import '../db/database.dart';
import '../providers/app_providers.dart';

class AppointmentRepository {
  final AppDatabase db;
  AppointmentRepository(this.db);

  // Add Appointment Function
  Future<int> addAppointment(AppointmentCompanion appointment) =>
      db.into(db.appointment).insert(appointment);

  // Get All Appointments
  Future<List<AppointmentData>> getAllAppointments() =>
      db.select(db.appointment).get();

  // Get a SINGLE Appointment
  Future<AppointmentData> getAppointment(int id) =>
      (db.select(db.appointment)..where((a) => a.appointmentId.equals(id)))
          .getSingle();

  // Get Appointments by PATIENT (Filter Function #1)
  Future<List<AppointmentData>> getAppointmentByPatient(int patientID) =>
      (db.select(db.appointment)..where((a) => a.patientId.equals(patientID)))
          .get();

  // Get Appointments by DATE (Filter Function #2)
  Future<List<AppointmentData>> getAppointmentByDate(
          DateTime appointmentDate) =>
      (db.select(db.appointment)
            ..where((a) => a.scheduleDateTime.isBetweenValues(
                  DateTime(appointmentDate.year, appointmentDate.month,
                      appointmentDate.day, 0, 0, 0), // min values
                  DateTime(appointmentDate.year, appointmentDate.month,
                      appointmentDate.day, 23, 59, 59), // max values
                )))
          .get();

  // Get Appointment by STATUS (Filter Funtion #3)
  Future<List<AppointmentData>> getAppointmentByStatus(String status) =>
      (db.select(db.appointment)..where((a) => a.status.equals(status))).get();

  // Update Appointment
  Future<bool> updateAppointment(AppointmentCompanion appointment) =>
      db.update(db.appointment).replace(appointment);

  // Update Appointment Status
  Future<int> updateAppointmentStatus(int id, String status) =>
      (db.update(db.appointment)..where((a) => a.appointmentId.equals(id)))
          .write(AppointmentCompanion(status: Value(status)));

  // Delete Appointment
  Future<int> deleteAppointment(int id) =>
      (db.delete(db.appointment)..where((a) => a.appointmentId.equals(id)))
          .go();

  // Get Booked Slots
  Future<List<String>> getBookedSlots(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day, 0, 0, 0);
    final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59);

    final appointments = await (db.select(db.appointment)
          ..where(
              (a) => a.scheduleDateTime.isBetweenValues(startOfDay, endOfDay))
          ..where((a) => a.status.isNotValue('Cancelled')))
        .get();

    // Return the list of time slots that are actually taken
    return appointments.map((a) => a.timeSlot).whereType<String>().toList();
  }

  Stream<List<DashboardQueueItem>> watchTodayQueue() {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day, 0, 0, 0);
    final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

    // Join tables so Patient's Name and the Appointment details in one go
    final query = db.select(db.appointment).join([
      innerJoin(
        db.patient,
        db.patient.patientId.equalsExp(db.appointment.patientId),
      ),
    ])
      ..where(db.appointment.scheduleDateTime
          .isBetweenValues(startOfDay, endOfDay));

    return query.watch().map((rows) {
      return rows.map((row) {
        final appt = row.readTable(db.appointment);
        final pt = row.readTable(db.patient);

        return DashboardQueueItem(
          appointmentId: appt.appointmentId,
          patientName: '${pt.lastName}, ${pt.firstName}',
          reason: appt.reasonForVisit ?? '',
          timeSlot: appt.timeSlot ?? '',
          status: appt.status ?? 'Waiting',
        );
      }).toList();
    });
  }
}
