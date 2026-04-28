import 'package:drift/drift.dart';
import '../db/database.dart';

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
       (db.select(db.appointment) ..where((a) => a.id.equals(id))) .getSingle();

// Get Appointments by PATIENT (Filter Function #1)
  Future<List<AppointmentData>> getAppointmentByPatient(int patientID) =>
  (db.select(db.appointment) ..where ((a) => a.patientId.equals(patientID))) .get();

// Get Appointments by DATE (Filter Function #2)
  Future<List<AppointmentData>> getAppointmentByDate(DateTime appointmentDate) =>
  (db.select(db.appointment)
        ..where((a) => a.appointmentDate.isBetweenValues(
          DateTime(appointmentDate.year, appointmentDate.month, appointmentDate.day, 0, 0, 0), // min values
          DateTime(appointmentDate.year, appointmentDate.month, appointmentDate.day, 23, 59, 59), // max values
        )))
        .get();

// Get Appointment by STATUS (Filter Funtion #3)
  Future<List<AppointmentData>> getAppointmentByStatus(String status) =>
  (db.select(db.appointment) ..where ((a) => a.status.equals(status))) .get();

// Update Appointment
  Future<bool> updateAppointment(AppointmentCompanion appointment) => 
  db.update(db.appointment).replace(appointment);

// Update Appointment Status
  Future<int> updateAppointmentStatus(int id, String status) =>
  (db.update(db.appointment) ..where((a) => a.id.equals(id))) .write(AppointmentCompanion(status: Value(status)));

// Delete Appointment
  Future<int> deleteAppointment(int id) => 
  (db.delete(db.appointment) .. where ((a) => a.id.equals(id))) .go(); 
}