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
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _middleNameMeta =
      const VerificationMeta('middleName');
  @override
  late final GeneratedColumn<String> middleName = GeneratedColumn<String>(
      'middle_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _birthDateMeta =
      const VerificationMeta('birthDate');
  @override
  late final GeneratedColumn<DateTime> birthDate = GeneratedColumn<DateTime>(
      'birth_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<String> sex = GeneratedColumn<String>(
      'sex', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _civilStatusMeta =
      const VerificationMeta('civilStatus');
  @override
  late final GeneratedColumn<String> civilStatus = GeneratedColumn<String>(
      'civil_status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contactNumberMeta =
      const VerificationMeta('contactNumber');
  @override
  late final GeneratedColumn<String> contactNumber = GeneratedColumn<String>(
      'contact_number', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 10, maxTextLength: 11),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _emergencyContactNoMeta =
      const VerificationMeta('emergencyContactNo');
  @override
  late final GeneratedColumn<String> emergencyContactNo =
      GeneratedColumn<String>('emergency_contact_no', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _referredByMeta =
      const VerificationMeta('referredBy');
  @override
  late final GeneratedColumn<String> referredBy = GeneratedColumn<String>(
      'referred_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _relationshipMeta =
      const VerificationMeta('relationship');
  @override
  late final GeneratedColumn<String> relationship = GeneratedColumn<String>(
      'relationship', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _streetAddressMeta =
      const VerificationMeta('streetAddress');
  @override
  late final GeneratedColumn<String> streetAddress = GeneratedColumn<String>(
      'street_address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _barangayMeta =
      const VerificationMeta('barangay');
  @override
  late final GeneratedColumn<String> barangay = GeneratedColumn<String>(
      'barangay', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cityMunicipalityMeta =
      const VerificationMeta('cityMunicipality');
  @override
  late final GeneratedColumn<String> cityMunicipality = GeneratedColumn<String>(
      'city_municipality', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _provinceMeta =
      const VerificationMeta('province');
  @override
  late final GeneratedColumn<String> province = GeneratedColumn<String>(
      'province', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _zipCodeMeta =
      const VerificationMeta('zipCode');
  @override
  late final GeneratedColumn<String> zipCode = GeneratedColumn<String>(
      'zip_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isArchivedMeta =
      const VerificationMeta('isArchived');
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
      'is_archived', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_archived" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        firstName,
        middleName,
        lastName,
        birthDate,
        sex,
        civilStatus,
        contactNumber,
        emergencyContactNo,
        referredBy,
        relationship,
        streetAddress,
        barangay,
        cityMunicipality,
        province,
        zipCode,
        isArchived
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'patient';
  @override
  VerificationContext validateIntegrity(Insertable<PatientData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('middle_name')) {
      context.handle(
          _middleNameMeta,
          middleName.isAcceptableOrUnknown(
              data['middle_name']!, _middleNameMeta));
    } else if (isInserting) {
      context.missing(_middleNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('birth_date')) {
      context.handle(_birthDateMeta,
          birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta));
    } else if (isInserting) {
      context.missing(_birthDateMeta);
    }
    if (data.containsKey('sex')) {
      context.handle(
          _sexMeta, sex.isAcceptableOrUnknown(data['sex']!, _sexMeta));
    } else if (isInserting) {
      context.missing(_sexMeta);
    }
    if (data.containsKey('civil_status')) {
      context.handle(
          _civilStatusMeta,
          civilStatus.isAcceptableOrUnknown(
              data['civil_status']!, _civilStatusMeta));
    } else if (isInserting) {
      context.missing(_civilStatusMeta);
    }
    if (data.containsKey('contact_number')) {
      context.handle(
          _contactNumberMeta,
          contactNumber.isAcceptableOrUnknown(
              data['contact_number']!, _contactNumberMeta));
    } else if (isInserting) {
      context.missing(_contactNumberMeta);
    }
    if (data.containsKey('emergency_contact_no')) {
      context.handle(
          _emergencyContactNoMeta,
          emergencyContactNo.isAcceptableOrUnknown(
              data['emergency_contact_no']!, _emergencyContactNoMeta));
    }
    if (data.containsKey('referred_by')) {
      context.handle(
          _referredByMeta,
          referredBy.isAcceptableOrUnknown(
              data['referred_by']!, _referredByMeta));
    }
    if (data.containsKey('relationship')) {
      context.handle(
          _relationshipMeta,
          relationship.isAcceptableOrUnknown(
              data['relationship']!, _relationshipMeta));
    }
    if (data.containsKey('street_address')) {
      context.handle(
          _streetAddressMeta,
          streetAddress.isAcceptableOrUnknown(
              data['street_address']!, _streetAddressMeta));
    } else if (isInserting) {
      context.missing(_streetAddressMeta);
    }
    if (data.containsKey('barangay')) {
      context.handle(_barangayMeta,
          barangay.isAcceptableOrUnknown(data['barangay']!, _barangayMeta));
    } else if (isInserting) {
      context.missing(_barangayMeta);
    }
    if (data.containsKey('city_municipality')) {
      context.handle(
          _cityMunicipalityMeta,
          cityMunicipality.isAcceptableOrUnknown(
              data['city_municipality']!, _cityMunicipalityMeta));
    } else if (isInserting) {
      context.missing(_cityMunicipalityMeta);
    }
    if (data.containsKey('province')) {
      context.handle(_provinceMeta,
          province.isAcceptableOrUnknown(data['province']!, _provinceMeta));
    } else if (isInserting) {
      context.missing(_provinceMeta);
    }
    if (data.containsKey('zip_code')) {
      context.handle(_zipCodeMeta,
          zipCode.isAcceptableOrUnknown(data['zip_code']!, _zipCodeMeta));
    } else if (isInserting) {
      context.missing(_zipCodeMeta);
    }
    if (data.containsKey('is_archived')) {
      context.handle(
          _isArchivedMeta,
          isArchived.isAcceptableOrUnknown(
              data['is_archived']!, _isArchivedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PatientData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PatientData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      middleName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}middle_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      birthDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}birth_date'])!,
      sex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sex'])!,
      civilStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}civil_status'])!,
      contactNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}contact_number'])!,
      emergencyContactNo: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}emergency_contact_no']),
      referredBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}referred_by']),
      relationship: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}relationship']),
      streetAddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}street_address'])!,
      barangay: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}barangay'])!,
      cityMunicipality: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}city_municipality'])!,
      province: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}province'])!,
      zipCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}zip_code'])!,
      isArchived: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_archived'])!,
    );
  }

  @override
  $PatientTable createAlias(String alias) {
    return $PatientTable(attachedDatabase, alias);
  }
}

class PatientData extends DataClass implements Insertable<PatientData> {
  final int id;
  final String firstName;
  final String middleName;
  final String lastName;
  final DateTime birthDate;
  final String sex;
  final String civilStatus;
  final String contactNumber;
  final String? emergencyContactNo;
  final String? referredBy;
  final String? relationship;
  final String streetAddress;
  final String barangay;
  final String cityMunicipality;
  final String province;
  final String zipCode;
  final bool isArchived;
  const PatientData(
      {required this.id,
      required this.firstName,
      required this.middleName,
      required this.lastName,
      required this.birthDate,
      required this.sex,
      required this.civilStatus,
      required this.contactNumber,
      this.emergencyContactNo,
      this.referredBy,
      this.relationship,
      required this.streetAddress,
      required this.barangay,
      required this.cityMunicipality,
      required this.province,
      required this.zipCode,
      required this.isArchived});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['first_name'] = Variable<String>(firstName);
    map['middle_name'] = Variable<String>(middleName);
    map['last_name'] = Variable<String>(lastName);
    map['birth_date'] = Variable<DateTime>(birthDate);
    map['sex'] = Variable<String>(sex);
    map['civil_status'] = Variable<String>(civilStatus);
    map['contact_number'] = Variable<String>(contactNumber);
    if (!nullToAbsent || emergencyContactNo != null) {
      map['emergency_contact_no'] = Variable<String>(emergencyContactNo);
    }
    if (!nullToAbsent || referredBy != null) {
      map['referred_by'] = Variable<String>(referredBy);
    }
    if (!nullToAbsent || relationship != null) {
      map['relationship'] = Variable<String>(relationship);
    }
    map['street_address'] = Variable<String>(streetAddress);
    map['barangay'] = Variable<String>(barangay);
    map['city_municipality'] = Variable<String>(cityMunicipality);
    map['province'] = Variable<String>(province);
    map['zip_code'] = Variable<String>(zipCode);
    map['is_archived'] = Variable<bool>(isArchived);
    return map;
  }

  PatientCompanion toCompanion(bool nullToAbsent) {
    return PatientCompanion(
      id: Value(id),
      firstName: Value(firstName),
      middleName: Value(middleName),
      lastName: Value(lastName),
      birthDate: Value(birthDate),
      sex: Value(sex),
      civilStatus: Value(civilStatus),
      contactNumber: Value(contactNumber),
      emergencyContactNo: emergencyContactNo == null && nullToAbsent
          ? const Value.absent()
          : Value(emergencyContactNo),
      referredBy: referredBy == null && nullToAbsent
          ? const Value.absent()
          : Value(referredBy),
      relationship: relationship == null && nullToAbsent
          ? const Value.absent()
          : Value(relationship),
      streetAddress: Value(streetAddress),
      barangay: Value(barangay),
      cityMunicipality: Value(cityMunicipality),
      province: Value(province),
      zipCode: Value(zipCode),
      isArchived: Value(isArchived),
    );
  }

  factory PatientData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PatientData(
      id: serializer.fromJson<int>(json['id']),
      firstName: serializer.fromJson<String>(json['firstName']),
      middleName: serializer.fromJson<String>(json['middleName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      birthDate: serializer.fromJson<DateTime>(json['birthDate']),
      sex: serializer.fromJson<String>(json['sex']),
      civilStatus: serializer.fromJson<String>(json['civilStatus']),
      contactNumber: serializer.fromJson<String>(json['contactNumber']),
      emergencyContactNo:
          serializer.fromJson<String?>(json['emergencyContactNo']),
      referredBy: serializer.fromJson<String?>(json['referredBy']),
      relationship: serializer.fromJson<String?>(json['relationship']),
      streetAddress: serializer.fromJson<String>(json['streetAddress']),
      barangay: serializer.fromJson<String>(json['barangay']),
      cityMunicipality: serializer.fromJson<String>(json['cityMunicipality']),
      province: serializer.fromJson<String>(json['province']),
      zipCode: serializer.fromJson<String>(json['zipCode']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firstName': serializer.toJson<String>(firstName),
      'middleName': serializer.toJson<String>(middleName),
      'lastName': serializer.toJson<String>(lastName),
      'birthDate': serializer.toJson<DateTime>(birthDate),
      'sex': serializer.toJson<String>(sex),
      'civilStatus': serializer.toJson<String>(civilStatus),
      'contactNumber': serializer.toJson<String>(contactNumber),
      'emergencyContactNo': serializer.toJson<String?>(emergencyContactNo),
      'referredBy': serializer.toJson<String?>(referredBy),
      'relationship': serializer.toJson<String?>(relationship),
      'streetAddress': serializer.toJson<String>(streetAddress),
      'barangay': serializer.toJson<String>(barangay),
      'cityMunicipality': serializer.toJson<String>(cityMunicipality),
      'province': serializer.toJson<String>(province),
      'zipCode': serializer.toJson<String>(zipCode),
      'isArchived': serializer.toJson<bool>(isArchived),
    };
  }

  PatientData copyWith(
          {int? id,
          String? firstName,
          String? middleName,
          String? lastName,
          DateTime? birthDate,
          String? sex,
          String? civilStatus,
          String? contactNumber,
          Value<String?> emergencyContactNo = const Value.absent(),
          Value<String?> referredBy = const Value.absent(),
          Value<String?> relationship = const Value.absent(),
          String? streetAddress,
          String? barangay,
          String? cityMunicipality,
          String? province,
          String? zipCode,
          bool? isArchived}) =>
      PatientData(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        lastName: lastName ?? this.lastName,
        birthDate: birthDate ?? this.birthDate,
        sex: sex ?? this.sex,
        civilStatus: civilStatus ?? this.civilStatus,
        contactNumber: contactNumber ?? this.contactNumber,
        emergencyContactNo: emergencyContactNo.present
            ? emergencyContactNo.value
            : this.emergencyContactNo,
        referredBy: referredBy.present ? referredBy.value : this.referredBy,
        relationship:
            relationship.present ? relationship.value : this.relationship,
        streetAddress: streetAddress ?? this.streetAddress,
        barangay: barangay ?? this.barangay,
        cityMunicipality: cityMunicipality ?? this.cityMunicipality,
        province: province ?? this.province,
        zipCode: zipCode ?? this.zipCode,
        isArchived: isArchived ?? this.isArchived,
      );
  PatientData copyWithCompanion(PatientCompanion data) {
    return PatientData(
      id: data.id.present ? data.id.value : this.id,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      middleName:
          data.middleName.present ? data.middleName.value : this.middleName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      birthDate: data.birthDate.present ? data.birthDate.value : this.birthDate,
      sex: data.sex.present ? data.sex.value : this.sex,
      civilStatus:
          data.civilStatus.present ? data.civilStatus.value : this.civilStatus,
      contactNumber: data.contactNumber.present
          ? data.contactNumber.value
          : this.contactNumber,
      emergencyContactNo: data.emergencyContactNo.present
          ? data.emergencyContactNo.value
          : this.emergencyContactNo,
      referredBy:
          data.referredBy.present ? data.referredBy.value : this.referredBy,
      relationship: data.relationship.present
          ? data.relationship.value
          : this.relationship,
      streetAddress: data.streetAddress.present
          ? data.streetAddress.value
          : this.streetAddress,
      barangay: data.barangay.present ? data.barangay.value : this.barangay,
      cityMunicipality: data.cityMunicipality.present
          ? data.cityMunicipality.value
          : this.cityMunicipality,
      province: data.province.present ? data.province.value : this.province,
      zipCode: data.zipCode.present ? data.zipCode.value : this.zipCode,
      isArchived:
          data.isArchived.present ? data.isArchived.value : this.isArchived,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PatientData(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('middleName: $middleName, ')
          ..write('lastName: $lastName, ')
          ..write('birthDate: $birthDate, ')
          ..write('sex: $sex, ')
          ..write('civilStatus: $civilStatus, ')
          ..write('contactNumber: $contactNumber, ')
          ..write('emergencyContactNo: $emergencyContactNo, ')
          ..write('referredBy: $referredBy, ')
          ..write('relationship: $relationship, ')
          ..write('streetAddress: $streetAddress, ')
          ..write('barangay: $barangay, ')
          ..write('cityMunicipality: $cityMunicipality, ')
          ..write('province: $province, ')
          ..write('zipCode: $zipCode, ')
          ..write('isArchived: $isArchived')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      firstName,
      middleName,
      lastName,
      birthDate,
      sex,
      civilStatus,
      contactNumber,
      emergencyContactNo,
      referredBy,
      relationship,
      streetAddress,
      barangay,
      cityMunicipality,
      province,
      zipCode,
      isArchived);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PatientData &&
          other.id == this.id &&
          other.firstName == this.firstName &&
          other.middleName == this.middleName &&
          other.lastName == this.lastName &&
          other.birthDate == this.birthDate &&
          other.sex == this.sex &&
          other.civilStatus == this.civilStatus &&
          other.contactNumber == this.contactNumber &&
          other.emergencyContactNo == this.emergencyContactNo &&
          other.referredBy == this.referredBy &&
          other.relationship == this.relationship &&
          other.streetAddress == this.streetAddress &&
          other.barangay == this.barangay &&
          other.cityMunicipality == this.cityMunicipality &&
          other.province == this.province &&
          other.zipCode == this.zipCode &&
          other.isArchived == this.isArchived);
}

class PatientCompanion extends UpdateCompanion<PatientData> {
  final Value<int> id;
  final Value<String> firstName;
  final Value<String> middleName;
  final Value<String> lastName;
  final Value<DateTime> birthDate;
  final Value<String> sex;
  final Value<String> civilStatus;
  final Value<String> contactNumber;
  final Value<String?> emergencyContactNo;
  final Value<String?> referredBy;
  final Value<String?> relationship;
  final Value<String> streetAddress;
  final Value<String> barangay;
  final Value<String> cityMunicipality;
  final Value<String> province;
  final Value<String> zipCode;
  final Value<bool> isArchived;
  const PatientCompanion({
    this.id = const Value.absent(),
    this.firstName = const Value.absent(),
    this.middleName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.sex = const Value.absent(),
    this.civilStatus = const Value.absent(),
    this.contactNumber = const Value.absent(),
    this.emergencyContactNo = const Value.absent(),
    this.referredBy = const Value.absent(),
    this.relationship = const Value.absent(),
    this.streetAddress = const Value.absent(),
    this.barangay = const Value.absent(),
    this.cityMunicipality = const Value.absent(),
    this.province = const Value.absent(),
    this.zipCode = const Value.absent(),
    this.isArchived = const Value.absent(),
  });
  PatientCompanion.insert({
    this.id = const Value.absent(),
    required String firstName,
    required String middleName,
    required String lastName,
    required DateTime birthDate,
    required String sex,
    required String civilStatus,
    required String contactNumber,
    this.emergencyContactNo = const Value.absent(),
    this.referredBy = const Value.absent(),
    this.relationship = const Value.absent(),
    required String streetAddress,
    required String barangay,
    required String cityMunicipality,
    required String province,
    required String zipCode,
    this.isArchived = const Value.absent(),
  })  : firstName = Value(firstName),
        middleName = Value(middleName),
        lastName = Value(lastName),
        birthDate = Value(birthDate),
        sex = Value(sex),
        civilStatus = Value(civilStatus),
        contactNumber = Value(contactNumber),
        streetAddress = Value(streetAddress),
        barangay = Value(barangay),
        cityMunicipality = Value(cityMunicipality),
        province = Value(province),
        zipCode = Value(zipCode);
  static Insertable<PatientData> custom({
    Expression<int>? id,
    Expression<String>? firstName,
    Expression<String>? middleName,
    Expression<String>? lastName,
    Expression<DateTime>? birthDate,
    Expression<String>? sex,
    Expression<String>? civilStatus,
    Expression<String>? contactNumber,
    Expression<String>? emergencyContactNo,
    Expression<String>? referredBy,
    Expression<String>? relationship,
    Expression<String>? streetAddress,
    Expression<String>? barangay,
    Expression<String>? cityMunicipality,
    Expression<String>? province,
    Expression<String>? zipCode,
    Expression<bool>? isArchived,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firstName != null) 'first_name': firstName,
      if (middleName != null) 'middle_name': middleName,
      if (lastName != null) 'last_name': lastName,
      if (birthDate != null) 'birth_date': birthDate,
      if (sex != null) 'sex': sex,
      if (civilStatus != null) 'civil_status': civilStatus,
      if (contactNumber != null) 'contact_number': contactNumber,
      if (emergencyContactNo != null)
        'emergency_contact_no': emergencyContactNo,
      if (referredBy != null) 'referred_by': referredBy,
      if (relationship != null) 'relationship': relationship,
      if (streetAddress != null) 'street_address': streetAddress,
      if (barangay != null) 'barangay': barangay,
      if (cityMunicipality != null) 'city_municipality': cityMunicipality,
      if (province != null) 'province': province,
      if (zipCode != null) 'zip_code': zipCode,
      if (isArchived != null) 'is_archived': isArchived,
    });
  }

  PatientCompanion copyWith(
      {Value<int>? id,
      Value<String>? firstName,
      Value<String>? middleName,
      Value<String>? lastName,
      Value<DateTime>? birthDate,
      Value<String>? sex,
      Value<String>? civilStatus,
      Value<String>? contactNumber,
      Value<String?>? emergencyContactNo,
      Value<String?>? referredBy,
      Value<String?>? relationship,
      Value<String>? streetAddress,
      Value<String>? barangay,
      Value<String>? cityMunicipality,
      Value<String>? province,
      Value<String>? zipCode,
      Value<bool>? isArchived}) {
    return PatientCompanion(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      birthDate: birthDate ?? this.birthDate,
      sex: sex ?? this.sex,
      civilStatus: civilStatus ?? this.civilStatus,
      contactNumber: contactNumber ?? this.contactNumber,
      emergencyContactNo: emergencyContactNo ?? this.emergencyContactNo,
      referredBy: referredBy ?? this.referredBy,
      relationship: relationship ?? this.relationship,
      streetAddress: streetAddress ?? this.streetAddress,
      barangay: barangay ?? this.barangay,
      cityMunicipality: cityMunicipality ?? this.cityMunicipality,
      province: province ?? this.province,
      zipCode: zipCode ?? this.zipCode,
      isArchived: isArchived ?? this.isArchived,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (middleName.present) {
      map['middle_name'] = Variable<String>(middleName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (sex.present) {
      map['sex'] = Variable<String>(sex.value);
    }
    if (civilStatus.present) {
      map['civil_status'] = Variable<String>(civilStatus.value);
    }
    if (contactNumber.present) {
      map['contact_number'] = Variable<String>(contactNumber.value);
    }
    if (emergencyContactNo.present) {
      map['emergency_contact_no'] = Variable<String>(emergencyContactNo.value);
    }
    if (referredBy.present) {
      map['referred_by'] = Variable<String>(referredBy.value);
    }
    if (relationship.present) {
      map['relationship'] = Variable<String>(relationship.value);
    }
    if (streetAddress.present) {
      map['street_address'] = Variable<String>(streetAddress.value);
    }
    if (barangay.present) {
      map['barangay'] = Variable<String>(barangay.value);
    }
    if (cityMunicipality.present) {
      map['city_municipality'] = Variable<String>(cityMunicipality.value);
    }
    if (province.present) {
      map['province'] = Variable<String>(province.value);
    }
    if (zipCode.present) {
      map['zip_code'] = Variable<String>(zipCode.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PatientCompanion(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('middleName: $middleName, ')
          ..write('lastName: $lastName, ')
          ..write('birthDate: $birthDate, ')
          ..write('sex: $sex, ')
          ..write('civilStatus: $civilStatus, ')
          ..write('contactNumber: $contactNumber, ')
          ..write('emergencyContactNo: $emergencyContactNo, ')
          ..write('referredBy: $referredBy, ')
          ..write('relationship: $relationship, ')
          ..write('streetAddress: $streetAddress, ')
          ..write('barangay: $barangay, ')
          ..write('cityMunicipality: $cityMunicipality, ')
          ..write('province: $province, ')
          ..write('zipCode: $zipCode, ')
          ..write('isArchived: $isArchived')
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
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dentist';
  @override
  VerificationContext validateIntegrity(Insertable<DentistData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  DentistData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DentistData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
    );
  }

  @override
  $DentistTable createAlias(String alias) {
    return $DentistTable(attachedDatabase, alias);
  }
}

class DentistData extends DataClass implements Insertable<DentistData> {
  final int id;
  const DentistData({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    return map;
  }

  DentistCompanion toCompanion(bool nullToAbsent) {
    return DentistCompanion(
      id: Value(id),
    );
  }

  factory DentistData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DentistData(
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
    };
  }

  DentistData copyWith({int? id}) => DentistData(
        id: id ?? this.id,
      );
  DentistData copyWithCompanion(DentistCompanion data) {
    return DentistData(
      id: data.id.present ? data.id.value : this.id,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DentistData(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is DentistData && other.id == this.id);
}

class DentistCompanion extends UpdateCompanion<DentistData> {
  final Value<int> id;
  final Value<int> rowid;
  const DentistCompanion({
    this.id = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DentistCompanion.insert({
    required int id,
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<DentistData> custom({
    Expression<int>? id,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DentistCompanion copyWith({Value<int>? id, Value<int>? rowid}) {
    return DentistCompanion(
      id: id ?? this.id,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DentistCompanion(')
          ..write('id: $id, ')
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
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _patientIdMeta =
      const VerificationMeta('patientId');
  @override
  late final GeneratedColumn<int> patientId = GeneratedColumn<int>(
      'patient_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES patient (id)'));
  static const VerificationMeta _appointmentDateMeta =
      const VerificationMeta('appointmentDate');
  @override
  late final GeneratedColumn<DateTime> appointmentDate =
      GeneratedColumn<DateTime>('appointment_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _timeSlotMeta =
      const VerificationMeta('timeSlot');
  @override
  late final GeneratedColumn<String> timeSlot = GeneratedColumn<String>(
      'time_slot', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _reasonForVisitMeta =
      const VerificationMeta('reasonForVisit');
  @override
  late final GeneratedColumn<String> reasonForVisit = GeneratedColumn<String>(
      'reason_for_visit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Scheduled'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, patientId, appointmentDate, timeSlot, reasonForVisit, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'appointment';
  @override
  VerificationContext validateIntegrity(Insertable<AppointmentData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('patient_id')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta));
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('appointment_date')) {
      context.handle(
          _appointmentDateMeta,
          appointmentDate.isAcceptableOrUnknown(
              data['appointment_date']!, _appointmentDateMeta));
    } else if (isInserting) {
      context.missing(_appointmentDateMeta);
    }
    if (data.containsKey('time_slot')) {
      context.handle(_timeSlotMeta,
          timeSlot.isAcceptableOrUnknown(data['time_slot']!, _timeSlotMeta));
    } else if (isInserting) {
      context.missing(_timeSlotMeta);
    }
    if (data.containsKey('reason_for_visit')) {
      context.handle(
          _reasonForVisitMeta,
          reasonForVisit.isAcceptableOrUnknown(
              data['reason_for_visit']!, _reasonForVisitMeta));
    } else if (isInserting) {
      context.missing(_reasonForVisitMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppointmentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppointmentData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}patient_id'])!,
      appointmentDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}appointment_date'])!,
      timeSlot: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}time_slot'])!,
      reasonForVisit: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}reason_for_visit'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $AppointmentTable createAlias(String alias) {
    return $AppointmentTable(attachedDatabase, alias);
  }
}

class AppointmentData extends DataClass implements Insertable<AppointmentData> {
  final int id;
  final int patientId;
  final DateTime appointmentDate;
  final String timeSlot;
  final String reasonForVisit;
  final String status;
  const AppointmentData(
      {required this.id,
      required this.patientId,
      required this.appointmentDate,
      required this.timeSlot,
      required this.reasonForVisit,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['patient_id'] = Variable<int>(patientId);
    map['appointment_date'] = Variable<DateTime>(appointmentDate);
    map['time_slot'] = Variable<String>(timeSlot);
    map['reason_for_visit'] = Variable<String>(reasonForVisit);
    map['status'] = Variable<String>(status);
    return map;
  }

  AppointmentCompanion toCompanion(bool nullToAbsent) {
    return AppointmentCompanion(
      id: Value(id),
      patientId: Value(patientId),
      appointmentDate: Value(appointmentDate),
      timeSlot: Value(timeSlot),
      reasonForVisit: Value(reasonForVisit),
      status: Value(status),
    );
  }

  factory AppointmentData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppointmentData(
      id: serializer.fromJson<int>(json['id']),
      patientId: serializer.fromJson<int>(json['patientId']),
      appointmentDate: serializer.fromJson<DateTime>(json['appointmentDate']),
      timeSlot: serializer.fromJson<String>(json['timeSlot']),
      reasonForVisit: serializer.fromJson<String>(json['reasonForVisit']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'patientId': serializer.toJson<int>(patientId),
      'appointmentDate': serializer.toJson<DateTime>(appointmentDate),
      'timeSlot': serializer.toJson<String>(timeSlot),
      'reasonForVisit': serializer.toJson<String>(reasonForVisit),
      'status': serializer.toJson<String>(status),
    };
  }

  AppointmentData copyWith(
          {int? id,
          int? patientId,
          DateTime? appointmentDate,
          String? timeSlot,
          String? reasonForVisit,
          String? status}) =>
      AppointmentData(
        id: id ?? this.id,
        patientId: patientId ?? this.patientId,
        appointmentDate: appointmentDate ?? this.appointmentDate,
        timeSlot: timeSlot ?? this.timeSlot,
        reasonForVisit: reasonForVisit ?? this.reasonForVisit,
        status: status ?? this.status,
      );
  AppointmentData copyWithCompanion(AppointmentCompanion data) {
    return AppointmentData(
      id: data.id.present ? data.id.value : this.id,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      appointmentDate: data.appointmentDate.present
          ? data.appointmentDate.value
          : this.appointmentDate,
      timeSlot: data.timeSlot.present ? data.timeSlot.value : this.timeSlot,
      reasonForVisit: data.reasonForVisit.present
          ? data.reasonForVisit.value
          : this.reasonForVisit,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppointmentData(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('appointmentDate: $appointmentDate, ')
          ..write('timeSlot: $timeSlot, ')
          ..write('reasonForVisit: $reasonForVisit, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, patientId, appointmentDate, timeSlot, reasonForVisit, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppointmentData &&
          other.id == this.id &&
          other.patientId == this.patientId &&
          other.appointmentDate == this.appointmentDate &&
          other.timeSlot == this.timeSlot &&
          other.reasonForVisit == this.reasonForVisit &&
          other.status == this.status);
}

class AppointmentCompanion extends UpdateCompanion<AppointmentData> {
  final Value<int> id;
  final Value<int> patientId;
  final Value<DateTime> appointmentDate;
  final Value<String> timeSlot;
  final Value<String> reasonForVisit;
  final Value<String> status;
  const AppointmentCompanion({
    this.id = const Value.absent(),
    this.patientId = const Value.absent(),
    this.appointmentDate = const Value.absent(),
    this.timeSlot = const Value.absent(),
    this.reasonForVisit = const Value.absent(),
    this.status = const Value.absent(),
  });
  AppointmentCompanion.insert({
    this.id = const Value.absent(),
    required int patientId,
    required DateTime appointmentDate,
    required String timeSlot,
    required String reasonForVisit,
    this.status = const Value.absent(),
  })  : patientId = Value(patientId),
        appointmentDate = Value(appointmentDate),
        timeSlot = Value(timeSlot),
        reasonForVisit = Value(reasonForVisit);
  static Insertable<AppointmentData> custom({
    Expression<int>? id,
    Expression<int>? patientId,
    Expression<DateTime>? appointmentDate,
    Expression<String>? timeSlot,
    Expression<String>? reasonForVisit,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientId != null) 'patient_id': patientId,
      if (appointmentDate != null) 'appointment_date': appointmentDate,
      if (timeSlot != null) 'time_slot': timeSlot,
      if (reasonForVisit != null) 'reason_for_visit': reasonForVisit,
      if (status != null) 'status': status,
    });
  }

  AppointmentCompanion copyWith(
      {Value<int>? id,
      Value<int>? patientId,
      Value<DateTime>? appointmentDate,
      Value<String>? timeSlot,
      Value<String>? reasonForVisit,
      Value<String>? status}) {
    return AppointmentCompanion(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      appointmentDate: appointmentDate ?? this.appointmentDate,
      timeSlot: timeSlot ?? this.timeSlot,
      reasonForVisit: reasonForVisit ?? this.reasonForVisit,
      status: status ?? this.status,
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
    if (appointmentDate.present) {
      map['appointment_date'] = Variable<DateTime>(appointmentDate.value);
    }
    if (timeSlot.present) {
      map['time_slot'] = Variable<String>(timeSlot.value);
    }
    if (reasonForVisit.present) {
      map['reason_for_visit'] = Variable<String>(reasonForVisit.value);
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
          ..write('patientId: $patientId, ')
          ..write('appointmentDate: $appointmentDate, ')
          ..write('timeSlot: $timeSlot, ')
          ..write('reasonForVisit: $reasonForVisit, ')
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
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _patientIdMeta =
      const VerificationMeta('patientId');
  @override
  late final GeneratedColumn<int> patientId = GeneratedColumn<int>(
      'patient_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES patient (id)'));
  static const VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
      'date_created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _totalAmountMeta =
      const VerificationMeta('totalAmount');
  @override
  late final GeneratedColumn<double> totalAmount = GeneratedColumn<double>(
      'total_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Unpaid'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, patientId, dateCreated, totalAmount, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'billing';
  @override
  VerificationContext validateIntegrity(Insertable<BillingData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('patient_id')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta));
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('date_created')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['date_created']!, _dateCreatedMeta));
    }
    if (data.containsKey('total_amount')) {
      context.handle(
          _totalAmountMeta,
          totalAmount.isAcceptableOrUnknown(
              data['total_amount']!, _totalAmountMeta));
    } else if (isInserting) {
      context.missing(_totalAmountMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BillingData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BillingData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}patient_id'])!,
      dateCreated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_created'])!,
      totalAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_amount'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $BillingTable createAlias(String alias) {
    return $BillingTable(attachedDatabase, alias);
  }
}

class BillingData extends DataClass implements Insertable<BillingData> {
  final int id;
  final int patientId;
  final DateTime dateCreated;
  final double totalAmount;
  final String status;
  const BillingData(
      {required this.id,
      required this.patientId,
      required this.dateCreated,
      required this.totalAmount,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['patient_id'] = Variable<int>(patientId);
    map['date_created'] = Variable<DateTime>(dateCreated);
    map['total_amount'] = Variable<double>(totalAmount);
    map['status'] = Variable<String>(status);
    return map;
  }

  BillingCompanion toCompanion(bool nullToAbsent) {
    return BillingCompanion(
      id: Value(id),
      patientId: Value(patientId),
      dateCreated: Value(dateCreated),
      totalAmount: Value(totalAmount),
      status: Value(status),
    );
  }

  factory BillingData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BillingData(
      id: serializer.fromJson<int>(json['id']),
      patientId: serializer.fromJson<int>(json['patientId']),
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
      totalAmount: serializer.fromJson<double>(json['totalAmount']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'patientId': serializer.toJson<int>(patientId),
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
      'totalAmount': serializer.toJson<double>(totalAmount),
      'status': serializer.toJson<String>(status),
    };
  }

  BillingData copyWith(
          {int? id,
          int? patientId,
          DateTime? dateCreated,
          double? totalAmount,
          String? status}) =>
      BillingData(
        id: id ?? this.id,
        patientId: patientId ?? this.patientId,
        dateCreated: dateCreated ?? this.dateCreated,
        totalAmount: totalAmount ?? this.totalAmount,
        status: status ?? this.status,
      );
  BillingData copyWithCompanion(BillingCompanion data) {
    return BillingData(
      id: data.id.present ? data.id.value : this.id,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      dateCreated:
          data.dateCreated.present ? data.dateCreated.value : this.dateCreated,
      totalAmount:
          data.totalAmount.present ? data.totalAmount.value : this.totalAmount,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BillingData(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, patientId, dateCreated, totalAmount, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BillingData &&
          other.id == this.id &&
          other.patientId == this.patientId &&
          other.dateCreated == this.dateCreated &&
          other.totalAmount == this.totalAmount &&
          other.status == this.status);
}

class BillingCompanion extends UpdateCompanion<BillingData> {
  final Value<int> id;
  final Value<int> patientId;
  final Value<DateTime> dateCreated;
  final Value<double> totalAmount;
  final Value<String> status;
  const BillingCompanion({
    this.id = const Value.absent(),
    this.patientId = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.status = const Value.absent(),
  });
  BillingCompanion.insert({
    this.id = const Value.absent(),
    required int patientId,
    this.dateCreated = const Value.absent(),
    required double totalAmount,
    this.status = const Value.absent(),
  })  : patientId = Value(patientId),
        totalAmount = Value(totalAmount);
  static Insertable<BillingData> custom({
    Expression<int>? id,
    Expression<int>? patientId,
    Expression<DateTime>? dateCreated,
    Expression<double>? totalAmount,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientId != null) 'patient_id': patientId,
      if (dateCreated != null) 'date_created': dateCreated,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (status != null) 'status': status,
    });
  }

  BillingCompanion copyWith(
      {Value<int>? id,
      Value<int>? patientId,
      Value<DateTime>? dateCreated,
      Value<double>? totalAmount,
      Value<String>? status}) {
    return BillingCompanion(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      dateCreated: dateCreated ?? this.dateCreated,
      totalAmount: totalAmount ?? this.totalAmount,
      status: status ?? this.status,
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
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<double>(totalAmount.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BillingCompanion(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('status: $status')
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
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _patientIDMeta =
      const VerificationMeta('patientID');
  @override
  late final GeneratedColumn<int> patientID = GeneratedColumn<int>(
      'patient_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES patient (id)'));
  static const VerificationMeta _toothNumberMeta =
      const VerificationMeta('toothNumber');
  @override
  late final GeneratedColumn<int> toothNumber = GeneratedColumn<int>(
      'tooth_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _surfaceMeta =
      const VerificationMeta('surface');
  @override
  late final GeneratedColumn<String> surface = GeneratedColumn<String>(
      'surface', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _conditionMeta =
      const VerificationMeta('condition');
  @override
  late final GeneratedColumn<String> condition = GeneratedColumn<String>(
      'condition', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
      'last_updated', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, patientID, toothNumber, surface, condition, lastUpdated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dental_chart';
  @override
  VerificationContext validateIntegrity(Insertable<DentalChartData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('patient_i_d')) {
      context.handle(
          _patientIDMeta,
          patientID.isAcceptableOrUnknown(
              data['patient_i_d']!, _patientIDMeta));
    } else if (isInserting) {
      context.missing(_patientIDMeta);
    }
    if (data.containsKey('tooth_number')) {
      context.handle(
          _toothNumberMeta,
          toothNumber.isAcceptableOrUnknown(
              data['tooth_number']!, _toothNumberMeta));
    } else if (isInserting) {
      context.missing(_toothNumberMeta);
    }
    if (data.containsKey('surface')) {
      context.handle(_surfaceMeta,
          surface.isAcceptableOrUnknown(data['surface']!, _surfaceMeta));
    } else if (isInserting) {
      context.missing(_surfaceMeta);
    }
    if (data.containsKey('condition')) {
      context.handle(_conditionMeta,
          condition.isAcceptableOrUnknown(data['condition']!, _conditionMeta));
    } else if (isInserting) {
      context.missing(_conditionMeta);
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
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
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      patientID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}patient_i_d'])!,
      toothNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tooth_number'])!,
      surface: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}surface'])!,
      condition: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}condition'])!,
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_updated'])!,
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
  const DentalChartData(
      {required this.id,
      required this.patientID,
      required this.toothNumber,
      required this.surface,
      required this.condition,
      required this.lastUpdated});
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

  factory DentalChartData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
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

  DentalChartData copyWith(
          {int? id,
          int? patientID,
          int? toothNumber,
          String? surface,
          String? condition,
          DateTime? lastUpdated}) =>
      DentalChartData(
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
      toothNumber:
          data.toothNumber.present ? data.toothNumber.value : this.toothNumber,
      surface: data.surface.present ? data.surface.value : this.surface,
      condition: data.condition.present ? data.condition.value : this.condition,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
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
  })  : patientID = Value(patientID),
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

  DentalChartCompanion copyWith(
      {Value<int>? id,
      Value<int>? patientID,
      Value<int>? toothNumber,
      Value<String>? surface,
      Value<String>? condition,
      Value<DateTime>? lastUpdated}) {
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
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _appointmentIDMeta =
      const VerificationMeta('appointmentID');
  @override
  late final GeneratedColumn<int> appointmentID = GeneratedColumn<int>(
      'appointment_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES appointment (id)'));
  static const VerificationMeta _procedureCodeMeta =
      const VerificationMeta('procedureCode');
  @override
  late final GeneratedColumn<int> procedureCode = GeneratedColumn<int>(
      'procedure_code', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _toothNumberMeta =
      const VerificationMeta('toothNumber');
  @override
  late final GeneratedColumn<int> toothNumber = GeneratedColumn<int>(
      'tooth_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, appointmentID, procedureCode, toothNumber, notes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'treatment_record';
  @override
  VerificationContext validateIntegrity(
      Insertable<TreatmentRecordData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('appointment_i_d')) {
      context.handle(
          _appointmentIDMeta,
          appointmentID.isAcceptableOrUnknown(
              data['appointment_i_d']!, _appointmentIDMeta));
    } else if (isInserting) {
      context.missing(_appointmentIDMeta);
    }
    if (data.containsKey('procedure_code')) {
      context.handle(
          _procedureCodeMeta,
          procedureCode.isAcceptableOrUnknown(
              data['procedure_code']!, _procedureCodeMeta));
    } else if (isInserting) {
      context.missing(_procedureCodeMeta);
    }
    if (data.containsKey('tooth_number')) {
      context.handle(
          _toothNumberMeta,
          toothNumber.isAcceptableOrUnknown(
              data['tooth_number']!, _toothNumberMeta));
    } else if (isInserting) {
      context.missing(_toothNumberMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
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
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      appointmentID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}appointment_i_d'])!,
      procedureCode: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}procedure_code'])!,
      toothNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tooth_number'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes'])!,
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
  const TreatmentRecordData(
      {required this.id,
      required this.appointmentID,
      required this.procedureCode,
      required this.toothNumber,
      required this.notes});
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

  factory TreatmentRecordData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
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

  TreatmentRecordData copyWith(
          {int? id,
          int? appointmentID,
          int? procedureCode,
          int? toothNumber,
          String? notes}) =>
      TreatmentRecordData(
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
      toothNumber:
          data.toothNumber.present ? data.toothNumber.value : this.toothNumber,
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
  })  : appointmentID = Value(appointmentID),
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

  TreatmentRecordCompanion copyWith(
      {Value<int>? id,
      Value<int>? appointmentID,
      Value<int>? procedureCode,
      Value<int>? toothNumber,
      Value<String>? notes}) {
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

class $ClinicalRecordTable extends ClinicalRecord
    with TableInfo<$ClinicalRecordTable, ClinicalRecordData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClinicalRecordTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _patientIdMeta =
      const VerificationMeta('patientId');
  @override
  late final GeneratedColumn<int> patientId = GeneratedColumn<int>(
      'patient_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES patient (id)'));
  static const VerificationMeta _pastIllnessesMeta =
      const VerificationMeta('pastIllnesses');
  @override
  late final GeneratedColumn<String> pastIllnesses = GeneratedColumn<String>(
      'past_illnesses', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _presentIllnessesMeta =
      const VerificationMeta('presentIllnesses');
  @override
  late final GeneratedColumn<String> presentIllnesses = GeneratedColumn<String>(
      'present_illnesses', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _allergiesMeta =
      const VerificationMeta('allergies');
  @override
  late final GeneratedColumn<String> allergies = GeneratedColumn<String>(
      'allergies', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _currentMedicationMeta =
      const VerificationMeta('currentMedication');
  @override
  late final GeneratedColumn<String> currentMedication =
      GeneratedColumn<String>('current_medication', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _hasOralDebrisMeta =
      const VerificationMeta('hasOralDebris');
  @override
  late final GeneratedColumn<bool> hasOralDebris = GeneratedColumn<bool>(
      'has_oral_debris', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_oral_debris" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _hasCalculusMeta =
      const VerificationMeta('hasCalculus');
  @override
  late final GeneratedColumn<bool> hasCalculus = GeneratedColumn<bool>(
      'has_calculus', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_calculus" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _hasGingivitisMeta =
      const VerificationMeta('hasGingivitis');
  @override
  late final GeneratedColumn<bool> hasGingivitis = GeneratedColumn<bool>(
      'has_gingivitis', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_gingivitis" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _hasPeriodontalPocketMeta =
      const VerificationMeta('hasPeriodontalPocket');
  @override
  late final GeneratedColumn<bool> hasPeriodontalPocket = GeneratedColumn<bool>(
      'has_periodontal_pocket', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_periodontal_pocket" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _hasDentofacialAnomalyMeta =
      const VerificationMeta('hasDentofacialAnomaly');
  @override
  late final GeneratedColumn<bool> hasDentofacialAnomaly =
      GeneratedColumn<bool>('has_dentofacial_anomaly', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("has_dentofacial_anomaly" IN (0, 1))'),
          defaultValue: const Constant(false));
  static const VerificationMeta _carriesForFillingMeta =
      const VerificationMeta('carriesForFilling');
  @override
  late final GeneratedColumn<int> carriesForFilling = GeneratedColumn<int>(
      'carries_for_filling', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _carriesForExtractionMeta =
      const VerificationMeta('carriesForExtraction');
  @override
  late final GeneratedColumn<int> carriesForExtraction = GeneratedColumn<int>(
      'carries_for_extraction', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _rootFragmentMeta =
      const VerificationMeta('rootFragment');
  @override
  late final GeneratedColumn<int> rootFragment = GeneratedColumn<int>(
      'root_fragment', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _missingDueToCariesMeta =
      const VerificationMeta('missingDueToCaries');
  @override
  late final GeneratedColumn<int> missingDueToCaries = GeneratedColumn<int>(
      'missing_due_to_caries', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _filledOrRestoredMeta =
      const VerificationMeta('filledOrRestored');
  @override
  late final GeneratedColumn<int> filledOrRestored = GeneratedColumn<int>(
      'filled_or_restored', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        patientId,
        pastIllnesses,
        presentIllnesses,
        allergies,
        currentMedication,
        hasOralDebris,
        hasCalculus,
        hasGingivitis,
        hasPeriodontalPocket,
        hasDentofacialAnomaly,
        carriesForFilling,
        carriesForExtraction,
        rootFragment,
        missingDueToCaries,
        filledOrRestored,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'clinical_record';
  @override
  VerificationContext validateIntegrity(Insertable<ClinicalRecordData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('patient_id')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta));
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('past_illnesses')) {
      context.handle(
          _pastIllnessesMeta,
          pastIllnesses.isAcceptableOrUnknown(
              data['past_illnesses']!, _pastIllnessesMeta));
    }
    if (data.containsKey('present_illnesses')) {
      context.handle(
          _presentIllnessesMeta,
          presentIllnesses.isAcceptableOrUnknown(
              data['present_illnesses']!, _presentIllnessesMeta));
    }
    if (data.containsKey('allergies')) {
      context.handle(_allergiesMeta,
          allergies.isAcceptableOrUnknown(data['allergies']!, _allergiesMeta));
    }
    if (data.containsKey('current_medication')) {
      context.handle(
          _currentMedicationMeta,
          currentMedication.isAcceptableOrUnknown(
              data['current_medication']!, _currentMedicationMeta));
    }
    if (data.containsKey('has_oral_debris')) {
      context.handle(
          _hasOralDebrisMeta,
          hasOralDebris.isAcceptableOrUnknown(
              data['has_oral_debris']!, _hasOralDebrisMeta));
    }
    if (data.containsKey('has_calculus')) {
      context.handle(
          _hasCalculusMeta,
          hasCalculus.isAcceptableOrUnknown(
              data['has_calculus']!, _hasCalculusMeta));
    }
    if (data.containsKey('has_gingivitis')) {
      context.handle(
          _hasGingivitisMeta,
          hasGingivitis.isAcceptableOrUnknown(
              data['has_gingivitis']!, _hasGingivitisMeta));
    }
    if (data.containsKey('has_periodontal_pocket')) {
      context.handle(
          _hasPeriodontalPocketMeta,
          hasPeriodontalPocket.isAcceptableOrUnknown(
              data['has_periodontal_pocket']!, _hasPeriodontalPocketMeta));
    }
    if (data.containsKey('has_dentofacial_anomaly')) {
      context.handle(
          _hasDentofacialAnomalyMeta,
          hasDentofacialAnomaly.isAcceptableOrUnknown(
              data['has_dentofacial_anomaly']!, _hasDentofacialAnomalyMeta));
    }
    if (data.containsKey('carries_for_filling')) {
      context.handle(
          _carriesForFillingMeta,
          carriesForFilling.isAcceptableOrUnknown(
              data['carries_for_filling']!, _carriesForFillingMeta));
    }
    if (data.containsKey('carries_for_extraction')) {
      context.handle(
          _carriesForExtractionMeta,
          carriesForExtraction.isAcceptableOrUnknown(
              data['carries_for_extraction']!, _carriesForExtractionMeta));
    }
    if (data.containsKey('root_fragment')) {
      context.handle(
          _rootFragmentMeta,
          rootFragment.isAcceptableOrUnknown(
              data['root_fragment']!, _rootFragmentMeta));
    }
    if (data.containsKey('missing_due_to_caries')) {
      context.handle(
          _missingDueToCariesMeta,
          missingDueToCaries.isAcceptableOrUnknown(
              data['missing_due_to_caries']!, _missingDueToCariesMeta));
    }
    if (data.containsKey('filled_or_restored')) {
      context.handle(
          _filledOrRestoredMeta,
          filledOrRestored.isAcceptableOrUnknown(
              data['filled_or_restored']!, _filledOrRestoredMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ClinicalRecordData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClinicalRecordData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}patient_id'])!,
      pastIllnesses: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}past_illnesses']),
      presentIllnesses: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}present_illnesses']),
      allergies: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}allergies']),
      currentMedication: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}current_medication']),
      hasOralDebris: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_oral_debris'])!,
      hasCalculus: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_calculus'])!,
      hasGingivitis: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_gingivitis'])!,
      hasPeriodontalPocket: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}has_periodontal_pocket'])!,
      hasDentofacialAnomaly: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}has_dentofacial_anomaly'])!,
      carriesForFilling: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}carries_for_filling'])!,
      carriesForExtraction: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}carries_for_extraction'])!,
      rootFragment: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}root_fragment'])!,
      missingDueToCaries: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}missing_due_to_caries'])!,
      filledOrRestored: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}filled_or_restored'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $ClinicalRecordTable createAlias(String alias) {
    return $ClinicalRecordTable(attachedDatabase, alias);
  }
}

class ClinicalRecordData extends DataClass
    implements Insertable<ClinicalRecordData> {
  final int id;
  final int patientId;
  final String? pastIllnesses;
  final String? presentIllnesses;
  final String? allergies;
  final String? currentMedication;
  final bool hasOralDebris;
  final bool hasCalculus;
  final bool hasGingivitis;
  final bool hasPeriodontalPocket;
  final bool hasDentofacialAnomaly;
  final int carriesForFilling;
  final int carriesForExtraction;
  final int rootFragment;
  final int missingDueToCaries;
  final int filledOrRestored;
  final DateTime createdAt;
  const ClinicalRecordData(
      {required this.id,
      required this.patientId,
      this.pastIllnesses,
      this.presentIllnesses,
      this.allergies,
      this.currentMedication,
      required this.hasOralDebris,
      required this.hasCalculus,
      required this.hasGingivitis,
      required this.hasPeriodontalPocket,
      required this.hasDentofacialAnomaly,
      required this.carriesForFilling,
      required this.carriesForExtraction,
      required this.rootFragment,
      required this.missingDueToCaries,
      required this.filledOrRestored,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['patient_id'] = Variable<int>(patientId);
    if (!nullToAbsent || pastIllnesses != null) {
      map['past_illnesses'] = Variable<String>(pastIllnesses);
    }
    if (!nullToAbsent || presentIllnesses != null) {
      map['present_illnesses'] = Variable<String>(presentIllnesses);
    }
    if (!nullToAbsent || allergies != null) {
      map['allergies'] = Variable<String>(allergies);
    }
    if (!nullToAbsent || currentMedication != null) {
      map['current_medication'] = Variable<String>(currentMedication);
    }
    map['has_oral_debris'] = Variable<bool>(hasOralDebris);
    map['has_calculus'] = Variable<bool>(hasCalculus);
    map['has_gingivitis'] = Variable<bool>(hasGingivitis);
    map['has_periodontal_pocket'] = Variable<bool>(hasPeriodontalPocket);
    map['has_dentofacial_anomaly'] = Variable<bool>(hasDentofacialAnomaly);
    map['carries_for_filling'] = Variable<int>(carriesForFilling);
    map['carries_for_extraction'] = Variable<int>(carriesForExtraction);
    map['root_fragment'] = Variable<int>(rootFragment);
    map['missing_due_to_caries'] = Variable<int>(missingDueToCaries);
    map['filled_or_restored'] = Variable<int>(filledOrRestored);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ClinicalRecordCompanion toCompanion(bool nullToAbsent) {
    return ClinicalRecordCompanion(
      id: Value(id),
      patientId: Value(patientId),
      pastIllnesses: pastIllnesses == null && nullToAbsent
          ? const Value.absent()
          : Value(pastIllnesses),
      presentIllnesses: presentIllnesses == null && nullToAbsent
          ? const Value.absent()
          : Value(presentIllnesses),
      allergies: allergies == null && nullToAbsent
          ? const Value.absent()
          : Value(allergies),
      currentMedication: currentMedication == null && nullToAbsent
          ? const Value.absent()
          : Value(currentMedication),
      hasOralDebris: Value(hasOralDebris),
      hasCalculus: Value(hasCalculus),
      hasGingivitis: Value(hasGingivitis),
      hasPeriodontalPocket: Value(hasPeriodontalPocket),
      hasDentofacialAnomaly: Value(hasDentofacialAnomaly),
      carriesForFilling: Value(carriesForFilling),
      carriesForExtraction: Value(carriesForExtraction),
      rootFragment: Value(rootFragment),
      missingDueToCaries: Value(missingDueToCaries),
      filledOrRestored: Value(filledOrRestored),
      createdAt: Value(createdAt),
    );
  }

  factory ClinicalRecordData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClinicalRecordData(
      id: serializer.fromJson<int>(json['id']),
      patientId: serializer.fromJson<int>(json['patientId']),
      pastIllnesses: serializer.fromJson<String?>(json['pastIllnesses']),
      presentIllnesses: serializer.fromJson<String?>(json['presentIllnesses']),
      allergies: serializer.fromJson<String?>(json['allergies']),
      currentMedication:
          serializer.fromJson<String?>(json['currentMedication']),
      hasOralDebris: serializer.fromJson<bool>(json['hasOralDebris']),
      hasCalculus: serializer.fromJson<bool>(json['hasCalculus']),
      hasGingivitis: serializer.fromJson<bool>(json['hasGingivitis']),
      hasPeriodontalPocket:
          serializer.fromJson<bool>(json['hasPeriodontalPocket']),
      hasDentofacialAnomaly:
          serializer.fromJson<bool>(json['hasDentofacialAnomaly']),
      carriesForFilling: serializer.fromJson<int>(json['carriesForFilling']),
      carriesForExtraction:
          serializer.fromJson<int>(json['carriesForExtraction']),
      rootFragment: serializer.fromJson<int>(json['rootFragment']),
      missingDueToCaries: serializer.fromJson<int>(json['missingDueToCaries']),
      filledOrRestored: serializer.fromJson<int>(json['filledOrRestored']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'patientId': serializer.toJson<int>(patientId),
      'pastIllnesses': serializer.toJson<String?>(pastIllnesses),
      'presentIllnesses': serializer.toJson<String?>(presentIllnesses),
      'allergies': serializer.toJson<String?>(allergies),
      'currentMedication': serializer.toJson<String?>(currentMedication),
      'hasOralDebris': serializer.toJson<bool>(hasOralDebris),
      'hasCalculus': serializer.toJson<bool>(hasCalculus),
      'hasGingivitis': serializer.toJson<bool>(hasGingivitis),
      'hasPeriodontalPocket': serializer.toJson<bool>(hasPeriodontalPocket),
      'hasDentofacialAnomaly': serializer.toJson<bool>(hasDentofacialAnomaly),
      'carriesForFilling': serializer.toJson<int>(carriesForFilling),
      'carriesForExtraction': serializer.toJson<int>(carriesForExtraction),
      'rootFragment': serializer.toJson<int>(rootFragment),
      'missingDueToCaries': serializer.toJson<int>(missingDueToCaries),
      'filledOrRestored': serializer.toJson<int>(filledOrRestored),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ClinicalRecordData copyWith(
          {int? id,
          int? patientId,
          Value<String?> pastIllnesses = const Value.absent(),
          Value<String?> presentIllnesses = const Value.absent(),
          Value<String?> allergies = const Value.absent(),
          Value<String?> currentMedication = const Value.absent(),
          bool? hasOralDebris,
          bool? hasCalculus,
          bool? hasGingivitis,
          bool? hasPeriodontalPocket,
          bool? hasDentofacialAnomaly,
          int? carriesForFilling,
          int? carriesForExtraction,
          int? rootFragment,
          int? missingDueToCaries,
          int? filledOrRestored,
          DateTime? createdAt}) =>
      ClinicalRecordData(
        id: id ?? this.id,
        patientId: patientId ?? this.patientId,
        pastIllnesses:
            pastIllnesses.present ? pastIllnesses.value : this.pastIllnesses,
        presentIllnesses: presentIllnesses.present
            ? presentIllnesses.value
            : this.presentIllnesses,
        allergies: allergies.present ? allergies.value : this.allergies,
        currentMedication: currentMedication.present
            ? currentMedication.value
            : this.currentMedication,
        hasOralDebris: hasOralDebris ?? this.hasOralDebris,
        hasCalculus: hasCalculus ?? this.hasCalculus,
        hasGingivitis: hasGingivitis ?? this.hasGingivitis,
        hasPeriodontalPocket: hasPeriodontalPocket ?? this.hasPeriodontalPocket,
        hasDentofacialAnomaly:
            hasDentofacialAnomaly ?? this.hasDentofacialAnomaly,
        carriesForFilling: carriesForFilling ?? this.carriesForFilling,
        carriesForExtraction: carriesForExtraction ?? this.carriesForExtraction,
        rootFragment: rootFragment ?? this.rootFragment,
        missingDueToCaries: missingDueToCaries ?? this.missingDueToCaries,
        filledOrRestored: filledOrRestored ?? this.filledOrRestored,
        createdAt: createdAt ?? this.createdAt,
      );
  ClinicalRecordData copyWithCompanion(ClinicalRecordCompanion data) {
    return ClinicalRecordData(
      id: data.id.present ? data.id.value : this.id,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      pastIllnesses: data.pastIllnesses.present
          ? data.pastIllnesses.value
          : this.pastIllnesses,
      presentIllnesses: data.presentIllnesses.present
          ? data.presentIllnesses.value
          : this.presentIllnesses,
      allergies: data.allergies.present ? data.allergies.value : this.allergies,
      currentMedication: data.currentMedication.present
          ? data.currentMedication.value
          : this.currentMedication,
      hasOralDebris: data.hasOralDebris.present
          ? data.hasOralDebris.value
          : this.hasOralDebris,
      hasCalculus:
          data.hasCalculus.present ? data.hasCalculus.value : this.hasCalculus,
      hasGingivitis: data.hasGingivitis.present
          ? data.hasGingivitis.value
          : this.hasGingivitis,
      hasPeriodontalPocket: data.hasPeriodontalPocket.present
          ? data.hasPeriodontalPocket.value
          : this.hasPeriodontalPocket,
      hasDentofacialAnomaly: data.hasDentofacialAnomaly.present
          ? data.hasDentofacialAnomaly.value
          : this.hasDentofacialAnomaly,
      carriesForFilling: data.carriesForFilling.present
          ? data.carriesForFilling.value
          : this.carriesForFilling,
      carriesForExtraction: data.carriesForExtraction.present
          ? data.carriesForExtraction.value
          : this.carriesForExtraction,
      rootFragment: data.rootFragment.present
          ? data.rootFragment.value
          : this.rootFragment,
      missingDueToCaries: data.missingDueToCaries.present
          ? data.missingDueToCaries.value
          : this.missingDueToCaries,
      filledOrRestored: data.filledOrRestored.present
          ? data.filledOrRestored.value
          : this.filledOrRestored,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClinicalRecordData(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('pastIllnesses: $pastIllnesses, ')
          ..write('presentIllnesses: $presentIllnesses, ')
          ..write('allergies: $allergies, ')
          ..write('currentMedication: $currentMedication, ')
          ..write('hasOralDebris: $hasOralDebris, ')
          ..write('hasCalculus: $hasCalculus, ')
          ..write('hasGingivitis: $hasGingivitis, ')
          ..write('hasPeriodontalPocket: $hasPeriodontalPocket, ')
          ..write('hasDentofacialAnomaly: $hasDentofacialAnomaly, ')
          ..write('carriesForFilling: $carriesForFilling, ')
          ..write('carriesForExtraction: $carriesForExtraction, ')
          ..write('rootFragment: $rootFragment, ')
          ..write('missingDueToCaries: $missingDueToCaries, ')
          ..write('filledOrRestored: $filledOrRestored, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      patientId,
      pastIllnesses,
      presentIllnesses,
      allergies,
      currentMedication,
      hasOralDebris,
      hasCalculus,
      hasGingivitis,
      hasPeriodontalPocket,
      hasDentofacialAnomaly,
      carriesForFilling,
      carriesForExtraction,
      rootFragment,
      missingDueToCaries,
      filledOrRestored,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClinicalRecordData &&
          other.id == this.id &&
          other.patientId == this.patientId &&
          other.pastIllnesses == this.pastIllnesses &&
          other.presentIllnesses == this.presentIllnesses &&
          other.allergies == this.allergies &&
          other.currentMedication == this.currentMedication &&
          other.hasOralDebris == this.hasOralDebris &&
          other.hasCalculus == this.hasCalculus &&
          other.hasGingivitis == this.hasGingivitis &&
          other.hasPeriodontalPocket == this.hasPeriodontalPocket &&
          other.hasDentofacialAnomaly == this.hasDentofacialAnomaly &&
          other.carriesForFilling == this.carriesForFilling &&
          other.carriesForExtraction == this.carriesForExtraction &&
          other.rootFragment == this.rootFragment &&
          other.missingDueToCaries == this.missingDueToCaries &&
          other.filledOrRestored == this.filledOrRestored &&
          other.createdAt == this.createdAt);
}

class ClinicalRecordCompanion extends UpdateCompanion<ClinicalRecordData> {
  final Value<int> id;
  final Value<int> patientId;
  final Value<String?> pastIllnesses;
  final Value<String?> presentIllnesses;
  final Value<String?> allergies;
  final Value<String?> currentMedication;
  final Value<bool> hasOralDebris;
  final Value<bool> hasCalculus;
  final Value<bool> hasGingivitis;
  final Value<bool> hasPeriodontalPocket;
  final Value<bool> hasDentofacialAnomaly;
  final Value<int> carriesForFilling;
  final Value<int> carriesForExtraction;
  final Value<int> rootFragment;
  final Value<int> missingDueToCaries;
  final Value<int> filledOrRestored;
  final Value<DateTime> createdAt;
  const ClinicalRecordCompanion({
    this.id = const Value.absent(),
    this.patientId = const Value.absent(),
    this.pastIllnesses = const Value.absent(),
    this.presentIllnesses = const Value.absent(),
    this.allergies = const Value.absent(),
    this.currentMedication = const Value.absent(),
    this.hasOralDebris = const Value.absent(),
    this.hasCalculus = const Value.absent(),
    this.hasGingivitis = const Value.absent(),
    this.hasPeriodontalPocket = const Value.absent(),
    this.hasDentofacialAnomaly = const Value.absent(),
    this.carriesForFilling = const Value.absent(),
    this.carriesForExtraction = const Value.absent(),
    this.rootFragment = const Value.absent(),
    this.missingDueToCaries = const Value.absent(),
    this.filledOrRestored = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ClinicalRecordCompanion.insert({
    this.id = const Value.absent(),
    required int patientId,
    this.pastIllnesses = const Value.absent(),
    this.presentIllnesses = const Value.absent(),
    this.allergies = const Value.absent(),
    this.currentMedication = const Value.absent(),
    this.hasOralDebris = const Value.absent(),
    this.hasCalculus = const Value.absent(),
    this.hasGingivitis = const Value.absent(),
    this.hasPeriodontalPocket = const Value.absent(),
    this.hasDentofacialAnomaly = const Value.absent(),
    this.carriesForFilling = const Value.absent(),
    this.carriesForExtraction = const Value.absent(),
    this.rootFragment = const Value.absent(),
    this.missingDueToCaries = const Value.absent(),
    this.filledOrRestored = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : patientId = Value(patientId);
  static Insertable<ClinicalRecordData> custom({
    Expression<int>? id,
    Expression<int>? patientId,
    Expression<String>? pastIllnesses,
    Expression<String>? presentIllnesses,
    Expression<String>? allergies,
    Expression<String>? currentMedication,
    Expression<bool>? hasOralDebris,
    Expression<bool>? hasCalculus,
    Expression<bool>? hasGingivitis,
    Expression<bool>? hasPeriodontalPocket,
    Expression<bool>? hasDentofacialAnomaly,
    Expression<int>? carriesForFilling,
    Expression<int>? carriesForExtraction,
    Expression<int>? rootFragment,
    Expression<int>? missingDueToCaries,
    Expression<int>? filledOrRestored,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientId != null) 'patient_id': patientId,
      if (pastIllnesses != null) 'past_illnesses': pastIllnesses,
      if (presentIllnesses != null) 'present_illnesses': presentIllnesses,
      if (allergies != null) 'allergies': allergies,
      if (currentMedication != null) 'current_medication': currentMedication,
      if (hasOralDebris != null) 'has_oral_debris': hasOralDebris,
      if (hasCalculus != null) 'has_calculus': hasCalculus,
      if (hasGingivitis != null) 'has_gingivitis': hasGingivitis,
      if (hasPeriodontalPocket != null)
        'has_periodontal_pocket': hasPeriodontalPocket,
      if (hasDentofacialAnomaly != null)
        'has_dentofacial_anomaly': hasDentofacialAnomaly,
      if (carriesForFilling != null) 'carries_for_filling': carriesForFilling,
      if (carriesForExtraction != null)
        'carries_for_extraction': carriesForExtraction,
      if (rootFragment != null) 'root_fragment': rootFragment,
      if (missingDueToCaries != null)
        'missing_due_to_caries': missingDueToCaries,
      if (filledOrRestored != null) 'filled_or_restored': filledOrRestored,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ClinicalRecordCompanion copyWith(
      {Value<int>? id,
      Value<int>? patientId,
      Value<String?>? pastIllnesses,
      Value<String?>? presentIllnesses,
      Value<String?>? allergies,
      Value<String?>? currentMedication,
      Value<bool>? hasOralDebris,
      Value<bool>? hasCalculus,
      Value<bool>? hasGingivitis,
      Value<bool>? hasPeriodontalPocket,
      Value<bool>? hasDentofacialAnomaly,
      Value<int>? carriesForFilling,
      Value<int>? carriesForExtraction,
      Value<int>? rootFragment,
      Value<int>? missingDueToCaries,
      Value<int>? filledOrRestored,
      Value<DateTime>? createdAt}) {
    return ClinicalRecordCompanion(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      pastIllnesses: pastIllnesses ?? this.pastIllnesses,
      presentIllnesses: presentIllnesses ?? this.presentIllnesses,
      allergies: allergies ?? this.allergies,
      currentMedication: currentMedication ?? this.currentMedication,
      hasOralDebris: hasOralDebris ?? this.hasOralDebris,
      hasCalculus: hasCalculus ?? this.hasCalculus,
      hasGingivitis: hasGingivitis ?? this.hasGingivitis,
      hasPeriodontalPocket: hasPeriodontalPocket ?? this.hasPeriodontalPocket,
      hasDentofacialAnomaly:
          hasDentofacialAnomaly ?? this.hasDentofacialAnomaly,
      carriesForFilling: carriesForFilling ?? this.carriesForFilling,
      carriesForExtraction: carriesForExtraction ?? this.carriesForExtraction,
      rootFragment: rootFragment ?? this.rootFragment,
      missingDueToCaries: missingDueToCaries ?? this.missingDueToCaries,
      filledOrRestored: filledOrRestored ?? this.filledOrRestored,
      createdAt: createdAt ?? this.createdAt,
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
    if (pastIllnesses.present) {
      map['past_illnesses'] = Variable<String>(pastIllnesses.value);
    }
    if (presentIllnesses.present) {
      map['present_illnesses'] = Variable<String>(presentIllnesses.value);
    }
    if (allergies.present) {
      map['allergies'] = Variable<String>(allergies.value);
    }
    if (currentMedication.present) {
      map['current_medication'] = Variable<String>(currentMedication.value);
    }
    if (hasOralDebris.present) {
      map['has_oral_debris'] = Variable<bool>(hasOralDebris.value);
    }
    if (hasCalculus.present) {
      map['has_calculus'] = Variable<bool>(hasCalculus.value);
    }
    if (hasGingivitis.present) {
      map['has_gingivitis'] = Variable<bool>(hasGingivitis.value);
    }
    if (hasPeriodontalPocket.present) {
      map['has_periodontal_pocket'] =
          Variable<bool>(hasPeriodontalPocket.value);
    }
    if (hasDentofacialAnomaly.present) {
      map['has_dentofacial_anomaly'] =
          Variable<bool>(hasDentofacialAnomaly.value);
    }
    if (carriesForFilling.present) {
      map['carries_for_filling'] = Variable<int>(carriesForFilling.value);
    }
    if (carriesForExtraction.present) {
      map['carries_for_extraction'] = Variable<int>(carriesForExtraction.value);
    }
    if (rootFragment.present) {
      map['root_fragment'] = Variable<int>(rootFragment.value);
    }
    if (missingDueToCaries.present) {
      map['missing_due_to_caries'] = Variable<int>(missingDueToCaries.value);
    }
    if (filledOrRestored.present) {
      map['filled_or_restored'] = Variable<int>(filledOrRestored.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClinicalRecordCompanion(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('pastIllnesses: $pastIllnesses, ')
          ..write('presentIllnesses: $presentIllnesses, ')
          ..write('allergies: $allergies, ')
          ..write('currentMedication: $currentMedication, ')
          ..write('hasOralDebris: $hasOralDebris, ')
          ..write('hasCalculus: $hasCalculus, ')
          ..write('hasGingivitis: $hasGingivitis, ')
          ..write('hasPeriodontalPocket: $hasPeriodontalPocket, ')
          ..write('hasDentofacialAnomaly: $hasDentofacialAnomaly, ')
          ..write('carriesForFilling: $carriesForFilling, ')
          ..write('carriesForExtraction: $carriesForExtraction, ')
          ..write('rootFragment: $rootFragment, ')
          ..write('missingDueToCaries: $missingDueToCaries, ')
          ..write('filledOrRestored: $filledOrRestored, ')
          ..write('createdAt: $createdAt')
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
  late final $TreatmentRecordTable treatmentRecord =
      $TreatmentRecordTable(this);
  late final $ClinicalRecordTable clinicalRecord = $ClinicalRecordTable(this);
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
        clinicalRecord
      ];
}

typedef $$PatientTableCreateCompanionBuilder = PatientCompanion Function({
  Value<int> id,
  required String firstName,
  required String middleName,
  required String lastName,
  required DateTime birthDate,
  required String sex,
  required String civilStatus,
  required String contactNumber,
  Value<String?> emergencyContactNo,
  Value<String?> referredBy,
  Value<String?> relationship,
  required String streetAddress,
  required String barangay,
  required String cityMunicipality,
  required String province,
  required String zipCode,
  Value<bool> isArchived,
});
typedef $$PatientTableUpdateCompanionBuilder = PatientCompanion Function({
  Value<int> id,
  Value<String> firstName,
  Value<String> middleName,
  Value<String> lastName,
  Value<DateTime> birthDate,
  Value<String> sex,
  Value<String> civilStatus,
  Value<String> contactNumber,
  Value<String?> emergencyContactNo,
  Value<String?> referredBy,
  Value<String?> relationship,
  Value<String> streetAddress,
  Value<String> barangay,
  Value<String> cityMunicipality,
  Value<String> province,
  Value<String> zipCode,
  Value<bool> isArchived,
});

final class $$PatientTableReferences
    extends BaseReferences<_$AppDatabase, $PatientTable, PatientData> {
  $$PatientTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AppointmentTable, List<AppointmentData>>
      _appointmentRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.appointment,
          aliasName:
              $_aliasNameGenerator(db.patient.id, db.appointment.patientId));

  $$AppointmentTableProcessedTableManager get appointmentRefs {
    final manager = $$AppointmentTableTableManager($_db, $_db.appointment)
        .filter((f) => f.patientId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_appointmentRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$BillingTable, List<BillingData>>
      _billingRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.billing,
          aliasName: $_aliasNameGenerator(db.patient.id, db.billing.patientId));

  $$BillingTableProcessedTableManager get billingRefs {
    final manager = $$BillingTableTableManager($_db, $_db.billing)
        .filter((f) => f.patientId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_billingRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$DentalChartTable, List<DentalChartData>>
      _dentalChartRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.dentalChart,
          aliasName:
              $_aliasNameGenerator(db.patient.id, db.dentalChart.patientID));

  $$DentalChartTableProcessedTableManager get dentalChartRefs {
    final manager = $$DentalChartTableTableManager($_db, $_db.dentalChart)
        .filter((f) => f.patientID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_dentalChartRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ClinicalRecordTable, List<ClinicalRecordData>>
      _clinicalRecordRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.clinicalRecord,
              aliasName: $_aliasNameGenerator(
                  db.patient.id, db.clinicalRecord.patientId));

  $$ClinicalRecordTableProcessedTableManager get clinicalRecordRefs {
    final manager = $$ClinicalRecordTableTableManager($_db, $_db.clinicalRecord)
        .filter((f) => f.patientId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_clinicalRecordRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
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
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get middleName => $composableBuilder(
      column: $table.middleName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get birthDate => $composableBuilder(
      column: $table.birthDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sex => $composableBuilder(
      column: $table.sex, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get civilStatus => $composableBuilder(
      column: $table.civilStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contactNumber => $composableBuilder(
      column: $table.contactNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get emergencyContactNo => $composableBuilder(
      column: $table.emergencyContactNo,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get referredBy => $composableBuilder(
      column: $table.referredBy, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get relationship => $composableBuilder(
      column: $table.relationship, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get streetAddress => $composableBuilder(
      column: $table.streetAddress, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get barangay => $composableBuilder(
      column: $table.barangay, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cityMunicipality => $composableBuilder(
      column: $table.cityMunicipality,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get province => $composableBuilder(
      column: $table.province, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get zipCode => $composableBuilder(
      column: $table.zipCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnFilters(column));

  Expression<bool> appointmentRefs(
      Expression<bool> Function($$AppointmentTableFilterComposer f) f) {
    final $$AppointmentTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.appointment,
        getReferencedColumn: (t) => t.patientId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AppointmentTableFilterComposer(
              $db: $db,
              $table: $db.appointment,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> billingRefs(
      Expression<bool> Function($$BillingTableFilterComposer f) f) {
    final $$BillingTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.billing,
        getReferencedColumn: (t) => t.patientId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BillingTableFilterComposer(
              $db: $db,
              $table: $db.billing,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> dentalChartRefs(
      Expression<bool> Function($$DentalChartTableFilterComposer f) f) {
    final $$DentalChartTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.dentalChart,
        getReferencedColumn: (t) => t.patientID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DentalChartTableFilterComposer(
              $db: $db,
              $table: $db.dentalChart,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> clinicalRecordRefs(
      Expression<bool> Function($$ClinicalRecordTableFilterComposer f) f) {
    final $$ClinicalRecordTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.clinicalRecord,
        getReferencedColumn: (t) => t.patientId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ClinicalRecordTableFilterComposer(
              $db: $db,
              $table: $db.clinicalRecord,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
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
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get middleName => $composableBuilder(
      column: $table.middleName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get birthDate => $composableBuilder(
      column: $table.birthDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sex => $composableBuilder(
      column: $table.sex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get civilStatus => $composableBuilder(
      column: $table.civilStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contactNumber => $composableBuilder(
      column: $table.contactNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get emergencyContactNo => $composableBuilder(
      column: $table.emergencyContactNo,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get referredBy => $composableBuilder(
      column: $table.referredBy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get relationship => $composableBuilder(
      column: $table.relationship,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get streetAddress => $composableBuilder(
      column: $table.streetAddress,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get barangay => $composableBuilder(
      column: $table.barangay, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cityMunicipality => $composableBuilder(
      column: $table.cityMunicipality,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get province => $composableBuilder(
      column: $table.province, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get zipCode => $composableBuilder(
      column: $table.zipCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get middleName => $composableBuilder(
      column: $table.middleName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<DateTime> get birthDate =>
      $composableBuilder(column: $table.birthDate, builder: (column) => column);

  GeneratedColumn<String> get sex =>
      $composableBuilder(column: $table.sex, builder: (column) => column);

  GeneratedColumn<String> get civilStatus => $composableBuilder(
      column: $table.civilStatus, builder: (column) => column);

  GeneratedColumn<String> get contactNumber => $composableBuilder(
      column: $table.contactNumber, builder: (column) => column);

  GeneratedColumn<String> get emergencyContactNo => $composableBuilder(
      column: $table.emergencyContactNo, builder: (column) => column);

  GeneratedColumn<String> get referredBy => $composableBuilder(
      column: $table.referredBy, builder: (column) => column);

  GeneratedColumn<String> get relationship => $composableBuilder(
      column: $table.relationship, builder: (column) => column);

  GeneratedColumn<String> get streetAddress => $composableBuilder(
      column: $table.streetAddress, builder: (column) => column);

  GeneratedColumn<String> get barangay =>
      $composableBuilder(column: $table.barangay, builder: (column) => column);

  GeneratedColumn<String> get cityMunicipality => $composableBuilder(
      column: $table.cityMunicipality, builder: (column) => column);

  GeneratedColumn<String> get province =>
      $composableBuilder(column: $table.province, builder: (column) => column);

  GeneratedColumn<String> get zipCode =>
      $composableBuilder(column: $table.zipCode, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => column);

  Expression<T> appointmentRefs<T extends Object>(
      Expression<T> Function($$AppointmentTableAnnotationComposer a) f) {
    final $$AppointmentTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.appointment,
        getReferencedColumn: (t) => t.patientId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AppointmentTableAnnotationComposer(
              $db: $db,
              $table: $db.appointment,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> billingRefs<T extends Object>(
      Expression<T> Function($$BillingTableAnnotationComposer a) f) {
    final $$BillingTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.billing,
        getReferencedColumn: (t) => t.patientId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BillingTableAnnotationComposer(
              $db: $db,
              $table: $db.billing,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> dentalChartRefs<T extends Object>(
      Expression<T> Function($$DentalChartTableAnnotationComposer a) f) {
    final $$DentalChartTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.dentalChart,
        getReferencedColumn: (t) => t.patientID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DentalChartTableAnnotationComposer(
              $db: $db,
              $table: $db.dentalChart,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> clinicalRecordRefs<T extends Object>(
      Expression<T> Function($$ClinicalRecordTableAnnotationComposer a) f) {
    final $$ClinicalRecordTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.clinicalRecord,
        getReferencedColumn: (t) => t.patientId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ClinicalRecordTableAnnotationComposer(
              $db: $db,
              $table: $db.clinicalRecord,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PatientTableTableManager extends RootTableManager<
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
    PrefetchHooks Function(
        {bool appointmentRefs,
        bool billingRefs,
        bool dentalChartRefs,
        bool clinicalRecordRefs})> {
  $$PatientTableTableManager(_$AppDatabase db, $PatientTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PatientTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PatientTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PatientTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> firstName = const Value.absent(),
            Value<String> middleName = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<DateTime> birthDate = const Value.absent(),
            Value<String> sex = const Value.absent(),
            Value<String> civilStatus = const Value.absent(),
            Value<String> contactNumber = const Value.absent(),
            Value<String?> emergencyContactNo = const Value.absent(),
            Value<String?> referredBy = const Value.absent(),
            Value<String?> relationship = const Value.absent(),
            Value<String> streetAddress = const Value.absent(),
            Value<String> barangay = const Value.absent(),
            Value<String> cityMunicipality = const Value.absent(),
            Value<String> province = const Value.absent(),
            Value<String> zipCode = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
          }) =>
              PatientCompanion(
            id: id,
            firstName: firstName,
            middleName: middleName,
            lastName: lastName,
            birthDate: birthDate,
            sex: sex,
            civilStatus: civilStatus,
            contactNumber: contactNumber,
            emergencyContactNo: emergencyContactNo,
            referredBy: referredBy,
            relationship: relationship,
            streetAddress: streetAddress,
            barangay: barangay,
            cityMunicipality: cityMunicipality,
            province: province,
            zipCode: zipCode,
            isArchived: isArchived,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String firstName,
            required String middleName,
            required String lastName,
            required DateTime birthDate,
            required String sex,
            required String civilStatus,
            required String contactNumber,
            Value<String?> emergencyContactNo = const Value.absent(),
            Value<String?> referredBy = const Value.absent(),
            Value<String?> relationship = const Value.absent(),
            required String streetAddress,
            required String barangay,
            required String cityMunicipality,
            required String province,
            required String zipCode,
            Value<bool> isArchived = const Value.absent(),
          }) =>
              PatientCompanion.insert(
            id: id,
            firstName: firstName,
            middleName: middleName,
            lastName: lastName,
            birthDate: birthDate,
            sex: sex,
            civilStatus: civilStatus,
            contactNumber: contactNumber,
            emergencyContactNo: emergencyContactNo,
            referredBy: referredBy,
            relationship: relationship,
            streetAddress: streetAddress,
            barangay: barangay,
            cityMunicipality: cityMunicipality,
            province: province,
            zipCode: zipCode,
            isArchived: isArchived,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$PatientTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {appointmentRefs = false,
              billingRefs = false,
              dentalChartRefs = false,
              clinicalRecordRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (appointmentRefs) db.appointment,
                if (billingRefs) db.billing,
                if (dentalChartRefs) db.dentalChart,
                if (clinicalRecordRefs) db.clinicalRecord
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (appointmentRefs)
                    await $_getPrefetchedData<PatientData, $PatientTable,
                            AppointmentData>(
                        currentTable: table,
                        referencedTable:
                            $$PatientTableReferences._appointmentRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PatientTableReferences(db, table, p0)
                                .appointmentRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.patientId == item.id),
                        typedResults: items),
                  if (billingRefs)
                    await $_getPrefetchedData<PatientData, $PatientTable,
                            BillingData>(
                        currentTable: table,
                        referencedTable:
                            $$PatientTableReferences._billingRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PatientTableReferences(db, table, p0).billingRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.patientId == item.id),
                        typedResults: items),
                  if (dentalChartRefs)
                    await $_getPrefetchedData<PatientData, $PatientTable,
                            DentalChartData>(
                        currentTable: table,
                        referencedTable:
                            $$PatientTableReferences._dentalChartRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PatientTableReferences(db, table, p0)
                                .dentalChartRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.patientID == item.id),
                        typedResults: items),
                  if (clinicalRecordRefs)
                    await $_getPrefetchedData<PatientData, $PatientTable,
                            ClinicalRecordData>(
                        currentTable: table,
                        referencedTable: $$PatientTableReferences
                            ._clinicalRecordRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PatientTableReferences(db, table, p0)
                                .clinicalRecordRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.patientId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PatientTableProcessedTableManager = ProcessedTableManager<
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
    PrefetchHooks Function(
        {bool appointmentRefs,
        bool billingRefs,
        bool dentalChartRefs,
        bool clinicalRecordRefs})>;
typedef $$DentistTableCreateCompanionBuilder = DentistCompanion Function({
  required int id,
  Value<int> rowid,
});
typedef $$DentistTableUpdateCompanionBuilder = DentistCompanion Function({
  Value<int> id,
  Value<int> rowid,
});

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
      column: $table.id, builder: (column) => ColumnFilters(column));
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
      column: $table.id, builder: (column) => ColumnOrderings(column));
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
}

class $$DentistTableTableManager extends RootTableManager<
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
    PrefetchHooks Function()> {
  $$DentistTableTableManager(_$AppDatabase db, $DentistTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DentistTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DentistTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DentistTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DentistCompanion(
            id: id,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            Value<int> rowid = const Value.absent(),
          }) =>
              DentistCompanion.insert(
            id: id,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DentistTableProcessedTableManager = ProcessedTableManager<
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
    PrefetchHooks Function()>;
typedef $$AppointmentTableCreateCompanionBuilder = AppointmentCompanion
    Function({
  Value<int> id,
  required int patientId,
  required DateTime appointmentDate,
  required String timeSlot,
  required String reasonForVisit,
  Value<String> status,
});
typedef $$AppointmentTableUpdateCompanionBuilder = AppointmentCompanion
    Function({
  Value<int> id,
  Value<int> patientId,
  Value<DateTime> appointmentDate,
  Value<String> timeSlot,
  Value<String> reasonForVisit,
  Value<String> status,
});

final class $$AppointmentTableReferences
    extends BaseReferences<_$AppDatabase, $AppointmentTable, AppointmentData> {
  $$AppointmentTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PatientTable _patientIdTable(_$AppDatabase db) =>
      db.patient.createAlias(
          $_aliasNameGenerator(db.appointment.patientId, db.patient.id));

  $$PatientTableProcessedTableManager get patientId {
    final $_column = $_itemColumn<int>('patient_id')!;

    final manager = $$PatientTableTableManager($_db, $_db.patient)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_patientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$TreatmentRecordTable, List<TreatmentRecordData>>
      _treatmentRecordRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.treatmentRecord,
              aliasName: $_aliasNameGenerator(
                  db.appointment.id, db.treatmentRecord.appointmentID));

  $$TreatmentRecordTableProcessedTableManager get treatmentRecordRefs {
    final manager = $$TreatmentRecordTableTableManager(
            $_db, $_db.treatmentRecord)
        .filter((f) => f.appointmentID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_treatmentRecordRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
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
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get appointmentDate => $composableBuilder(
      column: $table.appointmentDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get timeSlot => $composableBuilder(
      column: $table.timeSlot, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reasonForVisit => $composableBuilder(
      column: $table.reasonForVisit,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  $$PatientTableFilterComposer get patientId {
    final $$PatientTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patient,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientTableFilterComposer(
              $db: $db,
              $table: $db.patient,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> treatmentRecordRefs(
      Expression<bool> Function($$TreatmentRecordTableFilterComposer f) f) {
    final $$TreatmentRecordTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.treatmentRecord,
        getReferencedColumn: (t) => t.appointmentID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreatmentRecordTableFilterComposer(
              $db: $db,
              $table: $db.treatmentRecord,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
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
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get appointmentDate => $composableBuilder(
      column: $table.appointmentDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get timeSlot => $composableBuilder(
      column: $table.timeSlot, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reasonForVisit => $composableBuilder(
      column: $table.reasonForVisit,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  $$PatientTableOrderingComposer get patientId {
    final $$PatientTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patient,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientTableOrderingComposer(
              $db: $db,
              $table: $db.patient,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
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

  GeneratedColumn<DateTime> get appointmentDate => $composableBuilder(
      column: $table.appointmentDate, builder: (column) => column);

  GeneratedColumn<String> get timeSlot =>
      $composableBuilder(column: $table.timeSlot, builder: (column) => column);

  GeneratedColumn<String> get reasonForVisit => $composableBuilder(
      column: $table.reasonForVisit, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$PatientTableAnnotationComposer get patientId {
    final $$PatientTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patient,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientTableAnnotationComposer(
              $db: $db,
              $table: $db.patient,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> treatmentRecordRefs<T extends Object>(
      Expression<T> Function($$TreatmentRecordTableAnnotationComposer a) f) {
    final $$TreatmentRecordTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.treatmentRecord,
        getReferencedColumn: (t) => t.appointmentID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TreatmentRecordTableAnnotationComposer(
              $db: $db,
              $table: $db.treatmentRecord,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$AppointmentTableTableManager extends RootTableManager<
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
    PrefetchHooks Function({bool patientId, bool treatmentRecordRefs})> {
  $$AppointmentTableTableManager(_$AppDatabase db, $AppointmentTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppointmentTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppointmentTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppointmentTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> patientId = const Value.absent(),
            Value<DateTime> appointmentDate = const Value.absent(),
            Value<String> timeSlot = const Value.absent(),
            Value<String> reasonForVisit = const Value.absent(),
            Value<String> status = const Value.absent(),
          }) =>
              AppointmentCompanion(
            id: id,
            patientId: patientId,
            appointmentDate: appointmentDate,
            timeSlot: timeSlot,
            reasonForVisit: reasonForVisit,
            status: status,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int patientId,
            required DateTime appointmentDate,
            required String timeSlot,
            required String reasonForVisit,
            Value<String> status = const Value.absent(),
          }) =>
              AppointmentCompanion.insert(
            id: id,
            patientId: patientId,
            appointmentDate: appointmentDate,
            timeSlot: timeSlot,
            reasonForVisit: reasonForVisit,
            status: status,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AppointmentTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {patientId = false, treatmentRecordRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (treatmentRecordRefs) db.treatmentRecord
              ],
              addJoins: <
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
                      dynamic>>(state) {
                if (patientId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.patientId,
                    referencedTable:
                        $$AppointmentTableReferences._patientIdTable(db),
                    referencedColumn:
                        $$AppointmentTableReferences._patientIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (treatmentRecordRefs)
                    await $_getPrefetchedData<AppointmentData,
                            $AppointmentTable, TreatmentRecordData>(
                        currentTable: table,
                        referencedTable: $$AppointmentTableReferences
                            ._treatmentRecordRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$AppointmentTableReferences(db, table, p0)
                                .treatmentRecordRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.appointmentID == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$AppointmentTableProcessedTableManager = ProcessedTableManager<
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
    PrefetchHooks Function({bool patientId, bool treatmentRecordRefs})>;
typedef $$BillingTableCreateCompanionBuilder = BillingCompanion Function({
  Value<int> id,
  required int patientId,
  Value<DateTime> dateCreated,
  required double totalAmount,
  Value<String> status,
});
typedef $$BillingTableUpdateCompanionBuilder = BillingCompanion Function({
  Value<int> id,
  Value<int> patientId,
  Value<DateTime> dateCreated,
  Value<double> totalAmount,
  Value<String> status,
});

final class $$BillingTableReferences
    extends BaseReferences<_$AppDatabase, $BillingTable, BillingData> {
  $$BillingTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PatientTable _patientIdTable(_$AppDatabase db) => db.patient
      .createAlias($_aliasNameGenerator(db.billing.patientId, db.patient.id));

  $$PatientTableProcessedTableManager get patientId {
    final $_column = $_itemColumn<int>('patient_id')!;

    final manager = $$PatientTableTableManager($_db, $_db.patient)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_patientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
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
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalAmount => $composableBuilder(
      column: $table.totalAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  $$PatientTableFilterComposer get patientId {
    final $$PatientTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patient,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientTableFilterComposer(
              $db: $db,
              $table: $db.patient,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
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
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalAmount => $composableBuilder(
      column: $table.totalAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  $$PatientTableOrderingComposer get patientId {
    final $$PatientTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patient,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientTableOrderingComposer(
              $db: $db,
              $table: $db.patient,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
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

  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => column);

  GeneratedColumn<double> get totalAmount => $composableBuilder(
      column: $table.totalAmount, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$PatientTableAnnotationComposer get patientId {
    final $$PatientTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patient,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientTableAnnotationComposer(
              $db: $db,
              $table: $db.patient,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BillingTableTableManager extends RootTableManager<
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
    PrefetchHooks Function({bool patientId})> {
  $$BillingTableTableManager(_$AppDatabase db, $BillingTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BillingTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BillingTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BillingTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> patientId = const Value.absent(),
            Value<DateTime> dateCreated = const Value.absent(),
            Value<double> totalAmount = const Value.absent(),
            Value<String> status = const Value.absent(),
          }) =>
              BillingCompanion(
            id: id,
            patientId: patientId,
            dateCreated: dateCreated,
            totalAmount: totalAmount,
            status: status,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int patientId,
            Value<DateTime> dateCreated = const Value.absent(),
            required double totalAmount,
            Value<String> status = const Value.absent(),
          }) =>
              BillingCompanion.insert(
            id: id,
            patientId: patientId,
            dateCreated: dateCreated,
            totalAmount: totalAmount,
            status: status,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$BillingTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({patientId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                      dynamic>>(state) {
                if (patientId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.patientId,
                    referencedTable:
                        $$BillingTableReferences._patientIdTable(db),
                    referencedColumn:
                        $$BillingTableReferences._patientIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$BillingTableProcessedTableManager = ProcessedTableManager<
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
    PrefetchHooks Function({bool patientId})>;
typedef $$DentalChartTableCreateCompanionBuilder = DentalChartCompanion
    Function({
  Value<int> id,
  required int patientID,
  required int toothNumber,
  required String surface,
  required String condition,
  required DateTime lastUpdated,
});
typedef $$DentalChartTableUpdateCompanionBuilder = DentalChartCompanion
    Function({
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
          $_aliasNameGenerator(db.dentalChart.patientID, db.patient.id));

  $$PatientTableProcessedTableManager get patientID {
    final $_column = $_itemColumn<int>('patient_i_d')!;

    final manager = $$PatientTableTableManager($_db, $_db.patient)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_patientIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
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
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get toothNumber => $composableBuilder(
      column: $table.toothNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get surface => $composableBuilder(
      column: $table.surface, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get condition => $composableBuilder(
      column: $table.condition, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnFilters(column));

  $$PatientTableFilterComposer get patientID {
    final $$PatientTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientID,
        referencedTable: $db.patient,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientTableFilterComposer(
              $db: $db,
              $table: $db.patient,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
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
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get toothNumber => $composableBuilder(
      column: $table.toothNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get surface => $composableBuilder(
      column: $table.surface, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get condition => $composableBuilder(
      column: $table.condition, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnOrderings(column));

  $$PatientTableOrderingComposer get patientID {
    final $$PatientTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientID,
        referencedTable: $db.patient,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientTableOrderingComposer(
              $db: $db,
              $table: $db.patient,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
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
      column: $table.toothNumber, builder: (column) => column);

  GeneratedColumn<String> get surface =>
      $composableBuilder(column: $table.surface, builder: (column) => column);

  GeneratedColumn<String> get condition =>
      $composableBuilder(column: $table.condition, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => column);

  $$PatientTableAnnotationComposer get patientID {
    final $$PatientTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientID,
        referencedTable: $db.patient,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientTableAnnotationComposer(
              $db: $db,
              $table: $db.patient,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DentalChartTableTableManager extends RootTableManager<
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
    PrefetchHooks Function({bool patientID})> {
  $$DentalChartTableTableManager(_$AppDatabase db, $DentalChartTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DentalChartTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DentalChartTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DentalChartTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> patientID = const Value.absent(),
            Value<int> toothNumber = const Value.absent(),
            Value<String> surface = const Value.absent(),
            Value<String> condition = const Value.absent(),
            Value<DateTime> lastUpdated = const Value.absent(),
          }) =>
              DentalChartCompanion(
            id: id,
            patientID: patientID,
            toothNumber: toothNumber,
            surface: surface,
            condition: condition,
            lastUpdated: lastUpdated,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int patientID,
            required int toothNumber,
            required String surface,
            required String condition,
            required DateTime lastUpdated,
          }) =>
              DentalChartCompanion.insert(
            id: id,
            patientID: patientID,
            toothNumber: toothNumber,
            surface: surface,
            condition: condition,
            lastUpdated: lastUpdated,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DentalChartTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({patientID = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                      dynamic>>(state) {
                if (patientID) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.patientID,
                    referencedTable:
                        $$DentalChartTableReferences._patientIDTable(db),
                    referencedColumn:
                        $$DentalChartTableReferences._patientIDTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DentalChartTableProcessedTableManager = ProcessedTableManager<
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
    PrefetchHooks Function({bool patientID})>;
typedef $$TreatmentRecordTableCreateCompanionBuilder = TreatmentRecordCompanion
    Function({
  Value<int> id,
  required int appointmentID,
  required int procedureCode,
  required int toothNumber,
  required String notes,
});
typedef $$TreatmentRecordTableUpdateCompanionBuilder = TreatmentRecordCompanion
    Function({
  Value<int> id,
  Value<int> appointmentID,
  Value<int> procedureCode,
  Value<int> toothNumber,
  Value<String> notes,
});

final class $$TreatmentRecordTableReferences extends BaseReferences<
    _$AppDatabase, $TreatmentRecordTable, TreatmentRecordData> {
  $$TreatmentRecordTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $AppointmentTable _appointmentIDTable(_$AppDatabase db) =>
      db.appointment.createAlias($_aliasNameGenerator(
          db.treatmentRecord.appointmentID, db.appointment.id));

  $$AppointmentTableProcessedTableManager get appointmentID {
    final $_column = $_itemColumn<int>('appointment_i_d')!;

    final manager = $$AppointmentTableTableManager($_db, $_db.appointment)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_appointmentIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
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
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get procedureCode => $composableBuilder(
      column: $table.procedureCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get toothNumber => $composableBuilder(
      column: $table.toothNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  $$AppointmentTableFilterComposer get appointmentID {
    final $$AppointmentTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.appointmentID,
        referencedTable: $db.appointment,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AppointmentTableFilterComposer(
              $db: $db,
              $table: $db.appointment,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
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
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get procedureCode => $composableBuilder(
      column: $table.procedureCode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get toothNumber => $composableBuilder(
      column: $table.toothNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  $$AppointmentTableOrderingComposer get appointmentID {
    final $$AppointmentTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.appointmentID,
        referencedTable: $db.appointment,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AppointmentTableOrderingComposer(
              $db: $db,
              $table: $db.appointment,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
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
      column: $table.procedureCode, builder: (column) => column);

  GeneratedColumn<int> get toothNumber => $composableBuilder(
      column: $table.toothNumber, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$AppointmentTableAnnotationComposer get appointmentID {
    final $$AppointmentTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.appointmentID,
        referencedTable: $db.appointment,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AppointmentTableAnnotationComposer(
              $db: $db,
              $table: $db.appointment,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TreatmentRecordTableTableManager extends RootTableManager<
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
    PrefetchHooks Function({bool appointmentID})> {
  $$TreatmentRecordTableTableManager(
      _$AppDatabase db, $TreatmentRecordTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TreatmentRecordTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TreatmentRecordTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TreatmentRecordTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> appointmentID = const Value.absent(),
            Value<int> procedureCode = const Value.absent(),
            Value<int> toothNumber = const Value.absent(),
            Value<String> notes = const Value.absent(),
          }) =>
              TreatmentRecordCompanion(
            id: id,
            appointmentID: appointmentID,
            procedureCode: procedureCode,
            toothNumber: toothNumber,
            notes: notes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int appointmentID,
            required int procedureCode,
            required int toothNumber,
            required String notes,
          }) =>
              TreatmentRecordCompanion.insert(
            id: id,
            appointmentID: appointmentID,
            procedureCode: procedureCode,
            toothNumber: toothNumber,
            notes: notes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TreatmentRecordTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({appointmentID = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                      dynamic>>(state) {
                if (appointmentID) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.appointmentID,
                    referencedTable: $$TreatmentRecordTableReferences
                        ._appointmentIDTable(db),
                    referencedColumn: $$TreatmentRecordTableReferences
                        ._appointmentIDTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TreatmentRecordTableProcessedTableManager = ProcessedTableManager<
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
    PrefetchHooks Function({bool appointmentID})>;
typedef $$ClinicalRecordTableCreateCompanionBuilder = ClinicalRecordCompanion
    Function({
  Value<int> id,
  required int patientId,
  Value<String?> pastIllnesses,
  Value<String?> presentIllnesses,
  Value<String?> allergies,
  Value<String?> currentMedication,
  Value<bool> hasOralDebris,
  Value<bool> hasCalculus,
  Value<bool> hasGingivitis,
  Value<bool> hasPeriodontalPocket,
  Value<bool> hasDentofacialAnomaly,
  Value<int> carriesForFilling,
  Value<int> carriesForExtraction,
  Value<int> rootFragment,
  Value<int> missingDueToCaries,
  Value<int> filledOrRestored,
  Value<DateTime> createdAt,
});
typedef $$ClinicalRecordTableUpdateCompanionBuilder = ClinicalRecordCompanion
    Function({
  Value<int> id,
  Value<int> patientId,
  Value<String?> pastIllnesses,
  Value<String?> presentIllnesses,
  Value<String?> allergies,
  Value<String?> currentMedication,
  Value<bool> hasOralDebris,
  Value<bool> hasCalculus,
  Value<bool> hasGingivitis,
  Value<bool> hasPeriodontalPocket,
  Value<bool> hasDentofacialAnomaly,
  Value<int> carriesForFilling,
  Value<int> carriesForExtraction,
  Value<int> rootFragment,
  Value<int> missingDueToCaries,
  Value<int> filledOrRestored,
  Value<DateTime> createdAt,
});

final class $$ClinicalRecordTableReferences extends BaseReferences<
    _$AppDatabase, $ClinicalRecordTable, ClinicalRecordData> {
  $$ClinicalRecordTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PatientTable _patientIdTable(_$AppDatabase db) =>
      db.patient.createAlias(
          $_aliasNameGenerator(db.clinicalRecord.patientId, db.patient.id));

  $$PatientTableProcessedTableManager get patientId {
    final $_column = $_itemColumn<int>('patient_id')!;

    final manager = $$PatientTableTableManager($_db, $_db.patient)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_patientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ClinicalRecordTableFilterComposer
    extends Composer<_$AppDatabase, $ClinicalRecordTable> {
  $$ClinicalRecordTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pastIllnesses => $composableBuilder(
      column: $table.pastIllnesses, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get presentIllnesses => $composableBuilder(
      column: $table.presentIllnesses,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get allergies => $composableBuilder(
      column: $table.allergies, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currentMedication => $composableBuilder(
      column: $table.currentMedication,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get hasOralDebris => $composableBuilder(
      column: $table.hasOralDebris, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get hasCalculus => $composableBuilder(
      column: $table.hasCalculus, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get hasGingivitis => $composableBuilder(
      column: $table.hasGingivitis, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get hasPeriodontalPocket => $composableBuilder(
      column: $table.hasPeriodontalPocket,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get hasDentofacialAnomaly => $composableBuilder(
      column: $table.hasDentofacialAnomaly,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get carriesForFilling => $composableBuilder(
      column: $table.carriesForFilling,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get carriesForExtraction => $composableBuilder(
      column: $table.carriesForExtraction,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get rootFragment => $composableBuilder(
      column: $table.rootFragment, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get missingDueToCaries => $composableBuilder(
      column: $table.missingDueToCaries,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get filledOrRestored => $composableBuilder(
      column: $table.filledOrRestored,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$PatientTableFilterComposer get patientId {
    final $$PatientTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patient,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientTableFilterComposer(
              $db: $db,
              $table: $db.patient,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ClinicalRecordTableOrderingComposer
    extends Composer<_$AppDatabase, $ClinicalRecordTable> {
  $$ClinicalRecordTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pastIllnesses => $composableBuilder(
      column: $table.pastIllnesses,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get presentIllnesses => $composableBuilder(
      column: $table.presentIllnesses,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get allergies => $composableBuilder(
      column: $table.allergies, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currentMedication => $composableBuilder(
      column: $table.currentMedication,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hasOralDebris => $composableBuilder(
      column: $table.hasOralDebris,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hasCalculus => $composableBuilder(
      column: $table.hasCalculus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hasGingivitis => $composableBuilder(
      column: $table.hasGingivitis,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hasPeriodontalPocket => $composableBuilder(
      column: $table.hasPeriodontalPocket,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hasDentofacialAnomaly => $composableBuilder(
      column: $table.hasDentofacialAnomaly,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get carriesForFilling => $composableBuilder(
      column: $table.carriesForFilling,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get carriesForExtraction => $composableBuilder(
      column: $table.carriesForExtraction,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get rootFragment => $composableBuilder(
      column: $table.rootFragment,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get missingDueToCaries => $composableBuilder(
      column: $table.missingDueToCaries,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get filledOrRestored => $composableBuilder(
      column: $table.filledOrRestored,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$PatientTableOrderingComposer get patientId {
    final $$PatientTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patient,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientTableOrderingComposer(
              $db: $db,
              $table: $db.patient,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ClinicalRecordTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClinicalRecordTable> {
  $$ClinicalRecordTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get pastIllnesses => $composableBuilder(
      column: $table.pastIllnesses, builder: (column) => column);

  GeneratedColumn<String> get presentIllnesses => $composableBuilder(
      column: $table.presentIllnesses, builder: (column) => column);

  GeneratedColumn<String> get allergies =>
      $composableBuilder(column: $table.allergies, builder: (column) => column);

  GeneratedColumn<String> get currentMedication => $composableBuilder(
      column: $table.currentMedication, builder: (column) => column);

  GeneratedColumn<bool> get hasOralDebris => $composableBuilder(
      column: $table.hasOralDebris, builder: (column) => column);

  GeneratedColumn<bool> get hasCalculus => $composableBuilder(
      column: $table.hasCalculus, builder: (column) => column);

  GeneratedColumn<bool> get hasGingivitis => $composableBuilder(
      column: $table.hasGingivitis, builder: (column) => column);

  GeneratedColumn<bool> get hasPeriodontalPocket => $composableBuilder(
      column: $table.hasPeriodontalPocket, builder: (column) => column);

  GeneratedColumn<bool> get hasDentofacialAnomaly => $composableBuilder(
      column: $table.hasDentofacialAnomaly, builder: (column) => column);

  GeneratedColumn<int> get carriesForFilling => $composableBuilder(
      column: $table.carriesForFilling, builder: (column) => column);

  GeneratedColumn<int> get carriesForExtraction => $composableBuilder(
      column: $table.carriesForExtraction, builder: (column) => column);

  GeneratedColumn<int> get rootFragment => $composableBuilder(
      column: $table.rootFragment, builder: (column) => column);

  GeneratedColumn<int> get missingDueToCaries => $composableBuilder(
      column: $table.missingDueToCaries, builder: (column) => column);

  GeneratedColumn<int> get filledOrRestored => $composableBuilder(
      column: $table.filledOrRestored, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$PatientTableAnnotationComposer get patientId {
    final $$PatientTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patient,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientTableAnnotationComposer(
              $db: $db,
              $table: $db.patient,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ClinicalRecordTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ClinicalRecordTable,
    ClinicalRecordData,
    $$ClinicalRecordTableFilterComposer,
    $$ClinicalRecordTableOrderingComposer,
    $$ClinicalRecordTableAnnotationComposer,
    $$ClinicalRecordTableCreateCompanionBuilder,
    $$ClinicalRecordTableUpdateCompanionBuilder,
    (ClinicalRecordData, $$ClinicalRecordTableReferences),
    ClinicalRecordData,
    PrefetchHooks Function({bool patientId})> {
  $$ClinicalRecordTableTableManager(
      _$AppDatabase db, $ClinicalRecordTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClinicalRecordTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClinicalRecordTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClinicalRecordTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> patientId = const Value.absent(),
            Value<String?> pastIllnesses = const Value.absent(),
            Value<String?> presentIllnesses = const Value.absent(),
            Value<String?> allergies = const Value.absent(),
            Value<String?> currentMedication = const Value.absent(),
            Value<bool> hasOralDebris = const Value.absent(),
            Value<bool> hasCalculus = const Value.absent(),
            Value<bool> hasGingivitis = const Value.absent(),
            Value<bool> hasPeriodontalPocket = const Value.absent(),
            Value<bool> hasDentofacialAnomaly = const Value.absent(),
            Value<int> carriesForFilling = const Value.absent(),
            Value<int> carriesForExtraction = const Value.absent(),
            Value<int> rootFragment = const Value.absent(),
            Value<int> missingDueToCaries = const Value.absent(),
            Value<int> filledOrRestored = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ClinicalRecordCompanion(
            id: id,
            patientId: patientId,
            pastIllnesses: pastIllnesses,
            presentIllnesses: presentIllnesses,
            allergies: allergies,
            currentMedication: currentMedication,
            hasOralDebris: hasOralDebris,
            hasCalculus: hasCalculus,
            hasGingivitis: hasGingivitis,
            hasPeriodontalPocket: hasPeriodontalPocket,
            hasDentofacialAnomaly: hasDentofacialAnomaly,
            carriesForFilling: carriesForFilling,
            carriesForExtraction: carriesForExtraction,
            rootFragment: rootFragment,
            missingDueToCaries: missingDueToCaries,
            filledOrRestored: filledOrRestored,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int patientId,
            Value<String?> pastIllnesses = const Value.absent(),
            Value<String?> presentIllnesses = const Value.absent(),
            Value<String?> allergies = const Value.absent(),
            Value<String?> currentMedication = const Value.absent(),
            Value<bool> hasOralDebris = const Value.absent(),
            Value<bool> hasCalculus = const Value.absent(),
            Value<bool> hasGingivitis = const Value.absent(),
            Value<bool> hasPeriodontalPocket = const Value.absent(),
            Value<bool> hasDentofacialAnomaly = const Value.absent(),
            Value<int> carriesForFilling = const Value.absent(),
            Value<int> carriesForExtraction = const Value.absent(),
            Value<int> rootFragment = const Value.absent(),
            Value<int> missingDueToCaries = const Value.absent(),
            Value<int> filledOrRestored = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ClinicalRecordCompanion.insert(
            id: id,
            patientId: patientId,
            pastIllnesses: pastIllnesses,
            presentIllnesses: presentIllnesses,
            allergies: allergies,
            currentMedication: currentMedication,
            hasOralDebris: hasOralDebris,
            hasCalculus: hasCalculus,
            hasGingivitis: hasGingivitis,
            hasPeriodontalPocket: hasPeriodontalPocket,
            hasDentofacialAnomaly: hasDentofacialAnomaly,
            carriesForFilling: carriesForFilling,
            carriesForExtraction: carriesForExtraction,
            rootFragment: rootFragment,
            missingDueToCaries: missingDueToCaries,
            filledOrRestored: filledOrRestored,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ClinicalRecordTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({patientId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                      dynamic>>(state) {
                if (patientId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.patientId,
                    referencedTable:
                        $$ClinicalRecordTableReferences._patientIdTable(db),
                    referencedColumn:
                        $$ClinicalRecordTableReferences._patientIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ClinicalRecordTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ClinicalRecordTable,
    ClinicalRecordData,
    $$ClinicalRecordTableFilterComposer,
    $$ClinicalRecordTableOrderingComposer,
    $$ClinicalRecordTableAnnotationComposer,
    $$ClinicalRecordTableCreateCompanionBuilder,
    $$ClinicalRecordTableUpdateCompanionBuilder,
    (ClinicalRecordData, $$ClinicalRecordTableReferences),
    ClinicalRecordData,
    PrefetchHooks Function({bool patientId})>;

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
  $$ClinicalRecordTableTableManager get clinicalRecord =>
      $$ClinicalRecordTableTableManager(_db, _db.clinicalRecord);
}
