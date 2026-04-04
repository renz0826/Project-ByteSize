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
  @override
  List<GeneratedColumn> get $columns => [id, name];
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DentistData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DentistData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $DentistTable createAlias(String alias) {
    return $DentistTable(attachedDatabase, alias);
  }
}

class DentistData extends DataClass implements Insertable<DentistData> {
  final int id;
  final String name;
  const DentistData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  DentistCompanion toCompanion(bool nullToAbsent) {
    return DentistCompanion(id: Value(id), name: Value(name));
  }

  factory DentistData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DentistData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  DentistData copyWith({int? id, String? name}) =>
      DentistData(id: id ?? this.id, name: name ?? this.name);
  DentistData copyWithCompanion(DentistCompanion data) {
    return DentistData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DentistData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DentistData && other.id == this.id && other.name == this.name);
}

class DentistCompanion extends UpdateCompanion<DentistData> {
  final Value<int> id;
  final Value<String> name;
  const DentistCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  DentistCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<DentistData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  DentistCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return DentistCompanion(id: id ?? this.id, name: name ?? this.name);
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DentistCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
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
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES dentist (id)',
    ),
  );
  static const VerificationMeta _scheduledAtMeta = const VerificationMeta(
    'scheduledAt',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledAt = GeneratedColumn<DateTime>(
    'scheduled_at',
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
    scheduledAt,
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
    if (data.containsKey('scheduled_at')) {
      context.handle(
        _scheduledAtMeta,
        scheduledAt.isAcceptableOrUnknown(
          data['scheduled_at']!,
          _scheduledAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledAtMeta);
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
      scheduledAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_at'],
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
  final DateTime scheduledAt;
  final String status;
  const AppointmentData({
    required this.id,
    required this.patientID,
    required this.dentistID,
    required this.scheduledAt,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['patient_i_d'] = Variable<int>(patientID);
    map['dentist_i_d'] = Variable<int>(dentistID);
    map['scheduled_at'] = Variable<DateTime>(scheduledAt);
    map['status'] = Variable<String>(status);
    return map;
  }

  AppointmentCompanion toCompanion(bool nullToAbsent) {
    return AppointmentCompanion(
      id: Value(id),
      patientID: Value(patientID),
      dentistID: Value(dentistID),
      scheduledAt: Value(scheduledAt),
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
      scheduledAt: serializer.fromJson<DateTime>(json['scheduledAt']),
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
      'scheduledAt': serializer.toJson<DateTime>(scheduledAt),
      'status': serializer.toJson<String>(status),
    };
  }

  AppointmentData copyWith({
    int? id,
    int? patientID,
    int? dentistID,
    DateTime? scheduledAt,
    String? status,
  }) => AppointmentData(
    id: id ?? this.id,
    patientID: patientID ?? this.patientID,
    dentistID: dentistID ?? this.dentistID,
    scheduledAt: scheduledAt ?? this.scheduledAt,
    status: status ?? this.status,
  );
  AppointmentData copyWithCompanion(AppointmentCompanion data) {
    return AppointmentData(
      id: data.id.present ? data.id.value : this.id,
      patientID: data.patientID.present ? data.patientID.value : this.patientID,
      dentistID: data.dentistID.present ? data.dentistID.value : this.dentistID,
      scheduledAt: data.scheduledAt.present
          ? data.scheduledAt.value
          : this.scheduledAt,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppointmentData(')
          ..write('id: $id, ')
          ..write('patientID: $patientID, ')
          ..write('dentistID: $dentistID, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, patientID, dentistID, scheduledAt, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppointmentData &&
          other.id == this.id &&
          other.patientID == this.patientID &&
          other.dentistID == this.dentistID &&
          other.scheduledAt == this.scheduledAt &&
          other.status == this.status);
}

class AppointmentCompanion extends UpdateCompanion<AppointmentData> {
  final Value<int> id;
  final Value<int> patientID;
  final Value<int> dentistID;
  final Value<DateTime> scheduledAt;
  final Value<String> status;
  const AppointmentCompanion({
    this.id = const Value.absent(),
    this.patientID = const Value.absent(),
    this.dentistID = const Value.absent(),
    this.scheduledAt = const Value.absent(),
    this.status = const Value.absent(),
  });
  AppointmentCompanion.insert({
    this.id = const Value.absent(),
    required int patientID,
    required int dentistID,
    required DateTime scheduledAt,
    this.status = const Value.absent(),
  }) : patientID = Value(patientID),
       dentistID = Value(dentistID),
       scheduledAt = Value(scheduledAt);
  static Insertable<AppointmentData> custom({
    Expression<int>? id,
    Expression<int>? patientID,
    Expression<int>? dentistID,
    Expression<DateTime>? scheduledAt,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientID != null) 'patient_i_d': patientID,
      if (dentistID != null) 'dentist_i_d': dentistID,
      if (scheduledAt != null) 'scheduled_at': scheduledAt,
      if (status != null) 'status': status,
    });
  }

  AppointmentCompanion copyWith({
    Value<int>? id,
    Value<int>? patientID,
    Value<int>? dentistID,
    Value<DateTime>? scheduledAt,
    Value<String>? status,
  }) {
    return AppointmentCompanion(
      id: id ?? this.id,
      patientID: patientID ?? this.patientID,
      dentistID: dentistID ?? this.dentistID,
      scheduledAt: scheduledAt ?? this.scheduledAt,
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
    if (scheduledAt.present) {
      map['scheduled_at'] = Variable<DateTime>(scheduledAt.value);
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
          ..write('scheduledAt: $scheduledAt, ')
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
  static const VerificationMeta _amountPaidMeta = const VerificationMeta(
    'amountPaid',
  );
  @override
  late final GeneratedColumn<double> amountPaid = GeneratedColumn<double>(
    'amount_paid',
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
    amountPaid,
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
    if (data.containsKey('amount_paid')) {
      context.handle(
        _amountPaidMeta,
        amountPaid.isAcceptableOrUnknown(data['amount_paid']!, _amountPaidMeta),
      );
    } else if (isInserting) {
      context.missing(_amountPaidMeta);
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
      amountPaid: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount_paid'],
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
  final double amountPaid;
  final String paymentMethod;
  final String paymentStatus;
  const BillingData({
    required this.id,
    required this.appointmentID,
    required this.totalAmount,
    required this.amountPaid,
    required this.paymentMethod,
    required this.paymentStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['appointment_i_d'] = Variable<int>(appointmentID);
    map['total_amount'] = Variable<double>(totalAmount);
    map['amount_paid'] = Variable<double>(amountPaid);
    map['payment_method'] = Variable<String>(paymentMethod);
    map['payment_status'] = Variable<String>(paymentStatus);
    return map;
  }

  BillingCompanion toCompanion(bool nullToAbsent) {
    return BillingCompanion(
      id: Value(id),
      appointmentID: Value(appointmentID),
      totalAmount: Value(totalAmount),
      amountPaid: Value(amountPaid),
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
      amountPaid: serializer.fromJson<double>(json['amountPaid']),
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
      'amountPaid': serializer.toJson<double>(amountPaid),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'paymentStatus': serializer.toJson<String>(paymentStatus),
    };
  }

  BillingData copyWith({
    int? id,
    int? appointmentID,
    double? totalAmount,
    double? amountPaid,
    String? paymentMethod,
    String? paymentStatus,
  }) => BillingData(
    id: id ?? this.id,
    appointmentID: appointmentID ?? this.appointmentID,
    totalAmount: totalAmount ?? this.totalAmount,
    amountPaid: amountPaid ?? this.amountPaid,
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
      amountPaid: data.amountPaid.present
          ? data.amountPaid.value
          : this.amountPaid,
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
          ..write('amountPaid: $amountPaid, ')
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
    amountPaid,
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
          other.amountPaid == this.amountPaid &&
          other.paymentMethod == this.paymentMethod &&
          other.paymentStatus == this.paymentStatus);
}

class BillingCompanion extends UpdateCompanion<BillingData> {
  final Value<int> id;
  final Value<int> appointmentID;
  final Value<double> totalAmount;
  final Value<double> amountPaid;
  final Value<String> paymentMethod;
  final Value<String> paymentStatus;
  const BillingCompanion({
    this.id = const Value.absent(),
    this.appointmentID = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.amountPaid = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.paymentStatus = const Value.absent(),
  });
  BillingCompanion.insert({
    this.id = const Value.absent(),
    required int appointmentID,
    required double totalAmount,
    required double amountPaid,
    required String paymentMethod,
    this.paymentStatus = const Value.absent(),
  }) : appointmentID = Value(appointmentID),
       totalAmount = Value(totalAmount),
       amountPaid = Value(amountPaid),
       paymentMethod = Value(paymentMethod);
  static Insertable<BillingData> custom({
    Expression<int>? id,
    Expression<int>? appointmentID,
    Expression<double>? totalAmount,
    Expression<double>? amountPaid,
    Expression<String>? paymentMethod,
    Expression<String>? paymentStatus,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (appointmentID != null) 'appointment_i_d': appointmentID,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (amountPaid != null) 'amount_paid': amountPaid,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (paymentStatus != null) 'payment_status': paymentStatus,
    });
  }

  BillingCompanion copyWith({
    Value<int>? id,
    Value<int>? appointmentID,
    Value<double>? totalAmount,
    Value<double>? amountPaid,
    Value<String>? paymentMethod,
    Value<String>? paymentStatus,
  }) {
    return BillingCompanion(
      id: id ?? this.id,
      appointmentID: appointmentID ?? this.appointmentID,
      totalAmount: totalAmount ?? this.totalAmount,
      amountPaid: amountPaid ?? this.amountPaid,
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
    if (amountPaid.present) {
      map['amount_paid'] = Variable<double>(amountPaid.value);
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
          ..write('amountPaid: $amountPaid, ')
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

class $ProcedureLookupTable extends ProcedureLookup
    with TableInfo<$ProcedureLookupTable, ProcedureLookupData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProcedureLookupTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _baseCostMeta = const VerificationMeta(
    'baseCost',
  );
  @override
  late final GeneratedColumn<double> baseCost = GeneratedColumn<double>(
    'base_cost',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, description, baseCost];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'procedure_lookup';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProcedureLookupData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('base_cost')) {
      context.handle(
        _baseCostMeta,
        baseCost.isAcceptableOrUnknown(data['base_cost']!, _baseCostMeta),
      );
    } else if (isInserting) {
      context.missing(_baseCostMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProcedureLookupData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProcedureLookupData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      baseCost: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}base_cost'],
      )!,
    );
  }

  @override
  $ProcedureLookupTable createAlias(String alias) {
    return $ProcedureLookupTable(attachedDatabase, alias);
  }
}

class ProcedureLookupData extends DataClass
    implements Insertable<ProcedureLookupData> {
  final int id;
  final String description;
  final double baseCost;
  const ProcedureLookupData({
    required this.id,
    required this.description,
    required this.baseCost,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    map['base_cost'] = Variable<double>(baseCost);
    return map;
  }

  ProcedureLookupCompanion toCompanion(bool nullToAbsent) {
    return ProcedureLookupCompanion(
      id: Value(id),
      description: Value(description),
      baseCost: Value(baseCost),
    );
  }

  factory ProcedureLookupData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProcedureLookupData(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      baseCost: serializer.fromJson<double>(json['baseCost']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
      'baseCost': serializer.toJson<double>(baseCost),
    };
  }

  ProcedureLookupData copyWith({
    int? id,
    String? description,
    double? baseCost,
  }) => ProcedureLookupData(
    id: id ?? this.id,
    description: description ?? this.description,
    baseCost: baseCost ?? this.baseCost,
  );
  ProcedureLookupData copyWithCompanion(ProcedureLookupCompanion data) {
    return ProcedureLookupData(
      id: data.id.present ? data.id.value : this.id,
      description: data.description.present
          ? data.description.value
          : this.description,
      baseCost: data.baseCost.present ? data.baseCost.value : this.baseCost,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProcedureLookupData(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('baseCost: $baseCost')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description, baseCost);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProcedureLookupData &&
          other.id == this.id &&
          other.description == this.description &&
          other.baseCost == this.baseCost);
}

class ProcedureLookupCompanion extends UpdateCompanion<ProcedureLookupData> {
  final Value<int> id;
  final Value<String> description;
  final Value<double> baseCost;
  const ProcedureLookupCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.baseCost = const Value.absent(),
  });
  ProcedureLookupCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    required double baseCost,
  }) : description = Value(description),
       baseCost = Value(baseCost);
  static Insertable<ProcedureLookupData> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<double>? baseCost,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (baseCost != null) 'base_cost': baseCost,
    });
  }

  ProcedureLookupCompanion copyWith({
    Value<int>? id,
    Value<String>? description,
    Value<double>? baseCost,
  }) {
    return ProcedureLookupCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      baseCost: baseCost ?? this.baseCost,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (baseCost.present) {
      map['base_cost'] = Variable<double>(baseCost.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProcedureLookupCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('baseCost: $baseCost')
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
  static const VerificationMeta _procedureIDMeta = const VerificationMeta(
    'procedureID',
  );
  @override
  late final GeneratedColumn<int> procedureID = GeneratedColumn<int>(
    'procedure_i_d',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES procedure_lookup (id)',
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
    procedureID,
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
    if (data.containsKey('procedure_i_d')) {
      context.handle(
        _procedureIDMeta,
        procedureID.isAcceptableOrUnknown(
          data['procedure_i_d']!,
          _procedureIDMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_procedureIDMeta);
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
      procedureID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}procedure_i_d'],
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
  final int procedureID;
  final int toothNumber;
  final String notes;
  const TreatmentRecordData({
    required this.id,
    required this.appointmentID,
    required this.procedureID,
    required this.toothNumber,
    required this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['appointment_i_d'] = Variable<int>(appointmentID);
    map['procedure_i_d'] = Variable<int>(procedureID);
    map['tooth_number'] = Variable<int>(toothNumber);
    map['notes'] = Variable<String>(notes);
    return map;
  }

  TreatmentRecordCompanion toCompanion(bool nullToAbsent) {
    return TreatmentRecordCompanion(
      id: Value(id),
      appointmentID: Value(appointmentID),
      procedureID: Value(procedureID),
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
      procedureID: serializer.fromJson<int>(json['procedureID']),
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
      'procedureID': serializer.toJson<int>(procedureID),
      'toothNumber': serializer.toJson<int>(toothNumber),
      'notes': serializer.toJson<String>(notes),
    };
  }

  TreatmentRecordData copyWith({
    int? id,
    int? appointmentID,
    int? procedureID,
    int? toothNumber,
    String? notes,
  }) => TreatmentRecordData(
    id: id ?? this.id,
    appointmentID: appointmentID ?? this.appointmentID,
    procedureID: procedureID ?? this.procedureID,
    toothNumber: toothNumber ?? this.toothNumber,
    notes: notes ?? this.notes,
  );
  TreatmentRecordData copyWithCompanion(TreatmentRecordCompanion data) {
    return TreatmentRecordData(
      id: data.id.present ? data.id.value : this.id,
      appointmentID: data.appointmentID.present
          ? data.appointmentID.value
          : this.appointmentID,
      procedureID: data.procedureID.present
          ? data.procedureID.value
          : this.procedureID,
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
          ..write('procedureID: $procedureID, ')
          ..write('toothNumber: $toothNumber, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, appointmentID, procedureID, toothNumber, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TreatmentRecordData &&
          other.id == this.id &&
          other.appointmentID == this.appointmentID &&
          other.procedureID == this.procedureID &&
          other.toothNumber == this.toothNumber &&
          other.notes == this.notes);
}

class TreatmentRecordCompanion extends UpdateCompanion<TreatmentRecordData> {
  final Value<int> id;
  final Value<int> appointmentID;
  final Value<int> procedureID;
  final Value<int> toothNumber;
  final Value<String> notes;
  const TreatmentRecordCompanion({
    this.id = const Value.absent(),
    this.appointmentID = const Value.absent(),
    this.procedureID = const Value.absent(),
    this.toothNumber = const Value.absent(),
    this.notes = const Value.absent(),
  });
  TreatmentRecordCompanion.insert({
    this.id = const Value.absent(),
    required int appointmentID,
    required int procedureID,
    required int toothNumber,
    required String notes,
  }) : appointmentID = Value(appointmentID),
       procedureID = Value(procedureID),
       toothNumber = Value(toothNumber),
       notes = Value(notes);
  static Insertable<TreatmentRecordData> custom({
    Expression<int>? id,
    Expression<int>? appointmentID,
    Expression<int>? procedureID,
    Expression<int>? toothNumber,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (appointmentID != null) 'appointment_i_d': appointmentID,
      if (procedureID != null) 'procedure_i_d': procedureID,
      if (toothNumber != null) 'tooth_number': toothNumber,
      if (notes != null) 'notes': notes,
    });
  }

  TreatmentRecordCompanion copyWith({
    Value<int>? id,
    Value<int>? appointmentID,
    Value<int>? procedureID,
    Value<int>? toothNumber,
    Value<String>? notes,
  }) {
    return TreatmentRecordCompanion(
      id: id ?? this.id,
      appointmentID: appointmentID ?? this.appointmentID,
      procedureID: procedureID ?? this.procedureID,
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
    if (procedureID.present) {
      map['procedure_i_d'] = Variable<int>(procedureID.value);
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
          ..write('procedureID: $procedureID, ')
          ..write('toothNumber: $toothNumber, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $PatientRecordTable extends PatientRecord
    with TableInfo<$PatientRecordTable, PatientRecordData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PatientRecordTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _patientIdMeta = const VerificationMeta(
    'patientId',
  );
  @override
  late final GeneratedColumn<int> patientId = GeneratedColumn<int>(
    'patient_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES patient (id)',
    ),
  );
  static const VerificationMeta _allergiesMeta = const VerificationMeta(
    'allergies',
  );
  @override
  late final GeneratedColumn<String> allergies = GeneratedColumn<String>(
    'allergies',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('none'),
  );
  static const VerificationMeta _medicalConditionsMeta = const VerificationMeta(
    'medicalConditions',
  );
  @override
  late final GeneratedColumn<String> medicalConditions =
      GeneratedColumn<String>(
        'medical_conditions',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('none'),
      );
  static const VerificationMeta _currentMedicationMeta = const VerificationMeta(
    'currentMedication',
  );
  @override
  late final GeneratedColumn<String> currentMedication =
      GeneratedColumn<String>(
        'current_medication',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _emergencyContactNameMeta =
      const VerificationMeta('emergencyContactName');
  @override
  late final GeneratedColumn<String> emergencyContactName =
      GeneratedColumn<String>(
        'emergency_contact_name',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _emergencyContactNumberMeta =
      const VerificationMeta('emergencyContactNumber');
  @override
  late final GeneratedColumn<String> emergencyContactNumber =
      GeneratedColumn<String>(
        'emergency_contact_number',
        aliasedName,
        false,
        additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 10,
          maxTextLength: 10,
        ),
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _emergencyContactRelationMeta =
      const VerificationMeta('emergencyContactRelation');
  @override
  late final GeneratedColumn<String> emergencyContactRelation =
      GeneratedColumn<String>(
        'emergency_contact_relation',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    patientId,
    allergies,
    medicalConditions,
    currentMedication,
    emergencyContactName,
    emergencyContactNumber,
    emergencyContactRelation,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'patient_record';
  @override
  VerificationContext validateIntegrity(
    Insertable<PatientRecordData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('patient_id')) {
      context.handle(
        _patientIdMeta,
        patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('allergies')) {
      context.handle(
        _allergiesMeta,
        allergies.isAcceptableOrUnknown(data['allergies']!, _allergiesMeta),
      );
    }
    if (data.containsKey('medical_conditions')) {
      context.handle(
        _medicalConditionsMeta,
        medicalConditions.isAcceptableOrUnknown(
          data['medical_conditions']!,
          _medicalConditionsMeta,
        ),
      );
    }
    if (data.containsKey('current_medication')) {
      context.handle(
        _currentMedicationMeta,
        currentMedication.isAcceptableOrUnknown(
          data['current_medication']!,
          _currentMedicationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currentMedicationMeta);
    }
    if (data.containsKey('emergency_contact_name')) {
      context.handle(
        _emergencyContactNameMeta,
        emergencyContactName.isAcceptableOrUnknown(
          data['emergency_contact_name']!,
          _emergencyContactNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_emergencyContactNameMeta);
    }
    if (data.containsKey('emergency_contact_number')) {
      context.handle(
        _emergencyContactNumberMeta,
        emergencyContactNumber.isAcceptableOrUnknown(
          data['emergency_contact_number']!,
          _emergencyContactNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_emergencyContactNumberMeta);
    }
    if (data.containsKey('emergency_contact_relation')) {
      context.handle(
        _emergencyContactRelationMeta,
        emergencyContactRelation.isAcceptableOrUnknown(
          data['emergency_contact_relation']!,
          _emergencyContactRelationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_emergencyContactRelationMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PatientRecordData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PatientRecordData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      patientId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}patient_id'],
      )!,
      allergies: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}allergies'],
      )!,
      medicalConditions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medical_conditions'],
      )!,
      currentMedication: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}current_medication'],
      )!,
      emergencyContactName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emergency_contact_name'],
      )!,
      emergencyContactNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emergency_contact_number'],
      )!,
      emergencyContactRelation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emergency_contact_relation'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $PatientRecordTable createAlias(String alias) {
    return $PatientRecordTable(attachedDatabase, alias);
  }
}

class PatientRecordData extends DataClass
    implements Insertable<PatientRecordData> {
  final int id;
  final int patientId;
  final String allergies;
  final String medicalConditions;
  final String currentMedication;
  final String emergencyContactName;
  final String emergencyContactNumber;
  final String emergencyContactRelation;
  final DateTime createdAt;
  final DateTime updatedAt;
  const PatientRecordData({
    required this.id,
    required this.patientId,
    required this.allergies,
    required this.medicalConditions,
    required this.currentMedication,
    required this.emergencyContactName,
    required this.emergencyContactNumber,
    required this.emergencyContactRelation,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['patient_id'] = Variable<int>(patientId);
    map['allergies'] = Variable<String>(allergies);
    map['medical_conditions'] = Variable<String>(medicalConditions);
    map['current_medication'] = Variable<String>(currentMedication);
    map['emergency_contact_name'] = Variable<String>(emergencyContactName);
    map['emergency_contact_number'] = Variable<String>(emergencyContactNumber);
    map['emergency_contact_relation'] = Variable<String>(
      emergencyContactRelation,
    );
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PatientRecordCompanion toCompanion(bool nullToAbsent) {
    return PatientRecordCompanion(
      id: Value(id),
      patientId: Value(patientId),
      allergies: Value(allergies),
      medicalConditions: Value(medicalConditions),
      currentMedication: Value(currentMedication),
      emergencyContactName: Value(emergencyContactName),
      emergencyContactNumber: Value(emergencyContactNumber),
      emergencyContactRelation: Value(emergencyContactRelation),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PatientRecordData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PatientRecordData(
      id: serializer.fromJson<int>(json['id']),
      patientId: serializer.fromJson<int>(json['patientId']),
      allergies: serializer.fromJson<String>(json['allergies']),
      medicalConditions: serializer.fromJson<String>(json['medicalConditions']),
      currentMedication: serializer.fromJson<String>(json['currentMedication']),
      emergencyContactName: serializer.fromJson<String>(
        json['emergencyContactName'],
      ),
      emergencyContactNumber: serializer.fromJson<String>(
        json['emergencyContactNumber'],
      ),
      emergencyContactRelation: serializer.fromJson<String>(
        json['emergencyContactRelation'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'patientId': serializer.toJson<int>(patientId),
      'allergies': serializer.toJson<String>(allergies),
      'medicalConditions': serializer.toJson<String>(medicalConditions),
      'currentMedication': serializer.toJson<String>(currentMedication),
      'emergencyContactName': serializer.toJson<String>(emergencyContactName),
      'emergencyContactNumber': serializer.toJson<String>(
        emergencyContactNumber,
      ),
      'emergencyContactRelation': serializer.toJson<String>(
        emergencyContactRelation,
      ),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PatientRecordData copyWith({
    int? id,
    int? patientId,
    String? allergies,
    String? medicalConditions,
    String? currentMedication,
    String? emergencyContactName,
    String? emergencyContactNumber,
    String? emergencyContactRelation,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => PatientRecordData(
    id: id ?? this.id,
    patientId: patientId ?? this.patientId,
    allergies: allergies ?? this.allergies,
    medicalConditions: medicalConditions ?? this.medicalConditions,
    currentMedication: currentMedication ?? this.currentMedication,
    emergencyContactName: emergencyContactName ?? this.emergencyContactName,
    emergencyContactNumber:
        emergencyContactNumber ?? this.emergencyContactNumber,
    emergencyContactRelation:
        emergencyContactRelation ?? this.emergencyContactRelation,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  PatientRecordData copyWithCompanion(PatientRecordCompanion data) {
    return PatientRecordData(
      id: data.id.present ? data.id.value : this.id,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      allergies: data.allergies.present ? data.allergies.value : this.allergies,
      medicalConditions: data.medicalConditions.present
          ? data.medicalConditions.value
          : this.medicalConditions,
      currentMedication: data.currentMedication.present
          ? data.currentMedication.value
          : this.currentMedication,
      emergencyContactName: data.emergencyContactName.present
          ? data.emergencyContactName.value
          : this.emergencyContactName,
      emergencyContactNumber: data.emergencyContactNumber.present
          ? data.emergencyContactNumber.value
          : this.emergencyContactNumber,
      emergencyContactRelation: data.emergencyContactRelation.present
          ? data.emergencyContactRelation.value
          : this.emergencyContactRelation,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PatientRecordData(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('allergies: $allergies, ')
          ..write('medicalConditions: $medicalConditions, ')
          ..write('currentMedication: $currentMedication, ')
          ..write('emergencyContactName: $emergencyContactName, ')
          ..write('emergencyContactNumber: $emergencyContactNumber, ')
          ..write('emergencyContactRelation: $emergencyContactRelation, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    patientId,
    allergies,
    medicalConditions,
    currentMedication,
    emergencyContactName,
    emergencyContactNumber,
    emergencyContactRelation,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PatientRecordData &&
          other.id == this.id &&
          other.patientId == this.patientId &&
          other.allergies == this.allergies &&
          other.medicalConditions == this.medicalConditions &&
          other.currentMedication == this.currentMedication &&
          other.emergencyContactName == this.emergencyContactName &&
          other.emergencyContactNumber == this.emergencyContactNumber &&
          other.emergencyContactRelation == this.emergencyContactRelation &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PatientRecordCompanion extends UpdateCompanion<PatientRecordData> {
  final Value<int> id;
  final Value<int> patientId;
  final Value<String> allergies;
  final Value<String> medicalConditions;
  final Value<String> currentMedication;
  final Value<String> emergencyContactName;
  final Value<String> emergencyContactNumber;
  final Value<String> emergencyContactRelation;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const PatientRecordCompanion({
    this.id = const Value.absent(),
    this.patientId = const Value.absent(),
    this.allergies = const Value.absent(),
    this.medicalConditions = const Value.absent(),
    this.currentMedication = const Value.absent(),
    this.emergencyContactName = const Value.absent(),
    this.emergencyContactNumber = const Value.absent(),
    this.emergencyContactRelation = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  PatientRecordCompanion.insert({
    this.id = const Value.absent(),
    required int patientId,
    this.allergies = const Value.absent(),
    this.medicalConditions = const Value.absent(),
    required String currentMedication,
    required String emergencyContactName,
    required String emergencyContactNumber,
    required String emergencyContactRelation,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : patientId = Value(patientId),
       currentMedication = Value(currentMedication),
       emergencyContactName = Value(emergencyContactName),
       emergencyContactNumber = Value(emergencyContactNumber),
       emergencyContactRelation = Value(emergencyContactRelation),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<PatientRecordData> custom({
    Expression<int>? id,
    Expression<int>? patientId,
    Expression<String>? allergies,
    Expression<String>? medicalConditions,
    Expression<String>? currentMedication,
    Expression<String>? emergencyContactName,
    Expression<String>? emergencyContactNumber,
    Expression<String>? emergencyContactRelation,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientId != null) 'patient_id': patientId,
      if (allergies != null) 'allergies': allergies,
      if (medicalConditions != null) 'medical_conditions': medicalConditions,
      if (currentMedication != null) 'current_medication': currentMedication,
      if (emergencyContactName != null)
        'emergency_contact_name': emergencyContactName,
      if (emergencyContactNumber != null)
        'emergency_contact_number': emergencyContactNumber,
      if (emergencyContactRelation != null)
        'emergency_contact_relation': emergencyContactRelation,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  PatientRecordCompanion copyWith({
    Value<int>? id,
    Value<int>? patientId,
    Value<String>? allergies,
    Value<String>? medicalConditions,
    Value<String>? currentMedication,
    Value<String>? emergencyContactName,
    Value<String>? emergencyContactNumber,
    Value<String>? emergencyContactRelation,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return PatientRecordCompanion(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      allergies: allergies ?? this.allergies,
      medicalConditions: medicalConditions ?? this.medicalConditions,
      currentMedication: currentMedication ?? this.currentMedication,
      emergencyContactName: emergencyContactName ?? this.emergencyContactName,
      emergencyContactNumber:
          emergencyContactNumber ?? this.emergencyContactNumber,
      emergencyContactRelation:
          emergencyContactRelation ?? this.emergencyContactRelation,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<int>(patientId.value);
    }
    if (allergies.present) {
      map['allergies'] = Variable<String>(allergies.value);
    }
    if (medicalConditions.present) {
      map['medical_conditions'] = Variable<String>(medicalConditions.value);
    }
    if (currentMedication.present) {
      map['current_medication'] = Variable<String>(currentMedication.value);
    }
    if (emergencyContactName.present) {
      map['emergency_contact_name'] = Variable<String>(
        emergencyContactName.value,
      );
    }
    if (emergencyContactNumber.present) {
      map['emergency_contact_number'] = Variable<String>(
        emergencyContactNumber.value,
      );
    }
    if (emergencyContactRelation.present) {
      map['emergency_contact_relation'] = Variable<String>(
        emergencyContactRelation.value,
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PatientRecordCompanion(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('allergies: $allergies, ')
          ..write('medicalConditions: $medicalConditions, ')
          ..write('currentMedication: $currentMedication, ')
          ..write('emergencyContactName: $emergencyContactName, ')
          ..write('emergencyContactNumber: $emergencyContactNumber, ')
          ..write('emergencyContactRelation: $emergencyContactRelation, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
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
  late final $ProcedureLookupTable procedureLookup = $ProcedureLookupTable(
    this,
  );
  late final $TreatmentRecordTable treatmentRecord = $TreatmentRecordTable(
    this,
  );
  late final $PatientRecordTable patientRecord = $PatientRecordTable(this);
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
    procedureLookup,
    treatmentRecord,
    patientRecord,
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

  static MultiTypedResultKey<$PatientRecordTable, List<PatientRecordData>>
  _patientRecordRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.patientRecord,
    aliasName: $_aliasNameGenerator(db.patient.id, db.patientRecord.patientId),
  );

  $$PatientRecordTableProcessedTableManager get patientRecordRefs {
    final manager = $$PatientRecordTableTableManager(
      $_db,
      $_db.patientRecord,
    ).filter((f) => f.patientId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_patientRecordRefsTable($_db));
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

  Expression<bool> patientRecordRefs(
    Expression<bool> Function($$PatientRecordTableFilterComposer f) f,
  ) {
    final $$PatientRecordTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.patientRecord,
      getReferencedColumn: (t) => t.patientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientRecordTableFilterComposer(
            $db: $db,
            $table: $db.patientRecord,
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

  Expression<T> patientRecordRefs<T extends Object>(
    Expression<T> Function($$PatientRecordTableAnnotationComposer a) f,
  ) {
    final $$PatientRecordTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.patientRecord,
      getReferencedColumn: (t) => t.patientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientRecordTableAnnotationComposer(
            $db: $db,
            $table: $db.patientRecord,
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
          PrefetchHooks Function({
            bool appointmentRefs,
            bool dentalChartRefs,
            bool patientRecordRefs,
          })
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
              ({
                appointmentRefs = false,
                dentalChartRefs = false,
                patientRecordRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (appointmentRefs) db.appointment,
                    if (dentalChartRefs) db.dentalChart,
                    if (patientRecordRefs) db.patientRecord,
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
                      if (patientRecordRefs)
                        await $_getPrefetchedData<
                          PatientData,
                          $PatientTable,
                          PatientRecordData
                        >(
                          currentTable: table,
                          referencedTable: $$PatientTableReferences
                              ._patientRecordRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PatientTableReferences(
                                db,
                                table,
                                p0,
                              ).patientRecordRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.patientId == item.id,
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
      PrefetchHooks Function({
        bool appointmentRefs,
        bool dentalChartRefs,
        bool patientRecordRefs,
      })
    >;
typedef $$DentistTableCreateCompanionBuilder =
    DentistCompanion Function({Value<int> id, required String name});
typedef $$DentistTableUpdateCompanionBuilder =
    DentistCompanion Function({Value<int> id, Value<String> name});

final class $$DentistTableReferences
    extends BaseReferences<_$AppDatabase, $DentistTable, DentistData> {
  $$DentistTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AppointmentTable, List<AppointmentData>>
  _appointmentRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.appointment,
    aliasName: $_aliasNameGenerator(db.dentist.id, db.appointment.dentistID),
  );

  $$AppointmentTableProcessedTableManager get appointmentRefs {
    final manager = $$AppointmentTableTableManager(
      $_db,
      $_db.appointment,
    ).filter((f) => f.dentistID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_appointmentRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DentistTableFilterComposer
    extends Composer<_$AppDatabase, $DentistTable> {
  $$DentistTableFilterComposer({
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

  Expression<bool> appointmentRefs(
    Expression<bool> Function($$AppointmentTableFilterComposer f) f,
  ) {
    final $$AppointmentTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.appointment,
      getReferencedColumn: (t) => t.dentistID,
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
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
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
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> appointmentRefs<T extends Object>(
    Expression<T> Function($$AppointmentTableAnnotationComposer a) f,
  ) {
    final $$AppointmentTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.appointment,
      getReferencedColumn: (t) => t.dentistID,
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
          (DentistData, $$DentistTableReferences),
          DentistData,
          PrefetchHooks Function({bool appointmentRefs})
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
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => DentistCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  DentistCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DentistTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({appointmentRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (appointmentRefs) db.appointment],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (appointmentRefs)
                    await $_getPrefetchedData<
                      DentistData,
                      $DentistTable,
                      AppointmentData
                    >(
                      currentTable: table,
                      referencedTable: $$DentistTableReferences
                          ._appointmentRefsTable(db),
                      managerFromTypedResult: (p0) => $$DentistTableReferences(
                        db,
                        table,
                        p0,
                      ).appointmentRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.dentistID == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
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
      (DentistData, $$DentistTableReferences),
      DentistData,
      PrefetchHooks Function({bool appointmentRefs})
    >;
typedef $$AppointmentTableCreateCompanionBuilder =
    AppointmentCompanion Function({
      Value<int> id,
      required int patientID,
      required int dentistID,
      required DateTime scheduledAt,
      Value<String> status,
    });
typedef $$AppointmentTableUpdateCompanionBuilder =
    AppointmentCompanion Function({
      Value<int> id,
      Value<int> patientID,
      Value<int> dentistID,
      Value<DateTime> scheduledAt,
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

  static $DentistTable _dentistIDTable(_$AppDatabase db) =>
      db.dentist.createAlias(
        $_aliasNameGenerator(db.appointment.dentistID, db.dentist.id),
      );

  $$DentistTableProcessedTableManager get dentistID {
    final $_column = $_itemColumn<int>('dentist_i_d')!;

    final manager = $$DentistTableTableManager(
      $_db,
      $_db.dentist,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dentistIDTable($_db));
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

  ColumnFilters<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
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

  $$DentistTableFilterComposer get dentistID {
    final $$DentistTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dentistID,
      referencedTable: $db.dentist,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DentistTableFilterComposer(
            $db: $db,
            $table: $db.dentist,
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

  ColumnOrderings<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
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

  $$DentistTableOrderingComposer get dentistID {
    final $$DentistTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dentistID,
      referencedTable: $db.dentist,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DentistTableOrderingComposer(
            $db: $db,
            $table: $db.dentist,
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

  GeneratedColumn<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => column,
  );

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

  $$DentistTableAnnotationComposer get dentistID {
    final $$DentistTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dentistID,
      referencedTable: $db.dentist,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DentistTableAnnotationComposer(
            $db: $db,
            $table: $db.dentist,
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
            bool dentistID,
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
                Value<DateTime> scheduledAt = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => AppointmentCompanion(
                id: id,
                patientID: patientID,
                dentistID: dentistID,
                scheduledAt: scheduledAt,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int patientID,
                required int dentistID,
                required DateTime scheduledAt,
                Value<String> status = const Value.absent(),
              }) => AppointmentCompanion.insert(
                id: id,
                patientID: patientID,
                dentistID: dentistID,
                scheduledAt: scheduledAt,
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
                dentistID = false,
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
                        if (dentistID) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.dentistID,
                                    referencedTable:
                                        $$AppointmentTableReferences
                                            ._dentistIDTable(db),
                                    referencedColumn:
                                        $$AppointmentTableReferences
                                            ._dentistIDTable(db)
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
        bool dentistID,
        bool billingRefs,
        bool treatmentRecordRefs,
      })
    >;
typedef $$BillingTableCreateCompanionBuilder =
    BillingCompanion Function({
      Value<int> id,
      required int appointmentID,
      required double totalAmount,
      required double amountPaid,
      required String paymentMethod,
      Value<String> paymentStatus,
    });
typedef $$BillingTableUpdateCompanionBuilder =
    BillingCompanion Function({
      Value<int> id,
      Value<int> appointmentID,
      Value<double> totalAmount,
      Value<double> amountPaid,
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

  ColumnFilters<double> get amountPaid => $composableBuilder(
    column: $table.amountPaid,
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

  ColumnOrderings<double> get amountPaid => $composableBuilder(
    column: $table.amountPaid,
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

  GeneratedColumn<double> get amountPaid => $composableBuilder(
    column: $table.amountPaid,
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
                Value<double> amountPaid = const Value.absent(),
                Value<String> paymentMethod = const Value.absent(),
                Value<String> paymentStatus = const Value.absent(),
              }) => BillingCompanion(
                id: id,
                appointmentID: appointmentID,
                totalAmount: totalAmount,
                amountPaid: amountPaid,
                paymentMethod: paymentMethod,
                paymentStatus: paymentStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int appointmentID,
                required double totalAmount,
                required double amountPaid,
                required String paymentMethod,
                Value<String> paymentStatus = const Value.absent(),
              }) => BillingCompanion.insert(
                id: id,
                appointmentID: appointmentID,
                totalAmount: totalAmount,
                amountPaid: amountPaid,
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
typedef $$ProcedureLookupTableCreateCompanionBuilder =
    ProcedureLookupCompanion Function({
      Value<int> id,
      required String description,
      required double baseCost,
    });
typedef $$ProcedureLookupTableUpdateCompanionBuilder =
    ProcedureLookupCompanion Function({
      Value<int> id,
      Value<String> description,
      Value<double> baseCost,
    });

final class $$ProcedureLookupTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ProcedureLookupTable,
          ProcedureLookupData
        > {
  $$ProcedureLookupTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$TreatmentRecordTable, List<TreatmentRecordData>>
  _treatmentRecordRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.treatmentRecord,
    aliasName: $_aliasNameGenerator(
      db.procedureLookup.id,
      db.treatmentRecord.procedureID,
    ),
  );

  $$TreatmentRecordTableProcessedTableManager get treatmentRecordRefs {
    final manager = $$TreatmentRecordTableTableManager(
      $_db,
      $_db.treatmentRecord,
    ).filter((f) => f.procedureID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _treatmentRecordRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProcedureLookupTableFilterComposer
    extends Composer<_$AppDatabase, $ProcedureLookupTable> {
  $$ProcedureLookupTableFilterComposer({
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

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get baseCost => $composableBuilder(
    column: $table.baseCost,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> treatmentRecordRefs(
    Expression<bool> Function($$TreatmentRecordTableFilterComposer f) f,
  ) {
    final $$TreatmentRecordTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.treatmentRecord,
      getReferencedColumn: (t) => t.procedureID,
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

class $$ProcedureLookupTableOrderingComposer
    extends Composer<_$AppDatabase, $ProcedureLookupTable> {
  $$ProcedureLookupTableOrderingComposer({
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

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get baseCost => $composableBuilder(
    column: $table.baseCost,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProcedureLookupTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProcedureLookupTable> {
  $$ProcedureLookupTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<double> get baseCost =>
      $composableBuilder(column: $table.baseCost, builder: (column) => column);

  Expression<T> treatmentRecordRefs<T extends Object>(
    Expression<T> Function($$TreatmentRecordTableAnnotationComposer a) f,
  ) {
    final $$TreatmentRecordTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.treatmentRecord,
      getReferencedColumn: (t) => t.procedureID,
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

class $$ProcedureLookupTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProcedureLookupTable,
          ProcedureLookupData,
          $$ProcedureLookupTableFilterComposer,
          $$ProcedureLookupTableOrderingComposer,
          $$ProcedureLookupTableAnnotationComposer,
          $$ProcedureLookupTableCreateCompanionBuilder,
          $$ProcedureLookupTableUpdateCompanionBuilder,
          (ProcedureLookupData, $$ProcedureLookupTableReferences),
          ProcedureLookupData,
          PrefetchHooks Function({bool treatmentRecordRefs})
        > {
  $$ProcedureLookupTableTableManager(
    _$AppDatabase db,
    $ProcedureLookupTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProcedureLookupTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProcedureLookupTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProcedureLookupTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<double> baseCost = const Value.absent(),
              }) => ProcedureLookupCompanion(
                id: id,
                description: description,
                baseCost: baseCost,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String description,
                required double baseCost,
              }) => ProcedureLookupCompanion.insert(
                id: id,
                description: description,
                baseCost: baseCost,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProcedureLookupTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({treatmentRecordRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (treatmentRecordRefs) db.treatmentRecord,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (treatmentRecordRefs)
                    await $_getPrefetchedData<
                      ProcedureLookupData,
                      $ProcedureLookupTable,
                      TreatmentRecordData
                    >(
                      currentTable: table,
                      referencedTable: $$ProcedureLookupTableReferences
                          ._treatmentRecordRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ProcedureLookupTableReferences(
                            db,
                            table,
                            p0,
                          ).treatmentRecordRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.procedureID == item.id,
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

typedef $$ProcedureLookupTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProcedureLookupTable,
      ProcedureLookupData,
      $$ProcedureLookupTableFilterComposer,
      $$ProcedureLookupTableOrderingComposer,
      $$ProcedureLookupTableAnnotationComposer,
      $$ProcedureLookupTableCreateCompanionBuilder,
      $$ProcedureLookupTableUpdateCompanionBuilder,
      (ProcedureLookupData, $$ProcedureLookupTableReferences),
      ProcedureLookupData,
      PrefetchHooks Function({bool treatmentRecordRefs})
    >;
typedef $$TreatmentRecordTableCreateCompanionBuilder =
    TreatmentRecordCompanion Function({
      Value<int> id,
      required int appointmentID,
      required int procedureID,
      required int toothNumber,
      required String notes,
    });
typedef $$TreatmentRecordTableUpdateCompanionBuilder =
    TreatmentRecordCompanion Function({
      Value<int> id,
      Value<int> appointmentID,
      Value<int> procedureID,
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

  static $ProcedureLookupTable _procedureIDTable(_$AppDatabase db) =>
      db.procedureLookup.createAlias(
        $_aliasNameGenerator(
          db.treatmentRecord.procedureID,
          db.procedureLookup.id,
        ),
      );

  $$ProcedureLookupTableProcessedTableManager get procedureID {
    final $_column = $_itemColumn<int>('procedure_i_d')!;

    final manager = $$ProcedureLookupTableTableManager(
      $_db,
      $_db.procedureLookup,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_procedureIDTable($_db));
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

  $$ProcedureLookupTableFilterComposer get procedureID {
    final $$ProcedureLookupTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.procedureID,
      referencedTable: $db.procedureLookup,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProcedureLookupTableFilterComposer(
            $db: $db,
            $table: $db.procedureLookup,
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

  $$ProcedureLookupTableOrderingComposer get procedureID {
    final $$ProcedureLookupTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.procedureID,
      referencedTable: $db.procedureLookup,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProcedureLookupTableOrderingComposer(
            $db: $db,
            $table: $db.procedureLookup,
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

  $$ProcedureLookupTableAnnotationComposer get procedureID {
    final $$ProcedureLookupTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.procedureID,
      referencedTable: $db.procedureLookup,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProcedureLookupTableAnnotationComposer(
            $db: $db,
            $table: $db.procedureLookup,
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
          PrefetchHooks Function({bool appointmentID, bool procedureID})
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
                Value<int> procedureID = const Value.absent(),
                Value<int> toothNumber = const Value.absent(),
                Value<String> notes = const Value.absent(),
              }) => TreatmentRecordCompanion(
                id: id,
                appointmentID: appointmentID,
                procedureID: procedureID,
                toothNumber: toothNumber,
                notes: notes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int appointmentID,
                required int procedureID,
                required int toothNumber,
                required String notes,
              }) => TreatmentRecordCompanion.insert(
                id: id,
                appointmentID: appointmentID,
                procedureID: procedureID,
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
          prefetchHooksCallback:
              ({appointmentID = false, procedureID = false}) {
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
                        if (procedureID) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.procedureID,
                                    referencedTable:
                                        $$TreatmentRecordTableReferences
                                            ._procedureIDTable(db),
                                    referencedColumn:
                                        $$TreatmentRecordTableReferences
                                            ._procedureIDTable(db)
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
      PrefetchHooks Function({bool appointmentID, bool procedureID})
    >;
typedef $$PatientRecordTableCreateCompanionBuilder =
    PatientRecordCompanion Function({
      Value<int> id,
      required int patientId,
      Value<String> allergies,
      Value<String> medicalConditions,
      required String currentMedication,
      required String emergencyContactName,
      required String emergencyContactNumber,
      required String emergencyContactRelation,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$PatientRecordTableUpdateCompanionBuilder =
    PatientRecordCompanion Function({
      Value<int> id,
      Value<int> patientId,
      Value<String> allergies,
      Value<String> medicalConditions,
      Value<String> currentMedication,
      Value<String> emergencyContactName,
      Value<String> emergencyContactNumber,
      Value<String> emergencyContactRelation,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$PatientRecordTableReferences
    extends
        BaseReferences<_$AppDatabase, $PatientRecordTable, PatientRecordData> {
  $$PatientRecordTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PatientTable _patientIdTable(_$AppDatabase db) =>
      db.patient.createAlias(
        $_aliasNameGenerator(db.patientRecord.patientId, db.patient.id),
      );

  $$PatientTableProcessedTableManager get patientId {
    final $_column = $_itemColumn<int>('patient_id')!;

    final manager = $$PatientTableTableManager(
      $_db,
      $_db.patient,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_patientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PatientRecordTableFilterComposer
    extends Composer<_$AppDatabase, $PatientRecordTable> {
  $$PatientRecordTableFilterComposer({
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

  ColumnFilters<String> get allergies => $composableBuilder(
    column: $table.allergies,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get medicalConditions => $composableBuilder(
    column: $table.medicalConditions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currentMedication => $composableBuilder(
    column: $table.currentMedication,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emergencyContactName => $composableBuilder(
    column: $table.emergencyContactName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emergencyContactNumber => $composableBuilder(
    column: $table.emergencyContactNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emergencyContactRelation => $composableBuilder(
    column: $table.emergencyContactRelation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PatientTableFilterComposer get patientId {
    final $$PatientTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patientId,
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

class $$PatientRecordTableOrderingComposer
    extends Composer<_$AppDatabase, $PatientRecordTable> {
  $$PatientRecordTableOrderingComposer({
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

  ColumnOrderings<String> get allergies => $composableBuilder(
    column: $table.allergies,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get medicalConditions => $composableBuilder(
    column: $table.medicalConditions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currentMedication => $composableBuilder(
    column: $table.currentMedication,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emergencyContactName => $composableBuilder(
    column: $table.emergencyContactName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emergencyContactNumber => $composableBuilder(
    column: $table.emergencyContactNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emergencyContactRelation => $composableBuilder(
    column: $table.emergencyContactRelation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PatientTableOrderingComposer get patientId {
    final $$PatientTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patientId,
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

class $$PatientRecordTableAnnotationComposer
    extends Composer<_$AppDatabase, $PatientRecordTable> {
  $$PatientRecordTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get allergies =>
      $composableBuilder(column: $table.allergies, builder: (column) => column);

  GeneratedColumn<String> get medicalConditions => $composableBuilder(
    column: $table.medicalConditions,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currentMedication => $composableBuilder(
    column: $table.currentMedication,
    builder: (column) => column,
  );

  GeneratedColumn<String> get emergencyContactName => $composableBuilder(
    column: $table.emergencyContactName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get emergencyContactNumber => $composableBuilder(
    column: $table.emergencyContactNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get emergencyContactRelation => $composableBuilder(
    column: $table.emergencyContactRelation,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$PatientTableAnnotationComposer get patientId {
    final $$PatientTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.patientId,
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

class $$PatientRecordTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PatientRecordTable,
          PatientRecordData,
          $$PatientRecordTableFilterComposer,
          $$PatientRecordTableOrderingComposer,
          $$PatientRecordTableAnnotationComposer,
          $$PatientRecordTableCreateCompanionBuilder,
          $$PatientRecordTableUpdateCompanionBuilder,
          (PatientRecordData, $$PatientRecordTableReferences),
          PatientRecordData,
          PrefetchHooks Function({bool patientId})
        > {
  $$PatientRecordTableTableManager(_$AppDatabase db, $PatientRecordTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PatientRecordTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PatientRecordTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PatientRecordTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> patientId = const Value.absent(),
                Value<String> allergies = const Value.absent(),
                Value<String> medicalConditions = const Value.absent(),
                Value<String> currentMedication = const Value.absent(),
                Value<String> emergencyContactName = const Value.absent(),
                Value<String> emergencyContactNumber = const Value.absent(),
                Value<String> emergencyContactRelation = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => PatientRecordCompanion(
                id: id,
                patientId: patientId,
                allergies: allergies,
                medicalConditions: medicalConditions,
                currentMedication: currentMedication,
                emergencyContactName: emergencyContactName,
                emergencyContactNumber: emergencyContactNumber,
                emergencyContactRelation: emergencyContactRelation,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int patientId,
                Value<String> allergies = const Value.absent(),
                Value<String> medicalConditions = const Value.absent(),
                required String currentMedication,
                required String emergencyContactName,
                required String emergencyContactNumber,
                required String emergencyContactRelation,
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => PatientRecordCompanion.insert(
                id: id,
                patientId: patientId,
                allergies: allergies,
                medicalConditions: medicalConditions,
                currentMedication: currentMedication,
                emergencyContactName: emergencyContactName,
                emergencyContactNumber: emergencyContactNumber,
                emergencyContactRelation: emergencyContactRelation,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PatientRecordTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({patientId = false}) {
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
                    if (patientId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.patientId,
                                referencedTable: $$PatientRecordTableReferences
                                    ._patientIdTable(db),
                                referencedColumn: $$PatientRecordTableReferences
                                    ._patientIdTable(db)
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

typedef $$PatientRecordTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PatientRecordTable,
      PatientRecordData,
      $$PatientRecordTableFilterComposer,
      $$PatientRecordTableOrderingComposer,
      $$PatientRecordTableAnnotationComposer,
      $$PatientRecordTableCreateCompanionBuilder,
      $$PatientRecordTableUpdateCompanionBuilder,
      (PatientRecordData, $$PatientRecordTableReferences),
      PatientRecordData,
      PrefetchHooks Function({bool patientId})
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
  $$ProcedureLookupTableTableManager get procedureLookup =>
      $$ProcedureLookupTableTableManager(_db, _db.procedureLookup);
  $$TreatmentRecordTableTableManager get treatmentRecord =>
      $$TreatmentRecordTableTableManager(_db, _db.treatmentRecord);
  $$PatientRecordTableTableManager get patientRecord =>
      $$PatientRecordTableTableManager(_db, _db.patientRecord);
}
