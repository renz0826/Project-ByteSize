// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PatientTable extends Patient
    with drift.TableInfo<$PatientTable, PatientData> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PatientTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _patientIdMeta =
      const drift.VerificationMeta('patientId');
  @override
  late final drift.GeneratedColumn<int> patientId = drift.GeneratedColumn<int>(
      'patient_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const drift.VerificationMeta _firstNameMeta =
      const drift.VerificationMeta('firstName');
  @override
  late final drift.GeneratedColumn<String> firstName =
      drift.GeneratedColumn<String>('first_name', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _middleNameMeta =
      const drift.VerificationMeta('middleName');
  @override
  late final drift.GeneratedColumn<String> middleName =
      drift.GeneratedColumn<String>('middle_name', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _lastNameMeta =
      const drift.VerificationMeta('lastName');
  @override
  late final drift.GeneratedColumn<String> lastName =
      drift.GeneratedColumn<String>('last_name', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _suffixMeta =
      const drift.VerificationMeta('suffix');
  @override
  late final drift.GeneratedColumn<String> suffix =
      drift.GeneratedColumn<String>('suffix', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _birthDateMeta =
      const drift.VerificationMeta('birthDate');
  @override
  late final drift.GeneratedColumn<DateTime> birthDate =
      drift.GeneratedColumn<DateTime>('birth_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const drift.VerificationMeta _sexMeta =
      const drift.VerificationMeta('sex');
  @override
  late final drift.GeneratedColumn<String> sex = drift.GeneratedColumn<String>(
      'sex', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const drift.VerificationMeta _civilStatusMeta =
      const drift.VerificationMeta('civilStatus');
  @override
  late final drift.GeneratedColumn<String> civilStatus =
      drift.GeneratedColumn<String>('civil_status', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _contactNumberMeta =
      const drift.VerificationMeta('contactNumber');
  @override
  late final drift.GeneratedColumn<String> contactNumber =
      drift.GeneratedColumn<String>('contact_number', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 11, maxTextLength: 11),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const drift.VerificationMeta _emergencyContactNoMeta =
      const drift.VerificationMeta('emergencyContactNo');
  @override
  late final drift.GeneratedColumn<String> emergencyContactNo =
      drift.GeneratedColumn<String>('emergency_contact_no', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _referredByMeta =
      const drift.VerificationMeta('referredBy');
  @override
  late final drift.GeneratedColumn<String> referredBy =
      drift.GeneratedColumn<String>('referred_by', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _relationshipMeta =
      const drift.VerificationMeta('relationship');
  @override
  late final drift.GeneratedColumn<String> relationship =
      drift.GeneratedColumn<String>('relationship', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _relationshipEmergencyMeta =
      const drift.VerificationMeta('relationshipEmergency');
  @override
  late final drift.GeneratedColumn<String> relationshipEmergency =
      drift.GeneratedColumn<String>('relationship_emergency', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _streetAddressMeta =
      const drift.VerificationMeta('streetAddress');
  @override
  late final drift.GeneratedColumn<String> streetAddress =
      drift.GeneratedColumn<String>('street_address', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _barangayMeta =
      const drift.VerificationMeta('barangay');
  @override
  late final drift.GeneratedColumn<String> barangay =
      drift.GeneratedColumn<String>('barangay', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _cityMunicipalityMeta =
      const drift.VerificationMeta('cityMunicipality');
  @override
  late final drift.GeneratedColumn<String> cityMunicipality =
      drift.GeneratedColumn<String>('city_municipality', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _provinceMeta =
      const drift.VerificationMeta('province');
  @override
  late final drift.GeneratedColumn<String> province =
      drift.GeneratedColumn<String>('province', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _zipCodeMeta =
      const drift.VerificationMeta('zipCode');
  @override
  late final drift.GeneratedColumn<String> zipCode =
      drift.GeneratedColumn<String>('zip_code', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _isArchivedMeta =
      const drift.VerificationMeta('isArchived');
  @override
  late final drift.GeneratedColumn<bool> isArchived =
      drift.GeneratedColumn<bool>('is_archived', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("is_archived" IN (0, 1))'),
          defaultValue: const drift.Constant(false));
  static const drift.VerificationMeta _isSeniorOrPWDMeta =
      const drift.VerificationMeta('isSeniorOrPWD');
  @override
  late final drift.GeneratedColumn<bool> isSeniorOrPWD =
      drift.GeneratedColumn<bool>('is_senior_or_p_w_d', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("is_senior_or_p_w_d" IN (0, 1))'),
          defaultValue: const drift.Constant(false));
  static const drift.VerificationMeta _createdAtMeta =
      const drift.VerificationMeta('createdAt');
  @override
  late final drift.GeneratedColumn<DateTime> createdAt =
      drift.GeneratedColumn<DateTime>('created_at', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const drift.VerificationMeta _updatedAtMeta =
      const drift.VerificationMeta('updatedAt');
  @override
  late final drift.GeneratedColumn<DateTime> updatedAt =
      drift.GeneratedColumn<DateTime>('updated_at', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<drift.GeneratedColumn> get $columns => [
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
  drift.VerificationContext validateIntegrity(
      drift.Insertable<PatientData> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
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
  Set<drift.GeneratedColumn> get $primaryKey => {patientId};
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
          .read(DriftSqlType.string, data['${effectivePrefix}zip_code']),
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

class PatientData extends drift.DataClass
    implements drift.Insertable<PatientData> {
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
  final String? zipCode;
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
      this.zipCode,
      required this.isArchived,
      required this.isSeniorOrPWD,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['patient_id'] = drift.Variable<int>(patientId);
    map['first_name'] = drift.Variable<String>(firstName);
    if (!nullToAbsent || middleName != null) {
      map['middle_name'] = drift.Variable<String>(middleName);
    }
    map['last_name'] = drift.Variable<String>(lastName);
    if (!nullToAbsent || suffix != null) {
      map['suffix'] = drift.Variable<String>(suffix);
    }
    map['birth_date'] = drift.Variable<DateTime>(birthDate);
    map['sex'] = drift.Variable<String>(sex);
    map['civil_status'] = drift.Variable<String>(civilStatus);
    map['contact_number'] = drift.Variable<String>(contactNumber);
    if (!nullToAbsent || emergencyContactNo != null) {
      map['emergency_contact_no'] = drift.Variable<String>(emergencyContactNo);
    }
    if (!nullToAbsent || referredBy != null) {
      map['referred_by'] = drift.Variable<String>(referredBy);
    }
    if (!nullToAbsent || relationship != null) {
      map['relationship'] = drift.Variable<String>(relationship);
    }
    if (!nullToAbsent || relationshipEmergency != null) {
      map['relationship_emergency'] =
          drift.Variable<String>(relationshipEmergency);
    }
    map['street_address'] = drift.Variable<String>(streetAddress);
    map['barangay'] = drift.Variable<String>(barangay);
    map['city_municipality'] = drift.Variable<String>(cityMunicipality);
    map['province'] = drift.Variable<String>(province);
    if (!nullToAbsent || zipCode != null) {
      map['zip_code'] = drift.Variable<String>(zipCode);
    }
    map['is_archived'] = drift.Variable<bool>(isArchived);
    map['is_senior_or_p_w_d'] = drift.Variable<bool>(isSeniorOrPWD);
    map['created_at'] = drift.Variable<DateTime>(createdAt);
    map['updated_at'] = drift.Variable<DateTime>(updatedAt);
    return map;
  }

  PatientCompanion toCompanion(bool nullToAbsent) {
    return PatientCompanion(
      patientId: drift.Value(patientId),
      firstName: drift.Value(firstName),
      middleName: middleName == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(middleName),
      lastName: drift.Value(lastName),
      suffix: suffix == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(suffix),
      birthDate: drift.Value(birthDate),
      sex: drift.Value(sex),
      civilStatus: drift.Value(civilStatus),
      contactNumber: drift.Value(contactNumber),
      emergencyContactNo: emergencyContactNo == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(emergencyContactNo),
      referredBy: referredBy == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(referredBy),
      relationship: relationship == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(relationship),
      relationshipEmergency: relationshipEmergency == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(relationshipEmergency),
      streetAddress: drift.Value(streetAddress),
      barangay: drift.Value(barangay),
      cityMunicipality: drift.Value(cityMunicipality),
      province: drift.Value(province),
      zipCode: zipCode == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(zipCode),
      isArchived: drift.Value(isArchived),
      isSeniorOrPWD: drift.Value(isSeniorOrPWD),
      createdAt: drift.Value(createdAt),
      updatedAt: drift.Value(updatedAt),
    );
  }

  factory PatientData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
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
      zipCode: serializer.fromJson<String?>(json['zipCode']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      isSeniorOrPWD: serializer.fromJson<bool>(json['isSeniorOrPWD']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
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
      'zipCode': serializer.toJson<String?>(zipCode),
      'isArchived': serializer.toJson<bool>(isArchived),
      'isSeniorOrPWD': serializer.toJson<bool>(isSeniorOrPWD),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PatientData copyWith(
          {int? patientId,
          String? firstName,
          drift.Value<String?> middleName = const drift.Value.absent(),
          String? lastName,
          drift.Value<String?> suffix = const drift.Value.absent(),
          DateTime? birthDate,
          String? sex,
          String? civilStatus,
          String? contactNumber,
          drift.Value<String?> emergencyContactNo = const drift.Value.absent(),
          drift.Value<String?> referredBy = const drift.Value.absent(),
          drift.Value<String?> relationship = const drift.Value.absent(),
          drift.Value<String?> relationshipEmergency =
              const drift.Value.absent(),
          String? streetAddress,
          String? barangay,
          String? cityMunicipality,
          String? province,
          drift.Value<String?> zipCode = const drift.Value.absent(),
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
        zipCode: zipCode.present ? zipCode.value : this.zipCode,
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

class PatientCompanion extends drift.UpdateCompanion<PatientData> {
  final drift.Value<int> patientId;
  final drift.Value<String> firstName;
  final drift.Value<String?> middleName;
  final drift.Value<String> lastName;
  final drift.Value<String?> suffix;
  final drift.Value<DateTime> birthDate;
  final drift.Value<String> sex;
  final drift.Value<String> civilStatus;
  final drift.Value<String> contactNumber;
  final drift.Value<String?> emergencyContactNo;
  final drift.Value<String?> referredBy;
  final drift.Value<String?> relationship;
  final drift.Value<String?> relationshipEmergency;
  final drift.Value<String> streetAddress;
  final drift.Value<String> barangay;
  final drift.Value<String> cityMunicipality;
  final drift.Value<String> province;
  final drift.Value<String?> zipCode;
  final drift.Value<bool> isArchived;
  final drift.Value<bool> isSeniorOrPWD;
  final drift.Value<DateTime> createdAt;
  final drift.Value<DateTime> updatedAt;
  const PatientCompanion({
    this.patientId = const drift.Value.absent(),
    this.firstName = const drift.Value.absent(),
    this.middleName = const drift.Value.absent(),
    this.lastName = const drift.Value.absent(),
    this.suffix = const drift.Value.absent(),
    this.birthDate = const drift.Value.absent(),
    this.sex = const drift.Value.absent(),
    this.civilStatus = const drift.Value.absent(),
    this.contactNumber = const drift.Value.absent(),
    this.emergencyContactNo = const drift.Value.absent(),
    this.referredBy = const drift.Value.absent(),
    this.relationship = const drift.Value.absent(),
    this.relationshipEmergency = const drift.Value.absent(),
    this.streetAddress = const drift.Value.absent(),
    this.barangay = const drift.Value.absent(),
    this.cityMunicipality = const drift.Value.absent(),
    this.province = const drift.Value.absent(),
    this.zipCode = const drift.Value.absent(),
    this.isArchived = const drift.Value.absent(),
    this.isSeniorOrPWD = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.updatedAt = const drift.Value.absent(),
  });
  PatientCompanion.insert({
    this.patientId = const drift.Value.absent(),
    required String firstName,
    this.middleName = const drift.Value.absent(),
    required String lastName,
    this.suffix = const drift.Value.absent(),
    required DateTime birthDate,
    required String sex,
    required String civilStatus,
    required String contactNumber,
    this.emergencyContactNo = const drift.Value.absent(),
    this.referredBy = const drift.Value.absent(),
    this.relationship = const drift.Value.absent(),
    this.relationshipEmergency = const drift.Value.absent(),
    required String streetAddress,
    required String barangay,
    required String cityMunicipality,
    required String province,
    this.zipCode = const drift.Value.absent(),
    this.isArchived = const drift.Value.absent(),
    this.isSeniorOrPWD = const drift.Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : firstName = drift.Value(firstName),
        lastName = drift.Value(lastName),
        birthDate = drift.Value(birthDate),
        sex = drift.Value(sex),
        civilStatus = drift.Value(civilStatus),
        contactNumber = drift.Value(contactNumber),
        streetAddress = drift.Value(streetAddress),
        barangay = drift.Value(barangay),
        cityMunicipality = drift.Value(cityMunicipality),
        province = drift.Value(province),
        createdAt = drift.Value(createdAt),
        updatedAt = drift.Value(updatedAt);
  static drift.Insertable<PatientData> custom({
    drift.Expression<int>? patientId,
    drift.Expression<String>? firstName,
    drift.Expression<String>? middleName,
    drift.Expression<String>? lastName,
    drift.Expression<String>? suffix,
    drift.Expression<DateTime>? birthDate,
    drift.Expression<String>? sex,
    drift.Expression<String>? civilStatus,
    drift.Expression<String>? contactNumber,
    drift.Expression<String>? emergencyContactNo,
    drift.Expression<String>? referredBy,
    drift.Expression<String>? relationship,
    drift.Expression<String>? relationshipEmergency,
    drift.Expression<String>? streetAddress,
    drift.Expression<String>? barangay,
    drift.Expression<String>? cityMunicipality,
    drift.Expression<String>? province,
    drift.Expression<String>? zipCode,
    drift.Expression<bool>? isArchived,
    drift.Expression<bool>? isSeniorOrPWD,
    drift.Expression<DateTime>? createdAt,
    drift.Expression<DateTime>? updatedAt,
  }) {
    return drift.RawValuesInsertable({
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
      {drift.Value<int>? patientId,
      drift.Value<String>? firstName,
      drift.Value<String?>? middleName,
      drift.Value<String>? lastName,
      drift.Value<String?>? suffix,
      drift.Value<DateTime>? birthDate,
      drift.Value<String>? sex,
      drift.Value<String>? civilStatus,
      drift.Value<String>? contactNumber,
      drift.Value<String?>? emergencyContactNo,
      drift.Value<String?>? referredBy,
      drift.Value<String?>? relationship,
      drift.Value<String?>? relationshipEmergency,
      drift.Value<String>? streetAddress,
      drift.Value<String>? barangay,
      drift.Value<String>? cityMunicipality,
      drift.Value<String>? province,
      drift.Value<String?>? zipCode,
      drift.Value<bool>? isArchived,
      drift.Value<bool>? isSeniorOrPWD,
      drift.Value<DateTime>? createdAt,
      drift.Value<DateTime>? updatedAt}) {
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
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (patientId.present) {
      map['patient_id'] = drift.Variable<int>(patientId.value);
    }
    if (firstName.present) {
      map['first_name'] = drift.Variable<String>(firstName.value);
    }
    if (middleName.present) {
      map['middle_name'] = drift.Variable<String>(middleName.value);
    }
    if (lastName.present) {
      map['last_name'] = drift.Variable<String>(lastName.value);
    }
    if (suffix.present) {
      map['suffix'] = drift.Variable<String>(suffix.value);
    }
    if (birthDate.present) {
      map['birth_date'] = drift.Variable<DateTime>(birthDate.value);
    }
    if (sex.present) {
      map['sex'] = drift.Variable<String>(sex.value);
    }
    if (civilStatus.present) {
      map['civil_status'] = drift.Variable<String>(civilStatus.value);
    }
    if (contactNumber.present) {
      map['contact_number'] = drift.Variable<String>(contactNumber.value);
    }
    if (emergencyContactNo.present) {
      map['emergency_contact_no'] =
          drift.Variable<String>(emergencyContactNo.value);
    }
    if (referredBy.present) {
      map['referred_by'] = drift.Variable<String>(referredBy.value);
    }
    if (relationship.present) {
      map['relationship'] = drift.Variable<String>(relationship.value);
    }
    if (relationshipEmergency.present) {
      map['relationship_emergency'] =
          drift.Variable<String>(relationshipEmergency.value);
    }
    if (streetAddress.present) {
      map['street_address'] = drift.Variable<String>(streetAddress.value);
    }
    if (barangay.present) {
      map['barangay'] = drift.Variable<String>(barangay.value);
    }
    if (cityMunicipality.present) {
      map['city_municipality'] = drift.Variable<String>(cityMunicipality.value);
    }
    if (province.present) {
      map['province'] = drift.Variable<String>(province.value);
    }
    if (zipCode.present) {
      map['zip_code'] = drift.Variable<String>(zipCode.value);
    }
    if (isArchived.present) {
      map['is_archived'] = drift.Variable<bool>(isArchived.value);
    }
    if (isSeniorOrPWD.present) {
      map['is_senior_or_p_w_d'] = drift.Variable<bool>(isSeniorOrPWD.value);
    }
    if (createdAt.present) {
      map['created_at'] = drift.Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = drift.Variable<DateTime>(updatedAt.value);
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
    with drift.TableInfo<$ClinicalStaffTable, ClinicalStaffData> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClinicalStaffTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _staffIdMeta =
      const drift.VerificationMeta('staffId');
  @override
  late final drift.GeneratedColumn<int> staffId = drift.GeneratedColumn<int>(
      'staff_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const drift.VerificationMeta _firstNameMeta =
      const drift.VerificationMeta('firstName');
  @override
  late final drift.GeneratedColumn<String> firstName =
      drift.GeneratedColumn<String>('first_name', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _middleNameMeta =
      const drift.VerificationMeta('middleName');
  @override
  late final drift.GeneratedColumn<String> middleName =
      drift.GeneratedColumn<String>('middle_name', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _lastNameMeta =
      const drift.VerificationMeta('lastName');
  @override
  late final drift.GeneratedColumn<String> lastName =
      drift.GeneratedColumn<String>('last_name', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _pinMeta =
      const drift.VerificationMeta('pin');
  @override
  late final drift.GeneratedColumn<String> pin = drift.GeneratedColumn<String>(
      'pin', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _isLockedOutMeta =
      const drift.VerificationMeta('isLockedOut');
  @override
  late final drift.GeneratedColumn<bool> isLockedOut =
      drift.GeneratedColumn<bool>('is_locked_out', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("is_locked_out" IN (0, 1))'),
          defaultValue: const drift.Constant(false));
  static const drift.VerificationMeta _failedAttemptsMeta =
      const drift.VerificationMeta('failedAttempts');
  @override
  late final drift.GeneratedColumn<int> failedAttempts =
      drift.GeneratedColumn<int>('failed_attempts', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultValue: const drift.Constant(0));
  static const drift.VerificationMeta _lockoutTierMeta =
      const drift.VerificationMeta('lockoutTier');
  @override
  late final drift.GeneratedColumn<int> lockoutTier =
      drift.GeneratedColumn<int>('lockout_tier', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultValue: const drift.Constant(0));
  static const drift.VerificationMeta _lockoutUntilMeta =
      const drift.VerificationMeta('lockoutUntil');
  @override
  late final drift.GeneratedColumn<DateTime> lockoutUntil =
      drift.GeneratedColumn<DateTime>('lockout_until', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<drift.GeneratedColumn> get $columns => [
        staffId,
        firstName,
        middleName,
        lastName,
        pin,
        isLockedOut,
        failedAttempts,
        lockoutTier,
        lockoutUntil
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'clinical_staff';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<ClinicalStaffData> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('staff_id')) {
      context.handle(_staffIdMeta,
          staffId.isAcceptableOrUnknown(data['staff_id']!, _staffIdMeta));
    } else if (isInserting) {
      context.missing(_staffIdMeta);
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
    if (data.containsKey('pin')) {
      context.handle(
          _pinMeta, pin.isAcceptableOrUnknown(data['pin']!, _pinMeta));
    } else if (isInserting) {
      context.missing(_pinMeta);
    }
    if (data.containsKey('is_locked_out')) {
      context.handle(
          _isLockedOutMeta,
          isLockedOut.isAcceptableOrUnknown(
              data['is_locked_out']!, _isLockedOutMeta));
    }
    if (data.containsKey('failed_attempts')) {
      context.handle(
          _failedAttemptsMeta,
          failedAttempts.isAcceptableOrUnknown(
              data['failed_attempts']!, _failedAttemptsMeta));
    }
    if (data.containsKey('lockout_tier')) {
      context.handle(
          _lockoutTierMeta,
          lockoutTier.isAcceptableOrUnknown(
              data['lockout_tier']!, _lockoutTierMeta));
    }
    if (data.containsKey('lockout_until')) {
      context.handle(
          _lockoutUntilMeta,
          lockoutUntil.isAcceptableOrUnknown(
              data['lockout_until']!, _lockoutUntilMeta));
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => const {};
  @override
  ClinicalStaffData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClinicalStaffData(
      staffId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}staff_id'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      middleName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}middle_name']),
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      pin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pin'])!,
      isLockedOut: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_locked_out'])!,
      failedAttempts: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}failed_attempts'])!,
      lockoutTier: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}lockout_tier'])!,
      lockoutUntil: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}lockout_until']),
    );
  }

  @override
  $ClinicalStaffTable createAlias(String alias) {
    return $ClinicalStaffTable(attachedDatabase, alias);
  }
}

class ClinicalStaffData extends drift.DataClass
    implements drift.Insertable<ClinicalStaffData> {
  final int staffId;
  final String firstName;
  final String? middleName;
  final String lastName;
  final String pin;
  final bool isLockedOut;
  final int failedAttempts;
  final int lockoutTier;
  final DateTime? lockoutUntil;
  const ClinicalStaffData(
      {required this.staffId,
      required this.firstName,
      this.middleName,
      required this.lastName,
      required this.pin,
      required this.isLockedOut,
      required this.failedAttempts,
      required this.lockoutTier,
      this.lockoutUntil});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['staff_id'] = drift.Variable<int>(staffId);
    map['first_name'] = drift.Variable<String>(firstName);
    if (!nullToAbsent || middleName != null) {
      map['middle_name'] = drift.Variable<String>(middleName);
    }
    map['last_name'] = drift.Variable<String>(lastName);
    map['pin'] = drift.Variable<String>(pin);
    map['is_locked_out'] = drift.Variable<bool>(isLockedOut);
    map['failed_attempts'] = drift.Variable<int>(failedAttempts);
    map['lockout_tier'] = drift.Variable<int>(lockoutTier);
    if (!nullToAbsent || lockoutUntil != null) {
      map['lockout_until'] = drift.Variable<DateTime>(lockoutUntil);
    }
    return map;
  }

  ClinicalStaffCompanion toCompanion(bool nullToAbsent) {
    return ClinicalStaffCompanion(
      staffId: drift.Value(staffId),
      firstName: drift.Value(firstName),
      middleName: middleName == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(middleName),
      lastName: drift.Value(lastName),
      pin: drift.Value(pin),
      isLockedOut: drift.Value(isLockedOut),
      failedAttempts: drift.Value(failedAttempts),
      lockoutTier: drift.Value(lockoutTier),
      lockoutUntil: lockoutUntil == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(lockoutUntil),
    );
  }

  factory ClinicalStaffData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return ClinicalStaffData(
      staffId: serializer.fromJson<int>(json['staffId']),
      firstName: serializer.fromJson<String>(json['firstName']),
      middleName: serializer.fromJson<String?>(json['middleName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      pin: serializer.fromJson<String>(json['pin']),
      isLockedOut: serializer.fromJson<bool>(json['isLockedOut']),
      failedAttempts: serializer.fromJson<int>(json['failedAttempts']),
      lockoutTier: serializer.fromJson<int>(json['lockoutTier']),
      lockoutUntil: serializer.fromJson<DateTime?>(json['lockoutUntil']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'staffId': serializer.toJson<int>(staffId),
      'firstName': serializer.toJson<String>(firstName),
      'middleName': serializer.toJson<String?>(middleName),
      'lastName': serializer.toJson<String>(lastName),
      'pin': serializer.toJson<String>(pin),
      'isLockedOut': serializer.toJson<bool>(isLockedOut),
      'failedAttempts': serializer.toJson<int>(failedAttempts),
      'lockoutTier': serializer.toJson<int>(lockoutTier),
      'lockoutUntil': serializer.toJson<DateTime?>(lockoutUntil),
    };
  }

  ClinicalStaffData copyWith(
          {int? staffId,
          String? firstName,
          drift.Value<String?> middleName = const drift.Value.absent(),
          String? lastName,
          String? pin,
          bool? isLockedOut,
          int? failedAttempts,
          int? lockoutTier,
          drift.Value<DateTime?> lockoutUntil = const drift.Value.absent()}) =>
      ClinicalStaffData(
        staffId: staffId ?? this.staffId,
        firstName: firstName ?? this.firstName,
        middleName: middleName.present ? middleName.value : this.middleName,
        lastName: lastName ?? this.lastName,
        pin: pin ?? this.pin,
        isLockedOut: isLockedOut ?? this.isLockedOut,
        failedAttempts: failedAttempts ?? this.failedAttempts,
        lockoutTier: lockoutTier ?? this.lockoutTier,
        lockoutUntil:
            lockoutUntil.present ? lockoutUntil.value : this.lockoutUntil,
      );
  ClinicalStaffData copyWithCompanion(ClinicalStaffCompanion data) {
    return ClinicalStaffData(
      staffId: data.staffId.present ? data.staffId.value : this.staffId,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      middleName:
          data.middleName.present ? data.middleName.value : this.middleName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      pin: data.pin.present ? data.pin.value : this.pin,
      isLockedOut:
          data.isLockedOut.present ? data.isLockedOut.value : this.isLockedOut,
      failedAttempts: data.failedAttempts.present
          ? data.failedAttempts.value
          : this.failedAttempts,
      lockoutTier:
          data.lockoutTier.present ? data.lockoutTier.value : this.lockoutTier,
      lockoutUntil: data.lockoutUntil.present
          ? data.lockoutUntil.value
          : this.lockoutUntil,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClinicalStaffData(')
          ..write('staffId: $staffId, ')
          ..write('firstName: $firstName, ')
          ..write('middleName: $middleName, ')
          ..write('lastName: $lastName, ')
          ..write('pin: $pin, ')
          ..write('isLockedOut: $isLockedOut, ')
          ..write('failedAttempts: $failedAttempts, ')
          ..write('lockoutTier: $lockoutTier, ')
          ..write('lockoutUntil: $lockoutUntil')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(staffId, firstName, middleName, lastName, pin,
      isLockedOut, failedAttempts, lockoutTier, lockoutUntil);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClinicalStaffData &&
          other.staffId == this.staffId &&
          other.firstName == this.firstName &&
          other.middleName == this.middleName &&
          other.lastName == this.lastName &&
          other.pin == this.pin &&
          other.isLockedOut == this.isLockedOut &&
          other.failedAttempts == this.failedAttempts &&
          other.lockoutTier == this.lockoutTier &&
          other.lockoutUntil == this.lockoutUntil);
}

class ClinicalStaffCompanion extends drift.UpdateCompanion<ClinicalStaffData> {
  final drift.Value<int> staffId;
  final drift.Value<String> firstName;
  final drift.Value<String?> middleName;
  final drift.Value<String> lastName;
  final drift.Value<String> pin;
  final drift.Value<bool> isLockedOut;
  final drift.Value<int> failedAttempts;
  final drift.Value<int> lockoutTier;
  final drift.Value<DateTime?> lockoutUntil;
  final drift.Value<int> rowid;
  const ClinicalStaffCompanion({
    this.staffId = const drift.Value.absent(),
    this.firstName = const drift.Value.absent(),
    this.middleName = const drift.Value.absent(),
    this.lastName = const drift.Value.absent(),
    this.pin = const drift.Value.absent(),
    this.isLockedOut = const drift.Value.absent(),
    this.failedAttempts = const drift.Value.absent(),
    this.lockoutTier = const drift.Value.absent(),
    this.lockoutUntil = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  ClinicalStaffCompanion.insert({
    required int staffId,
    required String firstName,
    this.middleName = const drift.Value.absent(),
    required String lastName,
    required String pin,
    this.isLockedOut = const drift.Value.absent(),
    this.failedAttempts = const drift.Value.absent(),
    this.lockoutTier = const drift.Value.absent(),
    this.lockoutUntil = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  })  : staffId = drift.Value(staffId),
        firstName = drift.Value(firstName),
        lastName = drift.Value(lastName),
        pin = drift.Value(pin);
  static drift.Insertable<ClinicalStaffData> custom({
    drift.Expression<int>? staffId,
    drift.Expression<String>? firstName,
    drift.Expression<String>? middleName,
    drift.Expression<String>? lastName,
    drift.Expression<String>? pin,
    drift.Expression<bool>? isLockedOut,
    drift.Expression<int>? failedAttempts,
    drift.Expression<int>? lockoutTier,
    drift.Expression<DateTime>? lockoutUntil,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (staffId != null) 'staff_id': staffId,
      if (firstName != null) 'first_name': firstName,
      if (middleName != null) 'middle_name': middleName,
      if (lastName != null) 'last_name': lastName,
      if (pin != null) 'pin': pin,
      if (isLockedOut != null) 'is_locked_out': isLockedOut,
      if (failedAttempts != null) 'failed_attempts': failedAttempts,
      if (lockoutTier != null) 'lockout_tier': lockoutTier,
      if (lockoutUntil != null) 'lockout_until': lockoutUntil,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ClinicalStaffCompanion copyWith(
      {drift.Value<int>? staffId,
      drift.Value<String>? firstName,
      drift.Value<String?>? middleName,
      drift.Value<String>? lastName,
      drift.Value<String>? pin,
      drift.Value<bool>? isLockedOut,
      drift.Value<int>? failedAttempts,
      drift.Value<int>? lockoutTier,
      drift.Value<DateTime?>? lockoutUntil,
      drift.Value<int>? rowid}) {
    return ClinicalStaffCompanion(
      staffId: staffId ?? this.staffId,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      pin: pin ?? this.pin,
      isLockedOut: isLockedOut ?? this.isLockedOut,
      failedAttempts: failedAttempts ?? this.failedAttempts,
      lockoutTier: lockoutTier ?? this.lockoutTier,
      lockoutUntil: lockoutUntil ?? this.lockoutUntil,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (staffId.present) {
      map['staff_id'] = drift.Variable<int>(staffId.value);
    }
    if (firstName.present) {
      map['first_name'] = drift.Variable<String>(firstName.value);
    }
    if (middleName.present) {
      map['middle_name'] = drift.Variable<String>(middleName.value);
    }
    if (lastName.present) {
      map['last_name'] = drift.Variable<String>(lastName.value);
    }
    if (pin.present) {
      map['pin'] = drift.Variable<String>(pin.value);
    }
    if (isLockedOut.present) {
      map['is_locked_out'] = drift.Variable<bool>(isLockedOut.value);
    }
    if (failedAttempts.present) {
      map['failed_attempts'] = drift.Variable<int>(failedAttempts.value);
    }
    if (lockoutTier.present) {
      map['lockout_tier'] = drift.Variable<int>(lockoutTier.value);
    }
    if (lockoutUntil.present) {
      map['lockout_until'] = drift.Variable<DateTime>(lockoutUntil.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClinicalStaffCompanion(')
          ..write('staffId: $staffId, ')
          ..write('firstName: $firstName, ')
          ..write('middleName: $middleName, ')
          ..write('lastName: $lastName, ')
          ..write('pin: $pin, ')
          ..write('isLockedOut: $isLockedOut, ')
          ..write('failedAttempts: $failedAttempts, ')
          ..write('lockoutTier: $lockoutTier, ')
          ..write('lockoutUntil: $lockoutUntil, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppointmentTable extends Appointment
    with drift.TableInfo<$AppointmentTable, AppointmentData> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppointmentTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _appointmentIdMeta =
      const drift.VerificationMeta('appointmentId');
  @override
  late final drift.GeneratedColumn<int> appointmentId =
      drift.GeneratedColumn<int>('appointment_id', aliasedName, false,
          hasAutoIncrement: true,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultConstraints:
              GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const drift.VerificationMeta _patientIdMeta =
      const drift.VerificationMeta('patientId');
  @override
  late final drift.GeneratedColumn<int> patientId = drift.GeneratedColumn<int>(
      'patient_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES patient (patient_id)'));
  static const drift.VerificationMeta _staffIdMeta =
      const drift.VerificationMeta('staffId');
  @override
  late final drift.GeneratedColumn<int> staffId = drift.GeneratedColumn<int>(
      'staff_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES clinical_staff (staff_id)'));
  static const drift.VerificationMeta _scheduleDateTimeMeta =
      const drift.VerificationMeta('scheduleDateTime');
  @override
  late final drift.GeneratedColumn<DateTime> scheduleDateTime =
      drift.GeneratedColumn<DateTime>('schedule_date_time', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const drift.VerificationMeta _reasonForVisitMeta =
      const drift.VerificationMeta('reasonForVisit');
  @override
  late final drift.GeneratedColumn<String> reasonForVisit =
      drift.GeneratedColumn<String>('reason_for_visit', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _statusMeta =
      const drift.VerificationMeta('status');
  @override
  late final drift.GeneratedColumn<String> status =
      drift.GeneratedColumn<String>('status', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const drift.Constant('Scheduled'));
  static const drift.VerificationMeta _timeSlotMeta =
      const drift.VerificationMeta('timeSlot');
  @override
  late final drift.GeneratedColumn<String> timeSlot =
      drift.GeneratedColumn<String>('time_slot', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<drift.GeneratedColumn> get $columns => [
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
  drift.VerificationContext validateIntegrity(
      drift.Insertable<AppointmentData> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
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
  Set<drift.GeneratedColumn> get $primaryKey => {appointmentId};
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

class AppointmentData extends drift.DataClass
    implements drift.Insertable<AppointmentData> {
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
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['appointment_id'] = drift.Variable<int>(appointmentId);
    map['patient_id'] = drift.Variable<int>(patientId);
    if (!nullToAbsent || staffId != null) {
      map['staff_id'] = drift.Variable<int>(staffId);
    }
    map['schedule_date_time'] = drift.Variable<DateTime>(scheduleDateTime);
    map['reason_for_visit'] = drift.Variable<String>(reasonForVisit);
    map['status'] = drift.Variable<String>(status);
    map['time_slot'] = drift.Variable<String>(timeSlot);
    return map;
  }

  AppointmentCompanion toCompanion(bool nullToAbsent) {
    return AppointmentCompanion(
      appointmentId: drift.Value(appointmentId),
      patientId: drift.Value(patientId),
      staffId: staffId == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(staffId),
      scheduleDateTime: drift.Value(scheduleDateTime),
      reasonForVisit: drift.Value(reasonForVisit),
      status: drift.Value(status),
      timeSlot: drift.Value(timeSlot),
    );
  }

  factory AppointmentData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
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
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
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
          drift.Value<int?> staffId = const drift.Value.absent(),
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

class AppointmentCompanion extends drift.UpdateCompanion<AppointmentData> {
  final drift.Value<int> appointmentId;
  final drift.Value<int> patientId;
  final drift.Value<int?> staffId;
  final drift.Value<DateTime> scheduleDateTime;
  final drift.Value<String> reasonForVisit;
  final drift.Value<String> status;
  final drift.Value<String> timeSlot;
  const AppointmentCompanion({
    this.appointmentId = const drift.Value.absent(),
    this.patientId = const drift.Value.absent(),
    this.staffId = const drift.Value.absent(),
    this.scheduleDateTime = const drift.Value.absent(),
    this.reasonForVisit = const drift.Value.absent(),
    this.status = const drift.Value.absent(),
    this.timeSlot = const drift.Value.absent(),
  });
  AppointmentCompanion.insert({
    this.appointmentId = const drift.Value.absent(),
    required int patientId,
    this.staffId = const drift.Value.absent(),
    required DateTime scheduleDateTime,
    required String reasonForVisit,
    this.status = const drift.Value.absent(),
    required String timeSlot,
  })  : patientId = drift.Value(patientId),
        scheduleDateTime = drift.Value(scheduleDateTime),
        reasonForVisit = drift.Value(reasonForVisit),
        timeSlot = drift.Value(timeSlot);
  static drift.Insertable<AppointmentData> custom({
    drift.Expression<int>? appointmentId,
    drift.Expression<int>? patientId,
    drift.Expression<int>? staffId,
    drift.Expression<DateTime>? scheduleDateTime,
    drift.Expression<String>? reasonForVisit,
    drift.Expression<String>? status,
    drift.Expression<String>? timeSlot,
  }) {
    return drift.RawValuesInsertable({
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
      {drift.Value<int>? appointmentId,
      drift.Value<int>? patientId,
      drift.Value<int?>? staffId,
      drift.Value<DateTime>? scheduleDateTime,
      drift.Value<String>? reasonForVisit,
      drift.Value<String>? status,
      drift.Value<String>? timeSlot}) {
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
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (appointmentId.present) {
      map['appointment_id'] = drift.Variable<int>(appointmentId.value);
    }
    if (patientId.present) {
      map['patient_id'] = drift.Variable<int>(patientId.value);
    }
    if (staffId.present) {
      map['staff_id'] = drift.Variable<int>(staffId.value);
    }
    if (scheduleDateTime.present) {
      map['schedule_date_time'] =
          drift.Variable<DateTime>(scheduleDateTime.value);
    }
    if (reasonForVisit.present) {
      map['reason_for_visit'] = drift.Variable<String>(reasonForVisit.value);
    }
    if (status.present) {
      map['status'] = drift.Variable<String>(status.value);
    }
    if (timeSlot.present) {
      map['time_slot'] = drift.Variable<String>(timeSlot.value);
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

class $InvoiceTable extends Invoice
    with drift.TableInfo<$InvoiceTable, InvoiceData> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvoiceTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _invoiceIdMeta =
      const drift.VerificationMeta('invoiceId');
  @override
  late final drift.GeneratedColumn<int> invoiceId = drift.GeneratedColumn<int>(
      'invoice_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const drift.VerificationMeta _patientIdMeta =
      const drift.VerificationMeta('patientId');
  @override
  late final drift.GeneratedColumn<int> patientId = drift.GeneratedColumn<int>(
      'patient_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES patient (patient_id)'));
  static const drift.VerificationMeta _issuedDateMeta =
      const drift.VerificationMeta('issuedDate');
  @override
  late final drift.GeneratedColumn<DateTime> issuedDate =
      drift.GeneratedColumn<DateTime>('issued_date', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: drift.currentDateAndTime);
  static const drift.VerificationMeta _totalBalanceMeta =
      const drift.VerificationMeta('totalBalance');
  @override
  late final drift.GeneratedColumn<double> totalBalance =
      drift.GeneratedColumn<double>('total_balance', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const drift.VerificationMeta _statusMeta =
      const drift.VerificationMeta('status');
  @override
  late final drift.GeneratedColumn<String> status =
      drift.GeneratedColumn<String>('status', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<drift.GeneratedColumn> get $columns =>
      [invoiceId, patientId, issuedDate, totalBalance, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'invoice';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<InvoiceData> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
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
  Set<drift.GeneratedColumn> get $primaryKey => {invoiceId};
  @override
  InvoiceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InvoiceData(
      invoiceId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}invoice_id'])!,
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}patient_id'])!,
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

class InvoiceData extends drift.DataClass
    implements drift.Insertable<InvoiceData> {
  final int invoiceId;
  final int patientId;
  final DateTime issuedDate;
  final double totalBalance;
  final String status;
  const InvoiceData(
      {required this.invoiceId,
      required this.patientId,
      required this.issuedDate,
      required this.totalBalance,
      required this.status});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['invoice_id'] = drift.Variable<int>(invoiceId);
    map['patient_id'] = drift.Variable<int>(patientId);
    map['issued_date'] = drift.Variable<DateTime>(issuedDate);
    map['total_balance'] = drift.Variable<double>(totalBalance);
    map['status'] = drift.Variable<String>(status);
    return map;
  }

  InvoiceCompanion toCompanion(bool nullToAbsent) {
    return InvoiceCompanion(
      invoiceId: drift.Value(invoiceId),
      patientId: drift.Value(patientId),
      issuedDate: drift.Value(issuedDate),
      totalBalance: drift.Value(totalBalance),
      status: drift.Value(status),
    );
  }

  factory InvoiceData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return InvoiceData(
      invoiceId: serializer.fromJson<int>(json['invoiceId']),
      patientId: serializer.fromJson<int>(json['patientId']),
      issuedDate: serializer.fromJson<DateTime>(json['issuedDate']),
      totalBalance: serializer.fromJson<double>(json['totalBalance']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'invoiceId': serializer.toJson<int>(invoiceId),
      'patientId': serializer.toJson<int>(patientId),
      'issuedDate': serializer.toJson<DateTime>(issuedDate),
      'totalBalance': serializer.toJson<double>(totalBalance),
      'status': serializer.toJson<String>(status),
    };
  }

  InvoiceData copyWith(
          {int? invoiceId,
          int? patientId,
          DateTime? issuedDate,
          double? totalBalance,
          String? status}) =>
      InvoiceData(
        invoiceId: invoiceId ?? this.invoiceId,
        patientId: patientId ?? this.patientId,
        issuedDate: issuedDate ?? this.issuedDate,
        totalBalance: totalBalance ?? this.totalBalance,
        status: status ?? this.status,
      );
  InvoiceData copyWithCompanion(InvoiceCompanion data) {
    return InvoiceData(
      invoiceId: data.invoiceId.present ? data.invoiceId.value : this.invoiceId,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
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
          ..write('issuedDate: $issuedDate, ')
          ..write('totalBalance: $totalBalance, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(invoiceId, patientId, issuedDate, totalBalance, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InvoiceData &&
          other.invoiceId == this.invoiceId &&
          other.patientId == this.patientId &&
          other.issuedDate == this.issuedDate &&
          other.totalBalance == this.totalBalance &&
          other.status == this.status);
}

class InvoiceCompanion extends drift.UpdateCompanion<InvoiceData> {
  final drift.Value<int> invoiceId;
  final drift.Value<int> patientId;
  final drift.Value<DateTime> issuedDate;
  final drift.Value<double> totalBalance;
  final drift.Value<String> status;
  const InvoiceCompanion({
    this.invoiceId = const drift.Value.absent(),
    this.patientId = const drift.Value.absent(),
    this.issuedDate = const drift.Value.absent(),
    this.totalBalance = const drift.Value.absent(),
    this.status = const drift.Value.absent(),
  });
  InvoiceCompanion.insert({
    this.invoiceId = const drift.Value.absent(),
    required int patientId,
    this.issuedDate = const drift.Value.absent(),
    required double totalBalance,
    required String status,
  })  : patientId = drift.Value(patientId),
        totalBalance = drift.Value(totalBalance),
        status = drift.Value(status);
  static drift.Insertable<InvoiceData> custom({
    drift.Expression<int>? invoiceId,
    drift.Expression<int>? patientId,
    drift.Expression<DateTime>? issuedDate,
    drift.Expression<double>? totalBalance,
    drift.Expression<String>? status,
  }) {
    return drift.RawValuesInsertable({
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (patientId != null) 'patient_id': patientId,
      if (issuedDate != null) 'issued_date': issuedDate,
      if (totalBalance != null) 'total_balance': totalBalance,
      if (status != null) 'status': status,
    });
  }

  InvoiceCompanion copyWith(
      {drift.Value<int>? invoiceId,
      drift.Value<int>? patientId,
      drift.Value<DateTime>? issuedDate,
      drift.Value<double>? totalBalance,
      drift.Value<String>? status}) {
    return InvoiceCompanion(
      invoiceId: invoiceId ?? this.invoiceId,
      patientId: patientId ?? this.patientId,
      issuedDate: issuedDate ?? this.issuedDate,
      totalBalance: totalBalance ?? this.totalBalance,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (invoiceId.present) {
      map['invoice_id'] = drift.Variable<int>(invoiceId.value);
    }
    if (patientId.present) {
      map['patient_id'] = drift.Variable<int>(patientId.value);
    }
    if (issuedDate.present) {
      map['issued_date'] = drift.Variable<DateTime>(issuedDate.value);
    }
    if (totalBalance.present) {
      map['total_balance'] = drift.Variable<double>(totalBalance.value);
    }
    if (status.present) {
      map['status'] = drift.Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceCompanion(')
          ..write('invoiceId: $invoiceId, ')
          ..write('patientId: $patientId, ')
          ..write('issuedDate: $issuedDate, ')
          ..write('totalBalance: $totalBalance, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $ProcedureChargeTable extends ProcedureCharge
    with drift.TableInfo<$ProcedureChargeTable, ProcedureChargeData> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProcedureChargeTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _chargeIdMeta =
      const drift.VerificationMeta('chargeId');
  @override
  late final drift.GeneratedColumn<int> chargeId = drift.GeneratedColumn<int>(
      'charge_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const drift.VerificationMeta _invoiceIdMeta =
      const drift.VerificationMeta('invoiceId');
  @override
  late final drift.GeneratedColumn<int> invoiceId = drift.GeneratedColumn<int>(
      'invoice_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES invoice (invoice_id)'));
  static const drift.VerificationMeta _procedureNameMeta =
      const drift.VerificationMeta('procedureName');
  @override
  late final drift.GeneratedColumn<String> procedureName =
      drift.GeneratedColumn<String>('procedure_name', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _procedureChargeMeta =
      const drift.VerificationMeta('procedureCharge');
  @override
  late final drift.GeneratedColumn<double> procedureCharge =
      drift.GeneratedColumn<double>('procedure_charge', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const drift.VerificationMeta _quantityMeta =
      const drift.VerificationMeta('quantity');
  @override
  late final drift.GeneratedColumn<int> quantity = drift.GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const drift.Constant(1));
  static const drift.VerificationMeta _totalProcedureChargeMeta =
      const drift.VerificationMeta('totalProcedureCharge');
  @override
  late final drift.GeneratedColumn<double> totalProcedureCharge =
      drift.GeneratedColumn<double>(
          'total_procedure_charge', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<drift.GeneratedColumn> get $columns => [
        chargeId,
        invoiceId,
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
  drift.VerificationContext validateIntegrity(
      drift.Insertable<ProcedureChargeData> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('charge_id')) {
      context.handle(_chargeIdMeta,
          chargeId.isAcceptableOrUnknown(data['charge_id']!, _chargeIdMeta));
    }
    if (data.containsKey('invoice_id')) {
      context.handle(_invoiceIdMeta,
          invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta));
    } else if (isInserting) {
      context.missing(_invoiceIdMeta);
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
  Set<drift.GeneratedColumn> get $primaryKey => {chargeId};
  @override
  ProcedureChargeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProcedureChargeData(
      chargeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}charge_id'])!,
      invoiceId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}invoice_id'])!,
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

class ProcedureChargeData extends drift.DataClass
    implements drift.Insertable<ProcedureChargeData> {
  final int chargeId;
  final int invoiceId;
  final String procedureName;
  final double procedureCharge;
  final int quantity;
  final double totalProcedureCharge;
  const ProcedureChargeData(
      {required this.chargeId,
      required this.invoiceId,
      required this.procedureName,
      required this.procedureCharge,
      required this.quantity,
      required this.totalProcedureCharge});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['charge_id'] = drift.Variable<int>(chargeId);
    map['invoice_id'] = drift.Variable<int>(invoiceId);
    map['procedure_name'] = drift.Variable<String>(procedureName);
    map['procedure_charge'] = drift.Variable<double>(procedureCharge);
    map['quantity'] = drift.Variable<int>(quantity);
    map['total_procedure_charge'] =
        drift.Variable<double>(totalProcedureCharge);
    return map;
  }

  ProcedureChargeCompanion toCompanion(bool nullToAbsent) {
    return ProcedureChargeCompanion(
      chargeId: drift.Value(chargeId),
      invoiceId: drift.Value(invoiceId),
      procedureName: drift.Value(procedureName),
      procedureCharge: drift.Value(procedureCharge),
      quantity: drift.Value(quantity),
      totalProcedureCharge: drift.Value(totalProcedureCharge),
    );
  }

  factory ProcedureChargeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return ProcedureChargeData(
      chargeId: serializer.fromJson<int>(json['chargeId']),
      invoiceId: serializer.fromJson<int>(json['invoiceId']),
      procedureName: serializer.fromJson<String>(json['procedureName']),
      procedureCharge: serializer.fromJson<double>(json['procedureCharge']),
      quantity: serializer.fromJson<int>(json['quantity']),
      totalProcedureCharge:
          serializer.fromJson<double>(json['totalProcedureCharge']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'chargeId': serializer.toJson<int>(chargeId),
      'invoiceId': serializer.toJson<int>(invoiceId),
      'procedureName': serializer.toJson<String>(procedureName),
      'procedureCharge': serializer.toJson<double>(procedureCharge),
      'quantity': serializer.toJson<int>(quantity),
      'totalProcedureCharge': serializer.toJson<double>(totalProcedureCharge),
    };
  }

  ProcedureChargeData copyWith(
          {int? chargeId,
          int? invoiceId,
          String? procedureName,
          double? procedureCharge,
          int? quantity,
          double? totalProcedureCharge}) =>
      ProcedureChargeData(
        chargeId: chargeId ?? this.chargeId,
        invoiceId: invoiceId ?? this.invoiceId,
        procedureName: procedureName ?? this.procedureName,
        procedureCharge: procedureCharge ?? this.procedureCharge,
        quantity: quantity ?? this.quantity,
        totalProcedureCharge: totalProcedureCharge ?? this.totalProcedureCharge,
      );
  ProcedureChargeData copyWithCompanion(ProcedureChargeCompanion data) {
    return ProcedureChargeData(
      chargeId: data.chargeId.present ? data.chargeId.value : this.chargeId,
      invoiceId: data.invoiceId.present ? data.invoiceId.value : this.invoiceId,
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
          ..write('invoiceId: $invoiceId, ')
          ..write('procedureName: $procedureName, ')
          ..write('procedureCharge: $procedureCharge, ')
          ..write('quantity: $quantity, ')
          ..write('totalProcedureCharge: $totalProcedureCharge')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(chargeId, invoiceId, procedureName,
      procedureCharge, quantity, totalProcedureCharge);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProcedureChargeData &&
          other.chargeId == this.chargeId &&
          other.invoiceId == this.invoiceId &&
          other.procedureName == this.procedureName &&
          other.procedureCharge == this.procedureCharge &&
          other.quantity == this.quantity &&
          other.totalProcedureCharge == this.totalProcedureCharge);
}

class ProcedureChargeCompanion
    extends drift.UpdateCompanion<ProcedureChargeData> {
  final drift.Value<int> chargeId;
  final drift.Value<int> invoiceId;
  final drift.Value<String> procedureName;
  final drift.Value<double> procedureCharge;
  final drift.Value<int> quantity;
  final drift.Value<double> totalProcedureCharge;
  const ProcedureChargeCompanion({
    this.chargeId = const drift.Value.absent(),
    this.invoiceId = const drift.Value.absent(),
    this.procedureName = const drift.Value.absent(),
    this.procedureCharge = const drift.Value.absent(),
    this.quantity = const drift.Value.absent(),
    this.totalProcedureCharge = const drift.Value.absent(),
  });
  ProcedureChargeCompanion.insert({
    this.chargeId = const drift.Value.absent(),
    required int invoiceId,
    required String procedureName,
    required double procedureCharge,
    this.quantity = const drift.Value.absent(),
    required double totalProcedureCharge,
  })  : invoiceId = drift.Value(invoiceId),
        procedureName = drift.Value(procedureName),
        procedureCharge = drift.Value(procedureCharge),
        totalProcedureCharge = drift.Value(totalProcedureCharge);
  static drift.Insertable<ProcedureChargeData> custom({
    drift.Expression<int>? chargeId,
    drift.Expression<int>? invoiceId,
    drift.Expression<String>? procedureName,
    drift.Expression<double>? procedureCharge,
    drift.Expression<int>? quantity,
    drift.Expression<double>? totalProcedureCharge,
  }) {
    return drift.RawValuesInsertable({
      if (chargeId != null) 'charge_id': chargeId,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (procedureName != null) 'procedure_name': procedureName,
      if (procedureCharge != null) 'procedure_charge': procedureCharge,
      if (quantity != null) 'quantity': quantity,
      if (totalProcedureCharge != null)
        'total_procedure_charge': totalProcedureCharge,
    });
  }

  ProcedureChargeCompanion copyWith(
      {drift.Value<int>? chargeId,
      drift.Value<int>? invoiceId,
      drift.Value<String>? procedureName,
      drift.Value<double>? procedureCharge,
      drift.Value<int>? quantity,
      drift.Value<double>? totalProcedureCharge}) {
    return ProcedureChargeCompanion(
      chargeId: chargeId ?? this.chargeId,
      invoiceId: invoiceId ?? this.invoiceId,
      procedureName: procedureName ?? this.procedureName,
      procedureCharge: procedureCharge ?? this.procedureCharge,
      quantity: quantity ?? this.quantity,
      totalProcedureCharge: totalProcedureCharge ?? this.totalProcedureCharge,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (chargeId.present) {
      map['charge_id'] = drift.Variable<int>(chargeId.value);
    }
    if (invoiceId.present) {
      map['invoice_id'] = drift.Variable<int>(invoiceId.value);
    }
    if (procedureName.present) {
      map['procedure_name'] = drift.Variable<String>(procedureName.value);
    }
    if (procedureCharge.present) {
      map['procedure_charge'] = drift.Variable<double>(procedureCharge.value);
    }
    if (quantity.present) {
      map['quantity'] = drift.Variable<int>(quantity.value);
    }
    if (totalProcedureCharge.present) {
      map['total_procedure_charge'] =
          drift.Variable<double>(totalProcedureCharge.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProcedureChargeCompanion(')
          ..write('chargeId: $chargeId, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('procedureName: $procedureName, ')
          ..write('procedureCharge: $procedureCharge, ')
          ..write('quantity: $quantity, ')
          ..write('totalProcedureCharge: $totalProcedureCharge')
          ..write(')'))
        .toString();
  }
}

class $PaymentTransactionTable extends PaymentTransaction
    with drift.TableInfo<$PaymentTransactionTable, PaymentTransactionData> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentTransactionTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _transactionIdMeta =
      const drift.VerificationMeta('transactionId');
  @override
  late final drift.GeneratedColumn<int> transactionId =
      drift.GeneratedColumn<int>('transaction_id', aliasedName, false,
          hasAutoIncrement: true,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultConstraints:
              GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const drift.VerificationMeta _invoiceIdMeta =
      const drift.VerificationMeta('invoiceId');
  @override
  late final drift.GeneratedColumn<int> invoiceId = drift.GeneratedColumn<int>(
      'invoice_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES invoice (invoice_id)'));
  static const drift.VerificationMeta _amountReceivedMeta =
      const drift.VerificationMeta('amountReceived');
  @override
  late final drift.GeneratedColumn<double> amountReceived =
      drift.GeneratedColumn<double>('amount_received', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const drift.VerificationMeta _modeOfPaymentMeta =
      const drift.VerificationMeta('modeOfPayment');
  @override
  late final drift.GeneratedColumn<String> modeOfPayment =
      drift.GeneratedColumn<String>('mode_of_payment', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _paymentDateMeta =
      const drift.VerificationMeta('paymentDate');
  @override
  late final drift.GeneratedColumn<DateTime> paymentDate =
      drift.GeneratedColumn<DateTime>('payment_date', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: drift.currentDateAndTime);
  @override
  List<drift.GeneratedColumn> get $columns =>
      [transactionId, invoiceId, amountReceived, modeOfPayment, paymentDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payment_transaction';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<PaymentTransactionData> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('transaction_id')) {
      context.handle(
          _transactionIdMeta,
          transactionId.isAcceptableOrUnknown(
              data['transaction_id']!, _transactionIdMeta));
    }
    if (data.containsKey('invoice_id')) {
      context.handle(_invoiceIdMeta,
          invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta));
    } else if (isInserting) {
      context.missing(_invoiceIdMeta);
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
  Set<drift.GeneratedColumn> get $primaryKey => {transactionId};
  @override
  PaymentTransactionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PaymentTransactionData(
      transactionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}transaction_id'])!,
      invoiceId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}invoice_id'])!,
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

class PaymentTransactionData extends drift.DataClass
    implements drift.Insertable<PaymentTransactionData> {
  final int transactionId;
  final int invoiceId;
  final double amountReceived;
  final String modeOfPayment;
  final DateTime paymentDate;
  const PaymentTransactionData(
      {required this.transactionId,
      required this.invoiceId,
      required this.amountReceived,
      required this.modeOfPayment,
      required this.paymentDate});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['transaction_id'] = drift.Variable<int>(transactionId);
    map['invoice_id'] = drift.Variable<int>(invoiceId);
    map['amount_received'] = drift.Variable<double>(amountReceived);
    map['mode_of_payment'] = drift.Variable<String>(modeOfPayment);
    map['payment_date'] = drift.Variable<DateTime>(paymentDate);
    return map;
  }

  PaymentTransactionCompanion toCompanion(bool nullToAbsent) {
    return PaymentTransactionCompanion(
      transactionId: drift.Value(transactionId),
      invoiceId: drift.Value(invoiceId),
      amountReceived: drift.Value(amountReceived),
      modeOfPayment: drift.Value(modeOfPayment),
      paymentDate: drift.Value(paymentDate),
    );
  }

  factory PaymentTransactionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return PaymentTransactionData(
      transactionId: serializer.fromJson<int>(json['transactionId']),
      invoiceId: serializer.fromJson<int>(json['invoiceId']),
      amountReceived: serializer.fromJson<double>(json['amountReceived']),
      modeOfPayment: serializer.fromJson<String>(json['modeOfPayment']),
      paymentDate: serializer.fromJson<DateTime>(json['paymentDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'transactionId': serializer.toJson<int>(transactionId),
      'invoiceId': serializer.toJson<int>(invoiceId),
      'amountReceived': serializer.toJson<double>(amountReceived),
      'modeOfPayment': serializer.toJson<String>(modeOfPayment),
      'paymentDate': serializer.toJson<DateTime>(paymentDate),
    };
  }

  PaymentTransactionData copyWith(
          {int? transactionId,
          int? invoiceId,
          double? amountReceived,
          String? modeOfPayment,
          DateTime? paymentDate}) =>
      PaymentTransactionData(
        transactionId: transactionId ?? this.transactionId,
        invoiceId: invoiceId ?? this.invoiceId,
        amountReceived: amountReceived ?? this.amountReceived,
        modeOfPayment: modeOfPayment ?? this.modeOfPayment,
        paymentDate: paymentDate ?? this.paymentDate,
      );
  PaymentTransactionData copyWithCompanion(PaymentTransactionCompanion data) {
    return PaymentTransactionData(
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      invoiceId: data.invoiceId.present ? data.invoiceId.value : this.invoiceId,
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
          ..write('invoiceId: $invoiceId, ')
          ..write('amountReceived: $amountReceived, ')
          ..write('modeOfPayment: $modeOfPayment, ')
          ..write('paymentDate: $paymentDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      transactionId, invoiceId, amountReceived, modeOfPayment, paymentDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaymentTransactionData &&
          other.transactionId == this.transactionId &&
          other.invoiceId == this.invoiceId &&
          other.amountReceived == this.amountReceived &&
          other.modeOfPayment == this.modeOfPayment &&
          other.paymentDate == this.paymentDate);
}

class PaymentTransactionCompanion
    extends drift.UpdateCompanion<PaymentTransactionData> {
  final drift.Value<int> transactionId;
  final drift.Value<int> invoiceId;
  final drift.Value<double> amountReceived;
  final drift.Value<String> modeOfPayment;
  final drift.Value<DateTime> paymentDate;
  const PaymentTransactionCompanion({
    this.transactionId = const drift.Value.absent(),
    this.invoiceId = const drift.Value.absent(),
    this.amountReceived = const drift.Value.absent(),
    this.modeOfPayment = const drift.Value.absent(),
    this.paymentDate = const drift.Value.absent(),
  });
  PaymentTransactionCompanion.insert({
    this.transactionId = const drift.Value.absent(),
    required int invoiceId,
    required double amountReceived,
    required String modeOfPayment,
    this.paymentDate = const drift.Value.absent(),
  })  : invoiceId = drift.Value(invoiceId),
        amountReceived = drift.Value(amountReceived),
        modeOfPayment = drift.Value(modeOfPayment);
  static drift.Insertable<PaymentTransactionData> custom({
    drift.Expression<int>? transactionId,
    drift.Expression<int>? invoiceId,
    drift.Expression<double>? amountReceived,
    drift.Expression<String>? modeOfPayment,
    drift.Expression<DateTime>? paymentDate,
  }) {
    return drift.RawValuesInsertable({
      if (transactionId != null) 'transaction_id': transactionId,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (amountReceived != null) 'amount_received': amountReceived,
      if (modeOfPayment != null) 'mode_of_payment': modeOfPayment,
      if (paymentDate != null) 'payment_date': paymentDate,
    });
  }

  PaymentTransactionCompanion copyWith(
      {drift.Value<int>? transactionId,
      drift.Value<int>? invoiceId,
      drift.Value<double>? amountReceived,
      drift.Value<String>? modeOfPayment,
      drift.Value<DateTime>? paymentDate}) {
    return PaymentTransactionCompanion(
      transactionId: transactionId ?? this.transactionId,
      invoiceId: invoiceId ?? this.invoiceId,
      amountReceived: amountReceived ?? this.amountReceived,
      modeOfPayment: modeOfPayment ?? this.modeOfPayment,
      paymentDate: paymentDate ?? this.paymentDate,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (transactionId.present) {
      map['transaction_id'] = drift.Variable<int>(transactionId.value);
    }
    if (invoiceId.present) {
      map['invoice_id'] = drift.Variable<int>(invoiceId.value);
    }
    if (amountReceived.present) {
      map['amount_received'] = drift.Variable<double>(amountReceived.value);
    }
    if (modeOfPayment.present) {
      map['mode_of_payment'] = drift.Variable<String>(modeOfPayment.value);
    }
    if (paymentDate.present) {
      map['payment_date'] = drift.Variable<DateTime>(paymentDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentTransactionCompanion(')
          ..write('transactionId: $transactionId, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('amountReceived: $amountReceived, ')
          ..write('modeOfPayment: $modeOfPayment, ')
          ..write('paymentDate: $paymentDate')
          ..write(')'))
        .toString();
  }
}

class $ClinicalRecordTable extends ClinicalRecord
    with drift.TableInfo<$ClinicalRecordTable, ClinicalRecordData> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClinicalRecordTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _recordIdMeta =
      const drift.VerificationMeta('recordId');
  @override
  late final drift.GeneratedColumn<int> recordId = drift.GeneratedColumn<int>(
      'record_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const drift.VerificationMeta _patientIdMeta =
      const drift.VerificationMeta('patientId');
  @override
  late final drift.GeneratedColumn<int> patientId = drift.GeneratedColumn<int>(
      'patient_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES patient (patient_id)'));
  static const drift.VerificationMeta _createdAtMeta =
      const drift.VerificationMeta('createdAt');
  @override
  late final drift.GeneratedColumn<DateTime> createdAt =
      drift.GeneratedColumn<DateTime>('created_at', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: drift.currentDateAndTime);
  static const drift.VerificationMeta _pastIllnessMeta =
      const drift.VerificationMeta('pastIllness');
  @override
  late final drift.GeneratedColumn<String> pastIllness =
      drift.GeneratedColumn<String>('past_illness', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _presentIllnessMeta =
      const drift.VerificationMeta('presentIllness');
  @override
  late final drift.GeneratedColumn<String> presentIllness =
      drift.GeneratedColumn<String>('present_illness', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _allergiesMeta =
      const drift.VerificationMeta('allergies');
  @override
  late final drift.GeneratedColumn<String> allergies =
      drift.GeneratedColumn<String>('allergies', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _currentMedicationMeta =
      const drift.VerificationMeta('currentMedication');
  @override
  late final drift.GeneratedColumn<String> currentMedication =
      drift.GeneratedColumn<String>('current_medication', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const drift.VerificationMeta _hasOralDebrisMeta =
      const drift.VerificationMeta('hasOralDebris');
  @override
  late final drift.GeneratedColumn<bool> hasOralDebris =
      drift.GeneratedColumn<bool>('has_oral_debris', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("has_oral_debris" IN (0, 1))'),
          defaultValue: const drift.Constant(false));
  static const drift.VerificationMeta _hasCalculusMeta =
      const drift.VerificationMeta('hasCalculus');
  @override
  late final drift.GeneratedColumn<bool> hasCalculus =
      drift.GeneratedColumn<bool>('has_calculus', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("has_calculus" IN (0, 1))'),
          defaultValue: const drift.Constant(false));
  static const drift.VerificationMeta _hasPeriodontalPocketMeta =
      const drift.VerificationMeta('hasPeriodontalPocket');
  @override
  late final drift.GeneratedColumn<bool> hasPeriodontalPocket =
      drift.GeneratedColumn<bool>('has_periodontal_pocket', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("has_periodontal_pocket" IN (0, 1))'),
          defaultValue: const drift.Constant(false));
  static const drift.VerificationMeta _hasGingivitisMeta =
      const drift.VerificationMeta('hasGingivitis');
  @override
  late final drift.GeneratedColumn<bool> hasGingivitis =
      drift.GeneratedColumn<bool>('has_gingivitis', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("has_gingivitis" IN (0, 1))'),
          defaultValue: const drift.Constant(false));
  static const drift.VerificationMeta _hasDentofacialAnomalyMeta =
      const drift.VerificationMeta('hasDentofacialAnomaly');
  @override
  late final drift.GeneratedColumn<bool> hasDentofacialAnomaly =
      drift.GeneratedColumn<bool>('has_dentofacial_anomaly', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("has_dentofacial_anomaly" IN (0, 1))'),
          defaultValue: const drift.Constant(false));
  static const drift.VerificationMeta _cariesForFillingMeta =
      const drift.VerificationMeta('cariesForFilling');
  @override
  late final drift.GeneratedColumn<int> cariesForFilling =
      drift.GeneratedColumn<int>('caries_for_filling', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultValue: const drift.Constant(0));
  static const drift.VerificationMeta _cariesForExtractionMeta =
      const drift.VerificationMeta('cariesForExtraction');
  @override
  late final drift.GeneratedColumn<int> cariesForExtraction =
      drift.GeneratedColumn<int>('caries_for_extraction', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultValue: const drift.Constant(0));
  static const drift.VerificationMeta _rootFragmentMeta =
      const drift.VerificationMeta('rootFragment');
  @override
  late final drift.GeneratedColumn<int> rootFragment =
      drift.GeneratedColumn<int>('root_fragment', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultValue: const drift.Constant(0));
  static const drift.VerificationMeta _missingDueToCariesMeta =
      const drift.VerificationMeta('missingDueToCaries');
  @override
  late final drift.GeneratedColumn<int> missingDueToCaries =
      drift.GeneratedColumn<int>('missing_due_to_caries', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultValue: const drift.Constant(0));
  static const drift.VerificationMeta _filledOrRestoredMeta =
      const drift.VerificationMeta('filledOrRestored');
  @override
  late final drift.GeneratedColumn<int> filledOrRestored =
      drift.GeneratedColumn<int>('filled_or_restored', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultValue: const drift.Constant(0));
  static const drift.VerificationMeta _clinicalNotesMeta =
      const drift.VerificationMeta('clinicalNotes');
  @override
  late final drift.GeneratedColumn<String> clinicalNotes =
      drift.GeneratedColumn<String>('clinical_notes', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<drift.GeneratedColumn> get $columns => [
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
  drift.VerificationContext validateIntegrity(
      drift.Insertable<ClinicalRecordData> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
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
  Set<drift.GeneratedColumn> get $primaryKey => {recordId};
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

class ClinicalRecordData extends drift.DataClass
    implements drift.Insertable<ClinicalRecordData> {
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
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['record_id'] = drift.Variable<int>(recordId);
    map['patient_id'] = drift.Variable<int>(patientId);
    map['created_at'] = drift.Variable<DateTime>(createdAt);
    if (!nullToAbsent || pastIllness != null) {
      map['past_illness'] = drift.Variable<String>(pastIllness);
    }
    if (!nullToAbsent || presentIllness != null) {
      map['present_illness'] = drift.Variable<String>(presentIllness);
    }
    if (!nullToAbsent || allergies != null) {
      map['allergies'] = drift.Variable<String>(allergies);
    }
    if (!nullToAbsent || currentMedication != null) {
      map['current_medication'] = drift.Variable<String>(currentMedication);
    }
    map['has_oral_debris'] = drift.Variable<bool>(hasOralDebris);
    map['has_calculus'] = drift.Variable<bool>(hasCalculus);
    map['has_periodontal_pocket'] = drift.Variable<bool>(hasPeriodontalPocket);
    map['has_gingivitis'] = drift.Variable<bool>(hasGingivitis);
    map['has_dentofacial_anomaly'] =
        drift.Variable<bool>(hasDentofacialAnomaly);
    map['caries_for_filling'] = drift.Variable<int>(cariesForFilling);
    map['caries_for_extraction'] = drift.Variable<int>(cariesForExtraction);
    map['root_fragment'] = drift.Variable<int>(rootFragment);
    map['missing_due_to_caries'] = drift.Variable<int>(missingDueToCaries);
    map['filled_or_restored'] = drift.Variable<int>(filledOrRestored);
    if (!nullToAbsent || clinicalNotes != null) {
      map['clinical_notes'] = drift.Variable<String>(clinicalNotes);
    }
    return map;
  }

  ClinicalRecordCompanion toCompanion(bool nullToAbsent) {
    return ClinicalRecordCompanion(
      recordId: drift.Value(recordId),
      patientId: drift.Value(patientId),
      createdAt: drift.Value(createdAt),
      pastIllness: pastIllness == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(pastIllness),
      presentIllness: presentIllness == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(presentIllness),
      allergies: allergies == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(allergies),
      currentMedication: currentMedication == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(currentMedication),
      hasOralDebris: drift.Value(hasOralDebris),
      hasCalculus: drift.Value(hasCalculus),
      hasPeriodontalPocket: drift.Value(hasPeriodontalPocket),
      hasGingivitis: drift.Value(hasGingivitis),
      hasDentofacialAnomaly: drift.Value(hasDentofacialAnomaly),
      cariesForFilling: drift.Value(cariesForFilling),
      cariesForExtraction: drift.Value(cariesForExtraction),
      rootFragment: drift.Value(rootFragment),
      missingDueToCaries: drift.Value(missingDueToCaries),
      filledOrRestored: drift.Value(filledOrRestored),
      clinicalNotes: clinicalNotes == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(clinicalNotes),
    );
  }

  factory ClinicalRecordData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
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
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
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
          drift.Value<String?> pastIllness = const drift.Value.absent(),
          drift.Value<String?> presentIllness = const drift.Value.absent(),
          drift.Value<String?> allergies = const drift.Value.absent(),
          drift.Value<String?> currentMedication = const drift.Value.absent(),
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
          drift.Value<String?> clinicalNotes = const drift.Value.absent()}) =>
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

class ClinicalRecordCompanion
    extends drift.UpdateCompanion<ClinicalRecordData> {
  final drift.Value<int> recordId;
  final drift.Value<int> patientId;
  final drift.Value<DateTime> createdAt;
  final drift.Value<String?> pastIllness;
  final drift.Value<String?> presentIllness;
  final drift.Value<String?> allergies;
  final drift.Value<String?> currentMedication;
  final drift.Value<bool> hasOralDebris;
  final drift.Value<bool> hasCalculus;
  final drift.Value<bool> hasPeriodontalPocket;
  final drift.Value<bool> hasGingivitis;
  final drift.Value<bool> hasDentofacialAnomaly;
  final drift.Value<int> cariesForFilling;
  final drift.Value<int> cariesForExtraction;
  final drift.Value<int> rootFragment;
  final drift.Value<int> missingDueToCaries;
  final drift.Value<int> filledOrRestored;
  final drift.Value<String?> clinicalNotes;
  const ClinicalRecordCompanion({
    this.recordId = const drift.Value.absent(),
    this.patientId = const drift.Value.absent(),
    this.createdAt = const drift.Value.absent(),
    this.pastIllness = const drift.Value.absent(),
    this.presentIllness = const drift.Value.absent(),
    this.allergies = const drift.Value.absent(),
    this.currentMedication = const drift.Value.absent(),
    this.hasOralDebris = const drift.Value.absent(),
    this.hasCalculus = const drift.Value.absent(),
    this.hasPeriodontalPocket = const drift.Value.absent(),
    this.hasGingivitis = const drift.Value.absent(),
    this.hasDentofacialAnomaly = const drift.Value.absent(),
    this.cariesForFilling = const drift.Value.absent(),
    this.cariesForExtraction = const drift.Value.absent(),
    this.rootFragment = const drift.Value.absent(),
    this.missingDueToCaries = const drift.Value.absent(),
    this.filledOrRestored = const drift.Value.absent(),
    this.clinicalNotes = const drift.Value.absent(),
  });
  ClinicalRecordCompanion.insert({
    this.recordId = const drift.Value.absent(),
    required int patientId,
    this.createdAt = const drift.Value.absent(),
    this.pastIllness = const drift.Value.absent(),
    this.presentIllness = const drift.Value.absent(),
    this.allergies = const drift.Value.absent(),
    this.currentMedication = const drift.Value.absent(),
    this.hasOralDebris = const drift.Value.absent(),
    this.hasCalculus = const drift.Value.absent(),
    this.hasPeriodontalPocket = const drift.Value.absent(),
    this.hasGingivitis = const drift.Value.absent(),
    this.hasDentofacialAnomaly = const drift.Value.absent(),
    this.cariesForFilling = const drift.Value.absent(),
    this.cariesForExtraction = const drift.Value.absent(),
    this.rootFragment = const drift.Value.absent(),
    this.missingDueToCaries = const drift.Value.absent(),
    this.filledOrRestored = const drift.Value.absent(),
    this.clinicalNotes = const drift.Value.absent(),
  }) : patientId = drift.Value(patientId);
  static drift.Insertable<ClinicalRecordData> custom({
    drift.Expression<int>? recordId,
    drift.Expression<int>? patientId,
    drift.Expression<DateTime>? createdAt,
    drift.Expression<String>? pastIllness,
    drift.Expression<String>? presentIllness,
    drift.Expression<String>? allergies,
    drift.Expression<String>? currentMedication,
    drift.Expression<bool>? hasOralDebris,
    drift.Expression<bool>? hasCalculus,
    drift.Expression<bool>? hasPeriodontalPocket,
    drift.Expression<bool>? hasGingivitis,
    drift.Expression<bool>? hasDentofacialAnomaly,
    drift.Expression<int>? cariesForFilling,
    drift.Expression<int>? cariesForExtraction,
    drift.Expression<int>? rootFragment,
    drift.Expression<int>? missingDueToCaries,
    drift.Expression<int>? filledOrRestored,
    drift.Expression<String>? clinicalNotes,
  }) {
    return drift.RawValuesInsertable({
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
      {drift.Value<int>? recordId,
      drift.Value<int>? patientId,
      drift.Value<DateTime>? createdAt,
      drift.Value<String?>? pastIllness,
      drift.Value<String?>? presentIllness,
      drift.Value<String?>? allergies,
      drift.Value<String?>? currentMedication,
      drift.Value<bool>? hasOralDebris,
      drift.Value<bool>? hasCalculus,
      drift.Value<bool>? hasPeriodontalPocket,
      drift.Value<bool>? hasGingivitis,
      drift.Value<bool>? hasDentofacialAnomaly,
      drift.Value<int>? cariesForFilling,
      drift.Value<int>? cariesForExtraction,
      drift.Value<int>? rootFragment,
      drift.Value<int>? missingDueToCaries,
      drift.Value<int>? filledOrRestored,
      drift.Value<String?>? clinicalNotes}) {
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
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (recordId.present) {
      map['record_id'] = drift.Variable<int>(recordId.value);
    }
    if (patientId.present) {
      map['patient_id'] = drift.Variable<int>(patientId.value);
    }
    if (createdAt.present) {
      map['created_at'] = drift.Variable<DateTime>(createdAt.value);
    }
    if (pastIllness.present) {
      map['past_illness'] = drift.Variable<String>(pastIllness.value);
    }
    if (presentIllness.present) {
      map['present_illness'] = drift.Variable<String>(presentIllness.value);
    }
    if (allergies.present) {
      map['allergies'] = drift.Variable<String>(allergies.value);
    }
    if (currentMedication.present) {
      map['current_medication'] =
          drift.Variable<String>(currentMedication.value);
    }
    if (hasOralDebris.present) {
      map['has_oral_debris'] = drift.Variable<bool>(hasOralDebris.value);
    }
    if (hasCalculus.present) {
      map['has_calculus'] = drift.Variable<bool>(hasCalculus.value);
    }
    if (hasPeriodontalPocket.present) {
      map['has_periodontal_pocket'] =
          drift.Variable<bool>(hasPeriodontalPocket.value);
    }
    if (hasGingivitis.present) {
      map['has_gingivitis'] = drift.Variable<bool>(hasGingivitis.value);
    }
    if (hasDentofacialAnomaly.present) {
      map['has_dentofacial_anomaly'] =
          drift.Variable<bool>(hasDentofacialAnomaly.value);
    }
    if (cariesForFilling.present) {
      map['caries_for_filling'] = drift.Variable<int>(cariesForFilling.value);
    }
    if (cariesForExtraction.present) {
      map['caries_for_extraction'] =
          drift.Variable<int>(cariesForExtraction.value);
    }
    if (rootFragment.present) {
      map['root_fragment'] = drift.Variable<int>(rootFragment.value);
    }
    if (missingDueToCaries.present) {
      map['missing_due_to_caries'] =
          drift.Variable<int>(missingDueToCaries.value);
    }
    if (filledOrRestored.present) {
      map['filled_or_restored'] = drift.Variable<int>(filledOrRestored.value);
    }
    if (clinicalNotes.present) {
      map['clinical_notes'] = drift.Variable<String>(clinicalNotes.value);
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

abstract class _$AppDatabase extends drift.GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PatientTable patient = $PatientTable(this);
  late final $ClinicalStaffTable clinicalStaff = $ClinicalStaffTable(this);
  late final $AppointmentTable appointment = $AppointmentTable(this);
  late final $InvoiceTable invoice = $InvoiceTable(this);
  late final $ProcedureChargeTable procedureCharge =
      $ProcedureChargeTable(this);
  late final $PaymentTransactionTable paymentTransaction =
      $PaymentTransactionTable(this);
  late final $ClinicalRecordTable clinicalRecord = $ClinicalRecordTable(this);
  @override
  Iterable<drift.TableInfo<drift.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<drift.TableInfo<drift.Table, Object?>>();
  @override
  List<drift.DatabaseSchemaEntity> get allSchemaEntities => [
        patient,
        clinicalStaff,
        appointment,
        invoice,
        procedureCharge,
        paymentTransaction,
        clinicalRecord
      ];
}

typedef $$PatientTableCreateCompanionBuilder = PatientCompanion Function({
  drift.Value<int> patientId,
  required String firstName,
  drift.Value<String?> middleName,
  required String lastName,
  drift.Value<String?> suffix,
  required DateTime birthDate,
  required String sex,
  required String civilStatus,
  required String contactNumber,
  drift.Value<String?> emergencyContactNo,
  drift.Value<String?> referredBy,
  drift.Value<String?> relationship,
  drift.Value<String?> relationshipEmergency,
  required String streetAddress,
  required String barangay,
  required String cityMunicipality,
  required String province,
  drift.Value<String?> zipCode,
  drift.Value<bool> isArchived,
  drift.Value<bool> isSeniorOrPWD,
  required DateTime createdAt,
  required DateTime updatedAt,
});
typedef $$PatientTableUpdateCompanionBuilder = PatientCompanion Function({
  drift.Value<int> patientId,
  drift.Value<String> firstName,
  drift.Value<String?> middleName,
  drift.Value<String> lastName,
  drift.Value<String?> suffix,
  drift.Value<DateTime> birthDate,
  drift.Value<String> sex,
  drift.Value<String> civilStatus,
  drift.Value<String> contactNumber,
  drift.Value<String?> emergencyContactNo,
  drift.Value<String?> referredBy,
  drift.Value<String?> relationship,
  drift.Value<String?> relationshipEmergency,
  drift.Value<String> streetAddress,
  drift.Value<String> barangay,
  drift.Value<String> cityMunicipality,
  drift.Value<String> province,
  drift.Value<String?> zipCode,
  drift.Value<bool> isArchived,
  drift.Value<bool> isSeniorOrPWD,
  drift.Value<DateTime> createdAt,
  drift.Value<DateTime> updatedAt,
});

final class $$PatientTableReferences
    extends drift.BaseReferences<_$AppDatabase, $PatientTable, PatientData> {
  $$PatientTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static drift.MultiTypedResultKey<$AppointmentTable, List<AppointmentData>>
      _appointmentRefsTable(_$AppDatabase db) =>
          drift.MultiTypedResultKey.fromTable(db.appointment,
              aliasName: drift.$_aliasNameGenerator(
                  db.patient.patientId, db.appointment.patientId));

  $$AppointmentTableProcessedTableManager get appointmentRefs {
    final manager = $$AppointmentTableTableManager($_db, $_db.appointment)
        .filter((f) =>
            f.patientId.patientId.sqlEquals($_itemColumn<int>('patient_id')!));

    final cache = $_typedResult.readTableOrNull(_appointmentRefsTable($_db));
    return drift.ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static drift.MultiTypedResultKey<$InvoiceTable, List<InvoiceData>>
      _invoiceRefsTable(_$AppDatabase db) =>
          drift.MultiTypedResultKey.fromTable(db.invoice,
              aliasName: drift.$_aliasNameGenerator(
                  db.patient.patientId, db.invoice.patientId));

  $$InvoiceTableProcessedTableManager get invoiceRefs {
    final manager = $$InvoiceTableTableManager($_db, $_db.invoice).filter((f) =>
        f.patientId.patientId.sqlEquals($_itemColumn<int>('patient_id')!));

    final cache = $_typedResult.readTableOrNull(_invoiceRefsTable($_db));
    return drift.ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static drift
      .MultiTypedResultKey<$ClinicalRecordTable, List<ClinicalRecordData>>
      _clinicalRecordRefsTable(_$AppDatabase db) =>
          drift.MultiTypedResultKey.fromTable(db.clinicalRecord,
              aliasName: drift.$_aliasNameGenerator(
                  db.patient.patientId, db.clinicalRecord.patientId));

  $$ClinicalRecordTableProcessedTableManager get clinicalRecordRefs {
    final manager = $$ClinicalRecordTableTableManager($_db, $_db.clinicalRecord)
        .filter((f) =>
            f.patientId.patientId.sqlEquals($_itemColumn<int>('patient_id')!));

    final cache = $_typedResult.readTableOrNull(_clinicalRecordRefsTable($_db));
    return drift.ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PatientTableFilterComposer
    extends drift.Composer<_$AppDatabase, $PatientTable> {
  $$PatientTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<int> get patientId => $composableBuilder(
      column: $table.patientId,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get middleName => $composableBuilder(
      column: $table.middleName,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get suffix => $composableBuilder(
      column: $table.suffix, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get birthDate => $composableBuilder(
      column: $table.birthDate,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get sex => $composableBuilder(
      column: $table.sex, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get civilStatus => $composableBuilder(
      column: $table.civilStatus,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get contactNumber => $composableBuilder(
      column: $table.contactNumber,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get emergencyContactNo => $composableBuilder(
      column: $table.emergencyContactNo,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get referredBy => $composableBuilder(
      column: $table.referredBy,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get relationship => $composableBuilder(
      column: $table.relationship,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get relationshipEmergency => $composableBuilder(
      column: $table.relationshipEmergency,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get streetAddress => $composableBuilder(
      column: $table.streetAddress,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get barangay => $composableBuilder(
      column: $table.barangay,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get cityMunicipality => $composableBuilder(
      column: $table.cityMunicipality,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get province => $composableBuilder(
      column: $table.province,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get zipCode => $composableBuilder(
      column: $table.zipCode, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get isArchived => $composableBuilder(
      column: $table.isArchived,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get isSeniorOrPWD => $composableBuilder(
      column: $table.isSeniorOrPWD,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt,
      builder: (column) => drift.ColumnFilters(column));

  drift.Expression<bool> appointmentRefs(
      drift.Expression<bool> Function($$AppointmentTableFilterComposer f) f) {
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

  drift.Expression<bool> invoiceRefs(
      drift.Expression<bool> Function($$InvoiceTableFilterComposer f) f) {
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

  drift.Expression<bool> clinicalRecordRefs(
      drift.Expression<bool> Function($$ClinicalRecordTableFilterComposer f)
          f) {
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
    extends drift.Composer<_$AppDatabase, $PatientTable> {
  $$PatientTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<int> get patientId => $composableBuilder(
      column: $table.patientId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get middleName => $composableBuilder(
      column: $table.middleName,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get suffix => $composableBuilder(
      column: $table.suffix,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get birthDate => $composableBuilder(
      column: $table.birthDate,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get sex => $composableBuilder(
      column: $table.sex, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get civilStatus => $composableBuilder(
      column: $table.civilStatus,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get contactNumber => $composableBuilder(
      column: $table.contactNumber,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get emergencyContactNo => $composableBuilder(
      column: $table.emergencyContactNo,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get referredBy => $composableBuilder(
      column: $table.referredBy,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get relationship => $composableBuilder(
      column: $table.relationship,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get relationshipEmergency => $composableBuilder(
      column: $table.relationshipEmergency,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get streetAddress => $composableBuilder(
      column: $table.streetAddress,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get barangay => $composableBuilder(
      column: $table.barangay,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get cityMunicipality => $composableBuilder(
      column: $table.cityMunicipality,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get province => $composableBuilder(
      column: $table.province,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get zipCode => $composableBuilder(
      column: $table.zipCode,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get isArchived => $composableBuilder(
      column: $table.isArchived,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get isSeniorOrPWD => $composableBuilder(
      column: $table.isSeniorOrPWD,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$PatientTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $PatientTable> {
  $$PatientTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<int> get patientId =>
      $composableBuilder(column: $table.patientId, builder: (column) => column);

  drift.GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  drift.GeneratedColumn<String> get middleName => $composableBuilder(
      column: $table.middleName, builder: (column) => column);

  drift.GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  drift.GeneratedColumn<String> get suffix =>
      $composableBuilder(column: $table.suffix, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get birthDate =>
      $composableBuilder(column: $table.birthDate, builder: (column) => column);

  drift.GeneratedColumn<String> get sex =>
      $composableBuilder(column: $table.sex, builder: (column) => column);

  drift.GeneratedColumn<String> get civilStatus => $composableBuilder(
      column: $table.civilStatus, builder: (column) => column);

  drift.GeneratedColumn<String> get contactNumber => $composableBuilder(
      column: $table.contactNumber, builder: (column) => column);

  drift.GeneratedColumn<String> get emergencyContactNo => $composableBuilder(
      column: $table.emergencyContactNo, builder: (column) => column);

  drift.GeneratedColumn<String> get referredBy => $composableBuilder(
      column: $table.referredBy, builder: (column) => column);

  drift.GeneratedColumn<String> get relationship => $composableBuilder(
      column: $table.relationship, builder: (column) => column);

  drift.GeneratedColumn<String> get relationshipEmergency => $composableBuilder(
      column: $table.relationshipEmergency, builder: (column) => column);

  drift.GeneratedColumn<String> get streetAddress => $composableBuilder(
      column: $table.streetAddress, builder: (column) => column);

  drift.GeneratedColumn<String> get barangay =>
      $composableBuilder(column: $table.barangay, builder: (column) => column);

  drift.GeneratedColumn<String> get cityMunicipality => $composableBuilder(
      column: $table.cityMunicipality, builder: (column) => column);

  drift.GeneratedColumn<String> get province =>
      $composableBuilder(column: $table.province, builder: (column) => column);

  drift.GeneratedColumn<String> get zipCode =>
      $composableBuilder(column: $table.zipCode, builder: (column) => column);

  drift.GeneratedColumn<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => column);

  drift.GeneratedColumn<bool> get isSeniorOrPWD => $composableBuilder(
      column: $table.isSeniorOrPWD, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  drift.Expression<T> appointmentRefs<T extends Object>(
      drift.Expression<T> Function($$AppointmentTableAnnotationComposer a) f) {
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

  drift.Expression<T> invoiceRefs<T extends Object>(
      drift.Expression<T> Function($$InvoiceTableAnnotationComposer a) f) {
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

  drift.Expression<T> clinicalRecordRefs<T extends Object>(
      drift.Expression<T> Function($$ClinicalRecordTableAnnotationComposer a)
          f) {
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

class $$PatientTableTableManager extends drift.RootTableManager<
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
    drift.PrefetchHooks Function(
        {bool appointmentRefs, bool invoiceRefs, bool clinicalRecordRefs})> {
  $$PatientTableTableManager(_$AppDatabase db, $PatientTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PatientTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PatientTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PatientTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<int> patientId = const drift.Value.absent(),
            drift.Value<String> firstName = const drift.Value.absent(),
            drift.Value<String?> middleName = const drift.Value.absent(),
            drift.Value<String> lastName = const drift.Value.absent(),
            drift.Value<String?> suffix = const drift.Value.absent(),
            drift.Value<DateTime> birthDate = const drift.Value.absent(),
            drift.Value<String> sex = const drift.Value.absent(),
            drift.Value<String> civilStatus = const drift.Value.absent(),
            drift.Value<String> contactNumber = const drift.Value.absent(),
            drift.Value<String?> emergencyContactNo =
                const drift.Value.absent(),
            drift.Value<String?> referredBy = const drift.Value.absent(),
            drift.Value<String?> relationship = const drift.Value.absent(),
            drift.Value<String?> relationshipEmergency =
                const drift.Value.absent(),
            drift.Value<String> streetAddress = const drift.Value.absent(),
            drift.Value<String> barangay = const drift.Value.absent(),
            drift.Value<String> cityMunicipality = const drift.Value.absent(),
            drift.Value<String> province = const drift.Value.absent(),
            drift.Value<String?> zipCode = const drift.Value.absent(),
            drift.Value<bool> isArchived = const drift.Value.absent(),
            drift.Value<bool> isSeniorOrPWD = const drift.Value.absent(),
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<DateTime> updatedAt = const drift.Value.absent(),
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
            drift.Value<int> patientId = const drift.Value.absent(),
            required String firstName,
            drift.Value<String?> middleName = const drift.Value.absent(),
            required String lastName,
            drift.Value<String?> suffix = const drift.Value.absent(),
            required DateTime birthDate,
            required String sex,
            required String civilStatus,
            required String contactNumber,
            drift.Value<String?> emergencyContactNo =
                const drift.Value.absent(),
            drift.Value<String?> referredBy = const drift.Value.absent(),
            drift.Value<String?> relationship = const drift.Value.absent(),
            drift.Value<String?> relationshipEmergency =
                const drift.Value.absent(),
            required String streetAddress,
            required String barangay,
            required String cityMunicipality,
            required String province,
            drift.Value<String?> zipCode = const drift.Value.absent(),
            drift.Value<bool> isArchived = const drift.Value.absent(),
            drift.Value<bool> isSeniorOrPWD = const drift.Value.absent(),
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
            return drift.PrefetchHooks(
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
                    await drift.$_getPrefetchedData<PatientData, $PatientTable,
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
                    await drift.$_getPrefetchedData<PatientData, $PatientTable,
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
                    await drift.$_getPrefetchedData<PatientData, $PatientTable,
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

typedef $$PatientTableProcessedTableManager = drift.ProcessedTableManager<
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
    drift.PrefetchHooks Function(
        {bool appointmentRefs, bool invoiceRefs, bool clinicalRecordRefs})>;
typedef $$ClinicalStaffTableCreateCompanionBuilder = ClinicalStaffCompanion
    Function({
  required int staffId,
  required String firstName,
  drift.Value<String?> middleName,
  required String lastName,
  required String pin,
  drift.Value<bool> isLockedOut,
  drift.Value<int> failedAttempts,
  drift.Value<int> lockoutTier,
  drift.Value<DateTime?> lockoutUntil,
  drift.Value<int> rowid,
});
typedef $$ClinicalStaffTableUpdateCompanionBuilder = ClinicalStaffCompanion
    Function({
  drift.Value<int> staffId,
  drift.Value<String> firstName,
  drift.Value<String?> middleName,
  drift.Value<String> lastName,
  drift.Value<String> pin,
  drift.Value<bool> isLockedOut,
  drift.Value<int> failedAttempts,
  drift.Value<int> lockoutTier,
  drift.Value<DateTime?> lockoutUntil,
  drift.Value<int> rowid,
});

final class $$ClinicalStaffTableReferences extends drift
    .BaseReferences<_$AppDatabase, $ClinicalStaffTable, ClinicalStaffData> {
  $$ClinicalStaffTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static drift.MultiTypedResultKey<$AppointmentTable, List<AppointmentData>>
      _appointmentRefsTable(_$AppDatabase db) =>
          drift.MultiTypedResultKey.fromTable(db.appointment,
              aliasName: drift.$_aliasNameGenerator(
                  db.clinicalStaff.staffId, db.appointment.staffId));

  $$AppointmentTableProcessedTableManager get appointmentRefs {
    final manager = $$AppointmentTableTableManager($_db, $_db.appointment)
        .filter(
            (f) => f.staffId.staffId.sqlEquals($_itemColumn<int>('staff_id')!));

    final cache = $_typedResult.readTableOrNull(_appointmentRefsTable($_db));
    return drift.ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ClinicalStaffTableFilterComposer
    extends drift.Composer<_$AppDatabase, $ClinicalStaffTable> {
  $$ClinicalStaffTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<int> get staffId => $composableBuilder(
      column: $table.staffId, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get middleName => $composableBuilder(
      column: $table.middleName,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get pin => $composableBuilder(
      column: $table.pin, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get isLockedOut => $composableBuilder(
      column: $table.isLockedOut,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<int> get failedAttempts => $composableBuilder(
      column: $table.failedAttempts,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<int> get lockoutTier => $composableBuilder(
      column: $table.lockoutTier,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get lockoutUntil => $composableBuilder(
      column: $table.lockoutUntil,
      builder: (column) => drift.ColumnFilters(column));

  drift.Expression<bool> appointmentRefs(
      drift.Expression<bool> Function($$AppointmentTableFilterComposer f) f) {
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
    extends drift.Composer<_$AppDatabase, $ClinicalStaffTable> {
  $$ClinicalStaffTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<int> get staffId => $composableBuilder(
      column: $table.staffId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get middleName => $composableBuilder(
      column: $table.middleName,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get pin => $composableBuilder(
      column: $table.pin, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get isLockedOut => $composableBuilder(
      column: $table.isLockedOut,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<int> get failedAttempts => $composableBuilder(
      column: $table.failedAttempts,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<int> get lockoutTier => $composableBuilder(
      column: $table.lockoutTier,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get lockoutUntil => $composableBuilder(
      column: $table.lockoutUntil,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$ClinicalStaffTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $ClinicalStaffTable> {
  $$ClinicalStaffTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<int> get staffId =>
      $composableBuilder(column: $table.staffId, builder: (column) => column);

  drift.GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  drift.GeneratedColumn<String> get middleName => $composableBuilder(
      column: $table.middleName, builder: (column) => column);

  drift.GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  drift.GeneratedColumn<String> get pin =>
      $composableBuilder(column: $table.pin, builder: (column) => column);

  drift.GeneratedColumn<bool> get isLockedOut => $composableBuilder(
      column: $table.isLockedOut, builder: (column) => column);

  drift.GeneratedColumn<int> get failedAttempts => $composableBuilder(
      column: $table.failedAttempts, builder: (column) => column);

  drift.GeneratedColumn<int> get lockoutTier => $composableBuilder(
      column: $table.lockoutTier, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get lockoutUntil => $composableBuilder(
      column: $table.lockoutUntil, builder: (column) => column);

  drift.Expression<T> appointmentRefs<T extends Object>(
      drift.Expression<T> Function($$AppointmentTableAnnotationComposer a) f) {
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

class $$ClinicalStaffTableTableManager extends drift.RootTableManager<
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
    drift.PrefetchHooks Function({bool appointmentRefs})> {
  $$ClinicalStaffTableTableManager(_$AppDatabase db, $ClinicalStaffTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClinicalStaffTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClinicalStaffTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClinicalStaffTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<int> staffId = const drift.Value.absent(),
            drift.Value<String> firstName = const drift.Value.absent(),
            drift.Value<String?> middleName = const drift.Value.absent(),
            drift.Value<String> lastName = const drift.Value.absent(),
            drift.Value<String> pin = const drift.Value.absent(),
            drift.Value<bool> isLockedOut = const drift.Value.absent(),
            drift.Value<int> failedAttempts = const drift.Value.absent(),
            drift.Value<int> lockoutTier = const drift.Value.absent(),
            drift.Value<DateTime?> lockoutUntil = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              ClinicalStaffCompanion(
            staffId: staffId,
            firstName: firstName,
            middleName: middleName,
            lastName: lastName,
            pin: pin,
            isLockedOut: isLockedOut,
            failedAttempts: failedAttempts,
            lockoutTier: lockoutTier,
            lockoutUntil: lockoutUntil,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int staffId,
            required String firstName,
            drift.Value<String?> middleName = const drift.Value.absent(),
            required String lastName,
            required String pin,
            drift.Value<bool> isLockedOut = const drift.Value.absent(),
            drift.Value<int> failedAttempts = const drift.Value.absent(),
            drift.Value<int> lockoutTier = const drift.Value.absent(),
            drift.Value<DateTime?> lockoutUntil = const drift.Value.absent(),
            drift.Value<int> rowid = const drift.Value.absent(),
          }) =>
              ClinicalStaffCompanion.insert(
            staffId: staffId,
            firstName: firstName,
            middleName: middleName,
            lastName: lastName,
            pin: pin,
            isLockedOut: isLockedOut,
            failedAttempts: failedAttempts,
            lockoutTier: lockoutTier,
            lockoutUntil: lockoutUntil,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ClinicalStaffTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({appointmentRefs = false}) {
            return drift.PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (appointmentRefs) db.appointment],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (appointmentRefs)
                    await drift.$_getPrefetchedData<ClinicalStaffData,
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

typedef $$ClinicalStaffTableProcessedTableManager = drift.ProcessedTableManager<
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
    drift.PrefetchHooks Function({bool appointmentRefs})>;
typedef $$AppointmentTableCreateCompanionBuilder = AppointmentCompanion
    Function({
  drift.Value<int> appointmentId,
  required int patientId,
  drift.Value<int?> staffId,
  required DateTime scheduleDateTime,
  required String reasonForVisit,
  drift.Value<String> status,
  required String timeSlot,
});
typedef $$AppointmentTableUpdateCompanionBuilder = AppointmentCompanion
    Function({
  drift.Value<int> appointmentId,
  drift.Value<int> patientId,
  drift.Value<int?> staffId,
  drift.Value<DateTime> scheduleDateTime,
  drift.Value<String> reasonForVisit,
  drift.Value<String> status,
  drift.Value<String> timeSlot,
});

final class $$AppointmentTableReferences extends drift
    .BaseReferences<_$AppDatabase, $AppointmentTable, AppointmentData> {
  $$AppointmentTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PatientTable _patientIdTable(_$AppDatabase db) =>
      db.patient.createAlias(drift.$_aliasNameGenerator(
          db.appointment.patientId, db.patient.patientId));

  $$PatientTableProcessedTableManager get patientId {
    final $_column = $_itemColumn<int>('patient_id')!;

    final manager = $$PatientTableTableManager($_db, $_db.patient)
        .filter((f) => f.patientId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_patientIdTable($_db));
    if (item == null) return manager;
    return drift.ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ClinicalStaffTable _staffIdTable(_$AppDatabase db) =>
      db.clinicalStaff.createAlias(drift.$_aliasNameGenerator(
          db.appointment.staffId, db.clinicalStaff.staffId));

  $$ClinicalStaffTableProcessedTableManager? get staffId {
    final $_column = $_itemColumn<int>('staff_id');
    if ($_column == null) return null;
    final manager = $$ClinicalStaffTableTableManager($_db, $_db.clinicalStaff)
        .filter((f) => f.staffId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_staffIdTable($_db));
    if (item == null) return manager;
    return drift.ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$AppointmentTableFilterComposer
    extends drift.Composer<_$AppDatabase, $AppointmentTable> {
  $$AppointmentTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<int> get appointmentId => $composableBuilder(
      column: $table.appointmentId,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get scheduleDateTime => $composableBuilder(
      column: $table.scheduleDateTime,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get reasonForVisit => $composableBuilder(
      column: $table.reasonForVisit,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get timeSlot => $composableBuilder(
      column: $table.timeSlot,
      builder: (column) => drift.ColumnFilters(column));

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
    extends drift.Composer<_$AppDatabase, $AppointmentTable> {
  $$AppointmentTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<int> get appointmentId => $composableBuilder(
      column: $table.appointmentId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get scheduleDateTime => $composableBuilder(
      column: $table.scheduleDateTime,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get reasonForVisit => $composableBuilder(
      column: $table.reasonForVisit,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get timeSlot => $composableBuilder(
      column: $table.timeSlot,
      builder: (column) => drift.ColumnOrderings(column));

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
    extends drift.Composer<_$AppDatabase, $AppointmentTable> {
  $$AppointmentTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<int> get appointmentId => $composableBuilder(
      column: $table.appointmentId, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get scheduleDateTime => $composableBuilder(
      column: $table.scheduleDateTime, builder: (column) => column);

  drift.GeneratedColumn<String> get reasonForVisit => $composableBuilder(
      column: $table.reasonForVisit, builder: (column) => column);

  drift.GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  drift.GeneratedColumn<String> get timeSlot =>
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

class $$AppointmentTableTableManager extends drift.RootTableManager<
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
    drift.PrefetchHooks Function({bool patientId, bool staffId})> {
  $$AppointmentTableTableManager(_$AppDatabase db, $AppointmentTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppointmentTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppointmentTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppointmentTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<int> appointmentId = const drift.Value.absent(),
            drift.Value<int> patientId = const drift.Value.absent(),
            drift.Value<int?> staffId = const drift.Value.absent(),
            drift.Value<DateTime> scheduleDateTime = const drift.Value.absent(),
            drift.Value<String> reasonForVisit = const drift.Value.absent(),
            drift.Value<String> status = const drift.Value.absent(),
            drift.Value<String> timeSlot = const drift.Value.absent(),
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
            drift.Value<int> appointmentId = const drift.Value.absent(),
            required int patientId,
            drift.Value<int?> staffId = const drift.Value.absent(),
            required DateTime scheduleDateTime,
            required String reasonForVisit,
            drift.Value<String> status = const drift.Value.absent(),
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
            return drift.PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends drift.TableManagerState<
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

typedef $$AppointmentTableProcessedTableManager = drift.ProcessedTableManager<
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
    drift.PrefetchHooks Function({bool patientId, bool staffId})>;
typedef $$InvoiceTableCreateCompanionBuilder = InvoiceCompanion Function({
  drift.Value<int> invoiceId,
  required int patientId,
  drift.Value<DateTime> issuedDate,
  required double totalBalance,
  required String status,
});
typedef $$InvoiceTableUpdateCompanionBuilder = InvoiceCompanion Function({
  drift.Value<int> invoiceId,
  drift.Value<int> patientId,
  drift.Value<DateTime> issuedDate,
  drift.Value<double> totalBalance,
  drift.Value<String> status,
});

final class $$InvoiceTableReferences
    extends drift.BaseReferences<_$AppDatabase, $InvoiceTable, InvoiceData> {
  $$InvoiceTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PatientTable _patientIdTable(_$AppDatabase db) =>
      db.patient.createAlias(drift.$_aliasNameGenerator(
          db.invoice.patientId, db.patient.patientId));

  $$PatientTableProcessedTableManager get patientId {
    final $_column = $_itemColumn<int>('patient_id')!;

    final manager = $$PatientTableTableManager($_db, $_db.patient)
        .filter((f) => f.patientId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_patientIdTable($_db));
    if (item == null) return manager;
    return drift.ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static drift
      .MultiTypedResultKey<$ProcedureChargeTable, List<ProcedureChargeData>>
      _procedureChargeRefsTable(_$AppDatabase db) =>
          drift.MultiTypedResultKey.fromTable(db.procedureCharge,
              aliasName: drift.$_aliasNameGenerator(
                  db.invoice.invoiceId, db.procedureCharge.invoiceId));

  $$ProcedureChargeTableProcessedTableManager get procedureChargeRefs {
    final manager = $$ProcedureChargeTableTableManager(
            $_db, $_db.procedureCharge)
        .filter((f) =>
            f.invoiceId.invoiceId.sqlEquals($_itemColumn<int>('invoice_id')!));

    final cache =
        $_typedResult.readTableOrNull(_procedureChargeRefsTable($_db));
    return drift.ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static drift.MultiTypedResultKey<$PaymentTransactionTable,
      List<PaymentTransactionData>> _paymentTransactionRefsTable(
          _$AppDatabase db) =>
      drift.MultiTypedResultKey.fromTable(db.paymentTransaction,
          aliasName: drift.$_aliasNameGenerator(
              db.invoice.invoiceId, db.paymentTransaction.invoiceId));

  $$PaymentTransactionTableProcessedTableManager get paymentTransactionRefs {
    final manager = $$PaymentTransactionTableTableManager(
            $_db, $_db.paymentTransaction)
        .filter((f) =>
            f.invoiceId.invoiceId.sqlEquals($_itemColumn<int>('invoice_id')!));

    final cache =
        $_typedResult.readTableOrNull(_paymentTransactionRefsTable($_db));
    return drift.ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$InvoiceTableFilterComposer
    extends drift.Composer<_$AppDatabase, $InvoiceTable> {
  $$InvoiceTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<int> get invoiceId => $composableBuilder(
      column: $table.invoiceId,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get issuedDate => $composableBuilder(
      column: $table.issuedDate,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<double> get totalBalance => $composableBuilder(
      column: $table.totalBalance,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => drift.ColumnFilters(column));

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

  drift.Expression<bool> procedureChargeRefs(
      drift.Expression<bool> Function($$ProcedureChargeTableFilterComposer f)
          f) {
    final $$ProcedureChargeTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.invoiceId,
        referencedTable: $db.procedureCharge,
        getReferencedColumn: (t) => t.invoiceId,
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
    return f(composer);
  }

  drift.Expression<bool> paymentTransactionRefs(
      drift.Expression<bool> Function($$PaymentTransactionTableFilterComposer f)
          f) {
    final $$PaymentTransactionTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.invoiceId,
        referencedTable: $db.paymentTransaction,
        getReferencedColumn: (t) => t.invoiceId,
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
    return f(composer);
  }
}

class $$InvoiceTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $InvoiceTable> {
  $$InvoiceTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<int> get invoiceId => $composableBuilder(
      column: $table.invoiceId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get issuedDate => $composableBuilder(
      column: $table.issuedDate,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<double> get totalBalance => $composableBuilder(
      column: $table.totalBalance,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status,
      builder: (column) => drift.ColumnOrderings(column));

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

class $$InvoiceTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $InvoiceTable> {
  $$InvoiceTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<int> get invoiceId =>
      $composableBuilder(column: $table.invoiceId, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get issuedDate => $composableBuilder(
      column: $table.issuedDate, builder: (column) => column);

  drift.GeneratedColumn<double> get totalBalance => $composableBuilder(
      column: $table.totalBalance, builder: (column) => column);

  drift.GeneratedColumn<String> get status =>
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

  drift.Expression<T> procedureChargeRefs<T extends Object>(
      drift.Expression<T> Function($$ProcedureChargeTableAnnotationComposer a)
          f) {
    final $$ProcedureChargeTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.invoiceId,
        referencedTable: $db.procedureCharge,
        getReferencedColumn: (t) => t.invoiceId,
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
    return f(composer);
  }

  drift.Expression<T> paymentTransactionRefs<T extends Object>(
      drift.Expression<T> Function(
              $$PaymentTransactionTableAnnotationComposer a)
          f) {
    final $$PaymentTransactionTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.invoiceId,
            referencedTable: $db.paymentTransaction,
            getReferencedColumn: (t) => t.invoiceId,
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
    return f(composer);
  }
}

class $$InvoiceTableTableManager extends drift.RootTableManager<
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
    drift.PrefetchHooks Function(
        {bool patientId,
        bool procedureChargeRefs,
        bool paymentTransactionRefs})> {
  $$InvoiceTableTableManager(_$AppDatabase db, $InvoiceTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InvoiceTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InvoiceTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InvoiceTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<int> invoiceId = const drift.Value.absent(),
            drift.Value<int> patientId = const drift.Value.absent(),
            drift.Value<DateTime> issuedDate = const drift.Value.absent(),
            drift.Value<double> totalBalance = const drift.Value.absent(),
            drift.Value<String> status = const drift.Value.absent(),
          }) =>
              InvoiceCompanion(
            invoiceId: invoiceId,
            patientId: patientId,
            issuedDate: issuedDate,
            totalBalance: totalBalance,
            status: status,
          ),
          createCompanionCallback: ({
            drift.Value<int> invoiceId = const drift.Value.absent(),
            required int patientId,
            drift.Value<DateTime> issuedDate = const drift.Value.absent(),
            required double totalBalance,
            required String status,
          }) =>
              InvoiceCompanion.insert(
            invoiceId: invoiceId,
            patientId: patientId,
            issuedDate: issuedDate,
            totalBalance: totalBalance,
            status: status,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$InvoiceTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {patientId = false,
              procedureChargeRefs = false,
              paymentTransactionRefs = false}) {
            return drift.PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (procedureChargeRefs) db.procedureCharge,
                if (paymentTransactionRefs) db.paymentTransaction
              ],
              addJoins: <
                  T extends drift.TableManagerState<
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

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (procedureChargeRefs)
                    await drift.$_getPrefetchedData<InvoiceData, $InvoiceTable,
                            ProcedureChargeData>(
                        currentTable: table,
                        referencedTable: $$InvoiceTableReferences
                            ._procedureChargeRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$InvoiceTableReferences(db, table, p0)
                                .procedureChargeRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.invoiceId == item.invoiceId),
                        typedResults: items),
                  if (paymentTransactionRefs)
                    await drift.$_getPrefetchedData<InvoiceData, $InvoiceTable,
                            PaymentTransactionData>(
                        currentTable: table,
                        referencedTable: $$InvoiceTableReferences
                            ._paymentTransactionRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$InvoiceTableReferences(db, table, p0)
                                .paymentTransactionRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.invoiceId == item.invoiceId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$InvoiceTableProcessedTableManager = drift.ProcessedTableManager<
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
    drift.PrefetchHooks Function(
        {bool patientId,
        bool procedureChargeRefs,
        bool paymentTransactionRefs})>;
typedef $$ProcedureChargeTableCreateCompanionBuilder = ProcedureChargeCompanion
    Function({
  drift.Value<int> chargeId,
  required int invoiceId,
  required String procedureName,
  required double procedureCharge,
  drift.Value<int> quantity,
  required double totalProcedureCharge,
});
typedef $$ProcedureChargeTableUpdateCompanionBuilder = ProcedureChargeCompanion
    Function({
  drift.Value<int> chargeId,
  drift.Value<int> invoiceId,
  drift.Value<String> procedureName,
  drift.Value<double> procedureCharge,
  drift.Value<int> quantity,
  drift.Value<double> totalProcedureCharge,
});

final class $$ProcedureChargeTableReferences extends drift
    .BaseReferences<_$AppDatabase, $ProcedureChargeTable, ProcedureChargeData> {
  $$ProcedureChargeTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $InvoiceTable _invoiceIdTable(_$AppDatabase db) =>
      db.invoice.createAlias(drift.$_aliasNameGenerator(
          db.procedureCharge.invoiceId, db.invoice.invoiceId));

  $$InvoiceTableProcessedTableManager get invoiceId {
    final $_column = $_itemColumn<int>('invoice_id')!;

    final manager = $$InvoiceTableTableManager($_db, $_db.invoice)
        .filter((f) => f.invoiceId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_invoiceIdTable($_db));
    if (item == null) return manager;
    return drift.ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ProcedureChargeTableFilterComposer
    extends drift.Composer<_$AppDatabase, $ProcedureChargeTable> {
  $$ProcedureChargeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<int> get chargeId => $composableBuilder(
      column: $table.chargeId,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get procedureName => $composableBuilder(
      column: $table.procedureName,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<double> get procedureCharge => $composableBuilder(
      column: $table.procedureCharge,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<double> get totalProcedureCharge => $composableBuilder(
      column: $table.totalProcedureCharge,
      builder: (column) => drift.ColumnFilters(column));

  $$InvoiceTableFilterComposer get invoiceId {
    final $$InvoiceTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.invoiceId,
        referencedTable: $db.invoice,
        getReferencedColumn: (t) => t.invoiceId,
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
    return composer;
  }
}

class $$ProcedureChargeTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $ProcedureChargeTable> {
  $$ProcedureChargeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<int> get chargeId => $composableBuilder(
      column: $table.chargeId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get procedureName => $composableBuilder(
      column: $table.procedureName,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<double> get procedureCharge => $composableBuilder(
      column: $table.procedureCharge,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<double> get totalProcedureCharge => $composableBuilder(
      column: $table.totalProcedureCharge,
      builder: (column) => drift.ColumnOrderings(column));

  $$InvoiceTableOrderingComposer get invoiceId {
    final $$InvoiceTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.invoiceId,
        referencedTable: $db.invoice,
        getReferencedColumn: (t) => t.invoiceId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$InvoiceTableOrderingComposer(
              $db: $db,
              $table: $db.invoice,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProcedureChargeTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $ProcedureChargeTable> {
  $$ProcedureChargeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<int> get chargeId =>
      $composableBuilder(column: $table.chargeId, builder: (column) => column);

  drift.GeneratedColumn<String> get procedureName => $composableBuilder(
      column: $table.procedureName, builder: (column) => column);

  drift.GeneratedColumn<double> get procedureCharge => $composableBuilder(
      column: $table.procedureCharge, builder: (column) => column);

  drift.GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  drift.GeneratedColumn<double> get totalProcedureCharge => $composableBuilder(
      column: $table.totalProcedureCharge, builder: (column) => column);

  $$InvoiceTableAnnotationComposer get invoiceId {
    final $$InvoiceTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.invoiceId,
        referencedTable: $db.invoice,
        getReferencedColumn: (t) => t.invoiceId,
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
    return composer;
  }
}

class $$ProcedureChargeTableTableManager extends drift.RootTableManager<
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
    drift.PrefetchHooks Function({bool invoiceId})> {
  $$ProcedureChargeTableTableManager(
      _$AppDatabase db, $ProcedureChargeTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProcedureChargeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProcedureChargeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProcedureChargeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<int> chargeId = const drift.Value.absent(),
            drift.Value<int> invoiceId = const drift.Value.absent(),
            drift.Value<String> procedureName = const drift.Value.absent(),
            drift.Value<double> procedureCharge = const drift.Value.absent(),
            drift.Value<int> quantity = const drift.Value.absent(),
            drift.Value<double> totalProcedureCharge =
                const drift.Value.absent(),
          }) =>
              ProcedureChargeCompanion(
            chargeId: chargeId,
            invoiceId: invoiceId,
            procedureName: procedureName,
            procedureCharge: procedureCharge,
            quantity: quantity,
            totalProcedureCharge: totalProcedureCharge,
          ),
          createCompanionCallback: ({
            drift.Value<int> chargeId = const drift.Value.absent(),
            required int invoiceId,
            required String procedureName,
            required double procedureCharge,
            drift.Value<int> quantity = const drift.Value.absent(),
            required double totalProcedureCharge,
          }) =>
              ProcedureChargeCompanion.insert(
            chargeId: chargeId,
            invoiceId: invoiceId,
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
          prefetchHooksCallback: ({invoiceId = false}) {
            return drift.PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends drift.TableManagerState<
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
                if (invoiceId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.invoiceId,
                    referencedTable:
                        $$ProcedureChargeTableReferences._invoiceIdTable(db),
                    referencedColumn: $$ProcedureChargeTableReferences
                        ._invoiceIdTable(db)
                        .invoiceId,
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

typedef $$ProcedureChargeTableProcessedTableManager
    = drift.ProcessedTableManager<
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
        drift.PrefetchHooks Function({bool invoiceId})>;
typedef $$PaymentTransactionTableCreateCompanionBuilder
    = PaymentTransactionCompanion Function({
  drift.Value<int> transactionId,
  required int invoiceId,
  required double amountReceived,
  required String modeOfPayment,
  drift.Value<DateTime> paymentDate,
});
typedef $$PaymentTransactionTableUpdateCompanionBuilder
    = PaymentTransactionCompanion Function({
  drift.Value<int> transactionId,
  drift.Value<int> invoiceId,
  drift.Value<double> amountReceived,
  drift.Value<String> modeOfPayment,
  drift.Value<DateTime> paymentDate,
});

final class $$PaymentTransactionTableReferences extends drift.BaseReferences<
    _$AppDatabase, $PaymentTransactionTable, PaymentTransactionData> {
  $$PaymentTransactionTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $InvoiceTable _invoiceIdTable(_$AppDatabase db) =>
      db.invoice.createAlias(drift.$_aliasNameGenerator(
          db.paymentTransaction.invoiceId, db.invoice.invoiceId));

  $$InvoiceTableProcessedTableManager get invoiceId {
    final $_column = $_itemColumn<int>('invoice_id')!;

    final manager = $$InvoiceTableTableManager($_db, $_db.invoice)
        .filter((f) => f.invoiceId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_invoiceIdTable($_db));
    if (item == null) return manager;
    return drift.ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PaymentTransactionTableFilterComposer
    extends drift.Composer<_$AppDatabase, $PaymentTransactionTable> {
  $$PaymentTransactionTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<int> get transactionId => $composableBuilder(
      column: $table.transactionId,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<double> get amountReceived => $composableBuilder(
      column: $table.amountReceived,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get modeOfPayment => $composableBuilder(
      column: $table.modeOfPayment,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate,
      builder: (column) => drift.ColumnFilters(column));

  $$InvoiceTableFilterComposer get invoiceId {
    final $$InvoiceTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.invoiceId,
        referencedTable: $db.invoice,
        getReferencedColumn: (t) => t.invoiceId,
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
    return composer;
  }
}

class $$PaymentTransactionTableOrderingComposer
    extends drift.Composer<_$AppDatabase, $PaymentTransactionTable> {
  $$PaymentTransactionTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<int> get transactionId => $composableBuilder(
      column: $table.transactionId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<double> get amountReceived => $composableBuilder(
      column: $table.amountReceived,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get modeOfPayment => $composableBuilder(
      column: $table.modeOfPayment,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate,
      builder: (column) => drift.ColumnOrderings(column));

  $$InvoiceTableOrderingComposer get invoiceId {
    final $$InvoiceTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.invoiceId,
        referencedTable: $db.invoice,
        getReferencedColumn: (t) => t.invoiceId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$InvoiceTableOrderingComposer(
              $db: $db,
              $table: $db.invoice,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PaymentTransactionTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $PaymentTransactionTable> {
  $$PaymentTransactionTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<int> get transactionId => $composableBuilder(
      column: $table.transactionId, builder: (column) => column);

  drift.GeneratedColumn<double> get amountReceived => $composableBuilder(
      column: $table.amountReceived, builder: (column) => column);

  drift.GeneratedColumn<String> get modeOfPayment => $composableBuilder(
      column: $table.modeOfPayment, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => column);

  $$InvoiceTableAnnotationComposer get invoiceId {
    final $$InvoiceTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.invoiceId,
        referencedTable: $db.invoice,
        getReferencedColumn: (t) => t.invoiceId,
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
    return composer;
  }
}

class $$PaymentTransactionTableTableManager extends drift.RootTableManager<
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
    drift.PrefetchHooks Function({bool invoiceId})> {
  $$PaymentTransactionTableTableManager(
      _$AppDatabase db, $PaymentTransactionTable table)
      : super(drift.TableManagerState(
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
            drift.Value<int> transactionId = const drift.Value.absent(),
            drift.Value<int> invoiceId = const drift.Value.absent(),
            drift.Value<double> amountReceived = const drift.Value.absent(),
            drift.Value<String> modeOfPayment = const drift.Value.absent(),
            drift.Value<DateTime> paymentDate = const drift.Value.absent(),
          }) =>
              PaymentTransactionCompanion(
            transactionId: transactionId,
            invoiceId: invoiceId,
            amountReceived: amountReceived,
            modeOfPayment: modeOfPayment,
            paymentDate: paymentDate,
          ),
          createCompanionCallback: ({
            drift.Value<int> transactionId = const drift.Value.absent(),
            required int invoiceId,
            required double amountReceived,
            required String modeOfPayment,
            drift.Value<DateTime> paymentDate = const drift.Value.absent(),
          }) =>
              PaymentTransactionCompanion.insert(
            transactionId: transactionId,
            invoiceId: invoiceId,
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
          prefetchHooksCallback: ({invoiceId = false}) {
            return drift.PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends drift.TableManagerState<
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
                if (invoiceId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.invoiceId,
                    referencedTable:
                        $$PaymentTransactionTableReferences._invoiceIdTable(db),
                    referencedColumn: $$PaymentTransactionTableReferences
                        ._invoiceIdTable(db)
                        .invoiceId,
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

typedef $$PaymentTransactionTableProcessedTableManager
    = drift.ProcessedTableManager<
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
        drift.PrefetchHooks Function({bool invoiceId})>;
typedef $$ClinicalRecordTableCreateCompanionBuilder = ClinicalRecordCompanion
    Function({
  drift.Value<int> recordId,
  required int patientId,
  drift.Value<DateTime> createdAt,
  drift.Value<String?> pastIllness,
  drift.Value<String?> presentIllness,
  drift.Value<String?> allergies,
  drift.Value<String?> currentMedication,
  drift.Value<bool> hasOralDebris,
  drift.Value<bool> hasCalculus,
  drift.Value<bool> hasPeriodontalPocket,
  drift.Value<bool> hasGingivitis,
  drift.Value<bool> hasDentofacialAnomaly,
  drift.Value<int> cariesForFilling,
  drift.Value<int> cariesForExtraction,
  drift.Value<int> rootFragment,
  drift.Value<int> missingDueToCaries,
  drift.Value<int> filledOrRestored,
  drift.Value<String?> clinicalNotes,
});
typedef $$ClinicalRecordTableUpdateCompanionBuilder = ClinicalRecordCompanion
    Function({
  drift.Value<int> recordId,
  drift.Value<int> patientId,
  drift.Value<DateTime> createdAt,
  drift.Value<String?> pastIllness,
  drift.Value<String?> presentIllness,
  drift.Value<String?> allergies,
  drift.Value<String?> currentMedication,
  drift.Value<bool> hasOralDebris,
  drift.Value<bool> hasCalculus,
  drift.Value<bool> hasPeriodontalPocket,
  drift.Value<bool> hasGingivitis,
  drift.Value<bool> hasDentofacialAnomaly,
  drift.Value<int> cariesForFilling,
  drift.Value<int> cariesForExtraction,
  drift.Value<int> rootFragment,
  drift.Value<int> missingDueToCaries,
  drift.Value<int> filledOrRestored,
  drift.Value<String?> clinicalNotes,
});

final class $$ClinicalRecordTableReferences extends drift
    .BaseReferences<_$AppDatabase, $ClinicalRecordTable, ClinicalRecordData> {
  $$ClinicalRecordTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PatientTable _patientIdTable(_$AppDatabase db) =>
      db.patient.createAlias(drift.$_aliasNameGenerator(
          db.clinicalRecord.patientId, db.patient.patientId));

  $$PatientTableProcessedTableManager get patientId {
    final $_column = $_itemColumn<int>('patient_id')!;

    final manager = $$PatientTableTableManager($_db, $_db.patient)
        .filter((f) => f.patientId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_patientIdTable($_db));
    if (item == null) return manager;
    return drift.ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ClinicalRecordTableFilterComposer
    extends drift.Composer<_$AppDatabase, $ClinicalRecordTable> {
  $$ClinicalRecordTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<int> get recordId => $composableBuilder(
      column: $table.recordId,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get pastIllness => $composableBuilder(
      column: $table.pastIllness,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get presentIllness => $composableBuilder(
      column: $table.presentIllness,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get allergies => $composableBuilder(
      column: $table.allergies,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get currentMedication => $composableBuilder(
      column: $table.currentMedication,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get hasOralDebris => $composableBuilder(
      column: $table.hasOralDebris,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get hasCalculus => $composableBuilder(
      column: $table.hasCalculus,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get hasPeriodontalPocket => $composableBuilder(
      column: $table.hasPeriodontalPocket,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get hasGingivitis => $composableBuilder(
      column: $table.hasGingivitis,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get hasDentofacialAnomaly => $composableBuilder(
      column: $table.hasDentofacialAnomaly,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<int> get cariesForFilling => $composableBuilder(
      column: $table.cariesForFilling,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<int> get cariesForExtraction => $composableBuilder(
      column: $table.cariesForExtraction,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<int> get rootFragment => $composableBuilder(
      column: $table.rootFragment,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<int> get missingDueToCaries => $composableBuilder(
      column: $table.missingDueToCaries,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<int> get filledOrRestored => $composableBuilder(
      column: $table.filledOrRestored,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get clinicalNotes => $composableBuilder(
      column: $table.clinicalNotes,
      builder: (column) => drift.ColumnFilters(column));

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
    extends drift.Composer<_$AppDatabase, $ClinicalRecordTable> {
  $$ClinicalRecordTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<int> get recordId => $composableBuilder(
      column: $table.recordId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get pastIllness => $composableBuilder(
      column: $table.pastIllness,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get presentIllness => $composableBuilder(
      column: $table.presentIllness,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get allergies => $composableBuilder(
      column: $table.allergies,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get currentMedication => $composableBuilder(
      column: $table.currentMedication,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get hasOralDebris => $composableBuilder(
      column: $table.hasOralDebris,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get hasCalculus => $composableBuilder(
      column: $table.hasCalculus,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get hasPeriodontalPocket => $composableBuilder(
      column: $table.hasPeriodontalPocket,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get hasGingivitis => $composableBuilder(
      column: $table.hasGingivitis,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get hasDentofacialAnomaly => $composableBuilder(
      column: $table.hasDentofacialAnomaly,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<int> get cariesForFilling => $composableBuilder(
      column: $table.cariesForFilling,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<int> get cariesForExtraction => $composableBuilder(
      column: $table.cariesForExtraction,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<int> get rootFragment => $composableBuilder(
      column: $table.rootFragment,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<int> get missingDueToCaries => $composableBuilder(
      column: $table.missingDueToCaries,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<int> get filledOrRestored => $composableBuilder(
      column: $table.filledOrRestored,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get clinicalNotes => $composableBuilder(
      column: $table.clinicalNotes,
      builder: (column) => drift.ColumnOrderings(column));

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
    extends drift.Composer<_$AppDatabase, $ClinicalRecordTable> {
  $$ClinicalRecordTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<int> get recordId =>
      $composableBuilder(column: $table.recordId, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  drift.GeneratedColumn<String> get pastIllness => $composableBuilder(
      column: $table.pastIllness, builder: (column) => column);

  drift.GeneratedColumn<String> get presentIllness => $composableBuilder(
      column: $table.presentIllness, builder: (column) => column);

  drift.GeneratedColumn<String> get allergies =>
      $composableBuilder(column: $table.allergies, builder: (column) => column);

  drift.GeneratedColumn<String> get currentMedication => $composableBuilder(
      column: $table.currentMedication, builder: (column) => column);

  drift.GeneratedColumn<bool> get hasOralDebris => $composableBuilder(
      column: $table.hasOralDebris, builder: (column) => column);

  drift.GeneratedColumn<bool> get hasCalculus => $composableBuilder(
      column: $table.hasCalculus, builder: (column) => column);

  drift.GeneratedColumn<bool> get hasPeriodontalPocket => $composableBuilder(
      column: $table.hasPeriodontalPocket, builder: (column) => column);

  drift.GeneratedColumn<bool> get hasGingivitis => $composableBuilder(
      column: $table.hasGingivitis, builder: (column) => column);

  drift.GeneratedColumn<bool> get hasDentofacialAnomaly => $composableBuilder(
      column: $table.hasDentofacialAnomaly, builder: (column) => column);

  drift.GeneratedColumn<int> get cariesForFilling => $composableBuilder(
      column: $table.cariesForFilling, builder: (column) => column);

  drift.GeneratedColumn<int> get cariesForExtraction => $composableBuilder(
      column: $table.cariesForExtraction, builder: (column) => column);

  drift.GeneratedColumn<int> get rootFragment => $composableBuilder(
      column: $table.rootFragment, builder: (column) => column);

  drift.GeneratedColumn<int> get missingDueToCaries => $composableBuilder(
      column: $table.missingDueToCaries, builder: (column) => column);

  drift.GeneratedColumn<int> get filledOrRestored => $composableBuilder(
      column: $table.filledOrRestored, builder: (column) => column);

  drift.GeneratedColumn<String> get clinicalNotes => $composableBuilder(
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

class $$ClinicalRecordTableTableManager extends drift.RootTableManager<
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
    drift.PrefetchHooks Function({bool patientId})> {
  $$ClinicalRecordTableTableManager(
      _$AppDatabase db, $ClinicalRecordTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClinicalRecordTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClinicalRecordTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClinicalRecordTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<int> recordId = const drift.Value.absent(),
            drift.Value<int> patientId = const drift.Value.absent(),
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<String?> pastIllness = const drift.Value.absent(),
            drift.Value<String?> presentIllness = const drift.Value.absent(),
            drift.Value<String?> allergies = const drift.Value.absent(),
            drift.Value<String?> currentMedication = const drift.Value.absent(),
            drift.Value<bool> hasOralDebris = const drift.Value.absent(),
            drift.Value<bool> hasCalculus = const drift.Value.absent(),
            drift.Value<bool> hasPeriodontalPocket = const drift.Value.absent(),
            drift.Value<bool> hasGingivitis = const drift.Value.absent(),
            drift.Value<bool> hasDentofacialAnomaly =
                const drift.Value.absent(),
            drift.Value<int> cariesForFilling = const drift.Value.absent(),
            drift.Value<int> cariesForExtraction = const drift.Value.absent(),
            drift.Value<int> rootFragment = const drift.Value.absent(),
            drift.Value<int> missingDueToCaries = const drift.Value.absent(),
            drift.Value<int> filledOrRestored = const drift.Value.absent(),
            drift.Value<String?> clinicalNotes = const drift.Value.absent(),
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
            drift.Value<int> recordId = const drift.Value.absent(),
            required int patientId,
            drift.Value<DateTime> createdAt = const drift.Value.absent(),
            drift.Value<String?> pastIllness = const drift.Value.absent(),
            drift.Value<String?> presentIllness = const drift.Value.absent(),
            drift.Value<String?> allergies = const drift.Value.absent(),
            drift.Value<String?> currentMedication = const drift.Value.absent(),
            drift.Value<bool> hasOralDebris = const drift.Value.absent(),
            drift.Value<bool> hasCalculus = const drift.Value.absent(),
            drift.Value<bool> hasPeriodontalPocket = const drift.Value.absent(),
            drift.Value<bool> hasGingivitis = const drift.Value.absent(),
            drift.Value<bool> hasDentofacialAnomaly =
                const drift.Value.absent(),
            drift.Value<int> cariesForFilling = const drift.Value.absent(),
            drift.Value<int> cariesForExtraction = const drift.Value.absent(),
            drift.Value<int> rootFragment = const drift.Value.absent(),
            drift.Value<int> missingDueToCaries = const drift.Value.absent(),
            drift.Value<int> filledOrRestored = const drift.Value.absent(),
            drift.Value<String?> clinicalNotes = const drift.Value.absent(),
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
            return drift.PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends drift.TableManagerState<
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

typedef $$ClinicalRecordTableProcessedTableManager
    = drift.ProcessedTableManager<
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
        drift.PrefetchHooks Function({bool patientId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PatientTableTableManager get patient =>
      $$PatientTableTableManager(_db, _db.patient);
  $$ClinicalStaffTableTableManager get clinicalStaff =>
      $$ClinicalStaffTableTableManager(_db, _db.clinicalStaff);
  $$AppointmentTableTableManager get appointment =>
      $$AppointmentTableTableManager(_db, _db.appointment);
  $$InvoiceTableTableManager get invoice =>
      $$InvoiceTableTableManager(_db, _db.invoice);
  $$ProcedureChargeTableTableManager get procedureCharge =>
      $$ProcedureChargeTableTableManager(_db, _db.procedureCharge);
  $$PaymentTransactionTableTableManager get paymentTransaction =>
      $$PaymentTransactionTableTableManager(_db, _db.paymentTransaction);
  $$ClinicalRecordTableTableManager get clinicalRecord =>
      $$ClinicalRecordTableTableManager(_db, _db.clinicalRecord);
}
