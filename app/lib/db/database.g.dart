// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PatientTable extends Patient with TableInfo<$PatientTable, PatientData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PatientTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _patientIdMeta =
      const VerificationMeta('patientId');
  @override
  late final GeneratedColumn<int> patientId = GeneratedColumn<int>(
      'patient_id', aliasedName, false,
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
      'middle_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _suffixMeta = const VerificationMeta('suffix');
  @override
  late final GeneratedColumn<String> suffix = GeneratedColumn<String>(
      'suffix', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
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
          GeneratedColumn.checkTextLength(minTextLength: 11, maxTextLength: 11),
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
  static const VerificationMeta _relationshipEmergencyMeta =
      const VerificationMeta('relationshipEmergency');
  @override
  late final GeneratedColumn<String> relationshipEmergency =
      GeneratedColumn<String>('relationship_emergency', aliasedName, true,
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
  static const VerificationMeta _isSeniorOrPWDMeta =
      const VerificationMeta('isSeniorOrPWD');
  @override
  late final GeneratedColumn<bool> isSeniorOrPWD = GeneratedColumn<bool>(
      'is_senior_or_p_w_d', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_senior_or_p_w_d" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        patientId,
        firstName,
        middleName,
        lastName,
        suffix,
        birthDate,
        sex,
        civilStatus,
        contactNumber,
        emergencyContactNo,
        referredBy,
        relationship,
        relationshipEmergency,
        streetAddress,
        barangay,
        cityMunicipality,
        province,
        zipCode,
        isArchived,
        isSeniorOrPWD,
        createdAt,
        updatedAt
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
    if (data.containsKey('patient_id')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta));
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
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('suffix')) {
      context.handle(_suffixMeta,
          suffix.isAcceptableOrUnknown(data['suffix']!, _suffixMeta));
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
    if (data.containsKey('relationship_emergency')) {
      context.handle(
          _relationshipEmergencyMeta,
          relationshipEmergency.isAcceptableOrUnknown(
              data['relationship_emergency']!, _relationshipEmergencyMeta));
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
    if (data.containsKey('is_senior_or_p_w_d')) {
      context.handle(
          _isSeniorOrPWDMeta,
          isSeniorOrPWD.isAcceptableOrUnknown(
              data['is_senior_or_p_w_d']!, _isSeniorOrPWDMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {patientId};
  @override
  PatientData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PatientData(
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}patient_id'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      middleName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}middle_name']),
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      suffix: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}suffix']),
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
      relationshipEmergency: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}relationship_emergency']),
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
      isSeniorOrPWD: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_senior_or_p_w_d'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $PatientTable createAlias(String alias) {
    return $PatientTable(attachedDatabase, alias);
  }
}

class PatientData extends DataClass implements Insertable<PatientData> {
  final int patientId;
  final String firstName;
  final String? middleName;
  final String lastName;
  final String? suffix;
  final DateTime birthDate;
  final String sex;
  final String civilStatus;
  final String contactNumber;
  final String? emergencyContactNo;
  final String? referredBy;
  final String? relationship;
  final String? relationshipEmergency;
  final String streetAddress;
  final String barangay;
  final String cityMunicipality;
  final String province;
  final String zipCode;
  final bool isArchived;
  final bool isSeniorOrPWD;
  final DateTime createdAt;
  final DateTime updatedAt;
  const PatientData(
      {required this.patientId,
      required this.firstName,
      this.middleName,
      required this.lastName,
      this.suffix,
      required this.birthDate,
      required this.sex,
      required this.civilStatus,
      required this.contactNumber,
      this.emergencyContactNo,
      this.referredBy,
      this.relationship,
      this.relationshipEmergency,
      required this.streetAddress,
      required this.barangay,
      required this.cityMunicipality,
      required this.province,
      required this.zipCode,
      required this.isArchived,
      required this.isSeniorOrPWD,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['patient_id'] = Variable<int>(patientId);
    map['first_name'] = Variable<String>(firstName);
    if (!nullToAbsent || middleName != null) {
      map['middle_name'] = Variable<String>(middleName);
    }
    map['last_name'] = Variable<String>(lastName);
    if (!nullToAbsent || suffix != null) {
      map['suffix'] = Variable<String>(suffix);
    }
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
    if (!nullToAbsent || relationshipEmergency != null) {
      map['relationship_emergency'] = Variable<String>(relationshipEmergency);
    }
    map['street_address'] = Variable<String>(streetAddress);
    map['barangay'] = Variable<String>(barangay);
    map['city_municipality'] = Variable<String>(cityMunicipality);
    map['province'] = Variable<String>(province);
    map['zip_code'] = Variable<String>(zipCode);
    map['is_archived'] = Variable<bool>(isArchived);
    map['is_senior_or_p_w_d'] = Variable<bool>(isSeniorOrPWD);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PatientCompanion toCompanion(bool nullToAbsent) {
    return PatientCompanion(
      patientId: Value(patientId),
      firstName: Value(firstName),
      middleName: middleName == null && nullToAbsent
          ? const Value.absent()
          : Value(middleName),
      lastName: Value(lastName),
      suffix:
          suffix == null && nullToAbsent ? const Value.absent() : Value(suffix),
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
      relationshipEmergency: relationshipEmergency == null && nullToAbsent
          ? const Value.absent()
          : Value(relationshipEmergency),
      streetAddress: Value(streetAddress),
      barangay: Value(barangay),
      cityMunicipality: Value(cityMunicipality),
      province: Value(province),
      zipCode: Value(zipCode),
      isArchived: Value(isArchived),
      isSeniorOrPWD: Value(isSeniorOrPWD),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PatientData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PatientData(
      patientId: serializer.fromJson<int>(json['patientId']),
      firstName: serializer.fromJson<String>(json['firstName']),
      middleName: serializer.fromJson<String?>(json['middleName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      suffix: serializer.fromJson<String?>(json['suffix']),
      birthDate: serializer.fromJson<DateTime>(json['birthDate']),
      sex: serializer.fromJson<String>(json['sex']),
      civilStatus: serializer.fromJson<String>(json['civilStatus']),
      contactNumber: serializer.fromJson<String>(json['contactNumber']),
      emergencyContactNo:
          serializer.fromJson<String?>(json['emergencyContactNo']),
      referredBy: serializer.fromJson<String?>(json['referredBy']),
      relationship: serializer.fromJson<String?>(json['relationship']),
      relationshipEmergency:
          serializer.fromJson<String?>(json['relationshipEmergency']),
      streetAddress: serializer.fromJson<String>(json['streetAddress']),
      barangay: serializer.fromJson<String>(json['barangay']),
      cityMunicipality: serializer.fromJson<String>(json['cityMunicipality']),
      province: serializer.fromJson<String>(json['province']),
      zipCode: serializer.fromJson<String>(json['zipCode']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      isSeniorOrPWD: serializer.fromJson<bool>(json['isSeniorOrPWD']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'patientId': serializer.toJson<int>(patientId),
      'firstName': serializer.toJson<String>(firstName),
      'middleName': serializer.toJson<String?>(middleName),
      'lastName': serializer.toJson<String>(lastName),
      'suffix': serializer.toJson<String?>(suffix),
      'birthDate': serializer.toJson<DateTime>(birthDate),
      'sex': serializer.toJson<String>(sex),
      'civilStatus': serializer.toJson<String>(civilStatus),
      'contactNumber': serializer.toJson<String>(contactNumber),
      'emergencyContactNo': serializer.toJson<String?>(emergencyContactNo),
      'referredBy': serializer.toJson<String?>(referredBy),
      'relationship': serializer.toJson<String?>(relationship),
      'relationshipEmergency':
          serializer.toJson<String?>(relationshipEmergency),
      'streetAddress': serializer.toJson<String>(streetAddress),
      'barangay': serializer.toJson<String>(barangay),
      'cityMunicipality': serializer.toJson<String>(cityMunicipality),
      'province': serializer.toJson<String>(province),
      'zipCode': serializer.toJson<String>(zipCode),
      'isArchived': serializer.toJson<bool>(isArchived),
      'isSeniorOrPWD': serializer.toJson<bool>(isSeniorOrPWD),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PatientData copyWith(
          {int? patientId,
          String? firstName,
          Value<String?> middleName = const Value.absent(),
          String? lastName,
          Value<String?> suffix = const Value.absent(),
          DateTime? birthDate,
          String? sex,
          String? civilStatus,
          String? contactNumber,
          Value<String?> emergencyContactNo = const Value.absent(),
          Value<String?> referredBy = const Value.absent(),
          Value<String?> relationship = const Value.absent(),
          Value<String?> relationshipEmergency = const Value.absent(),
          String? streetAddress,
          String? barangay,
          String? cityMunicipality,
          String? province,
          String? zipCode,
          bool? isArchived,
          bool? isSeniorOrPWD,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      PatientData(
        patientId: patientId ?? this.patientId,
        firstName: firstName ?? this.firstName,
        middleName: middleName.present ? middleName.value : this.middleName,
        lastName: lastName ?? this.lastName,
        suffix: suffix.present ? suffix.value : this.suffix,
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
        relationshipEmergency: relationshipEmergency.present
            ? relationshipEmergency.value
            : this.relationshipEmergency,
        streetAddress: streetAddress ?? this.streetAddress,
        barangay: barangay ?? this.barangay,
        cityMunicipality: cityMunicipality ?? this.cityMunicipality,
        province: province ?? this.province,
        zipCode: zipCode ?? this.zipCode,
        isArchived: isArchived ?? this.isArchived,
        isSeniorOrPWD: isSeniorOrPWD ?? this.isSeniorOrPWD,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  PatientData copyWithCompanion(PatientCompanion data) {
    return PatientData(
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      middleName:
          data.middleName.present ? data.middleName.value : this.middleName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      suffix: data.suffix.present ? data.suffix.value : this.suffix,
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
      relationshipEmergency: data.relationshipEmergency.present
          ? data.relationshipEmergency.value
          : this.relationshipEmergency,
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
      isSeniorOrPWD: data.isSeniorOrPWD.present
          ? data.isSeniorOrPWD.value
          : this.isSeniorOrPWD,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PatientData(')
          ..write('patientId: $patientId, ')
          ..write('firstName: $firstName, ')
          ..write('middleName: $middleName, ')
          ..write('lastName: $lastName, ')
          ..write('suffix: $suffix, ')
          ..write('birthDate: $birthDate, ')
          ..write('sex: $sex, ')
          ..write('civilStatus: $civilStatus, ')
          ..write('contactNumber: $contactNumber, ')
          ..write('emergencyContactNo: $emergencyContactNo, ')
          ..write('referredBy: $referredBy, ')
          ..write('relationship: $relationship, ')
          ..write('relationshipEmergency: $relationshipEmergency, ')
          ..write('streetAddress: $streetAddress, ')
          ..write('barangay: $barangay, ')
          ..write('cityMunicipality: $cityMunicipality, ')
          ..write('province: $province, ')
          ..write('zipCode: $zipCode, ')
          ..write('isArchived: $isArchived, ')
          ..write('isSeniorOrPWD: $isSeniorOrPWD, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        patientId,
        firstName,
        middleName,
        lastName,
        suffix,
        birthDate,
        sex,
        civilStatus,
        contactNumber,
        emergencyContactNo,
        referredBy,
        relationship,
        relationshipEmergency,
        streetAddress,
        barangay,
        cityMunicipality,
        province,
        zipCode,
        isArchived,
        isSeniorOrPWD,
        createdAt,
        updatedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PatientData &&
          other.patientId == this.patientId &&
          other.firstName == this.firstName &&
          other.middleName == this.middleName &&
          other.lastName == this.lastName &&
          other.suffix == this.suffix &&
          other.birthDate == this.birthDate &&
          other.sex == this.sex &&
          other.civilStatus == this.civilStatus &&
          other.contactNumber == this.contactNumber &&
          other.emergencyContactNo == this.emergencyContactNo &&
          other.referredBy == this.referredBy &&
          other.relationship == this.relationship &&
          other.relationshipEmergency == this.relationshipEmergency &&
          other.streetAddress == this.streetAddress &&
          other.barangay == this.barangay &&
          other.cityMunicipality == this.cityMunicipality &&
          other.province == this.province &&
          other.zipCode == this.zipCode &&
          other.isArchived == this.isArchived &&
          other.isSeniorOrPWD == this.isSeniorOrPWD &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PatientCompanion extends UpdateCompanion<PatientData> {
  final Value<int> patientId;
  final Value<String> firstName;
  final Value<String?> middleName;
  final Value<String> lastName;
  final Value<String?> suffix;
  final Value<DateTime> birthDate;
  final Value<String> sex;
  final Value<String> civilStatus;
  final Value<String> contactNumber;
  final Value<String?> emergencyContactNo;
  final Value<String?> referredBy;
  final Value<String?> relationship;
  final Value<String?> relationshipEmergency;
  final Value<String> streetAddress;
  final Value<String> barangay;
  final Value<String> cityMunicipality;
  final Value<String> province;
  final Value<String> zipCode;
  final Value<bool> isArchived;
  final Value<bool> isSeniorOrPWD;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const PatientCompanion({
    this.patientId = const Value.absent(),
    this.firstName = const Value.absent(),
    this.middleName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.suffix = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.sex = const Value.absent(),
    this.civilStatus = const Value.absent(),
    this.contactNumber = const Value.absent(),
    this.emergencyContactNo = const Value.absent(),
    this.referredBy = const Value.absent(),
    this.relationship = const Value.absent(),
    this.relationshipEmergency = const Value.absent(),
    this.streetAddress = const Value.absent(),
    this.barangay = const Value.absent(),
    this.cityMunicipality = const Value.absent(),
    this.province = const Value.absent(),
    this.zipCode = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.isSeniorOrPWD = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  PatientCompanion.insert({
    this.patientId = const Value.absent(),
    required String firstName,
    this.middleName = const Value.absent(),
    required String lastName,
    this.suffix = const Value.absent(),
    required DateTime birthDate,
    required String sex,
    required String civilStatus,
    required String contactNumber,
    this.emergencyContactNo = const Value.absent(),
    this.referredBy = const Value.absent(),
    this.relationship = const Value.absent(),
    this.relationshipEmergency = const Value.absent(),
    required String streetAddress,
    required String barangay,
    required String cityMunicipality,
    required String province,
    required String zipCode,
    this.isArchived = const Value.absent(),
    this.isSeniorOrPWD = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : firstName = Value(firstName),
        lastName = Value(lastName),
        birthDate = Value(birthDate),
        sex = Value(sex),
        civilStatus = Value(civilStatus),
        contactNumber = Value(contactNumber),
        streetAddress = Value(streetAddress),
        barangay = Value(barangay),
        cityMunicipality = Value(cityMunicipality),
        province = Value(province),
        zipCode = Value(zipCode),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<PatientData> custom({
    Expression<int>? patientId,
    Expression<String>? firstName,
    Expression<String>? middleName,
    Expression<String>? lastName,
    Expression<String>? suffix,
    Expression<DateTime>? birthDate,
    Expression<String>? sex,
    Expression<String>? civilStatus,
    Expression<String>? contactNumber,
    Expression<String>? emergencyContactNo,
    Expression<String>? referredBy,
    Expression<String>? relationship,
    Expression<String>? relationshipEmergency,
    Expression<String>? streetAddress,
    Expression<String>? barangay,
    Expression<String>? cityMunicipality,
    Expression<String>? province,
    Expression<String>? zipCode,
    Expression<bool>? isArchived,
    Expression<bool>? isSeniorOrPWD,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (patientId != null) 'patient_id': patientId,
      if (firstName != null) 'first_name': firstName,
      if (middleName != null) 'middle_name': middleName,
      if (lastName != null) 'last_name': lastName,
      if (suffix != null) 'suffix': suffix,
      if (birthDate != null) 'birth_date': birthDate,
      if (sex != null) 'sex': sex,
      if (civilStatus != null) 'civil_status': civilStatus,
      if (contactNumber != null) 'contact_number': contactNumber,
      if (emergencyContactNo != null)
        'emergency_contact_no': emergencyContactNo,
      if (referredBy != null) 'referred_by': referredBy,
      if (relationship != null) 'relationship': relationship,
      if (relationshipEmergency != null)
        'relationship_emergency': relationshipEmergency,
      if (streetAddress != null) 'street_address': streetAddress,
      if (barangay != null) 'barangay': barangay,
      if (cityMunicipality != null) 'city_municipality': cityMunicipality,
      if (province != null) 'province': province,
      if (zipCode != null) 'zip_code': zipCode,
      if (isArchived != null) 'is_archived': isArchived,
      if (isSeniorOrPWD != null) 'is_senior_or_p_w_d': isSeniorOrPWD,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  PatientCompanion copyWith(
      {Value<int>? patientId,
      Value<String>? firstName,
      Value<String?>? middleName,
      Value<String>? lastName,
      Value<String?>? suffix,
      Value<DateTime>? birthDate,
      Value<String>? sex,
      Value<String>? civilStatus,
      Value<String>? contactNumber,
      Value<String?>? emergencyContactNo,
      Value<String?>? referredBy,
      Value<String?>? relationship,
      Value<String?>? relationshipEmergency,
      Value<String>? streetAddress,
      Value<String>? barangay,
      Value<String>? cityMunicipality,
      Value<String>? province,
      Value<String>? zipCode,
      Value<bool>? isArchived,
      Value<bool>? isSeniorOrPWD,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return PatientCompanion(
      patientId: patientId ?? this.patientId,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      suffix: suffix ?? this.suffix,
      birthDate: birthDate ?? this.birthDate,
      sex: sex ?? this.sex,
      civilStatus: civilStatus ?? this.civilStatus,
      contactNumber: contactNumber ?? this.contactNumber,
      emergencyContactNo: emergencyContactNo ?? this.emergencyContactNo,
      referredBy: referredBy ?? this.referredBy,
      relationship: relationship ?? this.relationship,
      relationshipEmergency:
          relationshipEmergency ?? this.relationshipEmergency,
      streetAddress: streetAddress ?? this.streetAddress,
      barangay: barangay ?? this.barangay,
      cityMunicipality: cityMunicipality ?? this.cityMunicipality,
      province: province ?? this.province,
      zipCode: zipCode ?? this.zipCode,
      isArchived: isArchived ?? this.isArchived,
      isSeniorOrPWD: isSeniorOrPWD ?? this.isSeniorOrPWD,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (patientId.present) {
      map['patient_id'] = Variable<int>(patientId.value);
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
    if (suffix.present) {
      map['suffix'] = Variable<String>(suffix.value);
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
    if (relationshipEmergency.present) {
      map['relationship_emergency'] =
          Variable<String>(relationshipEmergency.value);
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
    if (isSeniorOrPWD.present) {
      map['is_senior_or_p_w_d'] = Variable<bool>(isSeniorOrPWD.value);
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
    return (StringBuffer('PatientCompanion(')
          ..write('patientId: $patientId, ')
          ..write('firstName: $firstName, ')
          ..write('middleName: $middleName, ')
          ..write('lastName: $lastName, ')
          ..write('suffix: $suffix, ')
          ..write('birthDate: $birthDate, ')
          ..write('sex: $sex, ')
          ..write('civilStatus: $civilStatus, ')
          ..write('contactNumber: $contactNumber, ')
          ..write('emergencyContactNo: $emergencyContactNo, ')
          ..write('referredBy: $referredBy, ')
          ..write('relationship: $relationship, ')
          ..write('relationshipEmergency: $relationshipEmergency, ')
          ..write('streetAddress: $streetAddress, ')
          ..write('barangay: $barangay, ')
          ..write('cityMunicipality: $cityMunicipality, ')
          ..write('province: $province, ')
          ..write('zipCode: $zipCode, ')
          ..write('isArchived: $isArchived, ')
          ..write('isSeniorOrPWD: $isSeniorOrPWD, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ClinicalStaffTable extends ClinicalStaff
    with TableInfo<$ClinicalStaffTable, ClinicalStaffData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClinicalStaffTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _staffIdMeta =
      const VerificationMeta('staffId');
  @override
  late final GeneratedColumn<int> staffId = GeneratedColumn<int>(
      'staff_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isLockedOutMeta =
      const VerificationMeta('isLockedOut');
  @override
  late final GeneratedColumn<bool> isLockedOut = GeneratedColumn<bool>(
      'is_locked_out', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_locked_out" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [staffId, name, isLockedOut];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'clinical_staff';
  @override
  VerificationContext validateIntegrity(Insertable<ClinicalStaffData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('staff_id')) {
      context.handle(_staffIdMeta,
          staffId.isAcceptableOrUnknown(data['staff_id']!, _staffIdMeta));
    } else if (isInserting) {
      context.missing(_staffIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_locked_out')) {
      context.handle(
          _isLockedOutMeta,
          isLockedOut.isAcceptableOrUnknown(
              data['is_locked_out']!, _isLockedOutMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ClinicalStaffData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClinicalStaffData(
      staffId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}staff_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      isLockedOut: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_locked_out'])!,
    );
  }

  @override
  $ClinicalStaffTable createAlias(String alias) {
    return $ClinicalStaffTable(attachedDatabase, alias);
  }
}

class ClinicalStaffData extends DataClass
    implements Insertable<ClinicalStaffData> {
  final int staffId;
  final String name;
  final bool isLockedOut;
  const ClinicalStaffData(
      {required this.staffId, required this.name, required this.isLockedOut});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['staff_id'] = Variable<int>(staffId);
    map['name'] = Variable<String>(name);
    map['is_locked_out'] = Variable<bool>(isLockedOut);
    return map;
  }

  ClinicalStaffCompanion toCompanion(bool nullToAbsent) {
    return ClinicalStaffCompanion(
      staffId: Value(staffId),
      name: Value(name),
      isLockedOut: Value(isLockedOut),
    );
  }

  factory ClinicalStaffData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClinicalStaffData(
      staffId: serializer.fromJson<int>(json['staffId']),
      name: serializer.fromJson<String>(json['name']),
      isLockedOut: serializer.fromJson<bool>(json['isLockedOut']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'staffId': serializer.toJson<int>(staffId),
      'name': serializer.toJson<String>(name),
      'isLockedOut': serializer.toJson<bool>(isLockedOut),
    };
  }

  ClinicalStaffData copyWith({int? staffId, String? name, bool? isLockedOut}) =>
      ClinicalStaffData(
        staffId: staffId ?? this.staffId,
        name: name ?? this.name,
        isLockedOut: isLockedOut ?? this.isLockedOut,
      );
  ClinicalStaffData copyWithCompanion(ClinicalStaffCompanion data) {
    return ClinicalStaffData(
      staffId: data.staffId.present ? data.staffId.value : this.staffId,
      name: data.name.present ? data.name.value : this.name,
      isLockedOut:
          data.isLockedOut.present ? data.isLockedOut.value : this.isLockedOut,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClinicalStaffData(')
          ..write('staffId: $staffId, ')
          ..write('name: $name, ')
          ..write('isLockedOut: $isLockedOut')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(staffId, name, isLockedOut);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClinicalStaffData &&
          other.staffId == this.staffId &&
          other.name == this.name &&
          other.isLockedOut == this.isLockedOut);
}

class ClinicalStaffCompanion extends UpdateCompanion<ClinicalStaffData> {
  final Value<int> staffId;
  final Value<String> name;
  final Value<bool> isLockedOut;
  final Value<int> rowid;
  const ClinicalStaffCompanion({
    this.staffId = const Value.absent(),
    this.name = const Value.absent(),
    this.isLockedOut = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ClinicalStaffCompanion.insert({
    required int staffId,
    required String name,
    this.isLockedOut = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : staffId = Value(staffId),
        name = Value(name);
  static Insertable<ClinicalStaffData> custom({
    Expression<int>? staffId,
    Expression<String>? name,
    Expression<bool>? isLockedOut,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (staffId != null) 'staff_id': staffId,
      if (name != null) 'name': name,
      if (isLockedOut != null) 'is_locked_out': isLockedOut,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ClinicalStaffCompanion copyWith(
      {Value<int>? staffId,
      Value<String>? name,
      Value<bool>? isLockedOut,
      Value<int>? rowid}) {
    return ClinicalStaffCompanion(
      staffId: staffId ?? this.staffId,
      name: name ?? this.name,
      isLockedOut: isLockedOut ?? this.isLockedOut,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (staffId.present) {
      map['staff_id'] = Variable<int>(staffId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isLockedOut.present) {
      map['is_locked_out'] = Variable<bool>(isLockedOut.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClinicalStaffCompanion(')
          ..write('staffId: $staffId, ')
          ..write('name: $name, ')
          ..write('isLockedOut: $isLockedOut, ')
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
  static const VerificationMeta _appointmentIdMeta =
      const VerificationMeta('appointmentId');
  @override
  late final GeneratedColumn<int> appointmentId = GeneratedColumn<int>(
      'appointment_id', aliasedName, false,
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
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES patient (patient_id)'));
  static const VerificationMeta _staffIdMeta =
      const VerificationMeta('staffId');
  @override
  late final GeneratedColumn<int> staffId = GeneratedColumn<int>(
      'staff_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES clinical_staff (staff_id)'));
  static const VerificationMeta _scheduleDateTimeMeta =
      const VerificationMeta('scheduleDateTime');
  @override
  late final GeneratedColumn<DateTime> scheduleDateTime =
      GeneratedColumn<DateTime>('schedule_date_time', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
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
  static const VerificationMeta _timeSlotMeta =
      const VerificationMeta('timeSlot');
  @override
  late final GeneratedColumn<String> timeSlot = GeneratedColumn<String>(
      'time_slot', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        appointmentId,
        patientId,
        staffId,
        scheduleDateTime,
        reasonForVisit,
        status,
        timeSlot
      ];
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
    if (data.containsKey('appointment_id')) {
      context.handle(
          _appointmentIdMeta,
          appointmentId.isAcceptableOrUnknown(
              data['appointment_id']!, _appointmentIdMeta));
    }
    if (data.containsKey('patient_id')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta));
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('staff_id')) {
      context.handle(_staffIdMeta,
          staffId.isAcceptableOrUnknown(data['staff_id']!, _staffIdMeta));
    }
    if (data.containsKey('schedule_date_time')) {
      context.handle(
          _scheduleDateTimeMeta,
          scheduleDateTime.isAcceptableOrUnknown(
              data['schedule_date_time']!, _scheduleDateTimeMeta));
    } else if (isInserting) {
      context.missing(_scheduleDateTimeMeta);
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
    if (data.containsKey('time_slot')) {
      context.handle(_timeSlotMeta,
          timeSlot.isAcceptableOrUnknown(data['time_slot']!, _timeSlotMeta));
    } else if (isInserting) {
      context.missing(_timeSlotMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {appointmentId};
  @override
  AppointmentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppointmentData(
      appointmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}appointment_id'])!,
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}patient_id'])!,
      staffId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}staff_id']),
      scheduleDateTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}schedule_date_time'])!,
      reasonForVisit: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}reason_for_visit'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      timeSlot: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}time_slot'])!,
    );
  }

  @override
  $AppointmentTable createAlias(String alias) {
    return $AppointmentTable(attachedDatabase, alias);
  }
}

class AppointmentData extends DataClass implements Insertable<AppointmentData> {
  final int appointmentId;
  final int patientId;
  final int? staffId;
  final DateTime scheduleDateTime;
  final String reasonForVisit;
  final String status;
  final String timeSlot;
  const AppointmentData(
      {required this.appointmentId,
      required this.patientId,
      this.staffId,
      required this.scheduleDateTime,
      required this.reasonForVisit,
      required this.status,
      required this.timeSlot});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['appointment_id'] = Variable<int>(appointmentId);
    map['patient_id'] = Variable<int>(patientId);
    if (!nullToAbsent || staffId != null) {
      map['staff_id'] = Variable<int>(staffId);
    }
    map['schedule_date_time'] = Variable<DateTime>(scheduleDateTime);
    map['reason_for_visit'] = Variable<String>(reasonForVisit);
    map['status'] = Variable<String>(status);
    map['time_slot'] = Variable<String>(timeSlot);
    return map;
  }

  AppointmentCompanion toCompanion(bool nullToAbsent) {
    return AppointmentCompanion(
      appointmentId: Value(appointmentId),
      patientId: Value(patientId),
      staffId: staffId == null && nullToAbsent
          ? const Value.absent()
          : Value(staffId),
      scheduleDateTime: Value(scheduleDateTime),
      reasonForVisit: Value(reasonForVisit),
      status: Value(status),
      timeSlot: Value(timeSlot),
    );
  }

  factory AppointmentData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppointmentData(
      appointmentId: serializer.fromJson<int>(json['appointmentId']),
      patientId: serializer.fromJson<int>(json['patientId']),
      staffId: serializer.fromJson<int?>(json['staffId']),
      scheduleDateTime: serializer.fromJson<DateTime>(json['scheduleDateTime']),
      reasonForVisit: serializer.fromJson<String>(json['reasonForVisit']),
      status: serializer.fromJson<String>(json['status']),
      timeSlot: serializer.fromJson<String>(json['timeSlot']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'appointmentId': serializer.toJson<int>(appointmentId),
      'patientId': serializer.toJson<int>(patientId),
      'staffId': serializer.toJson<int?>(staffId),
      'scheduleDateTime': serializer.toJson<DateTime>(scheduleDateTime),
      'reasonForVisit': serializer.toJson<String>(reasonForVisit),
      'status': serializer.toJson<String>(status),
      'timeSlot': serializer.toJson<String>(timeSlot),
    };
  }

  AppointmentData copyWith(
          {int? appointmentId,
          int? patientId,
          Value<int?> staffId = const Value.absent(),
          DateTime? scheduleDateTime,
          String? reasonForVisit,
          String? status,
          String? timeSlot}) =>
      AppointmentData(
        appointmentId: appointmentId ?? this.appointmentId,
        patientId: patientId ?? this.patientId,
        staffId: staffId.present ? staffId.value : this.staffId,
        scheduleDateTime: scheduleDateTime ?? this.scheduleDateTime,
        reasonForVisit: reasonForVisit ?? this.reasonForVisit,
        status: status ?? this.status,
        timeSlot: timeSlot ?? this.timeSlot,
      );
  AppointmentData copyWithCompanion(AppointmentCompanion data) {
    return AppointmentData(
      appointmentId: data.appointmentId.present
          ? data.appointmentId.value
          : this.appointmentId,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      staffId: data.staffId.present ? data.staffId.value : this.staffId,
      scheduleDateTime: data.scheduleDateTime.present
          ? data.scheduleDateTime.value
          : this.scheduleDateTime,
      reasonForVisit: data.reasonForVisit.present
          ? data.reasonForVisit.value
          : this.reasonForVisit,
      status: data.status.present ? data.status.value : this.status,
      timeSlot: data.timeSlot.present ? data.timeSlot.value : this.timeSlot,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppointmentData(')
          ..write('appointmentId: $appointmentId, ')
          ..write('patientId: $patientId, ')
          ..write('staffId: $staffId, ')
          ..write('scheduleDateTime: $scheduleDateTime, ')
          ..write('reasonForVisit: $reasonForVisit, ')
          ..write('status: $status, ')
          ..write('timeSlot: $timeSlot')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(appointmentId, patientId, staffId,
      scheduleDateTime, reasonForVisit, status, timeSlot);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppointmentData &&
          other.appointmentId == this.appointmentId &&
          other.patientId == this.patientId &&
          other.staffId == this.staffId &&
          other.scheduleDateTime == this.scheduleDateTime &&
          other.reasonForVisit == this.reasonForVisit &&
          other.status == this.status &&
          other.timeSlot == this.timeSlot);
}

class AppointmentCompanion extends UpdateCompanion<AppointmentData> {
  final Value<int> appointmentId;
  final Value<int> patientId;
  final Value<int?> staffId;
  final Value<DateTime> scheduleDateTime;
  final Value<String> reasonForVisit;
  final Value<String> status;
  final Value<String> timeSlot;
  const AppointmentCompanion({
    this.appointmentId = const Value.absent(),
    this.patientId = const Value.absent(),
    this.staffId = const Value.absent(),
    this.scheduleDateTime = const Value.absent(),
    this.reasonForVisit = const Value.absent(),
    this.status = const Value.absent(),
    this.timeSlot = const Value.absent(),
  });
  AppointmentCompanion.insert({
    this.appointmentId = const Value.absent(),
    required int patientId,
    this.staffId = const Value.absent(),
    required DateTime scheduleDateTime,
    required String reasonForVisit,
    this.status = const Value.absent(),
    required String timeSlot,
  })  : patientId = Value(patientId),
        scheduleDateTime = Value(scheduleDateTime),
        reasonForVisit = Value(reasonForVisit),
        timeSlot = Value(timeSlot);
  static Insertable<AppointmentData> custom({
    Expression<int>? appointmentId,
    Expression<int>? patientId,
    Expression<int>? staffId,
    Expression<DateTime>? scheduleDateTime,
    Expression<String>? reasonForVisit,
    Expression<String>? status,
    Expression<String>? timeSlot,
  }) {
    return RawValuesInsertable({
      if (appointmentId != null) 'appointment_id': appointmentId,
      if (patientId != null) 'patient_id': patientId,
      if (staffId != null) 'staff_id': staffId,
      if (scheduleDateTime != null) 'schedule_date_time': scheduleDateTime,
      if (reasonForVisit != null) 'reason_for_visit': reasonForVisit,
      if (status != null) 'status': status,
      if (timeSlot != null) 'time_slot': timeSlot,
    });
  }

  AppointmentCompanion copyWith(
      {Value<int>? appointmentId,
      Value<int>? patientId,
      Value<int?>? staffId,
      Value<DateTime>? scheduleDateTime,
      Value<String>? reasonForVisit,
      Value<String>? status,
      Value<String>? timeSlot}) {
    return AppointmentCompanion(
      appointmentId: appointmentId ?? this.appointmentId,
      patientId: patientId ?? this.patientId,
      staffId: staffId ?? this.staffId,
      scheduleDateTime: scheduleDateTime ?? this.scheduleDateTime,
      reasonForVisit: reasonForVisit ?? this.reasonForVisit,
      status: status ?? this.status,
      timeSlot: timeSlot ?? this.timeSlot,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (appointmentId.present) {
      map['appointment_id'] = Variable<int>(appointmentId.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<int>(patientId.value);
    }
    if (staffId.present) {
      map['staff_id'] = Variable<int>(staffId.value);
    }
    if (scheduleDateTime.present) {
      map['schedule_date_time'] = Variable<DateTime>(scheduleDateTime.value);
    }
    if (reasonForVisit.present) {
      map['reason_for_visit'] = Variable<String>(reasonForVisit.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (timeSlot.present) {
      map['time_slot'] = Variable<String>(timeSlot.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppointmentCompanion(')
          ..write('appointmentId: $appointmentId, ')
          ..write('patientId: $patientId, ')
          ..write('staffId: $staffId, ')
          ..write('scheduleDateTime: $scheduleDateTime, ')
          ..write('reasonForVisit: $reasonForVisit, ')
          ..write('status: $status, ')
          ..write('timeSlot: $timeSlot')
          ..write(')'))
        .toString();
  }
}

class $ProcedureChargeTable extends ProcedureCharge
    with TableInfo<$ProcedureChargeTable, ProcedureChargeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProcedureChargeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _chargeIdMeta =
      const VerificationMeta('chargeId');
  @override
  late final GeneratedColumn<int> chargeId = GeneratedColumn<int>(
      'charge_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _procedureNameMeta =
      const VerificationMeta('procedureName');
  @override
  late final GeneratedColumn<String> procedureName = GeneratedColumn<String>(
      'procedure_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _procedureChargeMeta =
      const VerificationMeta('procedureCharge');
  @override
  late final GeneratedColumn<double> procedureCharge = GeneratedColumn<double>(
      'procedure_charge', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _totalProcedureChargeMeta =
      const VerificationMeta('totalProcedureCharge');
  @override
  late final GeneratedColumn<double> totalProcedureCharge =
      GeneratedColumn<double>('total_procedure_charge', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        chargeId,
        procedureName,
        procedureCharge,
        quantity,
        totalProcedureCharge
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'procedure_charge';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProcedureChargeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('charge_id')) {
      context.handle(_chargeIdMeta,
          chargeId.isAcceptableOrUnknown(data['charge_id']!, _chargeIdMeta));
    }
    if (data.containsKey('procedure_name')) {
      context.handle(
          _procedureNameMeta,
          procedureName.isAcceptableOrUnknown(
              data['procedure_name']!, _procedureNameMeta));
    } else if (isInserting) {
      context.missing(_procedureNameMeta);
    }
    if (data.containsKey('procedure_charge')) {
      context.handle(
          _procedureChargeMeta,
          procedureCharge.isAcceptableOrUnknown(
              data['procedure_charge']!, _procedureChargeMeta));
    } else if (isInserting) {
      context.missing(_procedureChargeMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    }
    if (data.containsKey('total_procedure_charge')) {
      context.handle(
          _totalProcedureChargeMeta,
          totalProcedureCharge.isAcceptableOrUnknown(
              data['total_procedure_charge']!, _totalProcedureChargeMeta));
    } else if (isInserting) {
      context.missing(_totalProcedureChargeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {chargeId};
  @override
  ProcedureChargeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProcedureChargeData(
      chargeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}charge_id'])!,
      procedureName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}procedure_name'])!,
      procedureCharge: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}procedure_charge'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      totalProcedureCharge: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}total_procedure_charge'])!,
    );
  }

  @override
  $ProcedureChargeTable createAlias(String alias) {
    return $ProcedureChargeTable(attachedDatabase, alias);
  }
}

class ProcedureChargeData extends DataClass
    implements Insertable<ProcedureChargeData> {
  final int chargeId;
  final String procedureName;
  final double procedureCharge;
  final int quantity;
  final double totalProcedureCharge;
  const ProcedureChargeData(
      {required this.chargeId,
      required this.procedureName,
      required this.procedureCharge,
      required this.quantity,
      required this.totalProcedureCharge});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['charge_id'] = Variable<int>(chargeId);
    map['procedure_name'] = Variable<String>(procedureName);
    map['procedure_charge'] = Variable<double>(procedureCharge);
    map['quantity'] = Variable<int>(quantity);
    map['total_procedure_charge'] = Variable<double>(totalProcedureCharge);
    return map;
  }

  ProcedureChargeCompanion toCompanion(bool nullToAbsent) {
    return ProcedureChargeCompanion(
      chargeId: Value(chargeId),
      procedureName: Value(procedureName),
      procedureCharge: Value(procedureCharge),
      quantity: Value(quantity),
      totalProcedureCharge: Value(totalProcedureCharge),
    );
  }

  factory ProcedureChargeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProcedureChargeData(
      chargeId: serializer.fromJson<int>(json['chargeId']),
      procedureName: serializer.fromJson<String>(json['procedureName']),
      procedureCharge: serializer.fromJson<double>(json['procedureCharge']),
      quantity: serializer.fromJson<int>(json['quantity']),
      totalProcedureCharge:
          serializer.fromJson<double>(json['totalProcedureCharge']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'chargeId': serializer.toJson<int>(chargeId),
      'procedureName': serializer.toJson<String>(procedureName),
      'procedureCharge': serializer.toJson<double>(procedureCharge),
      'quantity': serializer.toJson<int>(quantity),
      'totalProcedureCharge': serializer.toJson<double>(totalProcedureCharge),
    };
  }

  ProcedureChargeData copyWith(
          {int? chargeId,
          String? procedureName,
          double? procedureCharge,
          int? quantity,
          double? totalProcedureCharge}) =>
      ProcedureChargeData(
        chargeId: chargeId ?? this.chargeId,
        procedureName: procedureName ?? this.procedureName,
        procedureCharge: procedureCharge ?? this.procedureCharge,
        quantity: quantity ?? this.quantity,
        totalProcedureCharge: totalProcedureCharge ?? this.totalProcedureCharge,
      );
  ProcedureChargeData copyWithCompanion(ProcedureChargeCompanion data) {
    return ProcedureChargeData(
      chargeId: data.chargeId.present ? data.chargeId.value : this.chargeId,
      procedureName: data.procedureName.present
          ? data.procedureName.value
          : this.procedureName,
      procedureCharge: data.procedureCharge.present
          ? data.procedureCharge.value
          : this.procedureCharge,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      totalProcedureCharge: data.totalProcedureCharge.present
          ? data.totalProcedureCharge.value
          : this.totalProcedureCharge,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProcedureChargeData(')
          ..write('chargeId: $chargeId, ')
          ..write('procedureName: $procedureName, ')
          ..write('procedureCharge: $procedureCharge, ')
          ..write('quantity: $quantity, ')
          ..write('totalProcedureCharge: $totalProcedureCharge')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      chargeId, procedureName, procedureCharge, quantity, totalProcedureCharge);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProcedureChargeData &&
          other.chargeId == this.chargeId &&
          other.procedureName == this.procedureName &&
          other.procedureCharge == this.procedureCharge &&
          other.quantity == this.quantity &&
          other.totalProcedureCharge == this.totalProcedureCharge);
}

class ProcedureChargeCompanion extends UpdateCompanion<ProcedureChargeData> {
  final Value<int> chargeId;
  final Value<String> procedureName;
  final Value<double> procedureCharge;
  final Value<int> quantity;
  final Value<double> totalProcedureCharge;
  const ProcedureChargeCompanion({
    this.chargeId = const Value.absent(),
    this.procedureName = const Value.absent(),
    this.procedureCharge = const Value.absent(),
    this.quantity = const Value.absent(),
    this.totalProcedureCharge = const Value.absent(),
  });
  ProcedureChargeCompanion.insert({
    this.chargeId = const Value.absent(),
    required String procedureName,
    required double procedureCharge,
    this.quantity = const Value.absent(),
    required double totalProcedureCharge,
  })  : procedureName = Value(procedureName),
        procedureCharge = Value(procedureCharge),
        totalProcedureCharge = Value(totalProcedureCharge);
  static Insertable<ProcedureChargeData> custom({
    Expression<int>? chargeId,
    Expression<String>? procedureName,
    Expression<double>? procedureCharge,
    Expression<int>? quantity,
    Expression<double>? totalProcedureCharge,
  }) {
    return RawValuesInsertable({
      if (chargeId != null) 'charge_id': chargeId,
      if (procedureName != null) 'procedure_name': procedureName,
      if (procedureCharge != null) 'procedure_charge': procedureCharge,
      if (quantity != null) 'quantity': quantity,
      if (totalProcedureCharge != null)
        'total_procedure_charge': totalProcedureCharge,
    });
  }

  ProcedureChargeCompanion copyWith(
      {Value<int>? chargeId,
      Value<String>? procedureName,
      Value<double>? procedureCharge,
      Value<int>? quantity,
      Value<double>? totalProcedureCharge}) {
    return ProcedureChargeCompanion(
      chargeId: chargeId ?? this.chargeId,
      procedureName: procedureName ?? this.procedureName,
      procedureCharge: procedureCharge ?? this.procedureCharge,
      quantity: quantity ?? this.quantity,
      totalProcedureCharge: totalProcedureCharge ?? this.totalProcedureCharge,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (chargeId.present) {
      map['charge_id'] = Variable<int>(chargeId.value);
    }
    if (procedureName.present) {
      map['procedure_name'] = Variable<String>(procedureName.value);
    }
    if (procedureCharge.present) {
      map['procedure_charge'] = Variable<double>(procedureCharge.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (totalProcedureCharge.present) {
      map['total_procedure_charge'] =
          Variable<double>(totalProcedureCharge.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProcedureChargeCompanion(')
          ..write('chargeId: $chargeId, ')
          ..write('procedureName: $procedureName, ')
          ..write('procedureCharge: $procedureCharge, ')
          ..write('quantity: $quantity, ')
          ..write('totalProcedureCharge: $totalProcedureCharge')
          ..write(')'))
        .toString();
  }
}

class $PaymentTransactionTable extends PaymentTransaction
    with TableInfo<$PaymentTransactionTable, PaymentTransactionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentTransactionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _transactionIdMeta =
      const VerificationMeta('transactionId');
  @override
  late final GeneratedColumn<int> transactionId = GeneratedColumn<int>(
      'transaction_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _amountReceivedMeta =
      const VerificationMeta('amountReceived');
  @override
  late final GeneratedColumn<double> amountReceived = GeneratedColumn<double>(
      'amount_received', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _modeOfPaymentMeta =
      const VerificationMeta('modeOfPayment');
  @override
  late final GeneratedColumn<String> modeOfPayment = GeneratedColumn<String>(
      'mode_of_payment', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _paymentDateMeta =
      const VerificationMeta('paymentDate');
  @override
  late final GeneratedColumn<DateTime> paymentDate = GeneratedColumn<DateTime>(
      'payment_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [transactionId, amountReceived, modeOfPayment, paymentDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payment_transaction';
  @override
  VerificationContext validateIntegrity(
      Insertable<PaymentTransactionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('transaction_id')) {
      context.handle(
          _transactionIdMeta,
          transactionId.isAcceptableOrUnknown(
              data['transaction_id']!, _transactionIdMeta));
    }
    if (data.containsKey('amount_received')) {
      context.handle(
          _amountReceivedMeta,
          amountReceived.isAcceptableOrUnknown(
              data['amount_received']!, _amountReceivedMeta));
    } else if (isInserting) {
      context.missing(_amountReceivedMeta);
    }
    if (data.containsKey('mode_of_payment')) {
      context.handle(
          _modeOfPaymentMeta,
          modeOfPayment.isAcceptableOrUnknown(
              data['mode_of_payment']!, _modeOfPaymentMeta));
    } else if (isInserting) {
      context.missing(_modeOfPaymentMeta);
    }
    if (data.containsKey('payment_date')) {
      context.handle(
          _paymentDateMeta,
          paymentDate.isAcceptableOrUnknown(
              data['payment_date']!, _paymentDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {transactionId};
  @override
  PaymentTransactionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PaymentTransactionData(
      transactionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}transaction_id'])!,
      amountReceived: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}amount_received'])!,
      modeOfPayment: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}mode_of_payment'])!,
      paymentDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}payment_date'])!,
    );
  }

  @override
  $PaymentTransactionTable createAlias(String alias) {
    return $PaymentTransactionTable(attachedDatabase, alias);
  }
}

class PaymentTransactionData extends DataClass
    implements Insertable<PaymentTransactionData> {
  final int transactionId;
  final double amountReceived;
  final String modeOfPayment;
  final DateTime paymentDate;
  const PaymentTransactionData(
      {required this.transactionId,
      required this.amountReceived,
      required this.modeOfPayment,
      required this.paymentDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['transaction_id'] = Variable<int>(transactionId);
    map['amount_received'] = Variable<double>(amountReceived);
    map['mode_of_payment'] = Variable<String>(modeOfPayment);
    map['payment_date'] = Variable<DateTime>(paymentDate);
    return map;
  }

  PaymentTransactionCompanion toCompanion(bool nullToAbsent) {
    return PaymentTransactionCompanion(
      transactionId: Value(transactionId),
      amountReceived: Value(amountReceived),
      modeOfPayment: Value(modeOfPayment),
      paymentDate: Value(paymentDate),
    );
  }

  factory PaymentTransactionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PaymentTransactionData(
      transactionId: serializer.fromJson<int>(json['transactionId']),
      amountReceived: serializer.fromJson<double>(json['amountReceived']),
      modeOfPayment: serializer.fromJson<String>(json['modeOfPayment']),
      paymentDate: serializer.fromJson<DateTime>(json['paymentDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'transactionId': serializer.toJson<int>(transactionId),
      'amountReceived': serializer.toJson<double>(amountReceived),
      'modeOfPayment': serializer.toJson<String>(modeOfPayment),
      'paymentDate': serializer.toJson<DateTime>(paymentDate),
    };
  }

  PaymentTransactionData copyWith(
          {int? transactionId,
          double? amountReceived,
          String? modeOfPayment,
          DateTime? paymentDate}) =>
      PaymentTransactionData(
        transactionId: transactionId ?? this.transactionId,
        amountReceived: amountReceived ?? this.amountReceived,
        modeOfPayment: modeOfPayment ?? this.modeOfPayment,
        paymentDate: paymentDate ?? this.paymentDate,
      );
  PaymentTransactionData copyWithCompanion(PaymentTransactionCompanion data) {
    return PaymentTransactionData(
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      amountReceived: data.amountReceived.present
          ? data.amountReceived.value
          : this.amountReceived,
      modeOfPayment: data.modeOfPayment.present
          ? data.modeOfPayment.value
          : this.modeOfPayment,
      paymentDate:
          data.paymentDate.present ? data.paymentDate.value : this.paymentDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PaymentTransactionData(')
          ..write('transactionId: $transactionId, ')
          ..write('amountReceived: $amountReceived, ')
          ..write('modeOfPayment: $modeOfPayment, ')
          ..write('paymentDate: $paymentDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(transactionId, amountReceived, modeOfPayment, paymentDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaymentTransactionData &&
          other.transactionId == this.transactionId &&
          other.amountReceived == this.amountReceived &&
          other.modeOfPayment == this.modeOfPayment &&
          other.paymentDate == this.paymentDate);
}

class PaymentTransactionCompanion
    extends UpdateCompanion<PaymentTransactionData> {
  final Value<int> transactionId;
  final Value<double> amountReceived;
  final Value<String> modeOfPayment;
  final Value<DateTime> paymentDate;
  const PaymentTransactionCompanion({
    this.transactionId = const Value.absent(),
    this.amountReceived = const Value.absent(),
    this.modeOfPayment = const Value.absent(),
    this.paymentDate = const Value.absent(),
  });
  PaymentTransactionCompanion.insert({
    this.transactionId = const Value.absent(),
    required double amountReceived,
    required String modeOfPayment,
    this.paymentDate = const Value.absent(),
  })  : amountReceived = Value(amountReceived),
        modeOfPayment = Value(modeOfPayment);
  static Insertable<PaymentTransactionData> custom({
    Expression<int>? transactionId,
    Expression<double>? amountReceived,
    Expression<String>? modeOfPayment,
    Expression<DateTime>? paymentDate,
  }) {
    return RawValuesInsertable({
      if (transactionId != null) 'transaction_id': transactionId,
      if (amountReceived != null) 'amount_received': amountReceived,
      if (modeOfPayment != null) 'mode_of_payment': modeOfPayment,
      if (paymentDate != null) 'payment_date': paymentDate,
    });
  }

  PaymentTransactionCompanion copyWith(
      {Value<int>? transactionId,
      Value<double>? amountReceived,
      Value<String>? modeOfPayment,
      Value<DateTime>? paymentDate}) {
    return PaymentTransactionCompanion(
      transactionId: transactionId ?? this.transactionId,
      amountReceived: amountReceived ?? this.amountReceived,
      modeOfPayment: modeOfPayment ?? this.modeOfPayment,
      paymentDate: paymentDate ?? this.paymentDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (transactionId.present) {
      map['transaction_id'] = Variable<int>(transactionId.value);
    }
    if (amountReceived.present) {
      map['amount_received'] = Variable<double>(amountReceived.value);
    }
    if (modeOfPayment.present) {
      map['mode_of_payment'] = Variable<String>(modeOfPayment.value);
    }
    if (paymentDate.present) {
      map['payment_date'] = Variable<DateTime>(paymentDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentTransactionCompanion(')
          ..write('transactionId: $transactionId, ')
          ..write('amountReceived: $amountReceived, ')
          ..write('modeOfPayment: $modeOfPayment, ')
          ..write('paymentDate: $paymentDate')
          ..write(')'))
        .toString();
  }
}

class $InvoiceTable extends Invoice with TableInfo<$InvoiceTable, InvoiceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvoiceTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _invoiceIdMeta =
      const VerificationMeta('invoiceId');
  @override
  late final GeneratedColumn<int> invoiceId = GeneratedColumn<int>(
      'invoice_id', aliasedName, false,
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
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES patient (patient_id)'));
  static const VerificationMeta _chargeIdMeta =
      const VerificationMeta('chargeId');
  @override
  late final GeneratedColumn<int> chargeId = GeneratedColumn<int>(
      'charge_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES procedure_charge (charge_id)'));
  static const VerificationMeta _transactionIdMeta =
      const VerificationMeta('transactionId');
  @override
  late final GeneratedColumn<int> transactionId = GeneratedColumn<int>(
      'transaction_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES payment_transaction (transaction_id)'));
  static const VerificationMeta _issuedDateMeta =
      const VerificationMeta('issuedDate');
  @override
  late final GeneratedColumn<DateTime> issuedDate = GeneratedColumn<DateTime>(
      'issued_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _totalBalanceMeta =
      const VerificationMeta('totalBalance');
  @override
  late final GeneratedColumn<double> totalBalance = GeneratedColumn<double>(
      'total_balance', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        invoiceId,
        patientId,
        chargeId,
        transactionId,
        issuedDate,
        totalBalance,
        status
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'invoice';
  @override
  VerificationContext validateIntegrity(Insertable<InvoiceData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('invoice_id')) {
      context.handle(_invoiceIdMeta,
          invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta));
    }
    if (data.containsKey('patient_id')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta));
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('charge_id')) {
      context.handle(_chargeIdMeta,
          chargeId.isAcceptableOrUnknown(data['charge_id']!, _chargeIdMeta));
    } else if (isInserting) {
      context.missing(_chargeIdMeta);
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
          _transactionIdMeta,
          transactionId.isAcceptableOrUnknown(
              data['transaction_id']!, _transactionIdMeta));
    } else if (isInserting) {
      context.missing(_transactionIdMeta);
    }
    if (data.containsKey('issued_date')) {
      context.handle(
          _issuedDateMeta,
          issuedDate.isAcceptableOrUnknown(
              data['issued_date']!, _issuedDateMeta));
    }
    if (data.containsKey('total_balance')) {
      context.handle(
          _totalBalanceMeta,
          totalBalance.isAcceptableOrUnknown(
              data['total_balance']!, _totalBalanceMeta));
    } else if (isInserting) {
      context.missing(_totalBalanceMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {invoiceId};
  @override
  InvoiceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InvoiceData(
      invoiceId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}invoice_id'])!,
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}patient_id'])!,
      chargeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}charge_id'])!,
      transactionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}transaction_id'])!,
      issuedDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}issued_date'])!,
      totalBalance: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_balance'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $InvoiceTable createAlias(String alias) {
    return $InvoiceTable(attachedDatabase, alias);
  }
}

class InvoiceData extends DataClass implements Insertable<InvoiceData> {
  final int invoiceId;
  final int patientId;
  final int chargeId;
  final int transactionId;
  final DateTime issuedDate;
  final double totalBalance;
  final String status;
  const InvoiceData(
      {required this.invoiceId,
      required this.patientId,
      required this.chargeId,
      required this.transactionId,
      required this.issuedDate,
      required this.totalBalance,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['invoice_id'] = Variable<int>(invoiceId);
    map['patient_id'] = Variable<int>(patientId);
    map['charge_id'] = Variable<int>(chargeId);
    map['transaction_id'] = Variable<int>(transactionId);
    map['issued_date'] = Variable<DateTime>(issuedDate);
    map['total_balance'] = Variable<double>(totalBalance);
    map['status'] = Variable<String>(status);
    return map;
  }

  InvoiceCompanion toCompanion(bool nullToAbsent) {
    return InvoiceCompanion(
      invoiceId: Value(invoiceId),
      patientId: Value(patientId),
      chargeId: Value(chargeId),
      transactionId: Value(transactionId),
      issuedDate: Value(issuedDate),
      totalBalance: Value(totalBalance),
      status: Value(status),
    );
  }

  factory InvoiceData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InvoiceData(
      invoiceId: serializer.fromJson<int>(json['invoiceId']),
      patientId: serializer.fromJson<int>(json['patientId']),
      chargeId: serializer.fromJson<int>(json['chargeId']),
      transactionId: serializer.fromJson<int>(json['transactionId']),
      issuedDate: serializer.fromJson<DateTime>(json['issuedDate']),
      totalBalance: serializer.fromJson<double>(json['totalBalance']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'invoiceId': serializer.toJson<int>(invoiceId),
      'patientId': serializer.toJson<int>(patientId),
      'chargeId': serializer.toJson<int>(chargeId),
      'transactionId': serializer.toJson<int>(transactionId),
      'issuedDate': serializer.toJson<DateTime>(issuedDate),
      'totalBalance': serializer.toJson<double>(totalBalance),
      'status': serializer.toJson<String>(status),
    };
  }

  InvoiceData copyWith(
          {int? invoiceId,
          int? patientId,
          int? chargeId,
          int? transactionId,
          DateTime? issuedDate,
          double? totalBalance,
          String? status}) =>
      InvoiceData(
        invoiceId: invoiceId ?? this.invoiceId,
        patientId: patientId ?? this.patientId,
        chargeId: chargeId ?? this.chargeId,
        transactionId: transactionId ?? this.transactionId,
        issuedDate: issuedDate ?? this.issuedDate,
        totalBalance: totalBalance ?? this.totalBalance,
        status: status ?? this.status,
      );
  InvoiceData copyWithCompanion(InvoiceCompanion data) {
    return InvoiceData(
      invoiceId: data.invoiceId.present ? data.invoiceId.value : this.invoiceId,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      chargeId: data.chargeId.present ? data.chargeId.value : this.chargeId,
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      issuedDate:
          data.issuedDate.present ? data.issuedDate.value : this.issuedDate,
      totalBalance: data.totalBalance.present
          ? data.totalBalance.value
          : this.totalBalance,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceData(')
          ..write('invoiceId: $invoiceId, ')
          ..write('patientId: $patientId, ')
          ..write('chargeId: $chargeId, ')
          ..write('transactionId: $transactionId, ')
          ..write('issuedDate: $issuedDate, ')
          ..write('totalBalance: $totalBalance, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(invoiceId, patientId, chargeId, transactionId,
      issuedDate, totalBalance, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InvoiceData &&
          other.invoiceId == this.invoiceId &&
          other.patientId == this.patientId &&
          other.chargeId == this.chargeId &&
          other.transactionId == this.transactionId &&
          other.issuedDate == this.issuedDate &&
          other.totalBalance == this.totalBalance &&
          other.status == this.status);
}

class InvoiceCompanion extends UpdateCompanion<InvoiceData> {
  final Value<int> invoiceId;
  final Value<int> patientId;
  final Value<int> chargeId;
  final Value<int> transactionId;
  final Value<DateTime> issuedDate;
  final Value<double> totalBalance;
  final Value<String> status;
  const InvoiceCompanion({
    this.invoiceId = const Value.absent(),
    this.patientId = const Value.absent(),
    this.chargeId = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.issuedDate = const Value.absent(),
    this.totalBalance = const Value.absent(),
    this.status = const Value.absent(),
  });
  InvoiceCompanion.insert({
    this.invoiceId = const Value.absent(),
    required int patientId,
    required int chargeId,
    required int transactionId,
    this.issuedDate = const Value.absent(),
    required double totalBalance,
    required String status,
  })  : patientId = Value(patientId),
        chargeId = Value(chargeId),
        transactionId = Value(transactionId),
        totalBalance = Value(totalBalance),
        status = Value(status);
  static Insertable<InvoiceData> custom({
    Expression<int>? invoiceId,
    Expression<int>? patientId,
    Expression<int>? chargeId,
    Expression<int>? transactionId,
    Expression<DateTime>? issuedDate,
    Expression<double>? totalBalance,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (patientId != null) 'patient_id': patientId,
      if (chargeId != null) 'charge_id': chargeId,
      if (transactionId != null) 'transaction_id': transactionId,
      if (issuedDate != null) 'issued_date': issuedDate,
      if (totalBalance != null) 'total_balance': totalBalance,
      if (status != null) 'status': status,
    });
  }

  InvoiceCompanion copyWith(
      {Value<int>? invoiceId,
      Value<int>? patientId,
      Value<int>? chargeId,
      Value<int>? transactionId,
      Value<DateTime>? issuedDate,
      Value<double>? totalBalance,
      Value<String>? status}) {
    return InvoiceCompanion(
      invoiceId: invoiceId ?? this.invoiceId,
      patientId: patientId ?? this.patientId,
      chargeId: chargeId ?? this.chargeId,
      transactionId: transactionId ?? this.transactionId,
      issuedDate: issuedDate ?? this.issuedDate,
      totalBalance: totalBalance ?? this.totalBalance,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (invoiceId.present) {
      map['invoice_id'] = Variable<int>(invoiceId.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<int>(patientId.value);
    }
    if (chargeId.present) {
      map['charge_id'] = Variable<int>(chargeId.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<int>(transactionId.value);
    }
    if (issuedDate.present) {
      map['issued_date'] = Variable<DateTime>(issuedDate.value);
    }
    if (totalBalance.present) {
      map['total_balance'] = Variable<double>(totalBalance.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceCompanion(')
          ..write('invoiceId: $invoiceId, ')
          ..write('patientId: $patientId, ')
          ..write('chargeId: $chargeId, ')
          ..write('transactionId: $transactionId, ')
          ..write('issuedDate: $issuedDate, ')
          ..write('totalBalance: $totalBalance, ')
          ..write('status: $status')
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
  static const VerificationMeta _recordIdMeta =
      const VerificationMeta('recordId');
  @override
  late final GeneratedColumn<int> recordId = GeneratedColumn<int>(
      'record_id', aliasedName, false,
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
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES patient (patient_id)'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _pastIllnessMeta =
      const VerificationMeta('pastIllness');
  @override
  late final GeneratedColumn<String> pastIllness = GeneratedColumn<String>(
      'past_illness', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _presentIllnessMeta =
      const VerificationMeta('presentIllness');
  @override
  late final GeneratedColumn<String> presentIllness = GeneratedColumn<String>(
      'present_illness', aliasedName, true,
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
  static const VerificationMeta _cariesForFillingMeta =
      const VerificationMeta('cariesForFilling');
  @override
  late final GeneratedColumn<int> cariesForFilling = GeneratedColumn<int>(
      'caries_for_filling', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _cariesForExtractionMeta =
      const VerificationMeta('cariesForExtraction');
  @override
  late final GeneratedColumn<int> cariesForExtraction = GeneratedColumn<int>(
      'caries_for_extraction', aliasedName, false,
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
  static const VerificationMeta _clinicalNotesMeta =
      const VerificationMeta('clinicalNotes');
  @override
  late final GeneratedColumn<String> clinicalNotes = GeneratedColumn<String>(
      'clinical_notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        recordId,
        patientId,
        createdAt,
        pastIllness,
        presentIllness,
        allergies,
        currentMedication,
        hasOralDebris,
        hasCalculus,
        hasPeriodontalPocket,
        hasGingivitis,
        hasDentofacialAnomaly,
        cariesForFilling,
        cariesForExtraction,
        rootFragment,
        missingDueToCaries,
        filledOrRestored,
        clinicalNotes
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
    if (data.containsKey('record_id')) {
      context.handle(_recordIdMeta,
          recordId.isAcceptableOrUnknown(data['record_id']!, _recordIdMeta));
    }
    if (data.containsKey('patient_id')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta));
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('past_illness')) {
      context.handle(
          _pastIllnessMeta,
          pastIllness.isAcceptableOrUnknown(
              data['past_illness']!, _pastIllnessMeta));
    }
    if (data.containsKey('present_illness')) {
      context.handle(
          _presentIllnessMeta,
          presentIllness.isAcceptableOrUnknown(
              data['present_illness']!, _presentIllnessMeta));
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
    if (data.containsKey('has_periodontal_pocket')) {
      context.handle(
          _hasPeriodontalPocketMeta,
          hasPeriodontalPocket.isAcceptableOrUnknown(
              data['has_periodontal_pocket']!, _hasPeriodontalPocketMeta));
    }
    if (data.containsKey('has_gingivitis')) {
      context.handle(
          _hasGingivitisMeta,
          hasGingivitis.isAcceptableOrUnknown(
              data['has_gingivitis']!, _hasGingivitisMeta));
    }
    if (data.containsKey('has_dentofacial_anomaly')) {
      context.handle(
          _hasDentofacialAnomalyMeta,
          hasDentofacialAnomaly.isAcceptableOrUnknown(
              data['has_dentofacial_anomaly']!, _hasDentofacialAnomalyMeta));
    }
    if (data.containsKey('caries_for_filling')) {
      context.handle(
          _cariesForFillingMeta,
          cariesForFilling.isAcceptableOrUnknown(
              data['caries_for_filling']!, _cariesForFillingMeta));
    }
    if (data.containsKey('caries_for_extraction')) {
      context.handle(
          _cariesForExtractionMeta,
          cariesForExtraction.isAcceptableOrUnknown(
              data['caries_for_extraction']!, _cariesForExtractionMeta));
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
    if (data.containsKey('clinical_notes')) {
      context.handle(
          _clinicalNotesMeta,
          clinicalNotes.isAcceptableOrUnknown(
              data['clinical_notes']!, _clinicalNotesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {recordId};
  @override
  ClinicalRecordData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClinicalRecordData(
      recordId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}record_id'])!,
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}patient_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      pastIllness: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}past_illness']),
      presentIllness: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}present_illness']),
      allergies: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}allergies']),
      currentMedication: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}current_medication']),
      hasOralDebris: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_oral_debris'])!,
      hasCalculus: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_calculus'])!,
      hasPeriodontalPocket: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}has_periodontal_pocket'])!,
      hasGingivitis: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_gingivitis'])!,
      hasDentofacialAnomaly: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}has_dentofacial_anomaly'])!,
      cariesForFilling: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}caries_for_filling'])!,
      cariesForExtraction: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}caries_for_extraction'])!,
      rootFragment: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}root_fragment'])!,
      missingDueToCaries: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}missing_due_to_caries'])!,
      filledOrRestored: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}filled_or_restored'])!,
      clinicalNotes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}clinical_notes']),
    );
  }

  @override
  $ClinicalRecordTable createAlias(String alias) {
    return $ClinicalRecordTable(attachedDatabase, alias);
  }
}

class ClinicalRecordData extends DataClass
    implements Insertable<ClinicalRecordData> {
  final int recordId;
  final int patientId;
  final DateTime createdAt;
  final String? pastIllness;
  final String? presentIllness;
  final String? allergies;
  final String? currentMedication;
  final bool hasOralDebris;
  final bool hasCalculus;
  final bool hasPeriodontalPocket;
  final bool hasGingivitis;
  final bool hasDentofacialAnomaly;
  final int cariesForFilling;
  final int cariesForExtraction;
  final int rootFragment;
  final int missingDueToCaries;
  final int filledOrRestored;
  final String? clinicalNotes;
  const ClinicalRecordData(
      {required this.recordId,
      required this.patientId,
      required this.createdAt,
      this.pastIllness,
      this.presentIllness,
      this.allergies,
      this.currentMedication,
      required this.hasOralDebris,
      required this.hasCalculus,
      required this.hasPeriodontalPocket,
      required this.hasGingivitis,
      required this.hasDentofacialAnomaly,
      required this.cariesForFilling,
      required this.cariesForExtraction,
      required this.rootFragment,
      required this.missingDueToCaries,
      required this.filledOrRestored,
      this.clinicalNotes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['record_id'] = Variable<int>(recordId);
    map['patient_id'] = Variable<int>(patientId);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || pastIllness != null) {
      map['past_illness'] = Variable<String>(pastIllness);
    }
    if (!nullToAbsent || presentIllness != null) {
      map['present_illness'] = Variable<String>(presentIllness);
    }
    if (!nullToAbsent || allergies != null) {
      map['allergies'] = Variable<String>(allergies);
    }
    if (!nullToAbsent || currentMedication != null) {
      map['current_medication'] = Variable<String>(currentMedication);
    }
    map['has_oral_debris'] = Variable<bool>(hasOralDebris);
    map['has_calculus'] = Variable<bool>(hasCalculus);
    map['has_periodontal_pocket'] = Variable<bool>(hasPeriodontalPocket);
    map['has_gingivitis'] = Variable<bool>(hasGingivitis);
    map['has_dentofacial_anomaly'] = Variable<bool>(hasDentofacialAnomaly);
    map['caries_for_filling'] = Variable<int>(cariesForFilling);
    map['caries_for_extraction'] = Variable<int>(cariesForExtraction);
    map['root_fragment'] = Variable<int>(rootFragment);
    map['missing_due_to_caries'] = Variable<int>(missingDueToCaries);
    map['filled_or_restored'] = Variable<int>(filledOrRestored);
    if (!nullToAbsent || clinicalNotes != null) {
      map['clinical_notes'] = Variable<String>(clinicalNotes);
    }
    return map;
  }

  ClinicalRecordCompanion toCompanion(bool nullToAbsent) {
    return ClinicalRecordCompanion(
      recordId: Value(recordId),
      patientId: Value(patientId),
      createdAt: Value(createdAt),
      pastIllness: pastIllness == null && nullToAbsent
          ? const Value.absent()
          : Value(pastIllness),
      presentIllness: presentIllness == null && nullToAbsent
          ? const Value.absent()
          : Value(presentIllness),
      allergies: allergies == null && nullToAbsent
          ? const Value.absent()
          : Value(allergies),
      currentMedication: currentMedication == null && nullToAbsent
          ? const Value.absent()
          : Value(currentMedication),
      hasOralDebris: Value(hasOralDebris),
      hasCalculus: Value(hasCalculus),
      hasPeriodontalPocket: Value(hasPeriodontalPocket),
      hasGingivitis: Value(hasGingivitis),
      hasDentofacialAnomaly: Value(hasDentofacialAnomaly),
      cariesForFilling: Value(cariesForFilling),
      cariesForExtraction: Value(cariesForExtraction),
      rootFragment: Value(rootFragment),
      missingDueToCaries: Value(missingDueToCaries),
      filledOrRestored: Value(filledOrRestored),
      clinicalNotes: clinicalNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(clinicalNotes),
    );
  }

  factory ClinicalRecordData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClinicalRecordData(
      recordId: serializer.fromJson<int>(json['recordId']),
      patientId: serializer.fromJson<int>(json['patientId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      pastIllness: serializer.fromJson<String?>(json['pastIllness']),
      presentIllness: serializer.fromJson<String?>(json['presentIllness']),
      allergies: serializer.fromJson<String?>(json['allergies']),
      currentMedication:
          serializer.fromJson<String?>(json['currentMedication']),
      hasOralDebris: serializer.fromJson<bool>(json['hasOralDebris']),
      hasCalculus: serializer.fromJson<bool>(json['hasCalculus']),
      hasPeriodontalPocket:
          serializer.fromJson<bool>(json['hasPeriodontalPocket']),
      hasGingivitis: serializer.fromJson<bool>(json['hasGingivitis']),
      hasDentofacialAnomaly:
          serializer.fromJson<bool>(json['hasDentofacialAnomaly']),
      cariesForFilling: serializer.fromJson<int>(json['cariesForFilling']),
      cariesForExtraction:
          serializer.fromJson<int>(json['cariesForExtraction']),
      rootFragment: serializer.fromJson<int>(json['rootFragment']),
      missingDueToCaries: serializer.fromJson<int>(json['missingDueToCaries']),
      filledOrRestored: serializer.fromJson<int>(json['filledOrRestored']),
      clinicalNotes: serializer.fromJson<String?>(json['clinicalNotes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'recordId': serializer.toJson<int>(recordId),
      'patientId': serializer.toJson<int>(patientId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'pastIllness': serializer.toJson<String?>(pastIllness),
      'presentIllness': serializer.toJson<String?>(presentIllness),
      'allergies': serializer.toJson<String?>(allergies),
      'currentMedication': serializer.toJson<String?>(currentMedication),
      'hasOralDebris': serializer.toJson<bool>(hasOralDebris),
      'hasCalculus': serializer.toJson<bool>(hasCalculus),
      'hasPeriodontalPocket': serializer.toJson<bool>(hasPeriodontalPocket),
      'hasGingivitis': serializer.toJson<bool>(hasGingivitis),
      'hasDentofacialAnomaly': serializer.toJson<bool>(hasDentofacialAnomaly),
      'cariesForFilling': serializer.toJson<int>(cariesForFilling),
      'cariesForExtraction': serializer.toJson<int>(cariesForExtraction),
      'rootFragment': serializer.toJson<int>(rootFragment),
      'missingDueToCaries': serializer.toJson<int>(missingDueToCaries),
      'filledOrRestored': serializer.toJson<int>(filledOrRestored),
      'clinicalNotes': serializer.toJson<String?>(clinicalNotes),
    };
  }

  ClinicalRecordData copyWith(
          {int? recordId,
          int? patientId,
          DateTime? createdAt,
          Value<String?> pastIllness = const Value.absent(),
          Value<String?> presentIllness = const Value.absent(),
          Value<String?> allergies = const Value.absent(),
          Value<String?> currentMedication = const Value.absent(),
          bool? hasOralDebris,
          bool? hasCalculus,
          bool? hasPeriodontalPocket,
          bool? hasGingivitis,
          bool? hasDentofacialAnomaly,
          int? cariesForFilling,
          int? cariesForExtraction,
          int? rootFragment,
          int? missingDueToCaries,
          int? filledOrRestored,
          Value<String?> clinicalNotes = const Value.absent()}) =>
      ClinicalRecordData(
        recordId: recordId ?? this.recordId,
        patientId: patientId ?? this.patientId,
        createdAt: createdAt ?? this.createdAt,
        pastIllness: pastIllness.present ? pastIllness.value : this.pastIllness,
        presentIllness:
            presentIllness.present ? presentIllness.value : this.presentIllness,
        allergies: allergies.present ? allergies.value : this.allergies,
        currentMedication: currentMedication.present
            ? currentMedication.value
            : this.currentMedication,
        hasOralDebris: hasOralDebris ?? this.hasOralDebris,
        hasCalculus: hasCalculus ?? this.hasCalculus,
        hasPeriodontalPocket: hasPeriodontalPocket ?? this.hasPeriodontalPocket,
        hasGingivitis: hasGingivitis ?? this.hasGingivitis,
        hasDentofacialAnomaly:
            hasDentofacialAnomaly ?? this.hasDentofacialAnomaly,
        cariesForFilling: cariesForFilling ?? this.cariesForFilling,
        cariesForExtraction: cariesForExtraction ?? this.cariesForExtraction,
        rootFragment: rootFragment ?? this.rootFragment,
        missingDueToCaries: missingDueToCaries ?? this.missingDueToCaries,
        filledOrRestored: filledOrRestored ?? this.filledOrRestored,
        clinicalNotes:
            clinicalNotes.present ? clinicalNotes.value : this.clinicalNotes,
      );
  ClinicalRecordData copyWithCompanion(ClinicalRecordCompanion data) {
    return ClinicalRecordData(
      recordId: data.recordId.present ? data.recordId.value : this.recordId,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      pastIllness:
          data.pastIllness.present ? data.pastIllness.value : this.pastIllness,
      presentIllness: data.presentIllness.present
          ? data.presentIllness.value
          : this.presentIllness,
      allergies: data.allergies.present ? data.allergies.value : this.allergies,
      currentMedication: data.currentMedication.present
          ? data.currentMedication.value
          : this.currentMedication,
      hasOralDebris: data.hasOralDebris.present
          ? data.hasOralDebris.value
          : this.hasOralDebris,
      hasCalculus:
          data.hasCalculus.present ? data.hasCalculus.value : this.hasCalculus,
      hasPeriodontalPocket: data.hasPeriodontalPocket.present
          ? data.hasPeriodontalPocket.value
          : this.hasPeriodontalPocket,
      hasGingivitis: data.hasGingivitis.present
          ? data.hasGingivitis.value
          : this.hasGingivitis,
      hasDentofacialAnomaly: data.hasDentofacialAnomaly.present
          ? data.hasDentofacialAnomaly.value
          : this.hasDentofacialAnomaly,
      cariesForFilling: data.cariesForFilling.present
          ? data.cariesForFilling.value
          : this.cariesForFilling,
      cariesForExtraction: data.cariesForExtraction.present
          ? data.cariesForExtraction.value
          : this.cariesForExtraction,
      rootFragment: data.rootFragment.present
          ? data.rootFragment.value
          : this.rootFragment,
      missingDueToCaries: data.missingDueToCaries.present
          ? data.missingDueToCaries.value
          : this.missingDueToCaries,
      filledOrRestored: data.filledOrRestored.present
          ? data.filledOrRestored.value
          : this.filledOrRestored,
      clinicalNotes: data.clinicalNotes.present
          ? data.clinicalNotes.value
          : this.clinicalNotes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClinicalRecordData(')
          ..write('recordId: $recordId, ')
          ..write('patientId: $patientId, ')
          ..write('createdAt: $createdAt, ')
          ..write('pastIllness: $pastIllness, ')
          ..write('presentIllness: $presentIllness, ')
          ..write('allergies: $allergies, ')
          ..write('currentMedication: $currentMedication, ')
          ..write('hasOralDebris: $hasOralDebris, ')
          ..write('hasCalculus: $hasCalculus, ')
          ..write('hasPeriodontalPocket: $hasPeriodontalPocket, ')
          ..write('hasGingivitis: $hasGingivitis, ')
          ..write('hasDentofacialAnomaly: $hasDentofacialAnomaly, ')
          ..write('cariesForFilling: $cariesForFilling, ')
          ..write('cariesForExtraction: $cariesForExtraction, ')
          ..write('rootFragment: $rootFragment, ')
          ..write('missingDueToCaries: $missingDueToCaries, ')
          ..write('filledOrRestored: $filledOrRestored, ')
          ..write('clinicalNotes: $clinicalNotes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      recordId,
      patientId,
      createdAt,
      pastIllness,
      presentIllness,
      allergies,
      currentMedication,
      hasOralDebris,
      hasCalculus,
      hasPeriodontalPocket,
      hasGingivitis,
      hasDentofacialAnomaly,
      cariesForFilling,
      cariesForExtraction,
      rootFragment,
      missingDueToCaries,
      filledOrRestored,
      clinicalNotes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClinicalRecordData &&
          other.recordId == this.recordId &&
          other.patientId == this.patientId &&
          other.createdAt == this.createdAt &&
          other.pastIllness == this.pastIllness &&
          other.presentIllness == this.presentIllness &&
          other.allergies == this.allergies &&
          other.currentMedication == this.currentMedication &&
          other.hasOralDebris == this.hasOralDebris &&
          other.hasCalculus == this.hasCalculus &&
          other.hasPeriodontalPocket == this.hasPeriodontalPocket &&
          other.hasGingivitis == this.hasGingivitis &&
          other.hasDentofacialAnomaly == this.hasDentofacialAnomaly &&
          other.cariesForFilling == this.cariesForFilling &&
          other.cariesForExtraction == this.cariesForExtraction &&
          other.rootFragment == this.rootFragment &&
          other.missingDueToCaries == this.missingDueToCaries &&
          other.filledOrRestored == this.filledOrRestored &&
          other.clinicalNotes == this.clinicalNotes);
}

class ClinicalRecordCompanion extends UpdateCompanion<ClinicalRecordData> {
  final Value<int> recordId;
  final Value<int> patientId;
  final Value<DateTime> createdAt;
  final Value<String?> pastIllness;
  final Value<String?> presentIllness;
  final Value<String?> allergies;
  final Value<String?> currentMedication;
  final Value<bool> hasOralDebris;
  final Value<bool> hasCalculus;
  final Value<bool> hasPeriodontalPocket;
  final Value<bool> hasGingivitis;
  final Value<bool> hasDentofacialAnomaly;
  final Value<int> cariesForFilling;
  final Value<int> cariesForExtraction;
  final Value<int> rootFragment;
  final Value<int> missingDueToCaries;
  final Value<int> filledOrRestored;
  final Value<String?> clinicalNotes;
  const ClinicalRecordCompanion({
    this.recordId = const Value.absent(),
    this.patientId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.pastIllness = const Value.absent(),
    this.presentIllness = const Value.absent(),
    this.allergies = const Value.absent(),
    this.currentMedication = const Value.absent(),
    this.hasOralDebris = const Value.absent(),
    this.hasCalculus = const Value.absent(),
    this.hasPeriodontalPocket = const Value.absent(),
    this.hasGingivitis = const Value.absent(),
    this.hasDentofacialAnomaly = const Value.absent(),
    this.cariesForFilling = const Value.absent(),
    this.cariesForExtraction = const Value.absent(),
    this.rootFragment = const Value.absent(),
    this.missingDueToCaries = const Value.absent(),
    this.filledOrRestored = const Value.absent(),
    this.clinicalNotes = const Value.absent(),
  });
  ClinicalRecordCompanion.insert({
    this.recordId = const Value.absent(),
    required int patientId,
    this.createdAt = const Value.absent(),
    this.pastIllness = const Value.absent(),
    this.presentIllness = const Value.absent(),
    this.allergies = const Value.absent(),
    this.currentMedication = const Value.absent(),
    this.hasOralDebris = const Value.absent(),
    this.hasCalculus = const Value.absent(),
    this.hasPeriodontalPocket = const Value.absent(),
    this.hasGingivitis = const Value.absent(),
    this.hasDentofacialAnomaly = const Value.absent(),
    this.cariesForFilling = const Value.absent(),
    this.cariesForExtraction = const Value.absent(),
    this.rootFragment = const Value.absent(),
    this.missingDueToCaries = const Value.absent(),
    this.filledOrRestored = const Value.absent(),
    this.clinicalNotes = const Value.absent(),
  }) : patientId = Value(patientId);
  static Insertable<ClinicalRecordData> custom({
    Expression<int>? recordId,
    Expression<int>? patientId,
    Expression<DateTime>? createdAt,
    Expression<String>? pastIllness,
    Expression<String>? presentIllness,
    Expression<String>? allergies,
    Expression<String>? currentMedication,
    Expression<bool>? hasOralDebris,
    Expression<bool>? hasCalculus,
    Expression<bool>? hasPeriodontalPocket,
    Expression<bool>? hasGingivitis,
    Expression<bool>? hasDentofacialAnomaly,
    Expression<int>? cariesForFilling,
    Expression<int>? cariesForExtraction,
    Expression<int>? rootFragment,
    Expression<int>? missingDueToCaries,
    Expression<int>? filledOrRestored,
    Expression<String>? clinicalNotes,
  }) {
    return RawValuesInsertable({
      if (recordId != null) 'record_id': recordId,
      if (patientId != null) 'patient_id': patientId,
      if (createdAt != null) 'created_at': createdAt,
      if (pastIllness != null) 'past_illness': pastIllness,
      if (presentIllness != null) 'present_illness': presentIllness,
      if (allergies != null) 'allergies': allergies,
      if (currentMedication != null) 'current_medication': currentMedication,
      if (hasOralDebris != null) 'has_oral_debris': hasOralDebris,
      if (hasCalculus != null) 'has_calculus': hasCalculus,
      if (hasPeriodontalPocket != null)
        'has_periodontal_pocket': hasPeriodontalPocket,
      if (hasGingivitis != null) 'has_gingivitis': hasGingivitis,
      if (hasDentofacialAnomaly != null)
        'has_dentofacial_anomaly': hasDentofacialAnomaly,
      if (cariesForFilling != null) 'caries_for_filling': cariesForFilling,
      if (cariesForExtraction != null)
        'caries_for_extraction': cariesForExtraction,
      if (rootFragment != null) 'root_fragment': rootFragment,
      if (missingDueToCaries != null)
        'missing_due_to_caries': missingDueToCaries,
      if (filledOrRestored != null) 'filled_or_restored': filledOrRestored,
      if (clinicalNotes != null) 'clinical_notes': clinicalNotes,
    });
  }

  ClinicalRecordCompanion copyWith(
      {Value<int>? recordId,
      Value<int>? patientId,
      Value<DateTime>? createdAt,
      Value<String?>? pastIllness,
      Value<String?>? presentIllness,
      Value<String?>? allergies,
      Value<String?>? currentMedication,
      Value<bool>? hasOralDebris,
      Value<bool>? hasCalculus,
      Value<bool>? hasPeriodontalPocket,
      Value<bool>? hasGingivitis,
      Value<bool>? hasDentofacialAnomaly,
      Value<int>? cariesForFilling,
      Value<int>? cariesForExtraction,
      Value<int>? rootFragment,
      Value<int>? missingDueToCaries,
      Value<int>? filledOrRestored,
      Value<String?>? clinicalNotes}) {
    return ClinicalRecordCompanion(
      recordId: recordId ?? this.recordId,
      patientId: patientId ?? this.patientId,
      createdAt: createdAt ?? this.createdAt,
      pastIllness: pastIllness ?? this.pastIllness,
      presentIllness: presentIllness ?? this.presentIllness,
      allergies: allergies ?? this.allergies,
      currentMedication: currentMedication ?? this.currentMedication,
      hasOralDebris: hasOralDebris ?? this.hasOralDebris,
      hasCalculus: hasCalculus ?? this.hasCalculus,
      hasPeriodontalPocket: hasPeriodontalPocket ?? this.hasPeriodontalPocket,
      hasGingivitis: hasGingivitis ?? this.hasGingivitis,
      hasDentofacialAnomaly:
          hasDentofacialAnomaly ?? this.hasDentofacialAnomaly,
      cariesForFilling: cariesForFilling ?? this.cariesForFilling,
      cariesForExtraction: cariesForExtraction ?? this.cariesForExtraction,
      rootFragment: rootFragment ?? this.rootFragment,
      missingDueToCaries: missingDueToCaries ?? this.missingDueToCaries,
      filledOrRestored: filledOrRestored ?? this.filledOrRestored,
      clinicalNotes: clinicalNotes ?? this.clinicalNotes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (recordId.present) {
      map['record_id'] = Variable<int>(recordId.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<int>(patientId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (pastIllness.present) {
      map['past_illness'] = Variable<String>(pastIllness.value);
    }
    if (presentIllness.present) {
      map['present_illness'] = Variable<String>(presentIllness.value);
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
    if (hasPeriodontalPocket.present) {
      map['has_periodontal_pocket'] =
          Variable<bool>(hasPeriodontalPocket.value);
    }
    if (hasGingivitis.present) {
      map['has_gingivitis'] = Variable<bool>(hasGingivitis.value);
    }
    if (hasDentofacialAnomaly.present) {
      map['has_dentofacial_anomaly'] =
          Variable<bool>(hasDentofacialAnomaly.value);
    }
    if (cariesForFilling.present) {
      map['caries_for_filling'] = Variable<int>(cariesForFilling.value);
    }
    if (cariesForExtraction.present) {
      map['caries_for_extraction'] = Variable<int>(cariesForExtraction.value);
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
    if (clinicalNotes.present) {
      map['clinical_notes'] = Variable<String>(clinicalNotes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClinicalRecordCompanion(')
          ..write('recordId: $recordId, ')
          ..write('patientId: $patientId, ')
          ..write('createdAt: $createdAt, ')
          ..write('pastIllness: $pastIllness, ')
          ..write('presentIllness: $presentIllness, ')
          ..write('allergies: $allergies, ')
          ..write('currentMedication: $currentMedication, ')
          ..write('hasOralDebris: $hasOralDebris, ')
          ..write('hasCalculus: $hasCalculus, ')
          ..write('hasPeriodontalPocket: $hasPeriodontalPocket, ')
          ..write('hasGingivitis: $hasGingivitis, ')
          ..write('hasDentofacialAnomaly: $hasDentofacialAnomaly, ')
          ..write('cariesForFilling: $cariesForFilling, ')
          ..write('cariesForExtraction: $cariesForExtraction, ')
          ..write('rootFragment: $rootFragment, ')
          ..write('missingDueToCaries: $missingDueToCaries, ')
          ..write('filledOrRestored: $filledOrRestored, ')
          ..write('clinicalNotes: $clinicalNotes')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PatientTable patient = $PatientTable(this);
  late final $ClinicalStaffTable clinicalStaff = $ClinicalStaffTable(this);
  late final $AppointmentTable appointment = $AppointmentTable(this);
  late final $ProcedureChargeTable procedureCharge =
      $ProcedureChargeTable(this);
  late final $PaymentTransactionTable paymentTransaction =
      $PaymentTransactionTable(this);
  late final $InvoiceTable invoice = $InvoiceTable(this);
  late final $ClinicalRecordTable clinicalRecord = $ClinicalRecordTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        patient,
        clinicalStaff,
        appointment,
        procedureCharge,
        paymentTransaction,
        invoice,
        clinicalRecord
      ];
}

typedef $$PatientTableCreateCompanionBuilder = PatientCompanion Function({
  Value<int> patientId,
  required String firstName,
  Value<String?> middleName,
  required String lastName,
  Value<String?> suffix,
  required DateTime birthDate,
  required String sex,
  required String civilStatus,
  required String contactNumber,
  Value<String?> emergencyContactNo,
  Value<String?> referredBy,
  Value<String?> relationship,
  Value<String?> relationshipEmergency,
  required String streetAddress,
  required String barangay,
  required String cityMunicipality,
  required String province,
  required String zipCode,
  Value<bool> isArchived,
  Value<bool> isSeniorOrPWD,
  required DateTime createdAt,
  required DateTime updatedAt,
});
typedef $$PatientTableUpdateCompanionBuilder = PatientCompanion Function({
  Value<int> patientId,
  Value<String> firstName,
  Value<String?> middleName,
  Value<String> lastName,
  Value<String?> suffix,
  Value<DateTime> birthDate,
  Value<String> sex,
  Value<String> civilStatus,
  Value<String> contactNumber,
  Value<String?> emergencyContactNo,
  Value<String?> referredBy,
  Value<String?> relationship,
  Value<String?> relationshipEmergency,
  Value<String> streetAddress,
  Value<String> barangay,
  Value<String> cityMunicipality,
  Value<String> province,
  Value<String> zipCode,
  Value<bool> isArchived,
  Value<bool> isSeniorOrPWD,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$PatientTableReferences
    extends BaseReferences<_$AppDatabase, $PatientTable, PatientData> {
  $$PatientTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AppointmentTable, List<AppointmentData>>
      _appointmentRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.appointment,
              aliasName: $_aliasNameGenerator(
                  db.patient.patientId, db.appointment.patientId));

  $$AppointmentTableProcessedTableManager get appointmentRefs {
    final manager = $$AppointmentTableTableManager($_db, $_db.appointment)
        .filter((f) =>
            f.patientId.patientId.sqlEquals($_itemColumn<int>('patient_id')!));

    final cache = $_typedResult.readTableOrNull(_appointmentRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$InvoiceTable, List<InvoiceData>>
      _invoiceRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.invoice,
          aliasName:
              $_aliasNameGenerator(db.patient.patientId, db.invoice.patientId));

  $$InvoiceTableProcessedTableManager get invoiceRefs {
    final manager = $$InvoiceTableTableManager($_db, $_db.invoice).filter((f) =>
        f.patientId.patientId.sqlEquals($_itemColumn<int>('patient_id')!));

    final cache = $_typedResult.readTableOrNull(_invoiceRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ClinicalRecordTable, List<ClinicalRecordData>>
      _clinicalRecordRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.clinicalRecord,
              aliasName: $_aliasNameGenerator(
                  db.patient.patientId, db.clinicalRecord.patientId));

  $$ClinicalRecordTableProcessedTableManager get clinicalRecordRefs {
    final manager = $$ClinicalRecordTableTableManager($_db, $_db.clinicalRecord)
        .filter((f) =>
            f.patientId.patientId.sqlEquals($_itemColumn<int>('patient_id')!));

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
  ColumnFilters<int> get patientId => $composableBuilder(
      column: $table.patientId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get middleName => $composableBuilder(
      column: $table.middleName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get suffix => $composableBuilder(
      column: $table.suffix, builder: (column) => ColumnFilters(column));

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

  ColumnFilters<String> get relationshipEmergency => $composableBuilder(
      column: $table.relationshipEmergency,
      builder: (column) => ColumnFilters(column));

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

  ColumnFilters<bool> get isSeniorOrPWD => $composableBuilder(
      column: $table.isSeniorOrPWD, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> appointmentRefs(
      Expression<bool> Function($$AppointmentTableFilterComposer f) f) {
    final $$AppointmentTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
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

  Expression<bool> invoiceRefs(
      Expression<bool> Function($$InvoiceTableFilterComposer f) f) {
    final $$InvoiceTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.invoice,
        getReferencedColumn: (t) => t.patientId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$InvoiceTableFilterComposer(
              $db: $db,
              $table: $db.invoice,
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
        getCurrentColumn: (t) => t.patientId,
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
  ColumnOrderings<int> get patientId => $composableBuilder(
      column: $table.patientId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get middleName => $composableBuilder(
      column: $table.middleName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get suffix => $composableBuilder(
      column: $table.suffix, builder: (column) => ColumnOrderings(column));

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

  ColumnOrderings<String> get relationshipEmergency => $composableBuilder(
      column: $table.relationshipEmergency,
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

  ColumnOrderings<bool> get isSeniorOrPWD => $composableBuilder(
      column: $table.isSeniorOrPWD,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
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
  GeneratedColumn<int> get patientId =>
      $composableBuilder(column: $table.patientId, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get middleName => $composableBuilder(
      column: $table.middleName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get suffix =>
      $composableBuilder(column: $table.suffix, builder: (column) => column);

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

  GeneratedColumn<String> get relationshipEmergency => $composableBuilder(
      column: $table.relationshipEmergency, builder: (column) => column);

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

  GeneratedColumn<bool> get isSeniorOrPWD => $composableBuilder(
      column: $table.isSeniorOrPWD, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> appointmentRefs<T extends Object>(
      Expression<T> Function($$AppointmentTableAnnotationComposer a) f) {
    final $$AppointmentTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
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

  Expression<T> invoiceRefs<T extends Object>(
      Expression<T> Function($$InvoiceTableAnnotationComposer a) f) {
    final $$InvoiceTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.invoice,
        getReferencedColumn: (t) => t.patientId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$InvoiceTableAnnotationComposer(
              $db: $db,
              $table: $db.invoice,
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
        getCurrentColumn: (t) => t.patientId,
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
        {bool appointmentRefs, bool invoiceRefs, bool clinicalRecordRefs})> {
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
            Value<int> patientId = const Value.absent(),
            Value<String> firstName = const Value.absent(),
            Value<String?> middleName = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<String?> suffix = const Value.absent(),
            Value<DateTime> birthDate = const Value.absent(),
            Value<String> sex = const Value.absent(),
            Value<String> civilStatus = const Value.absent(),
            Value<String> contactNumber = const Value.absent(),
            Value<String?> emergencyContactNo = const Value.absent(),
            Value<String?> referredBy = const Value.absent(),
            Value<String?> relationship = const Value.absent(),
            Value<String?> relationshipEmergency = const Value.absent(),
            Value<String> streetAddress = const Value.absent(),
            Value<String> barangay = const Value.absent(),
            Value<String> cityMunicipality = const Value.absent(),
            Value<String> province = const Value.absent(),
            Value<String> zipCode = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
            Value<bool> isSeniorOrPWD = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              PatientCompanion(
            patientId: patientId,
            firstName: firstName,
            middleName: middleName,
            lastName: lastName,
            suffix: suffix,
            birthDate: birthDate,
            sex: sex,
            civilStatus: civilStatus,
            contactNumber: contactNumber,
            emergencyContactNo: emergencyContactNo,
            referredBy: referredBy,
            relationship: relationship,
            relationshipEmergency: relationshipEmergency,
            streetAddress: streetAddress,
            barangay: barangay,
            cityMunicipality: cityMunicipality,
            province: province,
            zipCode: zipCode,
            isArchived: isArchived,
            isSeniorOrPWD: isSeniorOrPWD,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> patientId = const Value.absent(),
            required String firstName,
            Value<String?> middleName = const Value.absent(),
            required String lastName,
            Value<String?> suffix = const Value.absent(),
            required DateTime birthDate,
            required String sex,
            required String civilStatus,
            required String contactNumber,
            Value<String?> emergencyContactNo = const Value.absent(),
            Value<String?> referredBy = const Value.absent(),
            Value<String?> relationship = const Value.absent(),
            Value<String?> relationshipEmergency = const Value.absent(),
            required String streetAddress,
            required String barangay,
            required String cityMunicipality,
            required String province,
            required String zipCode,
            Value<bool> isArchived = const Value.absent(),
            Value<bool> isSeniorOrPWD = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
          }) =>
              PatientCompanion.insert(
            patientId: patientId,
            firstName: firstName,
            middleName: middleName,
            lastName: lastName,
            suffix: suffix,
            birthDate: birthDate,
            sex: sex,
            civilStatus: civilStatus,
            contactNumber: contactNumber,
            emergencyContactNo: emergencyContactNo,
            referredBy: referredBy,
            relationship: relationship,
            relationshipEmergency: relationshipEmergency,
            streetAddress: streetAddress,
            barangay: barangay,
            cityMunicipality: cityMunicipality,
            province: province,
            zipCode: zipCode,
            isArchived: isArchived,
            isSeniorOrPWD: isSeniorOrPWD,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$PatientTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {appointmentRefs = false,
              invoiceRefs = false,
              clinicalRecordRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (appointmentRefs) db.appointment,
                if (invoiceRefs) db.invoice,
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
                                .where((e) => e.patientId == item.patientId),
                        typedResults: items),
                  if (invoiceRefs)
                    await $_getPrefetchedData<PatientData, $PatientTable,
                            InvoiceData>(
                        currentTable: table,
                        referencedTable:
                            $$PatientTableReferences._invoiceRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PatientTableReferences(db, table, p0).invoiceRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.patientId == item.patientId),
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
                                .where((e) => e.patientId == item.patientId),
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
        {bool appointmentRefs, bool invoiceRefs, bool clinicalRecordRefs})>;
typedef $$ClinicalStaffTableCreateCompanionBuilder = ClinicalStaffCompanion
    Function({
  required int staffId,
  required String name,
  Value<bool> isLockedOut,
  Value<int> rowid,
});
typedef $$ClinicalStaffTableUpdateCompanionBuilder = ClinicalStaffCompanion
    Function({
  Value<int> staffId,
  Value<String> name,
  Value<bool> isLockedOut,
  Value<int> rowid,
});

final class $$ClinicalStaffTableReferences extends BaseReferences<_$AppDatabase,
    $ClinicalStaffTable, ClinicalStaffData> {
  $$ClinicalStaffTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AppointmentTable, List<AppointmentData>>
      _appointmentRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.appointment,
              aliasName: $_aliasNameGenerator(
                  db.clinicalStaff.staffId, db.appointment.staffId));

  $$AppointmentTableProcessedTableManager get appointmentRefs {
    final manager = $$AppointmentTableTableManager($_db, $_db.appointment)
        .filter(
            (f) => f.staffId.staffId.sqlEquals($_itemColumn<int>('staff_id')!));

    final cache = $_typedResult.readTableOrNull(_appointmentRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ClinicalStaffTableFilterComposer
    extends Composer<_$AppDatabase, $ClinicalStaffTable> {
  $$ClinicalStaffTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get staffId => $composableBuilder(
      column: $table.staffId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isLockedOut => $composableBuilder(
      column: $table.isLockedOut, builder: (column) => ColumnFilters(column));

  Expression<bool> appointmentRefs(
      Expression<bool> Function($$AppointmentTableFilterComposer f) f) {
    final $$AppointmentTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.staffId,
        referencedTable: $db.appointment,
        getReferencedColumn: (t) => t.staffId,
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
}

class $$ClinicalStaffTableOrderingComposer
    extends Composer<_$AppDatabase, $ClinicalStaffTable> {
  $$ClinicalStaffTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get staffId => $composableBuilder(
      column: $table.staffId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isLockedOut => $composableBuilder(
      column: $table.isLockedOut, builder: (column) => ColumnOrderings(column));
}

class $$ClinicalStaffTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClinicalStaffTable> {
  $$ClinicalStaffTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get staffId =>
      $composableBuilder(column: $table.staffId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isLockedOut => $composableBuilder(
      column: $table.isLockedOut, builder: (column) => column);

  Expression<T> appointmentRefs<T extends Object>(
      Expression<T> Function($$AppointmentTableAnnotationComposer a) f) {
    final $$AppointmentTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.staffId,
        referencedTable: $db.appointment,
        getReferencedColumn: (t) => t.staffId,
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
}

class $$ClinicalStaffTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ClinicalStaffTable,
    ClinicalStaffData,
    $$ClinicalStaffTableFilterComposer,
    $$ClinicalStaffTableOrderingComposer,
    $$ClinicalStaffTableAnnotationComposer,
    $$ClinicalStaffTableCreateCompanionBuilder,
    $$ClinicalStaffTableUpdateCompanionBuilder,
    (ClinicalStaffData, $$ClinicalStaffTableReferences),
    ClinicalStaffData,
    PrefetchHooks Function({bool appointmentRefs})> {
  $$ClinicalStaffTableTableManager(_$AppDatabase db, $ClinicalStaffTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClinicalStaffTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClinicalStaffTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClinicalStaffTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> staffId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<bool> isLockedOut = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ClinicalStaffCompanion(
            staffId: staffId,
            name: name,
            isLockedOut: isLockedOut,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int staffId,
            required String name,
            Value<bool> isLockedOut = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ClinicalStaffCompanion.insert(
            staffId: staffId,
            name: name,
            isLockedOut: isLockedOut,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ClinicalStaffTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({appointmentRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (appointmentRefs) db.appointment],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (appointmentRefs)
                    await $_getPrefetchedData<ClinicalStaffData,
                            $ClinicalStaffTable, AppointmentData>(
                        currentTable: table,
                        referencedTable: $$ClinicalStaffTableReferences
                            ._appointmentRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ClinicalStaffTableReferences(db, table, p0)
                                .appointmentRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.staffId == item.staffId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ClinicalStaffTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ClinicalStaffTable,
    ClinicalStaffData,
    $$ClinicalStaffTableFilterComposer,
    $$ClinicalStaffTableOrderingComposer,
    $$ClinicalStaffTableAnnotationComposer,
    $$ClinicalStaffTableCreateCompanionBuilder,
    $$ClinicalStaffTableUpdateCompanionBuilder,
    (ClinicalStaffData, $$ClinicalStaffTableReferences),
    ClinicalStaffData,
    PrefetchHooks Function({bool appointmentRefs})>;
typedef $$AppointmentTableCreateCompanionBuilder = AppointmentCompanion
    Function({
  Value<int> appointmentId,
  required int patientId,
  Value<int?> staffId,
  required DateTime scheduleDateTime,
  required String reasonForVisit,
  Value<String> status,
  required String timeSlot,
});
typedef $$AppointmentTableUpdateCompanionBuilder = AppointmentCompanion
    Function({
  Value<int> appointmentId,
  Value<int> patientId,
  Value<int?> staffId,
  Value<DateTime> scheduleDateTime,
  Value<String> reasonForVisit,
  Value<String> status,
  Value<String> timeSlot,
});

final class $$AppointmentTableReferences
    extends BaseReferences<_$AppDatabase, $AppointmentTable, AppointmentData> {
  $$AppointmentTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PatientTable _patientIdTable(_$AppDatabase db) =>
      db.patient.createAlias(
          $_aliasNameGenerator(db.appointment.patientId, db.patient.patientId));

  $$PatientTableProcessedTableManager get patientId {
    final $_column = $_itemColumn<int>('patient_id')!;

    final manager = $$PatientTableTableManager($_db, $_db.patient)
        .filter((f) => f.patientId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_patientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ClinicalStaffTable _staffIdTable(_$AppDatabase db) =>
      db.clinicalStaff.createAlias($_aliasNameGenerator(
          db.appointment.staffId, db.clinicalStaff.staffId));

  $$ClinicalStaffTableProcessedTableManager? get staffId {
    final $_column = $_itemColumn<int>('staff_id');
    if ($_column == null) return null;
    final manager = $$ClinicalStaffTableTableManager($_db, $_db.clinicalStaff)
        .filter((f) => f.staffId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_staffIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
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
  ColumnFilters<int> get appointmentId => $composableBuilder(
      column: $table.appointmentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get scheduleDateTime => $composableBuilder(
      column: $table.scheduleDateTime,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reasonForVisit => $composableBuilder(
      column: $table.reasonForVisit,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get timeSlot => $composableBuilder(
      column: $table.timeSlot, builder: (column) => ColumnFilters(column));

  $$PatientTableFilterComposer get patientId {
    final $$PatientTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patient,
        getReferencedColumn: (t) => t.patientId,
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

  $$ClinicalStaffTableFilterComposer get staffId {
    final $$ClinicalStaffTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.staffId,
        referencedTable: $db.clinicalStaff,
        getReferencedColumn: (t) => t.staffId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ClinicalStaffTableFilterComposer(
              $db: $db,
              $table: $db.clinicalStaff,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
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
  ColumnOrderings<int> get appointmentId => $composableBuilder(
      column: $table.appointmentId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get scheduleDateTime => $composableBuilder(
      column: $table.scheduleDateTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reasonForVisit => $composableBuilder(
      column: $table.reasonForVisit,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get timeSlot => $composableBuilder(
      column: $table.timeSlot, builder: (column) => ColumnOrderings(column));

  $$PatientTableOrderingComposer get patientId {
    final $$PatientTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patient,
        getReferencedColumn: (t) => t.patientId,
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

  $$ClinicalStaffTableOrderingComposer get staffId {
    final $$ClinicalStaffTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.staffId,
        referencedTable: $db.clinicalStaff,
        getReferencedColumn: (t) => t.staffId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ClinicalStaffTableOrderingComposer(
              $db: $db,
              $table: $db.clinicalStaff,
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
  GeneratedColumn<int> get appointmentId => $composableBuilder(
      column: $table.appointmentId, builder: (column) => column);

  GeneratedColumn<DateTime> get scheduleDateTime => $composableBuilder(
      column: $table.scheduleDateTime, builder: (column) => column);

  GeneratedColumn<String> get reasonForVisit => $composableBuilder(
      column: $table.reasonForVisit, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get timeSlot =>
      $composableBuilder(column: $table.timeSlot, builder: (column) => column);

  $$PatientTableAnnotationComposer get patientId {
    final $$PatientTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patient,
        getReferencedColumn: (t) => t.patientId,
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

  $$ClinicalStaffTableAnnotationComposer get staffId {
    final $$ClinicalStaffTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.staffId,
        referencedTable: $db.clinicalStaff,
        getReferencedColumn: (t) => t.staffId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ClinicalStaffTableAnnotationComposer(
              $db: $db,
              $table: $db.clinicalStaff,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
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
    PrefetchHooks Function({bool patientId, bool staffId})> {
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
            Value<int> appointmentId = const Value.absent(),
            Value<int> patientId = const Value.absent(),
            Value<int?> staffId = const Value.absent(),
            Value<DateTime> scheduleDateTime = const Value.absent(),
            Value<String> reasonForVisit = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> timeSlot = const Value.absent(),
          }) =>
              AppointmentCompanion(
            appointmentId: appointmentId,
            patientId: patientId,
            staffId: staffId,
            scheduleDateTime: scheduleDateTime,
            reasonForVisit: reasonForVisit,
            status: status,
            timeSlot: timeSlot,
          ),
          createCompanionCallback: ({
            Value<int> appointmentId = const Value.absent(),
            required int patientId,
            Value<int?> staffId = const Value.absent(),
            required DateTime scheduleDateTime,
            required String reasonForVisit,
            Value<String> status = const Value.absent(),
            required String timeSlot,
          }) =>
              AppointmentCompanion.insert(
            appointmentId: appointmentId,
            patientId: patientId,
            staffId: staffId,
            scheduleDateTime: scheduleDateTime,
            reasonForVisit: reasonForVisit,
            status: status,
            timeSlot: timeSlot,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AppointmentTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({patientId = false, staffId = false}) {
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
                        $$AppointmentTableReferences._patientIdTable(db),
                    referencedColumn: $$AppointmentTableReferences
                        ._patientIdTable(db)
                        .patientId,
                  ) as T;
                }
                if (staffId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.staffId,
                    referencedTable:
                        $$AppointmentTableReferences._staffIdTable(db),
                    referencedColumn:
                        $$AppointmentTableReferences._staffIdTable(db).staffId,
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
    PrefetchHooks Function({bool patientId, bool staffId})>;
typedef $$ProcedureChargeTableCreateCompanionBuilder = ProcedureChargeCompanion
    Function({
  Value<int> chargeId,
  required String procedureName,
  required double procedureCharge,
  Value<int> quantity,
  required double totalProcedureCharge,
});
typedef $$ProcedureChargeTableUpdateCompanionBuilder = ProcedureChargeCompanion
    Function({
  Value<int> chargeId,
  Value<String> procedureName,
  Value<double> procedureCharge,
  Value<int> quantity,
  Value<double> totalProcedureCharge,
});

final class $$ProcedureChargeTableReferences extends BaseReferences<
    _$AppDatabase, $ProcedureChargeTable, ProcedureChargeData> {
  $$ProcedureChargeTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$InvoiceTable, List<InvoiceData>>
      _invoiceRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.invoice,
              aliasName: $_aliasNameGenerator(
                  db.procedureCharge.chargeId, db.invoice.chargeId));

  $$InvoiceTableProcessedTableManager get invoiceRefs {
    final manager = $$InvoiceTableTableManager($_db, $_db.invoice).filter(
        (f) => f.chargeId.chargeId.sqlEquals($_itemColumn<int>('charge_id')!));

    final cache = $_typedResult.readTableOrNull(_invoiceRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ProcedureChargeTableFilterComposer
    extends Composer<_$AppDatabase, $ProcedureChargeTable> {
  $$ProcedureChargeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get chargeId => $composableBuilder(
      column: $table.chargeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get procedureName => $composableBuilder(
      column: $table.procedureName, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get procedureCharge => $composableBuilder(
      column: $table.procedureCharge,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalProcedureCharge => $composableBuilder(
      column: $table.totalProcedureCharge,
      builder: (column) => ColumnFilters(column));

  Expression<bool> invoiceRefs(
      Expression<bool> Function($$InvoiceTableFilterComposer f) f) {
    final $$InvoiceTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.chargeId,
        referencedTable: $db.invoice,
        getReferencedColumn: (t) => t.chargeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$InvoiceTableFilterComposer(
              $db: $db,
              $table: $db.invoice,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProcedureChargeTableOrderingComposer
    extends Composer<_$AppDatabase, $ProcedureChargeTable> {
  $$ProcedureChargeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get chargeId => $composableBuilder(
      column: $table.chargeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get procedureName => $composableBuilder(
      column: $table.procedureName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get procedureCharge => $composableBuilder(
      column: $table.procedureCharge,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalProcedureCharge => $composableBuilder(
      column: $table.totalProcedureCharge,
      builder: (column) => ColumnOrderings(column));
}

class $$ProcedureChargeTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProcedureChargeTable> {
  $$ProcedureChargeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get chargeId =>
      $composableBuilder(column: $table.chargeId, builder: (column) => column);

  GeneratedColumn<String> get procedureName => $composableBuilder(
      column: $table.procedureName, builder: (column) => column);

  GeneratedColumn<double> get procedureCharge => $composableBuilder(
      column: $table.procedureCharge, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get totalProcedureCharge => $composableBuilder(
      column: $table.totalProcedureCharge, builder: (column) => column);

  Expression<T> invoiceRefs<T extends Object>(
      Expression<T> Function($$InvoiceTableAnnotationComposer a) f) {
    final $$InvoiceTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.chargeId,
        referencedTable: $db.invoice,
        getReferencedColumn: (t) => t.chargeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$InvoiceTableAnnotationComposer(
              $db: $db,
              $table: $db.invoice,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProcedureChargeTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProcedureChargeTable,
    ProcedureChargeData,
    $$ProcedureChargeTableFilterComposer,
    $$ProcedureChargeTableOrderingComposer,
    $$ProcedureChargeTableAnnotationComposer,
    $$ProcedureChargeTableCreateCompanionBuilder,
    $$ProcedureChargeTableUpdateCompanionBuilder,
    (ProcedureChargeData, $$ProcedureChargeTableReferences),
    ProcedureChargeData,
    PrefetchHooks Function({bool invoiceRefs})> {
  $$ProcedureChargeTableTableManager(
      _$AppDatabase db, $ProcedureChargeTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProcedureChargeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProcedureChargeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProcedureChargeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> chargeId = const Value.absent(),
            Value<String> procedureName = const Value.absent(),
            Value<double> procedureCharge = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<double> totalProcedureCharge = const Value.absent(),
          }) =>
              ProcedureChargeCompanion(
            chargeId: chargeId,
            procedureName: procedureName,
            procedureCharge: procedureCharge,
            quantity: quantity,
            totalProcedureCharge: totalProcedureCharge,
          ),
          createCompanionCallback: ({
            Value<int> chargeId = const Value.absent(),
            required String procedureName,
            required double procedureCharge,
            Value<int> quantity = const Value.absent(),
            required double totalProcedureCharge,
          }) =>
              ProcedureChargeCompanion.insert(
            chargeId: chargeId,
            procedureName: procedureName,
            procedureCharge: procedureCharge,
            quantity: quantity,
            totalProcedureCharge: totalProcedureCharge,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ProcedureChargeTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({invoiceRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (invoiceRefs) db.invoice],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (invoiceRefs)
                    await $_getPrefetchedData<ProcedureChargeData,
                            $ProcedureChargeTable, InvoiceData>(
                        currentTable: table,
                        referencedTable: $$ProcedureChargeTableReferences
                            ._invoiceRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProcedureChargeTableReferences(db, table, p0)
                                .invoiceRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.chargeId == item.chargeId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ProcedureChargeTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProcedureChargeTable,
    ProcedureChargeData,
    $$ProcedureChargeTableFilterComposer,
    $$ProcedureChargeTableOrderingComposer,
    $$ProcedureChargeTableAnnotationComposer,
    $$ProcedureChargeTableCreateCompanionBuilder,
    $$ProcedureChargeTableUpdateCompanionBuilder,
    (ProcedureChargeData, $$ProcedureChargeTableReferences),
    ProcedureChargeData,
    PrefetchHooks Function({bool invoiceRefs})>;
typedef $$PaymentTransactionTableCreateCompanionBuilder
    = PaymentTransactionCompanion Function({
  Value<int> transactionId,
  required double amountReceived,
  required String modeOfPayment,
  Value<DateTime> paymentDate,
});
typedef $$PaymentTransactionTableUpdateCompanionBuilder
    = PaymentTransactionCompanion Function({
  Value<int> transactionId,
  Value<double> amountReceived,
  Value<String> modeOfPayment,
  Value<DateTime> paymentDate,
});

final class $$PaymentTransactionTableReferences extends BaseReferences<
    _$AppDatabase, $PaymentTransactionTable, PaymentTransactionData> {
  $$PaymentTransactionTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$InvoiceTable, List<InvoiceData>>
      _invoiceRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.invoice,
          aliasName: $_aliasNameGenerator(
              db.paymentTransaction.transactionId, db.invoice.transactionId));

  $$InvoiceTableProcessedTableManager get invoiceRefs {
    final manager = $$InvoiceTableTableManager($_db, $_db.invoice).filter((f) =>
        f.transactionId.transactionId
            .sqlEquals($_itemColumn<int>('transaction_id')!));

    final cache = $_typedResult.readTableOrNull(_invoiceRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PaymentTransactionTableFilterComposer
    extends Composer<_$AppDatabase, $PaymentTransactionTable> {
  $$PaymentTransactionTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get transactionId => $composableBuilder(
      column: $table.transactionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amountReceived => $composableBuilder(
      column: $table.amountReceived,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get modeOfPayment => $composableBuilder(
      column: $table.modeOfPayment, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => ColumnFilters(column));

  Expression<bool> invoiceRefs(
      Expression<bool> Function($$InvoiceTableFilterComposer f) f) {
    final $$InvoiceTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.transactionId,
        referencedTable: $db.invoice,
        getReferencedColumn: (t) => t.transactionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$InvoiceTableFilterComposer(
              $db: $db,
              $table: $db.invoice,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PaymentTransactionTableOrderingComposer
    extends Composer<_$AppDatabase, $PaymentTransactionTable> {
  $$PaymentTransactionTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get transactionId => $composableBuilder(
      column: $table.transactionId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amountReceived => $composableBuilder(
      column: $table.amountReceived,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get modeOfPayment => $composableBuilder(
      column: $table.modeOfPayment,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => ColumnOrderings(column));
}

class $$PaymentTransactionTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaymentTransactionTable> {
  $$PaymentTransactionTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get transactionId => $composableBuilder(
      column: $table.transactionId, builder: (column) => column);

  GeneratedColumn<double> get amountReceived => $composableBuilder(
      column: $table.amountReceived, builder: (column) => column);

  GeneratedColumn<String> get modeOfPayment => $composableBuilder(
      column: $table.modeOfPayment, builder: (column) => column);

  GeneratedColumn<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => column);

  Expression<T> invoiceRefs<T extends Object>(
      Expression<T> Function($$InvoiceTableAnnotationComposer a) f) {
    final $$InvoiceTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.transactionId,
        referencedTable: $db.invoice,
        getReferencedColumn: (t) => t.transactionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$InvoiceTableAnnotationComposer(
              $db: $db,
              $table: $db.invoice,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PaymentTransactionTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PaymentTransactionTable,
    PaymentTransactionData,
    $$PaymentTransactionTableFilterComposer,
    $$PaymentTransactionTableOrderingComposer,
    $$PaymentTransactionTableAnnotationComposer,
    $$PaymentTransactionTableCreateCompanionBuilder,
    $$PaymentTransactionTableUpdateCompanionBuilder,
    (PaymentTransactionData, $$PaymentTransactionTableReferences),
    PaymentTransactionData,
    PrefetchHooks Function({bool invoiceRefs})> {
  $$PaymentTransactionTableTableManager(
      _$AppDatabase db, $PaymentTransactionTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentTransactionTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentTransactionTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentTransactionTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> transactionId = const Value.absent(),
            Value<double> amountReceived = const Value.absent(),
            Value<String> modeOfPayment = const Value.absent(),
            Value<DateTime> paymentDate = const Value.absent(),
          }) =>
              PaymentTransactionCompanion(
            transactionId: transactionId,
            amountReceived: amountReceived,
            modeOfPayment: modeOfPayment,
            paymentDate: paymentDate,
          ),
          createCompanionCallback: ({
            Value<int> transactionId = const Value.absent(),
            required double amountReceived,
            required String modeOfPayment,
            Value<DateTime> paymentDate = const Value.absent(),
          }) =>
              PaymentTransactionCompanion.insert(
            transactionId: transactionId,
            amountReceived: amountReceived,
            modeOfPayment: modeOfPayment,
            paymentDate: paymentDate,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PaymentTransactionTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({invoiceRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (invoiceRefs) db.invoice],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (invoiceRefs)
                    await $_getPrefetchedData<PaymentTransactionData,
                            $PaymentTransactionTable, InvoiceData>(
                        currentTable: table,
                        referencedTable: $$PaymentTransactionTableReferences
                            ._invoiceRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PaymentTransactionTableReferences(db, table, p0)
                                .invoiceRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.transactionId == item.transactionId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PaymentTransactionTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PaymentTransactionTable,
    PaymentTransactionData,
    $$PaymentTransactionTableFilterComposer,
    $$PaymentTransactionTableOrderingComposer,
    $$PaymentTransactionTableAnnotationComposer,
    $$PaymentTransactionTableCreateCompanionBuilder,
    $$PaymentTransactionTableUpdateCompanionBuilder,
    (PaymentTransactionData, $$PaymentTransactionTableReferences),
    PaymentTransactionData,
    PrefetchHooks Function({bool invoiceRefs})>;
typedef $$InvoiceTableCreateCompanionBuilder = InvoiceCompanion Function({
  Value<int> invoiceId,
  required int patientId,
  required int chargeId,
  required int transactionId,
  Value<DateTime> issuedDate,
  required double totalBalance,
  required String status,
});
typedef $$InvoiceTableUpdateCompanionBuilder = InvoiceCompanion Function({
  Value<int> invoiceId,
  Value<int> patientId,
  Value<int> chargeId,
  Value<int> transactionId,
  Value<DateTime> issuedDate,
  Value<double> totalBalance,
  Value<String> status,
});

final class $$InvoiceTableReferences
    extends BaseReferences<_$AppDatabase, $InvoiceTable, InvoiceData> {
  $$InvoiceTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PatientTable _patientIdTable(_$AppDatabase db) =>
      db.patient.createAlias(
          $_aliasNameGenerator(db.invoice.patientId, db.patient.patientId));

  $$PatientTableProcessedTableManager get patientId {
    final $_column = $_itemColumn<int>('patient_id')!;

    final manager = $$PatientTableTableManager($_db, $_db.patient)
        .filter((f) => f.patientId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_patientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ProcedureChargeTable _chargeIdTable(_$AppDatabase db) =>
      db.procedureCharge.createAlias($_aliasNameGenerator(
          db.invoice.chargeId, db.procedureCharge.chargeId));

  $$ProcedureChargeTableProcessedTableManager get chargeId {
    final $_column = $_itemColumn<int>('charge_id')!;

    final manager =
        $$ProcedureChargeTableTableManager($_db, $_db.procedureCharge)
            .filter((f) => f.chargeId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_chargeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PaymentTransactionTable _transactionIdTable(_$AppDatabase db) =>
      db.paymentTransaction.createAlias($_aliasNameGenerator(
          db.invoice.transactionId, db.paymentTransaction.transactionId));

  $$PaymentTransactionTableProcessedTableManager get transactionId {
    final $_column = $_itemColumn<int>('transaction_id')!;

    final manager =
        $$PaymentTransactionTableTableManager($_db, $_db.paymentTransaction)
            .filter((f) => f.transactionId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_transactionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$InvoiceTableFilterComposer
    extends Composer<_$AppDatabase, $InvoiceTable> {
  $$InvoiceTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get invoiceId => $composableBuilder(
      column: $table.invoiceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get issuedDate => $composableBuilder(
      column: $table.issuedDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalBalance => $composableBuilder(
      column: $table.totalBalance, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  $$PatientTableFilterComposer get patientId {
    final $$PatientTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patient,
        getReferencedColumn: (t) => t.patientId,
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

  $$ProcedureChargeTableFilterComposer get chargeId {
    final $$ProcedureChargeTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.chargeId,
        referencedTable: $db.procedureCharge,
        getReferencedColumn: (t) => t.chargeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProcedureChargeTableFilterComposer(
              $db: $db,
              $table: $db.procedureCharge,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PaymentTransactionTableFilterComposer get transactionId {
    final $$PaymentTransactionTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.transactionId,
        referencedTable: $db.paymentTransaction,
        getReferencedColumn: (t) => t.transactionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PaymentTransactionTableFilterComposer(
              $db: $db,
              $table: $db.paymentTransaction,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$InvoiceTableOrderingComposer
    extends Composer<_$AppDatabase, $InvoiceTable> {
  $$InvoiceTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get invoiceId => $composableBuilder(
      column: $table.invoiceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get issuedDate => $composableBuilder(
      column: $table.issuedDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalBalance => $composableBuilder(
      column: $table.totalBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  $$PatientTableOrderingComposer get patientId {
    final $$PatientTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patient,
        getReferencedColumn: (t) => t.patientId,
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

  $$ProcedureChargeTableOrderingComposer get chargeId {
    final $$ProcedureChargeTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.chargeId,
        referencedTable: $db.procedureCharge,
        getReferencedColumn: (t) => t.chargeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProcedureChargeTableOrderingComposer(
              $db: $db,
              $table: $db.procedureCharge,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PaymentTransactionTableOrderingComposer get transactionId {
    final $$PaymentTransactionTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.transactionId,
        referencedTable: $db.paymentTransaction,
        getReferencedColumn: (t) => t.transactionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PaymentTransactionTableOrderingComposer(
              $db: $db,
              $table: $db.paymentTransaction,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$InvoiceTableAnnotationComposer
    extends Composer<_$AppDatabase, $InvoiceTable> {
  $$InvoiceTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get invoiceId =>
      $composableBuilder(column: $table.invoiceId, builder: (column) => column);

  GeneratedColumn<DateTime> get issuedDate => $composableBuilder(
      column: $table.issuedDate, builder: (column) => column);

  GeneratedColumn<double> get totalBalance => $composableBuilder(
      column: $table.totalBalance, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$PatientTableAnnotationComposer get patientId {
    final $$PatientTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patient,
        getReferencedColumn: (t) => t.patientId,
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

  $$ProcedureChargeTableAnnotationComposer get chargeId {
    final $$ProcedureChargeTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.chargeId,
        referencedTable: $db.procedureCharge,
        getReferencedColumn: (t) => t.chargeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProcedureChargeTableAnnotationComposer(
              $db: $db,
              $table: $db.procedureCharge,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PaymentTransactionTableAnnotationComposer get transactionId {
    final $$PaymentTransactionTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.transactionId,
            referencedTable: $db.paymentTransaction,
            getReferencedColumn: (t) => t.transactionId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PaymentTransactionTableAnnotationComposer(
                  $db: $db,
                  $table: $db.paymentTransaction,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$InvoiceTableTableManager extends RootTableManager<
    _$AppDatabase,
    $InvoiceTable,
    InvoiceData,
    $$InvoiceTableFilterComposer,
    $$InvoiceTableOrderingComposer,
    $$InvoiceTableAnnotationComposer,
    $$InvoiceTableCreateCompanionBuilder,
    $$InvoiceTableUpdateCompanionBuilder,
    (InvoiceData, $$InvoiceTableReferences),
    InvoiceData,
    PrefetchHooks Function(
        {bool patientId, bool chargeId, bool transactionId})> {
  $$InvoiceTableTableManager(_$AppDatabase db, $InvoiceTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InvoiceTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InvoiceTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InvoiceTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> invoiceId = const Value.absent(),
            Value<int> patientId = const Value.absent(),
            Value<int> chargeId = const Value.absent(),
            Value<int> transactionId = const Value.absent(),
            Value<DateTime> issuedDate = const Value.absent(),
            Value<double> totalBalance = const Value.absent(),
            Value<String> status = const Value.absent(),
          }) =>
              InvoiceCompanion(
            invoiceId: invoiceId,
            patientId: patientId,
            chargeId: chargeId,
            transactionId: transactionId,
            issuedDate: issuedDate,
            totalBalance: totalBalance,
            status: status,
          ),
          createCompanionCallback: ({
            Value<int> invoiceId = const Value.absent(),
            required int patientId,
            required int chargeId,
            required int transactionId,
            Value<DateTime> issuedDate = const Value.absent(),
            required double totalBalance,
            required String status,
          }) =>
              InvoiceCompanion.insert(
            invoiceId: invoiceId,
            patientId: patientId,
            chargeId: chargeId,
            transactionId: transactionId,
            issuedDate: issuedDate,
            totalBalance: totalBalance,
            status: status,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$InvoiceTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {patientId = false, chargeId = false, transactionId = false}) {
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
                        $$InvoiceTableReferences._patientIdTable(db),
                    referencedColumn:
                        $$InvoiceTableReferences._patientIdTable(db).patientId,
                  ) as T;
                }
                if (chargeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.chargeId,
                    referencedTable:
                        $$InvoiceTableReferences._chargeIdTable(db),
                    referencedColumn:
                        $$InvoiceTableReferences._chargeIdTable(db).chargeId,
                  ) as T;
                }
                if (transactionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.transactionId,
                    referencedTable:
                        $$InvoiceTableReferences._transactionIdTable(db),
                    referencedColumn: $$InvoiceTableReferences
                        ._transactionIdTable(db)
                        .transactionId,
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

typedef $$InvoiceTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $InvoiceTable,
    InvoiceData,
    $$InvoiceTableFilterComposer,
    $$InvoiceTableOrderingComposer,
    $$InvoiceTableAnnotationComposer,
    $$InvoiceTableCreateCompanionBuilder,
    $$InvoiceTableUpdateCompanionBuilder,
    (InvoiceData, $$InvoiceTableReferences),
    InvoiceData,
    PrefetchHooks Function(
        {bool patientId, bool chargeId, bool transactionId})>;
typedef $$ClinicalRecordTableCreateCompanionBuilder = ClinicalRecordCompanion
    Function({
  Value<int> recordId,
  required int patientId,
  Value<DateTime> createdAt,
  Value<String?> pastIllness,
  Value<String?> presentIllness,
  Value<String?> allergies,
  Value<String?> currentMedication,
  Value<bool> hasOralDebris,
  Value<bool> hasCalculus,
  Value<bool> hasPeriodontalPocket,
  Value<bool> hasGingivitis,
  Value<bool> hasDentofacialAnomaly,
  Value<int> cariesForFilling,
  Value<int> cariesForExtraction,
  Value<int> rootFragment,
  Value<int> missingDueToCaries,
  Value<int> filledOrRestored,
  Value<String?> clinicalNotes,
});
typedef $$ClinicalRecordTableUpdateCompanionBuilder = ClinicalRecordCompanion
    Function({
  Value<int> recordId,
  Value<int> patientId,
  Value<DateTime> createdAt,
  Value<String?> pastIllness,
  Value<String?> presentIllness,
  Value<String?> allergies,
  Value<String?> currentMedication,
  Value<bool> hasOralDebris,
  Value<bool> hasCalculus,
  Value<bool> hasPeriodontalPocket,
  Value<bool> hasGingivitis,
  Value<bool> hasDentofacialAnomaly,
  Value<int> cariesForFilling,
  Value<int> cariesForExtraction,
  Value<int> rootFragment,
  Value<int> missingDueToCaries,
  Value<int> filledOrRestored,
  Value<String?> clinicalNotes,
});

final class $$ClinicalRecordTableReferences extends BaseReferences<
    _$AppDatabase, $ClinicalRecordTable, ClinicalRecordData> {
  $$ClinicalRecordTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PatientTable _patientIdTable(_$AppDatabase db) =>
      db.patient.createAlias($_aliasNameGenerator(
          db.clinicalRecord.patientId, db.patient.patientId));

  $$PatientTableProcessedTableManager get patientId {
    final $_column = $_itemColumn<int>('patient_id')!;

    final manager = $$PatientTableTableManager($_db, $_db.patient)
        .filter((f) => f.patientId.sqlEquals($_column));
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
  ColumnFilters<int> get recordId => $composableBuilder(
      column: $table.recordId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pastIllness => $composableBuilder(
      column: $table.pastIllness, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get presentIllness => $composableBuilder(
      column: $table.presentIllness,
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

  ColumnFilters<bool> get hasPeriodontalPocket => $composableBuilder(
      column: $table.hasPeriodontalPocket,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get hasGingivitis => $composableBuilder(
      column: $table.hasGingivitis, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get hasDentofacialAnomaly => $composableBuilder(
      column: $table.hasDentofacialAnomaly,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get cariesForFilling => $composableBuilder(
      column: $table.cariesForFilling,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get cariesForExtraction => $composableBuilder(
      column: $table.cariesForExtraction,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get rootFragment => $composableBuilder(
      column: $table.rootFragment, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get missingDueToCaries => $composableBuilder(
      column: $table.missingDueToCaries,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get filledOrRestored => $composableBuilder(
      column: $table.filledOrRestored,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get clinicalNotes => $composableBuilder(
      column: $table.clinicalNotes, builder: (column) => ColumnFilters(column));

  $$PatientTableFilterComposer get patientId {
    final $$PatientTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patient,
        getReferencedColumn: (t) => t.patientId,
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
  ColumnOrderings<int> get recordId => $composableBuilder(
      column: $table.recordId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pastIllness => $composableBuilder(
      column: $table.pastIllness, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get presentIllness => $composableBuilder(
      column: $table.presentIllness,
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

  ColumnOrderings<bool> get hasPeriodontalPocket => $composableBuilder(
      column: $table.hasPeriodontalPocket,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hasGingivitis => $composableBuilder(
      column: $table.hasGingivitis,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hasDentofacialAnomaly => $composableBuilder(
      column: $table.hasDentofacialAnomaly,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get cariesForFilling => $composableBuilder(
      column: $table.cariesForFilling,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get cariesForExtraction => $composableBuilder(
      column: $table.cariesForExtraction,
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

  ColumnOrderings<String> get clinicalNotes => $composableBuilder(
      column: $table.clinicalNotes,
      builder: (column) => ColumnOrderings(column));

  $$PatientTableOrderingComposer get patientId {
    final $$PatientTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patient,
        getReferencedColumn: (t) => t.patientId,
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
  GeneratedColumn<int> get recordId =>
      $composableBuilder(column: $table.recordId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get pastIllness => $composableBuilder(
      column: $table.pastIllness, builder: (column) => column);

  GeneratedColumn<String> get presentIllness => $composableBuilder(
      column: $table.presentIllness, builder: (column) => column);

  GeneratedColumn<String> get allergies =>
      $composableBuilder(column: $table.allergies, builder: (column) => column);

  GeneratedColumn<String> get currentMedication => $composableBuilder(
      column: $table.currentMedication, builder: (column) => column);

  GeneratedColumn<bool> get hasOralDebris => $composableBuilder(
      column: $table.hasOralDebris, builder: (column) => column);

  GeneratedColumn<bool> get hasCalculus => $composableBuilder(
      column: $table.hasCalculus, builder: (column) => column);

  GeneratedColumn<bool> get hasPeriodontalPocket => $composableBuilder(
      column: $table.hasPeriodontalPocket, builder: (column) => column);

  GeneratedColumn<bool> get hasGingivitis => $composableBuilder(
      column: $table.hasGingivitis, builder: (column) => column);

  GeneratedColumn<bool> get hasDentofacialAnomaly => $composableBuilder(
      column: $table.hasDentofacialAnomaly, builder: (column) => column);

  GeneratedColumn<int> get cariesForFilling => $composableBuilder(
      column: $table.cariesForFilling, builder: (column) => column);

  GeneratedColumn<int> get cariesForExtraction => $composableBuilder(
      column: $table.cariesForExtraction, builder: (column) => column);

  GeneratedColumn<int> get rootFragment => $composableBuilder(
      column: $table.rootFragment, builder: (column) => column);

  GeneratedColumn<int> get missingDueToCaries => $composableBuilder(
      column: $table.missingDueToCaries, builder: (column) => column);

  GeneratedColumn<int> get filledOrRestored => $composableBuilder(
      column: $table.filledOrRestored, builder: (column) => column);

  GeneratedColumn<String> get clinicalNotes => $composableBuilder(
      column: $table.clinicalNotes, builder: (column) => column);

  $$PatientTableAnnotationComposer get patientId {
    final $$PatientTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patient,
        getReferencedColumn: (t) => t.patientId,
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
            Value<int> recordId = const Value.absent(),
            Value<int> patientId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String?> pastIllness = const Value.absent(),
            Value<String?> presentIllness = const Value.absent(),
            Value<String?> allergies = const Value.absent(),
            Value<String?> currentMedication = const Value.absent(),
            Value<bool> hasOralDebris = const Value.absent(),
            Value<bool> hasCalculus = const Value.absent(),
            Value<bool> hasPeriodontalPocket = const Value.absent(),
            Value<bool> hasGingivitis = const Value.absent(),
            Value<bool> hasDentofacialAnomaly = const Value.absent(),
            Value<int> cariesForFilling = const Value.absent(),
            Value<int> cariesForExtraction = const Value.absent(),
            Value<int> rootFragment = const Value.absent(),
            Value<int> missingDueToCaries = const Value.absent(),
            Value<int> filledOrRestored = const Value.absent(),
            Value<String?> clinicalNotes = const Value.absent(),
          }) =>
              ClinicalRecordCompanion(
            recordId: recordId,
            patientId: patientId,
            createdAt: createdAt,
            pastIllness: pastIllness,
            presentIllness: presentIllness,
            allergies: allergies,
            currentMedication: currentMedication,
            hasOralDebris: hasOralDebris,
            hasCalculus: hasCalculus,
            hasPeriodontalPocket: hasPeriodontalPocket,
            hasGingivitis: hasGingivitis,
            hasDentofacialAnomaly: hasDentofacialAnomaly,
            cariesForFilling: cariesForFilling,
            cariesForExtraction: cariesForExtraction,
            rootFragment: rootFragment,
            missingDueToCaries: missingDueToCaries,
            filledOrRestored: filledOrRestored,
            clinicalNotes: clinicalNotes,
          ),
          createCompanionCallback: ({
            Value<int> recordId = const Value.absent(),
            required int patientId,
            Value<DateTime> createdAt = const Value.absent(),
            Value<String?> pastIllness = const Value.absent(),
            Value<String?> presentIllness = const Value.absent(),
            Value<String?> allergies = const Value.absent(),
            Value<String?> currentMedication = const Value.absent(),
            Value<bool> hasOralDebris = const Value.absent(),
            Value<bool> hasCalculus = const Value.absent(),
            Value<bool> hasPeriodontalPocket = const Value.absent(),
            Value<bool> hasGingivitis = const Value.absent(),
            Value<bool> hasDentofacialAnomaly = const Value.absent(),
            Value<int> cariesForFilling = const Value.absent(),
            Value<int> cariesForExtraction = const Value.absent(),
            Value<int> rootFragment = const Value.absent(),
            Value<int> missingDueToCaries = const Value.absent(),
            Value<int> filledOrRestored = const Value.absent(),
            Value<String?> clinicalNotes = const Value.absent(),
          }) =>
              ClinicalRecordCompanion.insert(
            recordId: recordId,
            patientId: patientId,
            createdAt: createdAt,
            pastIllness: pastIllness,
            presentIllness: presentIllness,
            allergies: allergies,
            currentMedication: currentMedication,
            hasOralDebris: hasOralDebris,
            hasCalculus: hasCalculus,
            hasPeriodontalPocket: hasPeriodontalPocket,
            hasGingivitis: hasGingivitis,
            hasDentofacialAnomaly: hasDentofacialAnomaly,
            cariesForFilling: cariesForFilling,
            cariesForExtraction: cariesForExtraction,
            rootFragment: rootFragment,
            missingDueToCaries: missingDueToCaries,
            filledOrRestored: filledOrRestored,
            clinicalNotes: clinicalNotes,
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
                    referencedColumn: $$ClinicalRecordTableReferences
                        ._patientIdTable(db)
                        .patientId,
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
  $$ClinicalStaffTableTableManager get clinicalStaff =>
      $$ClinicalStaffTableTableManager(_db, _db.clinicalStaff);
  $$AppointmentTableTableManager get appointment =>
      $$AppointmentTableTableManager(_db, _db.appointment);
  $$ProcedureChargeTableTableManager get procedureCharge =>
      $$ProcedureChargeTableTableManager(_db, _db.procedureCharge);
  $$PaymentTransactionTableTableManager get paymentTransaction =>
      $$PaymentTransactionTableTableManager(_db, _db.paymentTransaction);
  $$InvoiceTableTableManager get invoice =>
      $$InvoiceTableTableManager(_db, _db.invoice);
  $$ClinicalRecordTableTableManager get clinicalRecord =>
      $$ClinicalRecordTableTableManager(_db, _db.clinicalRecord);
}
