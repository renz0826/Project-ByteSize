import 'package:drift/drift.dart';

class Patient extends Table { // Patient Entity
// Primary Key
  IntColumn get patientId=> integer().autoIncrement()();

// Full Name 
  TextColumn get firstName => text()();
  TextColumn get middleName => text().nullable()();
  TextColumn get lastName => text()();
  TextColumn get suffix => text().nullable()();

// Demographic ]
  DateTimeColumn get birthDate => dateTime()();
  TextColumn get sex => text().withLength(min: 1, max: 10)();
  TextColumn get civilStatus => text()();

// Contacts
  TextColumn get contactNumber => text().withLength(min: 11, max: 11)();
  TextColumn get emergencyContactNo => text().nullable()();
  TextColumn get referredBy => text().nullable()();
  TextColumn get relationship => text().nullable()();
  TextColumn get relationshipEmergency => text().nullable()();

// Address
  TextColumn get streetAddress => text()();
  TextColumn get barangay => text()();
  TextColumn get cityMunicipality => text()();
  TextColumn get province => text()();
  TextColumn get zipCode => text()();

// Flags
BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
BoolColumn get isSeniorOrPWD => boolean().withDefault(const Constant(false))();

// Metadata
DateTimeColumn get createdAt => dateTime()();
DateTimeColumn get updatedAt => dateTime()();
}

class ClinicalStaff extends Table {// Dentist and Staff Entity
// Primary Key
  IntColumn get staffId => integer()(); 

// Other Data
  TextColumn get name => text()();
  BoolColumn get isLockedOut => boolean().withDefault(const Constant(false))();
  // PIN is already located in auth_provider
}

class Appointment extends Table { // Appointment entity
// Primary Key
  IntColumn get appointmentId => integer().autoIncrement()();

// Foreign Key
  IntColumn get patientId => integer().references(Patient, #patientId)();
  IntColumn get staffId => integer().nullable().references(ClinicalStaff, #staffId)();

  // Date and Time
  DateTimeColumn get scheduleDateTime => dateTime()();

  // Reason for Visit
  TextColumn get reasonForVisit => text()();
  
  // Status (Scheduled, Completed, & Cancelled)
  TextColumn get status => text().withDefault(const Constant('Scheduled'))();

  // Time-Slot
  TextColumn get timeSlot => text()();
}

class Invoice extends Table { // Billing Entity
  // Primary Key
  IntColumn get invoiceId => integer().autoIncrement()();

  // Foreign Keys
  IntColumn get patientId => integer().references(Patient, #patientId)();
  IntColumn get chargeId => integer().references(ProcedureCharge, #chargeId)();
  IntColumn get transactionId => integer().references(PaymentTransaction, #transactionId)();

  // Issued Date
  DateTimeColumn get issuedDate => dateTime().withDefault(currentDateAndTime)();

  // Total Balance
  RealColumn get totalBalance => real()();

  // Status (Paid, Pending)
  TextColumn get status => text()();
}

class ProcedureCharge extends Table {
  // Primary Key
  IntColumn get chargeId => integer().autoIncrement()();

  // Procedure Name (Cleaning, Tightening)
  TextColumn get procedureName => text()();

  // The base price of a specific procedure
  RealColumn get procedureCharge => real()();

  // How many times this was done (1 being the default)
  IntColumn get quantity => integer().withDefault(const Constant(1))();

  // TCharge x Quantity = Total
  RealColumn get totalProcedureCharge => real()();
}

class PaymentTransaction extends Table {
// Primary Key
  IntColumn get transactionId => integer().autoIncrement()();

// The actual money paid by the patient
  RealColumn get amountReceived => real()();

// How the patient pays (cash, card, e-wallet)
  TextColumn get modeOfPayment => text()();
  
// Payment Date
  DateTimeColumn get paymentDate => dateTime().withDefault(currentDateAndTime)();
}

class ClinicalRecord extends Table {
  // Primary Key
  IntColumn get recordId => integer().autoIncrement()();

  // Foreign Key
  IntColumn get patientId => integer().references(Patient, #patientId)();

  // Timestamp
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  // Medical History 
  TextColumn get pastIllness => text().nullable()();
  TextColumn get presentIllness => text().nullable()();
  TextColumn get allergies => text().nullable()();
  TextColumn get currentMedication => text().nullable()();

  // Dental Exam 
  BoolColumn get hasOralDebris => boolean().withDefault(const Constant(false))();
  BoolColumn get hasCalculus => boolean().withDefault(const Constant(false))();
  BoolColumn get hasPeriodontalPocket => boolean().withDefault(const Constant(false))();
  BoolColumn get hasGingivitis => boolean().withDefault(const Constant(false))();
  BoolColumn get hasDentofacialAnomaly => boolean().withDefault(const Constant(false))();

  // Tooth Counters (Integers)
  IntColumn get cariesForFilling => integer().withDefault(const Constant(0))();
  IntColumn get cariesForExtraction => integer().withDefault(const Constant(0))();
  IntColumn get rootFragment => integer().withDefault(const Constant(0))();
  IntColumn get missingDueToCaries => integer().withDefault(const Constant(0))();
  IntColumn get filledOrRestored => integer().withDefault(const Constant(0))();

  // Doctor's Narrative
  TextColumn get clinicalNotes => text().nullable()();
}


