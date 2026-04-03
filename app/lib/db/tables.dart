import 'package:drift/drift.dart';

class Patient extends Table { // patient entity
  IntColumn get id => integer().autoIncrement()(); //pk
  TextColumn get name => text()();
  IntColumn get age => integer()();
  TextColumn get sex => text().withLength(min: 1,max: 1)(); 
  TextColumn get address => text()();
  TextColumn get contactNumber => text().withLength(min: 10, max: 10)(); // ph numbers only
}

class Dentist extends Table { // dentist entity
  IntColumn get id => integer().autoIncrement()(); // pk 
  TextColumn get name => text()();
}

class Appointment extends Table { // appointment entity
  IntColumn get id => integer().autoIncrement()(); //pk
  IntColumn get patientID => integer().references(Patient, #id)(); //fk
  IntColumn get dentistID => integer().references(Dentist, #id)(); //fk
  DateTimeColumn get scheduledAt => dateTime()(); // MM/DD/YY + HR/MN/SEC
  TextColumn get status => text().withDefault(const Constant('pending'))(); // keep this pending first
}

class Billing extends Table { // billing entity
  IntColumn get id => integer().autoIncrement()(); // pk
  IntColumn get appointmentID => integer().references(Appointment, #id)(); //fk
  RealColumn get totalAmount => real()(); 
  RealColumn get amountPaid => real()();  
  TextColumn get paymentMethod => text()();
  TextColumn get paymentStatus => text().withDefault(const Constant('pending'))(); // default should be 'pending'
}

class DentalChart extends Table { // dental chart entity
  IntColumn get id => integer().autoIncrement()(); // pk
  IntColumn get patientID => integer().references(Patient, #id)(); // fk
  IntColumn get toothNumber => integer()();
  TextColumn get surface => text()();
  TextColumn get condition => text()();
  DateTimeColumn get lastUpdated => dateTime()(); 
}

class TreatmentRecord extends Table { // treatment record entity
  IntColumn get id => integer().autoIncrement()(); // pk
  IntColumn get appointmentID => integer().references(Appointment, #id)(); // fk
  IntColumn get procedureID => integer().references(ProcedureLookup, #id)(); // fk
  IntColumn get toothNumber => integer()();
  TextColumn get notes => text()();  
}

class ProcedureLookup extends Table { // procedurelookup entity (this is for the drop-down table soon)
  IntColumn get id => integer().autoIncrement()(); // pk
  TextColumn get description => text()();
  RealColumn get baseCost => real()();
}
