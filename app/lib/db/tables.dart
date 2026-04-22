import 'package:drift/drift.dart';

class Patient extends Table { // Patient Entity
// Primary Key
  IntColumn get id => integer().autoIncrement()();

// Full Name Section
  TextColumn get firstName => text()();
  TextColumn get middleName => text()();
  TextColumn get lastName => text()();

// Demographic Section
  DateTimeColumn get birthDate => dateTime()();
  TextColumn get sex => text().withLength(min: 1, max: 10)();
  TextColumn get civilStatus => text()();

// Contacts
  TextColumn get contactNumber => text().withLength(min: 10, max: 11)();
  TextColumn get emergencyContactNo => text().nullable()();
  TextColumn get referredBy => text().nullable()();
  TextColumn get relationship => text().nullable()();

// Address
  TextColumn get streetAddress => text()();
  TextColumn get barangay => text()();
  TextColumn get cityMunicipality => text()();
  TextColumn get province => text()();
  TextColumn get zipCode => text()();

// flag
BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
}

class Dentist extends Table {// Dentist Entity
// Primary Key
  IntColumn get id => integer()(); // we don't really need this, but for database purposes setting a PK for our dentist
}

class Appointment extends Table { // appointment entity
// Primary Key
  IntColumn get id => integer().autoIncrement()();

// Foreign Key
  IntColumn get patientId => integer().references(Patient, #id)();

// Schedule an Appointment
  DateTimeColumn get appointmentDate => dateTime()();
  TextColumn get timeSlot => text()(); 
  TextColumn get reasonForVisit => text()(); // will put values in the DB for this
  TextColumn get status => text().withDefault(const Constant('Scheduled'))(); // scheduled first -> confirmed -> completed
}

class Billing extends Table { // Billing Entity (Summarized Data to be displayed in the dashboard)
// Primary Key
  IntColumn get id => integer().autoIncrement()();

// Foreign Key
  IntColumn get patientId => integer().references(Patient, #id)();

// Date, Status, and Total Amount
  DateTimeColumn get dateCreated => dateTime().withDefault(currentDateAndTime)();
  RealColumn get totalAmount => real()(); 
  TextColumn get status => text().withDefault(const Constant('Unpaid'))(); // The 3 statuses' in the main page
}

class BillingItems extends Table { // Billing Entity (Non-Summarized Data)
// Primary Key
  IntColumn get id => integer().autoIncrement()();

// Foreign Key
  IntColumn get billingId => integer().references(Billing, #id)();

// Procedure Charge
  TextColumn get procedureName => text()(); 
  RealColumn get procedureCharge => real()(); 
  IntColumn get quantity => integer().withDefault(const Constant(1))();
  RealColumn get totalLineCharge => real()(); // procedureCharge * quantity
}

class DentalChart extends Table { // dental chart entity
// Primary Key
  IntColumn get id => integer().autoIncrement()(); 

// Foreign Key
  IntColumn get patientID => integer().references(Patient, #id)(); 

// Tooth Information
  IntColumn get toothNumber => integer()();
  TextColumn get surface => text()();
  TextColumn get condition => text()();

// Last Updated 
  DateTimeColumn get lastUpdated => dateTime()();
}

class TreatmentRecord extends Table { // Treatment Record Entity
// Primary Key
  IntColumn get id => integer().autoIncrement()(); 

// Foreign Key
  IntColumn get appointmentID => integer().references(Appointment, #id)(); 

// Treatment Names & Details
  IntColumn get procedureCode => integer()();
  IntColumn get toothNumber => integer()();
  TextColumn get notes => text()();
}

class ProcedureLookup extends Table { // procedurelookup entity (this is for the drop-down table soon)
// Primary Key
  IntColumn get id => integer().autoIncrement()(); 

// Other Details
  TextColumn get description => text()();
  RealColumn get baseCost => real()();
}

class ClinicalRecord extends Table {
// Primary Key
  IntColumn get id => integer().autoIncrement()();

// Link to the patient
  IntColumn get patientId => integer().references(Patient, #id)();

// Medical Background Section
  TextColumn get pastIllnesses => text().nullable()();
  TextColumn get presentIllnesses => text().nullable()();
  TextColumn get allergies => text().nullable()();
  TextColumn get currentMedication => text().nullable()();

// Treatment Section (use radio buttons here)
  BoolColumn get hasOralDebris => boolean().withDefault(const Constant(false))();
  BoolColumn get hasCalculus => boolean().withDefault(const Constant(false))();
  BoolColumn get hasGingivitis => boolean().withDefault(const Constant(false))();
  BoolColumn get hasPeriodontalPocket => boolean().withDefault(const Constant(false))();
  BoolColumn get hasDentofacialAnomaly => boolean().withDefault(const Constant(false))();

  // Tooth Count Section
  IntColumn get carriesForFilling => integer().withDefault(const Constant(0))();
  IntColumn get carriesForExtraction => integer().withDefault(const Constant(0))();
  IntColumn get rootFragment => integer().withDefault(const Constant(0))();
  IntColumn get missingDueToCaries => integer().withDefault(const Constant(0))();
  IntColumn get filledOrRestored => integer().withDefault(const Constant(0))();

  // Date of Creation for Clinical Record
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
