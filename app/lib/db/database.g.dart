// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PatientTable extends Patient with TableInfo<$PatientTable, PatientData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PatientTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
    'age',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<String> sex = GeneratedColumn<String>(
    'sex',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 1,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contactNumberMeta = const VerificationMeta(
    'contactNumber',
  );
  @override
  late final GeneratedColumn<String> contactNumber = GeneratedColumn<String>(
    'contact_number',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 10,
      maxTextLength: 10,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    age,
    sex,
    address,
    contactNumber,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'patient';
  @override
  VerificationContext validateIntegrity(
    Insertable<PatientData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
        _ageMeta,
        age.isAcceptableOrUnknown(data['age']!, _ageMeta),
      );
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('sex')) {
      context.handle(
        _sexMeta,
        sex.isAcceptableOrUnknown(data['sex']!, _sexMeta),
      );
    } else if (isInserting) {
      context.missing(_sexMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('contact_number')) {
      context.handle(
        _contactNumberMeta,
        contactNumber.isAcceptableOrUnknown(
          data['contact_number']!,
          _contactNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_contactNumberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PatientData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PatientData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      age: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age'],
      )!,
      sex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sex'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      contactNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contact_number'],
      )!,
    );
  }

  @override
  $PatientTable createAlias(String alias) {
    return $PatientTable(attachedDatabase, alias);
  }
}

class PatientData extends DataClass implements Insertable<PatientData> {
  final int id;
  final String name;
  final int age;
  final String sex;
  final String address;
  final String contactNumber;
  const PatientData({
    required this.id,
    required this.name,
    required this.age,
    required this.sex,
    required this.address,
    required this.contactNumber,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['age'] = Variable<int>(age);
    map['sex'] = Variable<String>(sex);
    map['address'] = Variable<String>(address);
    map['contact_number'] = Variable<String>(contactNumber);
    return map;
  }

  PatientCompanion toCompanion(bool nullToAbsent) {
    return PatientCompanion(
      id: Value(id),
      name: Value(name),
      age: Value(age),
      sex: Value(sex),
      address: Value(address),
      contactNumber: Value(contactNumber),
    );
  }

  factory PatientData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PatientData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      age: serializer.fromJson<int>(json['age']),
      sex: serializer.fromJson<String>(json['sex']),
      address: serializer.fromJson<String>(json['address']),
      contactNumber: serializer.fromJson<String>(json['contactNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'age': serializer.toJson<int>(age),
      'sex': serializer.toJson<String>(sex),
      'address': serializer.toJson<String>(address),
      'contactNumber': serializer.toJson<String>(contactNumber),
    };
  }

  PatientData copyWith({
    int? id,
    String? name,
    int? age,
    String? sex,
    String? address,
    String? contactNumber,
  }) => PatientData(
    id: id ?? this.id,
    name: name ?? this.name,
    age: age ?? this.age,
    sex: sex ?? this.sex,
    address: address ?? this.address,
    contactNumber: contactNumber ?? this.contactNumber,
  );
  PatientData copyWithCompanion(PatientCompanion data) {
    return PatientData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      age: data.age.present ? data.age.value : this.age,
      sex: data.sex.present ? data.sex.value : this.sex,
      address: data.address.present ? data.address.value : this.address,
      contactNumber: data.contactNumber.present
          ? data.contactNumber.value
          : this.contactNumber,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PatientData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('sex: $sex, ')
          ..write('address: $address, ')
          ..write('contactNumber: $contactNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, age, sex, address, contactNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PatientData &&
          other.id == this.id &&
          other.name == this.name &&
          other.age == this.age &&
          other.sex == this.sex &&
          other.address == this.address &&
          other.contactNumber == this.contactNumber);
}

class PatientCompanion extends UpdateCompanion<PatientData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> age;
  final Value<String> sex;
  final Value<String> address;
  final Value<String> contactNumber;
  const PatientCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.age = const Value.absent(),
    this.sex = const Value.absent(),
    this.address = const Value.absent(),
    this.contactNumber = const Value.absent(),
  });
  PatientCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int age,
    required String sex,
    required String address,
    required String contactNumber,
  }) : name = Value(name),
       age = Value(age),
       sex = Value(sex),
       address = Value(address),
       contactNumber = Value(contactNumber);
  static Insertable<PatientData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? age,
    Expression<String>? sex,
    Expression<String>? address,
    Expression<String>? contactNumber,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (age != null) 'age': age,
      if (sex != null) 'sex': sex,
      if (address != null) 'address': address,
      if (contactNumber != null) 'contact_number': contactNumber,
    });
  }

  PatientCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? age,
    Value<String>? sex,
    Value<String>? address,
    Value<String>? contactNumber,
  }) {
    return PatientCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      sex: sex ?? this.sex,
      address: address ?? this.address,
      contactNumber: contactNumber ?? this.contactNumber,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (sex.present) {
      map['sex'] = Variable<String>(sex.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (contactNumber.present) {
      map['contact_number'] = Variable<String>(contactNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PatientCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('sex: $sex, ')
          ..write('address: $address, ')
          ..write('contactNumber: $contactNumber')
          ..write(')'))
        .toString();
  }
}

class $DentistTable extends Dentist with TableInfo<$DentistTable, DentistData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DentistTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dentistIDMeta = const VerificationMeta(
    'dentistID',
  );
  @override
  late final GeneratedColumn<int> dentistID = GeneratedColumn<int>(
    'dentist_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [dentistID];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dentist';
  @override
  VerificationContext validateIntegrity(
    Insertable<DentistData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('dentist_i_d')) {
      context.handle(
        _dentistIDMeta,
        dentistID.isAcceptableOrUnknown(data['dentist_i_d']!, _dentistIDMeta),
      );
    } else if (isInserting) {
      context.missing(_dentistIDMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  DentistData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DentistData(
      dentistID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}dentist_i_d'],
      )!,
    );
  }

  @override
  $DentistTable createAlias(String alias) {
    return $DentistTable(attachedDatabase, alias);
  }
}

class DentistData extends DataClass implements Insertable<DentistData> {
  final int dentistID;
  const DentistData({required this.dentistID});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['dentist_i_d'] = Variable<int>(dentistID);
    return map;
  }

  DentistCompanion toCompanion(bool nullToAbsent) {
    return DentistCompanion(dentistID: Value(dentistID));
  }

  factory DentistData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DentistData(dentistID: serializer.fromJson<int>(json['dentistID']));
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'dentistID': serializer.toJson<int>(dentistID)};
  }

  DentistData copyWith({int? dentistID}) =>
      DentistData(dentistID: dentistID ?? this.dentistID);
  DentistData copyWithCompanion(DentistCompanion data) {
    return DentistData(
      dentistID: data.dentistID.present ? data.dentistID.value : this.dentistID,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DentistData(')
          ..write('dentistID: $dentistID')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => dentistID.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DentistData && other.dentistID == this.dentistID);
}

class DentistCompanion extends UpdateCompanion<DentistData> {
  final Value<int> dentistID;
  final Value<int> rowid;
  const DentistCompanion({
    this.dentistID = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DentistCompanion.insert({
    required int dentistID,
    this.rowid = const Value.absent(),
  }) : dentistID = Value(dentistID);
  static Insertable<DentistData> custom({
    Expression<int>? dentistID,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (dentistID != null) 'dentist_i_d': dentistID,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DentistCompanion copyWith({Value<int>? dentistID, Value<int>? rowid}) {
    return DentistCompanion(
      dentistID: dentistID ?? this.dentistID,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dentistID.present) {
      map['dentist_i_d'] = Variable<int>(dentistID.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DentistCompanion(')
          ..write('dentistID: $dentistID, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppointmentTable extends Appointment
    with TableInfo<$AppointmentTable, AppointmentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppointmentTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _patientIDMeta = const VerificationMeta(
    'patientID',
  );
  @override
  late final GeneratedColumn<int> patientID = GeneratedColumn<int>(
    'patient_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES patient (id)',
    ),
  );
  static const VerificationMeta _dentistIDMeta = const VerificationMeta(
    'dentistID',
  );
  @override
  late final GeneratedColumn<int> dentistID = GeneratedColumn<int>(
    'dentist_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<DateTime> time = GeneratedColumn<DateTime>(
    'time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    patientID,
    dentistID,
    date,
    time,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'appointment';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppointmentData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('patient_i_d')) {
      context.handle(
        _patientIDMeta,
        patientID.isAcceptableOrUnknown(data['patient_i_d']!, _patientIDMeta),
      );
    } else if (isInserting) {
      context.missing(_patientIDMeta);
    }
    if (data.containsKey('dentist_i_d')) {
      context.handle(
        _dentistIDMeta,
        dentistID.isAcceptableOrUnknown(data['dentist_i_d']!, _dentistIDMeta),
      );
    } else if (isInserting) {
      context.missing(_dentistIDMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
        _timeMeta,
        time.isAcceptableOrUnknown(data['time']!, _timeMeta),
      );
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppointmentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppointmentData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      patientID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}patient_i_d'],
      )!,
      dentistID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}dentist_i_d'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      time: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}time'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $AppointmentTable createAlias(String alias) {
    return $AppointmentTable(attachedDatabase, alias);
  }
}

class AppointmentData extends DataClass implements Insertable<AppointmentData> {
  final int id;
  final int patientID;
  final int dentistID;
  final DateTime date;
  final DateTime time;
  final String status;
  const AppointmentData({
    required this.id,
    required this.patientID,
    required this.dentistID,
    required this.date,
    required this.time,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['patient_i_d'] = Variable<int>(patientID);
    map['dentist_i_d'] = Variable<int>(dentistID);
    map['date'] = Variable<DateTime>(date);
    map['time'] = Variable<DateTime>(time);
    map['status'] = Variable<String>(status);
    return map;
  }

  AppointmentCompanion toCompanion(bool nullToAbsent) {
    return AppointmentCompanion(
      id: Value(id),
      patientID: Value(patientID),
      dentistID: Value(dentistID),
      date: Value(date),
      time: Value(time),
      status: Value(status),
    );
  }

  factory AppointmentData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppointmentData(
      id: serializer.fromJson<int>(json['id']),
      patientID: serializer.fromJson<int>(json['patientID']),
      dentistID: serializer.fromJson<int>(json['dentistID']),
      date: serializer.fromJson<DateTime>(json['date']),
      time: serializer.fromJson<DateTime>(json['time']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'patientID': serializer.toJson<int>(patientID),
      'dentistID': serializer.toJson<int>(dentistID),
      'date': serializer.toJson<DateTime>(date),
      'time': serializer.toJson<DateTime>(time),
      'status': serializer.toJson<String>(status),
    };
  }

  AppointmentData copyWith({
    int? id,
    int? patientID,
    int? dentistID,
    DateTime? date,
    DateTime? time,
    String? status,
  }) => AppointmentData(
    id: id ?? this.id,
    patientID: patientID ?? this.patientID,
    dentistID: dentistID ?? this.dentistID,
    date: date ?? this.date,
    time: time ?? this.time,
    status: status ?? this.status,
  );
  AppointmentData copyWithCompanion(AppointmentCompanion data) {
    return AppointmentData(
      id: data.id.present ? data.id.value : this.id,
      patientID: data.patientID.present ? data.patientID.value : this.patientID,
      dentistID: data.dentistID.present ? data.dentistID.value : this.dentistID,
      date: data.date.present ? data.date.value : this.date,
      time: data.time.present ? data.time.value : this.time,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppointmentData(')
          ..write('id: $id, ')
          ..write('patientID: $patientID, ')
          ..write('dentistID: $dentistID, ')
          ..write('date: $date, ')
          ..write('time: $time, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, patientID, dentistID, date, time, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppointmentData &&
          other.id == this.id &&
          other.patientID == this.patientID &&
          other.dentistID == this.dentistID &&
          other.date == this.date &&
          other.time == this.time &&
          other.status == this.status);
}

class AppointmentCompanion extends UpdateCompanion<AppointmentData> {
  final Value<int> id;
  final Value<int> patientID;
  final Value<int> dentistID;
  final Value<DateTime> date;
  final Value<DateTime> time;
  final Value<String> status;
  const AppointmentCompanion({
    this.id = const Value.absent(),
    this.patientID = const Value.absent(),
    this.dentistID = const Value.absent(),
    this.date = const Value.absent(),
    this.time = const Value.absent(),
    this.status = const Value.absent(),
  });
  AppointmentCompanion.insert({
    this.id = const Value.absent(),
    required int patientID,
    required int dentistID,
    required DateTime date,
    required DateTime time,
    this.status = const Value.absent(),
  }) : patientID = Value(patientID),
       dentistID = Value(dentistID),
       date = Value(date),
       time = Value(time);
  static Insertable<AppointmentData> custom({
    Expression<int>? id,
    Expression<int>? patientID,
    Expression<int>? dentistID,
    Expression<DateTime>? date,
    Expression<DateTime>? time,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientID != null) 'patient_i_d': patientID,
      if (dentistID != null) 'dentist_i_d': dentistID,
      if (date != null) 'date': date,
      if (time != null) 'time': time,
      if (status != null) 'status': status,
    });
  }

  AppointmentCompanion copyWith({
    Value<int>? id,
    Value<int>? patientID,
    Value<int>? dentistID,
    Value<DateTime>? date,
    Value<DateTime>? time,
    Value<String>? status,
  }) {
    return AppointmentCompanion(
      id: id ?? this.id,
      patientID: patientID ?? this.patientID,
      dentistID: dentistID ?? this.dentistID,
      date: date ?? this.date,
      time: time ?? this.time,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (patientID.present) {
      map['patient_i_d'] = Variable<int>(patientID.value);
    }
    if (dentistID.present) {
      map['dentist_i_d'] = Variable<int>(dentistID.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppointmentCompanion(')
          ..write('id: $id, ')
          ..write('patientID: $patientID, ')
          ..write('dentistID: $dentistID, ')
          ..write('date: $date, ')
          ..write('time: $time, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $BillingTable extends Billing with TableInfo<$BillingTable, BillingData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BillingTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _appointmentIDMeta = const VerificationMeta(
    'appointmentID',
  );
  @override
  late final GeneratedColumn<int> appointmentID = GeneratedColumn<int>(
    'appointment_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES appointment (id)',
    ),
  );
  static const VerificationMeta _totalAmountMeta = const VerificationMeta(
    'totalAmount',
  );
  @override
  late final GeneratedColumn<double> totalAmount = GeneratedColumn<double>(
    'total_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _realAmountMeta = const VerificationMeta(
    'realAmount',
  );
  @override
  late final GeneratedColumn<double> realAmount = GeneratedColumn<double>(
    'real_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paymentMethodMeta = const VerificationMeta(
    'paymentMethod',
  );
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
    'payment_method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paymentStatusMeta = const VerificationMeta(
    'paymentStatus',
  );
  @override
  late final GeneratedColumn<String> paymentStatus = GeneratedColumn<String>(
    'payment_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    appointmentID,
    totalAmount,
    realAmount,
    paymentMethod,
    paymentStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'billing';
  @override
  VerificationContext validateIntegrity(
    Insertable<BillingData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('appointment_i_d')) {
      context.handle(
        _appointmentIDMeta,
        appointmentID.isAcceptableOrUnknown(
          data['appointment_i_d']!,
          _appointmentIDMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_appointmentIDMeta);
    }
    if (data.containsKey('total_amount')) {
      context.handle(
        _totalAmountMeta,
        totalAmount.isAcceptableOrUnknown(
          data['total_amount']!,
          _totalAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalAmountMeta);
    }
    if (data.containsKey('real_amount')) {
      context.handle(
        _realAmountMeta,
        realAmount.isAcceptableOrUnknown(data['real_amount']!, _realAmountMeta),
      );
    } else if (isInserting) {
      context.missing(_realAmountMeta);
    }
    if (data.containsKey('payment_method')) {
      context.handle(
        _paymentMethodMeta,
        paymentMethod.isAcceptableOrUnknown(
          data['payment_method']!,
          _paymentMethodMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paymentMethodMeta);
    }
    if (data.containsKey('payment_status')) {
      context.handle(
        _paymentStatusMeta,
        paymentStatus.isAcceptableOrUnknown(
          data['payment_status']!,
          _paymentStatusMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BillingData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BillingData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      appointmentID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}appointment_i_d'],
      )!,
      totalAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_amount'],
      )!,
      realAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}real_amount'],
      )!,
      paymentMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_method'],
      )!,
      paymentStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_status'],
      )!,
    );
  }

  @override
  $BillingTable createAlias(String alias) {
    return $BillingTable(attachedDatabase, alias);
  }
}

class BillingData extends DataClass implements Insertable<BillingData> {
  final int id;
  final int appointmentID;
  final double totalAmount;
  final double realAmount;
  final String paymentMethod;
  final String paymentStatus;
  const BillingData({
    required this.id,
    required this.appointmentID,
    required this.totalAmount,
    required this.realAmount,
    required this.paymentMethod,
    required this.paymentStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['appointment_i_d'] = Variable<int>(appointmentID);
    map['total_amount'] = Variable<double>(totalAmount);
    map['real_amount'] = Variable<double>(realAmount);
    map['payment_method'] = Variable<String>(paymentMethod);
    map['payment_status'] = Variable<String>(paymentStatus);
    return map;
  }

  BillingCompanion toCompanion(bool nullToAbsent) {
    return BillingCompanion(
      id: Value(id),
      appointmentID: Value(appointmentID),
      totalAmount: Value(totalAmount),
      realAmount: Value(realAmount),
      paymentMethod: Value(paymentMethod),
      paymentStatus: Value(paymentStatus),
    );
  }

  factory BillingData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BillingData(
      id: serializer.fromJson<int>(json['id']),
      appointmentID: serializer.fromJson<int>(json['appointmentID']),
      totalAmount: serializer.fromJson<double>(json['totalAmount']),
      realAmount: serializer.fromJson<double>(json['realAmount']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      paymentStatus: serializer.fromJson<String>(json['paymentStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'appointmentID': serializer.toJson<int>(appointmentID),
      'totalAmount': serializer.toJson<double>(totalAmount),
      'realAmount': serializer.toJson<double>(realAmount),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'paymentStatus': serializer.toJson<String>(paymentStatus),
    };
  }

  BillingData copyWith({
    int? id,
    int? appointmentID,
    double? totalAmount,
    double? realAmount,
    String? paymentMethod,
    String? paymentStatus,
  }) => BillingData(
    id: id ?? this.id,
    appointmentID: appointmentID ?? this.appointmentID,
    totalAmount: totalAmount ?? this.totalAmount,
    realAmount: realAmount ?? this.realAmount,
    paymentMethod: paymentMethod ?? this.paymentMethod,
    paymentStatus: paymentStatus ?? this.paymentStatus,
  );
  BillingData copyWithCompanion(BillingCompanion data) {
    return BillingData(
      id: data.id.present ? data.id.value : this.id,
      appointmentID: data.appointmentID.present
          ? data.appointmentID.value
          : this.appointmentID,
      totalAmount: data.totalAmount.present
          ? data.totalAmount.value
          : this.totalAmount,
      realAmount: data.realAmount.present
          ? data.realAmount.value
          : this.realAmount,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      paymentStatus: data.paymentStatus.present
          ? data.paymentStatus.value
          : this.paymentStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BillingData(')
          ..write('id: $id, ')
          ..write('appointmentID: $appointmentID, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('realAmount: $realAmount, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('paymentStatus: $paymentStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    appointmentID,
    totalAmount,
    realAmount,
    paymentMethod,
    paymentStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BillingData &&
          other.id == this.id &&
          other.appointmentID == this.appointmentID &&
          other.totalAmount == this.totalAmount &&
          other.realAmount == this.realAmount &&
          other.paymentMethod == this.paymentMethod &&
          other.paymentStatus == this.paymentStatus);
}

class BillingCompanion extends UpdateCompanion<BillingData> {
  final Value<int> id;
  final Value<int> appointmentID;
  final Value<double> totalAmount;
  final Value<double> realAmount;
  final Value<String> paymentMethod;
  final Value<String> paymentStatus;
  const BillingCompanion({
    this.id = const Value.absent(),
    this.appointmentID = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.realAmount = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.paymentStatus = const Value.absent(),
  });
  BillingCompanion.insert({
    this.id = const Value.absent(),
    required int appointmentID,
    required double totalAmount,
    required double realAmount,
    required String paymentMethod,
    this.paymentStatus = const Value.absent(),
  }) : appointmentID = Value(appointmentID),
       totalAmount = Value(totalAmount),
       realAmount = Value(realAmount),
       paymentMethod = Value(paymentMethod);
  static Insertable<BillingData> custom({
    Expression<int>? id,
    Expression<int>? appointmentID,
    Expression<double>? totalAmount,
    Expression<double>? realAmount,
    Expression<String>? paymentMethod,
    Expression<String>? paymentStatus,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (appointmentID != null) 'appointment_i_d': appointmentID,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (realAmount != null) 'real_amount': realAmount,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (paymentStatus != null) 'payment_status': paymentStatus,
    });
  }

  BillingCompanion copyWith({
    Value<int>? id,
    Value<int>? appointmentID,
    Value<double>? totalAmount,
    Value<double>? realAmount,
    Value<String>? paymentMethod,
    Value<String>? paymentStatus,
  }) {
    return BillingCompanion(
      id: id ?? this.id,
      appointmentID: appointmentID ?? this.appointmentID,
      totalAmount: totalAmount ?? this.totalAmount,
      realAmount: realAmount ?? this.realAmount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentStatus: paymentStatus ?? this.paymentStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (appointmentID.present) {
      map['appointment_i_d'] = Variable<int>(appointmentID.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<double>(totalAmount.value);
    }
    if (realAmount.present) {
      map['real_amount'] = Variable<double>(realAmount.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (paymentStatus.present) {
      map['payment_status'] = Variable<String>(paymentStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BillingCompanion(')
          ..write('id: $id, ')
          ..write('appointmentID: $appointmentID, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('realAmount: $realAmount, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('paymentStatus: $paymentStatus')
          ..write(')'))
        .toString();
  }
}

class $DentalChartTable extends DentalChart
    with TableInfo<$DentalChartTable, DentalChartData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DentalChartTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _patientIDMeta = const VerificationMeta(
    'patientID',
  );
  @override
  late final GeneratedColumn<int> patientID = GeneratedColumn<int>(
    'patient_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES patient (id)',
    ),
  );
  static const VerificationMeta _toothNumberMeta = const VerificationMeta(
    'toothNumber',
  );
  @override
  late final GeneratedColumn<int> toothNumber = GeneratedColumn<int>(
    'tooth_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _surfaceMeta = const VerificationMeta(
    'surface',
  );
  @override
  late final GeneratedColumn<String> surface = GeneratedColumn<String>(
    'surface',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _conditionMeta = const VerificationMeta(
    'condition',
  );
  @override
  late final GeneratedColumn<String> condition = GeneratedColumn<String>(
    'condition',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastUpdatedMeta = const VerificationMeta(
    'lastUpdated',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
    'last_updated',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    patientID,
    toothNumber,
    surface,
    condition,
    lastUpdated,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dental_chart';
  @override
  VerificationContext validateIntegrity(
    Insertable<DentalChartData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('patient_i_d')) {
      context.handle(
        _patientIDMeta,
        patientID.isAcceptableOrUnknown(data['patient_i_d']!, _patientIDMeta),
      );
    } else if (isInserting) {
      context.missing(_patientIDMeta);
    }
    if (data.containsKey('tooth_number')) {
      context.handle(
        _toothNumberMeta,
        toothNumber.isAcceptableOrUnknown(
          data['tooth_number']!,
          _toothNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_toothNumberMeta);
    }
    if (data.containsKey('surface')) {
      context.handle(
        _surfaceMeta,
        surface.isAcceptableOrUnknown(data['surface']!, _surfaceMeta),
      );
    } else if (isInserting) {
      context.missing(_surfaceMeta);
    }
    if (data.containsKey('condition')) {
      context.handle(
        _conditionMeta,
        condition.isAcceptableOrUnknown(data['condition']!, _conditionMeta),
      );
    } else if (isInserting) {
      context.missing(_conditionMeta);
    }
    if (data.containsKey('last_updated')) {
      context.handle(
        _lastUpdatedMeta,
        lastUpdated.isAcceptableOrUnknown(
          data['last_updated']!,
          _lastUpdatedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastUpdatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DentalChartData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DentalChartData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      patientID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}patient_i_d'],
      )!,
      toothNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tooth_number'],
      )!,
      surface: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}surface'],
      )!,
      condition: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}condition'],
      )!,
      lastUpdated: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated'],
      )!,
    );
  }

  @override
  $DentalChartTable createAlias(String alias) {
    return $DentalChartTable(attachedDatabase, alias);
  }
}

class DentalChartData extends DataClass implements Insertable<DentalChartData> {
  final int id;
  final int patientID;
  final int toothNumber;
  final String surface;
  final String condition;
  final DateTime lastUpdated;
  const DentalChartData({
    required this.id,
    required this.patientID,
    required this.toothNumber,
    required this.surface,
    required this.condition,
    required this.lastUpdated,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['patient_i_d'] = Variable<int>(patientID);
    map['tooth_number'] = Variable<int>(toothNumber);
    map['surface'] = Variable<String>(surface);
    map['condition'] = Variable<String>(condition);
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    return map;
  }

  DentalChartCompanion toCompanion(bool nullToAbsent) {
    return DentalChartCompanion(
      id: Value(id),
      patientID: Value(patientID),
      toothNumber: Value(toothNumber),
      surface: Value(surface),
      condition: Value(condition),
      lastUpdated: Value(lastUpdated),
    );
  }

  factory DentalChartData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DentalChartData(
      id: serializer.fromJson<int>(json['id']),
      patientID: serializer.fromJson<int>(json['patientID']),
      toothNumber: serializer.fromJson<int>(json['toothNumber']),
      surface: serializer.fromJson<String>(json['surface']),
      condition: serializer.fromJson<String>(json['condition']),
      lastUpdated: serializer.fromJson<DateTime>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'patientID': serializer.toJson<int>(patientID),
      'toothNumber': serializer.toJson<int>(toothNumber),
      'surface': serializer.toJson<String>(surface),
      'condition': serializer.toJson<String>(condition),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
    };
  }

  DentalChartData copyWith({
    int? id,
    int? patientID,
    int? toothNumber,
    String? surface,
    String? condition,
    DateTime? lastUpdated,
  }) => DentalChartData(
    id: id ?? this.id,
    patientID: patientID ?? this.patientID,
    toothNumber: toothNumber ?? this.toothNumber,
    surface: surface ?? this.surface,
    condition: condition ?? this.condition,
    lastUpdated: lastUpdated ?? this.lastUpdated,
  );
  DentalChartData copyWithCompanion(DentalChartCompanion data) {
    return DentalChartData(
      id: data.id.present ? data.id.value : this.id,
      patientID: data.patientID.present ? data.patientID.value : this.patientID,
      toothNumber: data.toothNumber.present
          ? data.toothNumber.value
          : this.toothNumber,
      surface: data.surface.present ? data.surface.value : this.surface,
      condition: data.condition.present ? data.condition.value : this.condition,
      lastUpdated: data.lastUpdated.present
          ? data.lastUpdated.value
          : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DentalChartData(')
          ..write('id: $id, ')
          ..write('patientID: $patientID, ')
          ..write('toothNumber: $toothNumber, ')
          ..write('surface: $surface, ')
          ..write('condition: $condition, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, patientID, toothNumber, surface, condition, lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DentalChartData &&
          other.id == this.id &&
          other.patientID == this.patientID &&
          other.toothNumber == this.toothNumber &&
          other.surface == this.surface &&
          other.condition == this.condition &&
          other.lastUpdated == this.lastUpdated);
}

class DentalChartCompanion extends UpdateCompanion<DentalChartData> {
  final Value<int> id;
  final Value<int> patientID;
  final Value<int> toothNumber;
  final Value<String> surface;
  final Value<String> condition;
  final Value<DateTime> lastUpdated;
  const DentalChartCompanion({
    this.id = const Value.absent(),
    this.patientID = const Value.absent(),
    this.toothNumber = const Value.absent(),
    this.surface = const Value.absent(),
    this.condition = const Value.absent(),
    this.lastUpdated = const Value.absent(),
  });
  DentalChartCompanion.insert({
    this.id = const Value.absent(),
    required int patientID,
    required int toothNumber,
    required String surface,
    required String condition,
    required DateTime lastUpdated,
  }) : patientID = Value(patientID),
       toothNumber = Value(toothNumber),
       surface = Value(surface),
       condition = Value(condition),
       lastUpdated = Value(lastUpdated);
  static Insertable<DentalChartData> custom({
    Expression<int>? id,
    Expression<int>? patientID,
    Expression<int>? toothNumber,
    Expression<String>? surface,
    Expression<String>? condition,
    Expression<DateTime>? lastUpdated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientID != null) 'patient_i_d': patientID,
      if (toothNumber != null) 'tooth_number': toothNumber,
      if (surface != null) 'surface': surface,
      if (condition != null) 'condition': condition,
      if (lastUpdated != null) 'last_updated': lastUpdated,
    });
  }

  DentalChartCompanion copyWith({
    Value<int>? id,
    Value<int>? patientID,
    Value<int>? toothNumber,
    Value<String>? surface,
    Value<String>? condition,
    Value<DateTime>? lastUpdated,
  }) {
    return DentalChartCompanion(
      id: id ?? this.id,
      patientID: patientID ?? this.patientID,
      toothNumber: toothNumber ?? this.toothNumber,
      surface: surface ?? this.surface,
      condition: condition ?? this.condition,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (patientID.present) {
      map['patient_i_d'] = Variable<int>(patientID.value);
    }
    if (toothNumber.present) {
      map['tooth_number'] = Variable<int>(toothNumber.value);
    }
    if (surface.present) {
      map['surface'] = Variable<String>(surface.value);
    }
    if (condition.present) {
      map['condition'] = Variable<String>(condition.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DentalChartCompanion(')
          ..write('id: $id, ')
          ..write('patientID: $patientID, ')
          ..write('toothNumber: $toothNumber, ')
          ..write('surface: $surface, ')
          ..write('condition: $condition, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }
}

class $TreatmentRecordTable extends TreatmentRecord
    with TableInfo<$TreatmentRecordTable, TreatmentRecordData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TreatmentRecordTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _appointmentIDMeta = const VerificationMeta(
    'appointmentID',
  );
  @override
  late final GeneratedColumn<int> appointmentID = GeneratedColumn<int>(
    'appointment_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES appointment (id)',
    ),
  );
  static const VerificationMeta _procedureCodeMeta = const VerificationMeta(
    'procedureCode',
  );
  @override
  late final GeneratedColumn<int> procedureCode = GeneratedColumn<int>(
    'procedure_code',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _toothNumberMeta = const VerificationMeta(
    'toothNumber',
  );
  @override
  late final GeneratedColumn<int> toothNumber = GeneratedColumn<int>(
    'tooth_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    appointmentID,
    procedureCode,
    toothNumber,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'treatment_record';
  @override
  VerificationContext validateIntegrity(
    Insertable<TreatmentRecordData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('appointment_i_d')) {
      context.handle(
        _appointmentIDMeta,
        appointmentID.isAcceptableOrUnknown(
          data['appointment_i_d']!,
          _appointmentIDMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_appointmentIDMeta);
    }
    if (data.containsKey('procedure_code')) {
      context.handle(
        _procedureCodeMeta,
        procedureCode.isAcceptableOrUnknown(
          data['procedure_code']!,
          _procedureCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_procedureCodeMeta);
    }
    if (data.containsKey('tooth_number')) {
      context.handle(
        _toothNumberMeta,
        toothNumber.isAcceptableOrUnknown(
          data['tooth_number']!,
          _toothNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_toothNumberMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    } else if (isInserting) {
      context.missing(_notesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TreatmentRecordData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TreatmentRecordData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      appointmentID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}appointment_i_d'],
      )!,
      procedureCode: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}procedure_code'],
      )!,
      toothNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tooth_number'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
    );
  }

  @override
  $TreatmentRecordTable createAlias(String alias) {
    return $TreatmentRecordTable(attachedDatabase, alias);
  }
}

class TreatmentRecordData extends DataClass
    implements Insertable<TreatmentRecordData> {
  final int id;
  final int appointmentID;
  final int procedureCode;
  final int toothNumber;
  final String notes;
  const TreatmentRecordData({
    required this.id,
    required this.appointmentID,
    required this.procedureCode,
    required this.toothNumber,
    required this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['appointment_i_d'] = Variable<int>(appointmentID);
    map['procedure_code'] = Variable<int>(procedureCode);
    map['tooth_number'] = Variable<int>(toothNumber);
    map['notes'] = Variable<String>(notes);
    return map;
  }

  TreatmentRecordCompanion toCompanion(bool nullToAbsent) {
    return TreatmentRecordCompanion(
      id: Value(id),
      appointmentID: Value(appointmentID),
      procedureCode: Value(procedureCode),
      toothNumber: Value(toothNumber),
      notes: Value(notes),
    );
  }

  factory TreatmentRecordData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TreatmentRecordData(
      id: serializer.fromJson<int>(json['id']),
      appointmentID: serializer.fromJson<int>(json['appointmentID']),
      procedureCode: serializer.fromJson<int>(json['procedureCode']),
      toothNumber: serializer.fromJson<int>(json['toothNumber']),
      notes: serializer.fromJson<String>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'appointmentID': serializer.toJson<int>(appointmentID),
      'procedureCode': serializer.toJson<int>(procedureCode),
      'toothNumber': serializer.toJson<int>(toothNumber),
      'notes': serializer.toJson<String>(notes),
    };
  }

  TreatmentRecordData copyWith({
    int? id,
    int? appointmentID,
    int? procedureCode,
    int? toothNumber,
    String? notes,
  }) => TreatmentRecordData(
    id: id ?? this.id,
    appointmentID: appointmentID ?? this.appointmentID,
    procedureCode: procedureCode ?? this.procedureCode,
    toothNumber: toothNumber ?? this.toothNumber,
    notes: notes ?? this.notes,
  );
  TreatmentRecordData copyWithCompanion(TreatmentRecordCompanion data) {
    return TreatmentRecordData(
      id: data.id.present ? data.id.value : this.id,
      appointmentID: data.appointmentID.present
          ? data.appointmentID.value
          : this.appointmentID,
      procedureCode: data.procedureCode.present
          ? data.procedureCode.value
          : this.procedureCode,
      toothNumber: data.toothNumber.present
          ? data.toothNumber.value
          : this.toothNumber,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TreatmentRecordData(')
          ..write('id: $id, ')
          ..write('appointmentID: $appointmentID, ')
          ..write('procedureCode: $procedureCode, ')
          ..write('toothNumber: $toothNumber, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, appointmentID, procedureCode, toothNumber, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TreatmentRecordData &&
          other.id == this.id &&
          other.appointmentID == this.appointmentID &&
          other.procedureCode == this.procedureCode &&
          other.toothNumber == this.toothNumber &&
          other.notes == this.notes);
}

class TreatmentRecordCompanion extends UpdateCompanion<TreatmentRecordData> {
  final Value<int> id;
  final Value<int> appointmentID;
  final Value<int> procedureCode;
  final Value<int> toothNumber;
  final Value<String> notes;
  const TreatmentRecordCompanion({
    this.id = const Value.absent(),
    this.appointmentID = const Value.absent(),
    this.procedureCode = const Value.absent(),
    this.toothNumber = const Value.absent(),
    this.notes = const Value.absent(),
  });
  TreatmentRecordCompanion.insert({
    this.id = const Value.absent(),
    required int appointmentID,
    required int procedureCode,
    required int toothNumber,
    required String notes,
  }) : appointmentID = Value(appointmentID),
       procedureCode = Value(procedureCode),
       toothNumber = Value(toothNumber),
       notes = Value(notes);
  static Insertable<TreatmentRecordData> custom({
    Expression<int>? id,
    Expression<int>? appointmentID,
    Expression<int>? procedureCode,
    Expression<int>? toothNumber,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (appointmentID != null) 'appointment_i_d': appointmentID,
      if (procedureCode != null) 'procedure_code': procedureCode,
      if (toothNumber != null) 'tooth_number': toothNumber,
      if (notes != null) 'notes': notes,
    });
  }

  TreatmentRecordCompanion copyWith({
    Value<int>? id,
    Value<int>? appointmentID,
    Value<int>? procedureCode,
    Value<int>? toothNumber,
    Value<String>? notes,
  }) {
    return TreatmentRecordCompanion(
      id: id ?? this.id,
      appointmentID: appointmentID ?? this.appointmentID,
      procedureCode: procedureCode ?? this.procedureCode,
      toothNumber: toothNumber ?? this.toothNumber,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (appointmentID.present) {
      map['appointment_i_d'] = Variable<int>(appointmentID.value);
    }
    if (procedureCode.present) {
      map['procedure_code'] = Variable<int>(procedureCode.value);
    }
    if (toothNumber.present) {
      map['tooth_number'] = Variable<int>(toothNumber.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TreatmentRecordCompanion(')
          ..write('id: $id, ')
          ..write('appointmentID: $appointmentID, ')
          ..write('procedureCode: $procedureCode, ')
          ..write('toothNumber: $toothNumber, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PatientTable patient = $PatientTable(this);
  late final $DentistTable dentist = $DentistTable(this);
  late final $AppointmentTable appointment = $AppointmentTable(this);
  late final $BillingTable billing = $BillingTable(this);
  late final $DentalChartTable dentalChart = $DentalChartTable(this);
  late final $TreatmentRecordTable treatmentRecord = $TreatmentRecordTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    patient,
    dentist,
    appointment,
    billing,
    dentalChart,
    treatmentRecord,
  ];
}

typedef $$PatientTableCreateCompanionBuilder =
    PatientCompanion Function({
      Value<int> id,
      required String name,
      required int age,
      required String sex,
      required String address,
      required String contactNumber,
    });
typedef $$PatientTableUpdateCompanionBuilder =
    PatientCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> age,
      Value<String> sex,
      Value<String> address,
      Value<String> contactNumber,
    });

final class $$PatientTableReferences
    extends BaseReferences<_$AppDatabase, $PatientTable, PatientData> {
  $$PatientTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AppointmentTable, List<AppointmentData>>
  _appointmentRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.appointment,
    aliasName: $_aliasNameGenerator(db.patient.id, db.appointment.patientID),
  );

  $$AppointmentTableProcessedTableManager get appointmentRefs {
    final manager = $$AppointmentTableTableManager(
      $_db,
      $_db.appointment,
    ).filter((f) => f.patientID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_appointmentRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DentalChartTable, List<DentalChartData>>
  _dentalChartRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dentalChart,
    aliasName: $_aliasNameGenerator(db.patient.id, db.dentalChart.patientID),
  );

  $$DentalChartTableProcessedTableManager get dentalChartRefs {
    final manager = $$DentalChartTableTableManager(
      $_db,
      $_db.dentalChart,
    ).filter((f) => f.patientID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_dentalChartRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PatientTableFilterComposer
    extends Composer<_$AppDatabase, $PatientTable> {
  $$PatientTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contactNumber => $composableBuilder(
    column: $table.contactNumber,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> appointmentRefs(
    Expression<bool> Function($$AppointmentTableFilterComposer f) f,
  ) {
    final $$AppointmentTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.appointment,
      getReferencedColumn: (t) => t.patientID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppointmentTableFilterComposer(
            $db: $db,
            $table: $db.appointment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> dentalChartRefs(
    Expression<bool> Function($$DentalChartTableFilterComposer f) f,
  ) {
    final $$DentalChartTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dentalChart,
      getReferencedColumn: (t) => t.patientID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DentalChartTableFilterComposer(
            $db: $db,
            $table: $db.dentalChart,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PatientTableOrderingComposer
    extends Composer<_$AppDatabase, $PatientTable> {
  $$PatientTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contactNumber => $composableBuilder(
    column: $table.contactNumber,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PatientTableAnnotationComposer
    extends Composer<_$AppDatabase, $PatientTable> {
  $$PatientTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<String> get sex =>
      $composableBuilder(column: $table.sex, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get contactNumber => $composableBuilder(
    column: $table.contactNumber,
    builder: (column) => column,
  );

  Expression<T> appointmentRefs<T extends Object>(
    Expression<T> Function($$AppointmentTableAnnotationComposer a) f,
  ) {
    final $$AppointmentTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.appointment,
      getReferencedColumn: (t) => t.patientID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppointmentTableAnnotationComposer(
            $db: $db,
            $table: $db.appointment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> dentalChartRefs<T extends Object>(
    Expression<T> Function($$DentalChartTableAnnotationComposer a) f,
  ) {
    final $$DentalChartTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dentalChart,
      getReferencedColumn: (t) => t.patientID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DentalChartTableAnnotationComposer(
            $db: $db,
            $table: $db.dentalChart,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PatientTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PatientTable,
          PatientData,
          $$PatientTableFilterComposer,
          $$PatientTableOrderingComposer,
          $$PatientTableAnnotationComposer,
          $$PatientTableCreateCompanionBuilder,
          $$PatientTableUpdateCompanionBuilder,
          (PatientData, $$PatientTableReferences),
          PatientData,
          PrefetchHooks Function({bool appointmentRefs, bool dentalChartRefs})
        > {
  $$PatientTableTableManager(_$AppDatabase db, $PatientTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PatientTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PatientTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PatientTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> age = const Value.absent(),
                Value<String> sex = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> contactNumber = const Value.absent(),
              }) => PatientCompanion(
                id: id,
                name: name,
                age: age,
                sex: sex,
                address: address,
                contactNumber: contactNumber,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int age,
                required String sex,
                required String address,
                required String contactNumber,
              }) => PatientCompanion.insert(
                id: id,
                name: name,
                age: age,
                sex: sex,
                address: address,
                contactNumber: contactNumber,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PatientTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({appointmentRefs = false, dentalChartRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (appointmentRefs) db.appointment,
                    if (dentalChartRefs) db.dentalChart,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (appointmentRefs)
                        await $_getPrefetchedData<
                          PatientData,
                          $PatientTable,
                          AppointmentData
                        >(
                          currentTable: table,
                          referencedTable: $$PatientTableReferences
                              ._appointmentRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PatientTableReferences(
                                db,
                                table,
                                p0,
                              ).appointmentRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.patientID == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (dentalChartRefs)
                        await $_getPrefetchedData<
                          PatientData,
                          $PatientTable,
                          DentalChartData
                        >(
                          currentTable: table,
                          referencedTable: $$PatientTableReferences
                              ._dentalChartRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PatientTableReferences(
                                db,
                                table,
                                p0,
                              ).dentalChartRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.patientID == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PatientTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PatientTable,
      PatientData,
      $$PatientTableFilterComposer,
      $$PatientTableOrderingComposer,
      $$PatientTableAnnotationComposer,
      $$PatientTableCreateCompanionBuilder,
      $$PatientTableUpdateCompanionBuilder,
      (PatientData, $$PatientTableReferences),
      PatientData,
      PrefetchHooks Function({bool appointmentRefs, bool dentalChartRefs})
    >;
typedef $$DentistTableCreateCompanionBuilder =
    DentistCompanion Function({required int dentistID, Value<int> rowid});
typedef $$DentistTableUpdateCompanionBuilder =
    DentistCompanion Function({Value<int> dentistID, Value<int> rowid});

class $$DentistTableFilterComposer
    extends Composer<_$AppDatabase, $DentistTable> {
  $$DentistTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get dentistID => $composableBuilder(
    column: $table.dentistID,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DentistTableOrderingComposer
    extends Composer<_$AppDatabase, $DentistTable> {
  $$DentistTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get dentistID => $composableBuilder(
    column: $table.dentistID,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DentistTableAnnotationComposer
    extends Composer<_$AppDatabase, $DentistTable> {
  $$DentistTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get dentistID =>
      $composableBuilder(column: $table.dentistID, builder: (column) => column);
}

class $$DentistTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DentistTable,
          DentistData,
          $$DentistTableFilterComposer,
          $$DentistTableOrderingComposer,
          $$DentistTableAnnotationComposer,
          $$DentistTableCreateCompanionBuilder,
          $$DentistTableUpdateCompanionBuilder,
          (
            DentistData,
            BaseReferences<_$AppDatabase, $DentistTable, DentistData>,
          ),
          DentistData,
          PrefetchHooks Function()
        > {
  $$DentistTableTableManager(_$AppDatabase db, $DentistTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DentistTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DentistTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DentistTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> dentistID = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DentistCompanion(dentistID: dentistID, rowid: rowid),
          createCompanionCallback:
              ({
                required int dentistID,
                Value<int> rowid = const Value.absent(),
              }) => DentistCompanion.insert(dentistID: dentistID, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DentistTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DentistTable,
      DentistData,
      $$DentistTableFilterComposer,
      $$DentistTableOrderingComposer,
      $$DentistTableAnnotationComposer,
      $$DentistTableCreateCompanionBuilder,
      $$DentistTableUpdateCompanionBuilder,
      (DentistData, BaseReferences<_$AppDatabase, $DentistTable, DentistData>),
      DentistData,
      PrefetchHooks Function()
    >;
typedef $$AppointmentTableCreateCompanionBuilder =
    AppointmentCompanion Function({
      Value<int> id,
      required int patientID,
      required int dentistID,
      required DateTime date,
      required DateTime time,
      Value<String> status,
    });
typedef $$AppointmentTableUpdateCompanionBuilder =
    AppointmentCompanion Function({
      Value<int> id,
      Value<int> patientID,
      Value<int> dentistID,
      Value<DateTime> date,
      Value<DateTime> time,
      Value<String> status,
    });

final class $$AppointmentTableReferences
    extends BaseReferences<_$AppDatabase, $AppointmentTable, AppointmentData> {
  $$AppointmentTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PatientTable _patientIDTable(_$AppDatabase db) =>
      db.patient.createAlias(
        $_aliasNameGenerator(db.appointment.patientID, db.patient.id),
      );

  $$PatientTableProcessedTableManager get patientID {
    final $_column = $_itemColumn<int>('patient_i_d')!;

    final manager = $$PatientTableTableManager(
      $_db,
      $_db.patient,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_patientIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$BillingTable, List<BillingData>>
  _billingRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.billing,
    aliasName: $_aliasNameGenerator(
      db.appointment.id,
      db.billing.appointmentID,
    ),
  );

  $$BillingTableProcessedTableManager get billingRefs {
    final manager = $$BillingTableTableManager(
      $_db,
      $_db.billing,
    ).filter((f) => f.appointmentID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_billingRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TreatmentRecordTable, List<TreatmentRecordData>>
  _treatmentRecordRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.treatmentRecord,
    aliasName: $_aliasNameGenerator(
      db.appointment.id,
      db.treatmentRecord.appointmentID,
    ),
  );

  $$TreatmentRecordTableProcessedTableManager get treatmentRecordRefs {
    final manager = $$TreatmentRecordTableTableManager(
      $_db,
      $_db.treatmentRecord,
    ).filter((f) => f.appointmentID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _treatmentRecordRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AppointmentTableFilterComposer
    extends Composer<_$AppDatabase, $AppointmentTable> {
  $$AppointmentTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dentistID => $composableBuilder(
    column: $table.dentistID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  $$PatientTableFilterComposer get patientID {
    final $$PatientTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patientID,
      referencedTable: $db.patient,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientTableFilterComposer(
            $db: $db,
            $table: $db.patient,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> billingRefs(
    Expression<bool> Function($$BillingTableFilterComposer f) f,
  ) {
    final $$BillingTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.billing,
      getReferencedColumn: (t) => t.appointmentID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BillingTableFilterComposer(
            $db: $db,
            $table: $db.billing,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> treatmentRecordRefs(
    Expression<bool> Function($$TreatmentRecordTableFilterComposer f) f,
  ) {
    final $$TreatmentRecordTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.treatmentRecord,
      getReferencedColumn: (t) => t.appointmentID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TreatmentRecordTableFilterComposer(
            $db: $db,
            $table: $db.treatmentRecord,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AppointmentTableOrderingComposer
    extends Composer<_$AppDatabase, $AppointmentTable> {
  $$AppointmentTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dentistID => $composableBuilder(
    column: $table.dentistID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  $$PatientTableOrderingComposer get patientID {
    final $$PatientTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patientID,
      referencedTable: $db.patient,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientTableOrderingComposer(
            $db: $db,
            $table: $db.patient,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AppointmentTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppointmentTable> {
  $$AppointmentTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get dentistID =>
      $composableBuilder(column: $table.dentistID, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$PatientTableAnnotationComposer get patientID {
    final $$PatientTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patientID,
      referencedTable: $db.patient,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientTableAnnotationComposer(
            $db: $db,
            $table: $db.patient,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> billingRefs<T extends Object>(
    Expression<T> Function($$BillingTableAnnotationComposer a) f,
  ) {
    final $$BillingTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.billing,
      getReferencedColumn: (t) => t.appointmentID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BillingTableAnnotationComposer(
            $db: $db,
            $table: $db.billing,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> treatmentRecordRefs<T extends Object>(
    Expression<T> Function($$TreatmentRecordTableAnnotationComposer a) f,
  ) {
    final $$TreatmentRecordTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.treatmentRecord,
      getReferencedColumn: (t) => t.appointmentID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TreatmentRecordTableAnnotationComposer(
            $db: $db,
            $table: $db.treatmentRecord,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AppointmentTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppointmentTable,
          AppointmentData,
          $$AppointmentTableFilterComposer,
          $$AppointmentTableOrderingComposer,
          $$AppointmentTableAnnotationComposer,
          $$AppointmentTableCreateCompanionBuilder,
          $$AppointmentTableUpdateCompanionBuilder,
          (AppointmentData, $$AppointmentTableReferences),
          AppointmentData,
          PrefetchHooks Function({
            bool patientID,
            bool billingRefs,
            bool treatmentRecordRefs,
          })
        > {
  $$AppointmentTableTableManager(_$AppDatabase db, $AppointmentTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppointmentTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppointmentTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppointmentTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> patientID = const Value.absent(),
                Value<int> dentistID = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<DateTime> time = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => AppointmentCompanion(
                id: id,
                patientID: patientID,
                dentistID: dentistID,
                date: date,
                time: time,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int patientID,
                required int dentistID,
                required DateTime date,
                required DateTime time,
                Value<String> status = const Value.absent(),
              }) => AppointmentCompanion.insert(
                id: id,
                patientID: patientID,
                dentistID: dentistID,
                date: date,
                time: time,
                status: status,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AppointmentTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                patientID = false,
                billingRefs = false,
                treatmentRecordRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (billingRefs) db.billing,
                    if (treatmentRecordRefs) db.treatmentRecord,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (patientID) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.patientID,
                                    referencedTable:
                                        $$AppointmentTableReferences
                                            ._patientIDTable(db),
                                    referencedColumn:
                                        $$AppointmentTableReferences
                                            ._patientIDTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (billingRefs)
                        await $_getPrefetchedData<
                          AppointmentData,
                          $AppointmentTable,
                          BillingData
                        >(
                          currentTable: table,
                          referencedTable: $$AppointmentTableReferences
                              ._billingRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AppointmentTableReferences(
                                db,
                                table,
                                p0,
                              ).billingRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.appointmentID == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (treatmentRecordRefs)
                        await $_getPrefetchedData<
                          AppointmentData,
                          $AppointmentTable,
                          TreatmentRecordData
                        >(
                          currentTable: table,
                          referencedTable: $$AppointmentTableReferences
                              ._treatmentRecordRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AppointmentTableReferences(
                                db,
                                table,
                                p0,
                              ).treatmentRecordRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.appointmentID == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$AppointmentTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppointmentTable,
      AppointmentData,
      $$AppointmentTableFilterComposer,
      $$AppointmentTableOrderingComposer,
      $$AppointmentTableAnnotationComposer,
      $$AppointmentTableCreateCompanionBuilder,
      $$AppointmentTableUpdateCompanionBuilder,
      (AppointmentData, $$AppointmentTableReferences),
      AppointmentData,
      PrefetchHooks Function({
        bool patientID,
        bool billingRefs,
        bool treatmentRecordRefs,
      })
    >;
typedef $$BillingTableCreateCompanionBuilder =
    BillingCompanion Function({
      Value<int> id,
      required int appointmentID,
      required double totalAmount,
      required double realAmount,
      required String paymentMethod,
      Value<String> paymentStatus,
    });
typedef $$BillingTableUpdateCompanionBuilder =
    BillingCompanion Function({
      Value<int> id,
      Value<int> appointmentID,
      Value<double> totalAmount,
      Value<double> realAmount,
      Value<String> paymentMethod,
      Value<String> paymentStatus,
    });

final class $$BillingTableReferences
    extends BaseReferences<_$AppDatabase, $BillingTable, BillingData> {
  $$BillingTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AppointmentTable _appointmentIDTable(_$AppDatabase db) =>
      db.appointment.createAlias(
        $_aliasNameGenerator(db.billing.appointmentID, db.appointment.id),
      );

  $$AppointmentTableProcessedTableManager get appointmentID {
    final $_column = $_itemColumn<int>('appointment_i_d')!;

    final manager = $$AppointmentTableTableManager(
      $_db,
      $_db.appointment,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_appointmentIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BillingTableFilterComposer
    extends Composer<_$AppDatabase, $BillingTable> {
  $$BillingTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get realAmount => $composableBuilder(
    column: $table.realAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentStatus => $composableBuilder(
    column: $table.paymentStatus,
    builder: (column) => ColumnFilters(column),
  );

  $$AppointmentTableFilterComposer get appointmentID {
    final $$AppointmentTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.appointmentID,
      referencedTable: $db.appointment,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppointmentTableFilterComposer(
            $db: $db,
            $table: $db.appointment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BillingTableOrderingComposer
    extends Composer<_$AppDatabase, $BillingTable> {
  $$BillingTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get realAmount => $composableBuilder(
    column: $table.realAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentStatus => $composableBuilder(
    column: $table.paymentStatus,
    builder: (column) => ColumnOrderings(column),
  );

  $$AppointmentTableOrderingComposer get appointmentID {
    final $$AppointmentTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.appointmentID,
      referencedTable: $db.appointment,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppointmentTableOrderingComposer(
            $db: $db,
            $table: $db.appointment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BillingTableAnnotationComposer
    extends Composer<_$AppDatabase, $BillingTable> {
  $$BillingTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get realAmount => $composableBuilder(
    column: $table.realAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => column,
  );

  GeneratedColumn<String> get paymentStatus => $composableBuilder(
    column: $table.paymentStatus,
    builder: (column) => column,
  );

  $$AppointmentTableAnnotationComposer get appointmentID {
    final $$AppointmentTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.appointmentID,
      referencedTable: $db.appointment,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppointmentTableAnnotationComposer(
            $db: $db,
            $table: $db.appointment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BillingTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BillingTable,
          BillingData,
          $$BillingTableFilterComposer,
          $$BillingTableOrderingComposer,
          $$BillingTableAnnotationComposer,
          $$BillingTableCreateCompanionBuilder,
          $$BillingTableUpdateCompanionBuilder,
          (BillingData, $$BillingTableReferences),
          BillingData,
          PrefetchHooks Function({bool appointmentID})
        > {
  $$BillingTableTableManager(_$AppDatabase db, $BillingTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BillingTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BillingTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BillingTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> appointmentID = const Value.absent(),
                Value<double> totalAmount = const Value.absent(),
                Value<double> realAmount = const Value.absent(),
                Value<String> paymentMethod = const Value.absent(),
                Value<String> paymentStatus = const Value.absent(),
              }) => BillingCompanion(
                id: id,
                appointmentID: appointmentID,
                totalAmount: totalAmount,
                realAmount: realAmount,
                paymentMethod: paymentMethod,
                paymentStatus: paymentStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int appointmentID,
                required double totalAmount,
                required double realAmount,
                required String paymentMethod,
                Value<String> paymentStatus = const Value.absent(),
              }) => BillingCompanion.insert(
                id: id,
                appointmentID: appointmentID,
                totalAmount: totalAmount,
                realAmount: realAmount,
                paymentMethod: paymentMethod,
                paymentStatus: paymentStatus,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BillingTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({appointmentID = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (appointmentID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.appointmentID,
                                referencedTable: $$BillingTableReferences
                                    ._appointmentIDTable(db),
                                referencedColumn: $$BillingTableReferences
                                    ._appointmentIDTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$BillingTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BillingTable,
      BillingData,
      $$BillingTableFilterComposer,
      $$BillingTableOrderingComposer,
      $$BillingTableAnnotationComposer,
      $$BillingTableCreateCompanionBuilder,
      $$BillingTableUpdateCompanionBuilder,
      (BillingData, $$BillingTableReferences),
      BillingData,
      PrefetchHooks Function({bool appointmentID})
    >;
typedef $$DentalChartTableCreateCompanionBuilder =
    DentalChartCompanion Function({
      Value<int> id,
      required int patientID,
      required int toothNumber,
      required String surface,
      required String condition,
      required DateTime lastUpdated,
    });
typedef $$DentalChartTableUpdateCompanionBuilder =
    DentalChartCompanion Function({
      Value<int> id,
      Value<int> patientID,
      Value<int> toothNumber,
      Value<String> surface,
      Value<String> condition,
      Value<DateTime> lastUpdated,
    });

final class $$DentalChartTableReferences
    extends BaseReferences<_$AppDatabase, $DentalChartTable, DentalChartData> {
  $$DentalChartTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PatientTable _patientIDTable(_$AppDatabase db) =>
      db.patient.createAlias(
        $_aliasNameGenerator(db.dentalChart.patientID, db.patient.id),
      );

  $$PatientTableProcessedTableManager get patientID {
    final $_column = $_itemColumn<int>('patient_i_d')!;

    final manager = $$PatientTableTableManager(
      $_db,
      $_db.patient,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_patientIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DentalChartTableFilterComposer
    extends Composer<_$AppDatabase, $DentalChartTable> {
  $$DentalChartTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get toothNumber => $composableBuilder(
    column: $table.toothNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get surface => $composableBuilder(
    column: $table.surface,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => ColumnFilters(column),
  );

  $$PatientTableFilterComposer get patientID {
    final $$PatientTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patientID,
      referencedTable: $db.patient,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientTableFilterComposer(
            $db: $db,
            $table: $db.patient,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DentalChartTableOrderingComposer
    extends Composer<_$AppDatabase, $DentalChartTable> {
  $$DentalChartTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get toothNumber => $composableBuilder(
    column: $table.toothNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get surface => $composableBuilder(
    column: $table.surface,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => ColumnOrderings(column),
  );

  $$PatientTableOrderingComposer get patientID {
    final $$PatientTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patientID,
      referencedTable: $db.patient,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientTableOrderingComposer(
            $db: $db,
            $table: $db.patient,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DentalChartTableAnnotationComposer
    extends Composer<_$AppDatabase, $DentalChartTable> {
  $$DentalChartTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get toothNumber => $composableBuilder(
    column: $table.toothNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get surface =>
      $composableBuilder(column: $table.surface, builder: (column) => column);

  GeneratedColumn<String> get condition =>
      $composableBuilder(column: $table.condition, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => column,
  );

  $$PatientTableAnnotationComposer get patientID {
    final $$PatientTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patientID,
      referencedTable: $db.patient,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientTableAnnotationComposer(
            $db: $db,
            $table: $db.patient,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DentalChartTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DentalChartTable,
          DentalChartData,
          $$DentalChartTableFilterComposer,
          $$DentalChartTableOrderingComposer,
          $$DentalChartTableAnnotationComposer,
          $$DentalChartTableCreateCompanionBuilder,
          $$DentalChartTableUpdateCompanionBuilder,
          (DentalChartData, $$DentalChartTableReferences),
          DentalChartData,
          PrefetchHooks Function({bool patientID})
        > {
  $$DentalChartTableTableManager(_$AppDatabase db, $DentalChartTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DentalChartTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DentalChartTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DentalChartTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> patientID = const Value.absent(),
                Value<int> toothNumber = const Value.absent(),
                Value<String> surface = const Value.absent(),
                Value<String> condition = const Value.absent(),
                Value<DateTime> lastUpdated = const Value.absent(),
              }) => DentalChartCompanion(
                id: id,
                patientID: patientID,
                toothNumber: toothNumber,
                surface: surface,
                condition: condition,
                lastUpdated: lastUpdated,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int patientID,
                required int toothNumber,
                required String surface,
                required String condition,
                required DateTime lastUpdated,
              }) => DentalChartCompanion.insert(
                id: id,
                patientID: patientID,
                toothNumber: toothNumber,
                surface: surface,
                condition: condition,
                lastUpdated: lastUpdated,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DentalChartTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({patientID = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (patientID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.patientID,
                                referencedTable: $$DentalChartTableReferences
                                    ._patientIDTable(db),
                                referencedColumn: $$DentalChartTableReferences
                                    ._patientIDTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DentalChartTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DentalChartTable,
      DentalChartData,
      $$DentalChartTableFilterComposer,
      $$DentalChartTableOrderingComposer,
      $$DentalChartTableAnnotationComposer,
      $$DentalChartTableCreateCompanionBuilder,
      $$DentalChartTableUpdateCompanionBuilder,
      (DentalChartData, $$DentalChartTableReferences),
      DentalChartData,
      PrefetchHooks Function({bool patientID})
    >;
typedef $$TreatmentRecordTableCreateCompanionBuilder =
    TreatmentRecordCompanion Function({
      Value<int> id,
      required int appointmentID,
      required int procedureCode,
      required int toothNumber,
      required String notes,
    });
typedef $$TreatmentRecordTableUpdateCompanionBuilder =
    TreatmentRecordCompanion Function({
      Value<int> id,
      Value<int> appointmentID,
      Value<int> procedureCode,
      Value<int> toothNumber,
      Value<String> notes,
    });

final class $$TreatmentRecordTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $TreatmentRecordTable,
          TreatmentRecordData
        > {
  $$TreatmentRecordTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AppointmentTable _appointmentIDTable(_$AppDatabase db) =>
      db.appointment.createAlias(
        $_aliasNameGenerator(
          db.treatmentRecord.appointmentID,
          db.appointment.id,
        ),
      );

  $$AppointmentTableProcessedTableManager get appointmentID {
    final $_column = $_itemColumn<int>('appointment_i_d')!;

    final manager = $$AppointmentTableTableManager(
      $_db,
      $_db.appointment,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_appointmentIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TreatmentRecordTableFilterComposer
    extends Composer<_$AppDatabase, $TreatmentRecordTable> {
  $$TreatmentRecordTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get procedureCode => $composableBuilder(
    column: $table.procedureCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get toothNumber => $composableBuilder(
    column: $table.toothNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$AppointmentTableFilterComposer get appointmentID {
    final $$AppointmentTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.appointmentID,
      referencedTable: $db.appointment,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppointmentTableFilterComposer(
            $db: $db,
            $table: $db.appointment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TreatmentRecordTableOrderingComposer
    extends Composer<_$AppDatabase, $TreatmentRecordTable> {
  $$TreatmentRecordTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get procedureCode => $composableBuilder(
    column: $table.procedureCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get toothNumber => $composableBuilder(
    column: $table.toothNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$AppointmentTableOrderingComposer get appointmentID {
    final $$AppointmentTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.appointmentID,
      referencedTable: $db.appointment,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppointmentTableOrderingComposer(
            $db: $db,
            $table: $db.appointment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TreatmentRecordTableAnnotationComposer
    extends Composer<_$AppDatabase, $TreatmentRecordTable> {
  $$TreatmentRecordTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get procedureCode => $composableBuilder(
    column: $table.procedureCode,
    builder: (column) => column,
  );

  GeneratedColumn<int> get toothNumber => $composableBuilder(
    column: $table.toothNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$AppointmentTableAnnotationComposer get appointmentID {
    final $$AppointmentTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.appointmentID,
      referencedTable: $db.appointment,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppointmentTableAnnotationComposer(
            $db: $db,
            $table: $db.appointment,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TreatmentRecordTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TreatmentRecordTable,
          TreatmentRecordData,
          $$TreatmentRecordTableFilterComposer,
          $$TreatmentRecordTableOrderingComposer,
          $$TreatmentRecordTableAnnotationComposer,
          $$TreatmentRecordTableCreateCompanionBuilder,
          $$TreatmentRecordTableUpdateCompanionBuilder,
          (TreatmentRecordData, $$TreatmentRecordTableReferences),
          TreatmentRecordData,
          PrefetchHooks Function({bool appointmentID})
        > {
  $$TreatmentRecordTableTableManager(
    _$AppDatabase db,
    $TreatmentRecordTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TreatmentRecordTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TreatmentRecordTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TreatmentRecordTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> appointmentID = const Value.absent(),
                Value<int> procedureCode = const Value.absent(),
                Value<int> toothNumber = const Value.absent(),
                Value<String> notes = const Value.absent(),
              }) => TreatmentRecordCompanion(
                id: id,
                appointmentID: appointmentID,
                procedureCode: procedureCode,
                toothNumber: toothNumber,
                notes: notes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int appointmentID,
                required int procedureCode,
                required int toothNumber,
                required String notes,
              }) => TreatmentRecordCompanion.insert(
                id: id,
                appointmentID: appointmentID,
                procedureCode: procedureCode,
                toothNumber: toothNumber,
                notes: notes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TreatmentRecordTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({appointmentID = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (appointmentID) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.appointmentID,
                                referencedTable:
                                    $$TreatmentRecordTableReferences
                                        ._appointmentIDTable(db),
                                referencedColumn:
                                    $$TreatmentRecordTableReferences
                                        ._appointmentIDTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TreatmentRecordTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TreatmentRecordTable,
      TreatmentRecordData,
      $$TreatmentRecordTableFilterComposer,
      $$TreatmentRecordTableOrderingComposer,
      $$TreatmentRecordTableAnnotationComposer,
      $$TreatmentRecordTableCreateCompanionBuilder,
      $$TreatmentRecordTableUpdateCompanionBuilder,
      (TreatmentRecordData, $$TreatmentRecordTableReferences),
      TreatmentRecordData,
      PrefetchHooks Function({bool appointmentID})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PatientTableTableManager get patient =>
      $$PatientTableTableManager(_db, _db.patient);
  $$DentistTableTableManager get dentist =>
      $$DentistTableTableManager(_db, _db.dentist);
  $$AppointmentTableTableManager get appointment =>
      $$AppointmentTableTableManager(_db, _db.appointment);
  $$BillingTableTableManager get billing =>
      $$BillingTableTableManager(_db, _db.billing);
  $$DentalChartTableTableManager get dentalChart =>
      $$DentalChartTableTableManager(_db, _db.dentalChart);
  $$TreatmentRecordTableTableManager get treatmentRecord =>
      $$TreatmentRecordTableTableManager(_db, _db.treatmentRecord);
}
