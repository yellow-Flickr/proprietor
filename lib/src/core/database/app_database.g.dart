// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $LandlordProfilesTable extends LandlordProfiles
    with TableInfo<$LandlordProfilesTable, LandlordProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LandlordProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneNumberMeta = const VerificationMeta(
    'phoneNumber',
  );
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phone_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _defaultCurrencyMeta = const VerificationMeta(
    'defaultCurrency',
  );
  @override
  late final GeneratedColumn<String> defaultCurrency = GeneratedColumn<String>(
    'default_currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(defaultCurrencyCode),
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
    displayName,
    phoneNumber,
    email,
    defaultCurrency,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'landlord_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<LandlordProfile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
        _phoneNumberMeta,
        phoneNumber.isAcceptableOrUnknown(
          data['phone_number']!,
          _phoneNumberMeta,
        ),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('default_currency')) {
      context.handle(
        _defaultCurrencyMeta,
        defaultCurrency.isAcceptableOrUnknown(
          data['default_currency']!,
          _defaultCurrencyMeta,
        ),
      );
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
  LandlordProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LandlordProfile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
      phoneNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_number'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      defaultCurrency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}default_currency'],
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
  $LandlordProfilesTable createAlias(String alias) {
    return $LandlordProfilesTable(attachedDatabase, alias);
  }
}

class LandlordProfilesCompanion extends UpdateCompanion<LandlordProfile> {
  final Value<String> id;
  final Value<String> displayName;
  final Value<String?> phoneNumber;
  final Value<String?> email;
  final Value<String> defaultCurrency;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const LandlordProfilesCompanion({
    this.id = const Value.absent(),
    this.displayName = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.email = const Value.absent(),
    this.defaultCurrency = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LandlordProfilesCompanion.insert({
    required String id,
    required String displayName,
    this.phoneNumber = const Value.absent(),
    this.email = const Value.absent(),
    this.defaultCurrency = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       displayName = Value(displayName),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<LandlordProfile> custom({
    Expression<String>? id,
    Expression<String>? displayName,
    Expression<String>? phoneNumber,
    Expression<String>? email,
    Expression<String>? defaultCurrency,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (displayName != null) 'display_name': displayName,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (email != null) 'email': email,
      if (defaultCurrency != null) 'default_currency': defaultCurrency,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LandlordProfilesCompanion copyWith({
    Value<String>? id,
    Value<String>? displayName,
    Value<String?>? phoneNumber,
    Value<String?>? email,
    Value<String>? defaultCurrency,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return LandlordProfilesCompanion(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      defaultCurrency: defaultCurrency ?? this.defaultCurrency,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (defaultCurrency.present) {
      map['default_currency'] = Variable<String>(defaultCurrency.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LandlordProfilesCompanion(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('email: $email, ')
          ..write('defaultCurrency: $defaultCurrency, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$LandlordProfileInsertable implements Insertable<LandlordProfile> {
  LandlordProfile _object;
  _$LandlordProfileInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return LandlordProfilesCompanion(
      id: Value(_object.id),
      displayName: Value(_object.displayName),
      phoneNumber: Value(_object.phoneNumber),
      email: Value(_object.email),
      defaultCurrency: Value(_object.defaultCurrency),
      createdAt: Value(_object.createdAt),
      updatedAt: Value(_object.updatedAt),
    ).toColumns(false);
  }
}

extension LandlordProfileToInsertable on LandlordProfile {
  _$LandlordProfileInsertable toInsertable() {
    return _$LandlordProfileInsertable(this);
  }
}

class $PropertiesTable extends Properties
    with TableInfo<$PropertiesTable, Property> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PropertiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _landlordIdMeta = const VerificationMeta(
    'landlordId',
  );
  @override
  late final GeneratedColumn<String> landlordId = GeneratedColumn<String>(
    'landlord_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES landlord_profiles (id)',
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
  late final GeneratedColumnWithTypeConverter<PropertyType, String>
  propertyType = GeneratedColumn<String>(
    'property_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<PropertyType>($PropertiesTable.$converterpropertyType);
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressLineMeta = const VerificationMeta(
    'addressLine',
  );
  @override
  late final GeneratedColumn<String> addressLine = GeneratedColumn<String>(
    'address_line',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _areaOrTownMeta = const VerificationMeta(
    'areaOrTown',
  );
  @override
  late final GeneratedColumn<String> areaOrTown = GeneratedColumn<String>(
    'area_or_town',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _districtMeta = const VerificationMeta(
    'district',
  );
  @override
  late final GeneratedColumn<String> district = GeneratedColumn<String>(
    'district',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _regionMeta = const VerificationMeta('region');
  @override
  late final GeneratedColumn<String> region = GeneratedColumn<String>(
    'region',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _countryCodeMeta = const VerificationMeta(
    'countryCode',
  );
  @override
  late final GeneratedColumn<String> countryCode = GeneratedColumn<String>(
    'country_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(defaultCountryCode),
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _privateNotesMeta = const VerificationMeta(
    'privateNotes',
  );
  @override
  late final GeneratedColumn<String> privateNotes = GeneratedColumn<String>(
    'private_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<RecordStatus, String>
  recordStatus = GeneratedColumn<String>(
    'record_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<RecordStatus>($PropertiesTable.$converterrecordStatus);
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
  static const VerificationMeta _archivedAtMeta = const VerificationMeta(
    'archivedAt',
  );
  @override
  late final GeneratedColumn<DateTime> archivedAt = GeneratedColumn<DateTime>(
    'archived_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    landlordId,
    name,
    propertyType,
    description,
    addressLine,
    areaOrTown,
    district,
    region,
    countryCode,
    latitude,
    longitude,
    privateNotes,
    recordStatus,
    createdAt,
    updatedAt,
    archivedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'properties';
  @override
  VerificationContext validateIntegrity(
    Insertable<Property> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('landlord_id')) {
      context.handle(
        _landlordIdMeta,
        landlordId.isAcceptableOrUnknown(data['landlord_id']!, _landlordIdMeta),
      );
    } else if (isInserting) {
      context.missing(_landlordIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('address_line')) {
      context.handle(
        _addressLineMeta,
        addressLine.isAcceptableOrUnknown(
          data['address_line']!,
          _addressLineMeta,
        ),
      );
    }
    if (data.containsKey('area_or_town')) {
      context.handle(
        _areaOrTownMeta,
        areaOrTown.isAcceptableOrUnknown(
          data['area_or_town']!,
          _areaOrTownMeta,
        ),
      );
    }
    if (data.containsKey('district')) {
      context.handle(
        _districtMeta,
        district.isAcceptableOrUnknown(data['district']!, _districtMeta),
      );
    }
    if (data.containsKey('region')) {
      context.handle(
        _regionMeta,
        region.isAcceptableOrUnknown(data['region']!, _regionMeta),
      );
    }
    if (data.containsKey('country_code')) {
      context.handle(
        _countryCodeMeta,
        countryCode.isAcceptableOrUnknown(
          data['country_code']!,
          _countryCodeMeta,
        ),
      );
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    }
    if (data.containsKey('private_notes')) {
      context.handle(
        _privateNotesMeta,
        privateNotes.isAcceptableOrUnknown(
          data['private_notes']!,
          _privateNotesMeta,
        ),
      );
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
    if (data.containsKey('archived_at')) {
      context.handle(
        _archivedAtMeta,
        archivedAt.isAcceptableOrUnknown(data['archived_at']!, _archivedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Property map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Property(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      landlordId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}landlord_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      propertyType: $PropertiesTable.$converterpropertyType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}property_type'],
        )!,
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      addressLine: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address_line'],
      ),
      areaOrTown: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}area_or_town'],
      ),
      district: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}district'],
      ),
      region: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}region'],
      ),
      countryCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country_code'],
      )!,
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      ),
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      ),
      privateNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}private_notes'],
      ),
      recordStatus: $PropertiesTable.$converterrecordStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}record_status'],
        )!,
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      archivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}archived_at'],
      ),
    );
  }

  @override
  $PropertiesTable createAlias(String alias) {
    return $PropertiesTable(attachedDatabase, alias);
  }

  static TypeConverter<PropertyType, String> $converterpropertyType =
      const SnakeCaseEnumConverter(PropertyType.values);
  static TypeConverter<RecordStatus, String> $converterrecordStatus =
      const SnakeCaseEnumConverter(RecordStatus.values);
}

class PropertiesCompanion extends UpdateCompanion<Property> {
  final Value<String> id;
  final Value<String> landlordId;
  final Value<String> name;
  final Value<PropertyType> propertyType;
  final Value<String?> description;
  final Value<String?> addressLine;
  final Value<String?> areaOrTown;
  final Value<String?> district;
  final Value<String?> region;
  final Value<String> countryCode;
  final Value<double?> latitude;
  final Value<double?> longitude;
  final Value<String?> privateNotes;
  final Value<RecordStatus> recordStatus;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> archivedAt;
  final Value<int> rowid;
  const PropertiesCompanion({
    this.id = const Value.absent(),
    this.landlordId = const Value.absent(),
    this.name = const Value.absent(),
    this.propertyType = const Value.absent(),
    this.description = const Value.absent(),
    this.addressLine = const Value.absent(),
    this.areaOrTown = const Value.absent(),
    this.district = const Value.absent(),
    this.region = const Value.absent(),
    this.countryCode = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.privateNotes = const Value.absent(),
    this.recordStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.archivedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PropertiesCompanion.insert({
    required String id,
    required String landlordId,
    required String name,
    required PropertyType propertyType,
    this.description = const Value.absent(),
    this.addressLine = const Value.absent(),
    this.areaOrTown = const Value.absent(),
    this.district = const Value.absent(),
    this.region = const Value.absent(),
    this.countryCode = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.privateNotes = const Value.absent(),
    required RecordStatus recordStatus,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.archivedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       landlordId = Value(landlordId),
       name = Value(name),
       propertyType = Value(propertyType),
       recordStatus = Value(recordStatus),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Property> custom({
    Expression<String>? id,
    Expression<String>? landlordId,
    Expression<String>? name,
    Expression<String>? propertyType,
    Expression<String>? description,
    Expression<String>? addressLine,
    Expression<String>? areaOrTown,
    Expression<String>? district,
    Expression<String>? region,
    Expression<String>? countryCode,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? privateNotes,
    Expression<String>? recordStatus,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? archivedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (landlordId != null) 'landlord_id': landlordId,
      if (name != null) 'name': name,
      if (propertyType != null) 'property_type': propertyType,
      if (description != null) 'description': description,
      if (addressLine != null) 'address_line': addressLine,
      if (areaOrTown != null) 'area_or_town': areaOrTown,
      if (district != null) 'district': district,
      if (region != null) 'region': region,
      if (countryCode != null) 'country_code': countryCode,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (privateNotes != null) 'private_notes': privateNotes,
      if (recordStatus != null) 'record_status': recordStatus,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (archivedAt != null) 'archived_at': archivedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PropertiesCompanion copyWith({
    Value<String>? id,
    Value<String>? landlordId,
    Value<String>? name,
    Value<PropertyType>? propertyType,
    Value<String?>? description,
    Value<String?>? addressLine,
    Value<String?>? areaOrTown,
    Value<String?>? district,
    Value<String?>? region,
    Value<String>? countryCode,
    Value<double?>? latitude,
    Value<double?>? longitude,
    Value<String?>? privateNotes,
    Value<RecordStatus>? recordStatus,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? archivedAt,
    Value<int>? rowid,
  }) {
    return PropertiesCompanion(
      id: id ?? this.id,
      landlordId: landlordId ?? this.landlordId,
      name: name ?? this.name,
      propertyType: propertyType ?? this.propertyType,
      description: description ?? this.description,
      addressLine: addressLine ?? this.addressLine,
      areaOrTown: areaOrTown ?? this.areaOrTown,
      district: district ?? this.district,
      region: region ?? this.region,
      countryCode: countryCode ?? this.countryCode,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      privateNotes: privateNotes ?? this.privateNotes,
      recordStatus: recordStatus ?? this.recordStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      archivedAt: archivedAt ?? this.archivedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (landlordId.present) {
      map['landlord_id'] = Variable<String>(landlordId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (propertyType.present) {
      map['property_type'] = Variable<String>(
        $PropertiesTable.$converterpropertyType.toSql(propertyType.value),
      );
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (addressLine.present) {
      map['address_line'] = Variable<String>(addressLine.value);
    }
    if (areaOrTown.present) {
      map['area_or_town'] = Variable<String>(areaOrTown.value);
    }
    if (district.present) {
      map['district'] = Variable<String>(district.value);
    }
    if (region.present) {
      map['region'] = Variable<String>(region.value);
    }
    if (countryCode.present) {
      map['country_code'] = Variable<String>(countryCode.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (privateNotes.present) {
      map['private_notes'] = Variable<String>(privateNotes.value);
    }
    if (recordStatus.present) {
      map['record_status'] = Variable<String>(
        $PropertiesTable.$converterrecordStatus.toSql(recordStatus.value),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (archivedAt.present) {
      map['archived_at'] = Variable<DateTime>(archivedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PropertiesCompanion(')
          ..write('id: $id, ')
          ..write('landlordId: $landlordId, ')
          ..write('name: $name, ')
          ..write('propertyType: $propertyType, ')
          ..write('description: $description, ')
          ..write('addressLine: $addressLine, ')
          ..write('areaOrTown: $areaOrTown, ')
          ..write('district: $district, ')
          ..write('region: $region, ')
          ..write('countryCode: $countryCode, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('privateNotes: $privateNotes, ')
          ..write('recordStatus: $recordStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('archivedAt: $archivedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$PropertyInsertable implements Insertable<Property> {
  Property _object;
  _$PropertyInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return PropertiesCompanion(
      id: Value(_object.id),
      landlordId: Value(_object.landlordId),
      name: Value(_object.name),
      propertyType: Value(_object.propertyType),
      description: Value(_object.description),
      addressLine: Value(_object.addressLine),
      areaOrTown: Value(_object.areaOrTown),
      district: Value(_object.district),
      region: Value(_object.region),
      countryCode: Value(_object.countryCode),
      latitude: Value(_object.latitude),
      longitude: Value(_object.longitude),
      privateNotes: Value(_object.privateNotes),
      recordStatus: Value(_object.recordStatus),
      createdAt: Value(_object.createdAt),
      updatedAt: Value(_object.updatedAt),
      archivedAt: Value(_object.archivedAt),
    ).toColumns(false);
  }
}

extension PropertyToInsertable on Property {
  _$PropertyInsertable toInsertable() {
    return _$PropertyInsertable(this);
  }
}

class $UnitsTable extends Units with TableInfo<$UnitsTable, Unit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _propertyIdMeta = const VerificationMeta(
    'propertyId',
  );
  @override
  late final GeneratedColumn<String> propertyId = GeneratedColumn<String>(
    'property_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES properties (id)',
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
  late final GeneratedColumnWithTypeConverter<UnitType, String> unitType =
      GeneratedColumn<String>(
        'unit_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<UnitType>($UnitsTable.$converterunitType);
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _floorOrLevelMeta = const VerificationMeta(
    'floorOrLevel',
  );
  @override
  late final GeneratedColumn<String> floorOrLevel = GeneratedColumn<String>(
    'floor_or_level',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sizeValueMeta = const VerificationMeta(
    'sizeValue',
  );
  @override
  late final GeneratedColumn<double> sizeValue = GeneratedColumn<double>(
    'size_value',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sizeUnitMeta = const VerificationMeta(
    'sizeUnit',
  );
  @override
  late final GeneratedColumn<String> sizeUnit = GeneratedColumn<String>(
    'size_unit',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _defaultRentMinorMeta = const VerificationMeta(
    'defaultRentMinor',
  );
  @override
  late final GeneratedColumn<int> defaultRentMinor = GeneratedColumn<int>(
    'default_rent_minor',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _defaultCurrencyMeta = const VerificationMeta(
    'defaultCurrency',
  );
  @override
  late final GeneratedColumn<String> defaultCurrency = GeneratedColumn<String>(
    'default_currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(defaultCurrencyCode),
  );
  @override
  late final GeneratedColumnWithTypeConverter<AvailabilityRestriction, String>
  availabilityOverride =
      GeneratedColumn<String>(
        'availability_override',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<AvailabilityRestriction>(
        $UnitsTable.$converteravailabilityOverride,
      );
  static const VerificationMeta _privateNotesMeta = const VerificationMeta(
    'privateNotes',
  );
  @override
  late final GeneratedColumn<String> privateNotes = GeneratedColumn<String>(
    'private_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<RecordStatus, String>
  recordStatus = GeneratedColumn<String>(
    'record_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<RecordStatus>($UnitsTable.$converterrecordStatus);
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
  static const VerificationMeta _archivedAtMeta = const VerificationMeta(
    'archivedAt',
  );
  @override
  late final GeneratedColumn<DateTime> archivedAt = GeneratedColumn<DateTime>(
    'archived_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    propertyId,
    name,
    unitType,
    description,
    floorOrLevel,
    sizeValue,
    sizeUnit,
    defaultRentMinor,
    defaultCurrency,
    availabilityOverride,
    privateNotes,
    recordStatus,
    createdAt,
    updatedAt,
    archivedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'units';
  @override
  VerificationContext validateIntegrity(
    Insertable<Unit> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('property_id')) {
      context.handle(
        _propertyIdMeta,
        propertyId.isAcceptableOrUnknown(data['property_id']!, _propertyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_propertyIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('floor_or_level')) {
      context.handle(
        _floorOrLevelMeta,
        floorOrLevel.isAcceptableOrUnknown(
          data['floor_or_level']!,
          _floorOrLevelMeta,
        ),
      );
    }
    if (data.containsKey('size_value')) {
      context.handle(
        _sizeValueMeta,
        sizeValue.isAcceptableOrUnknown(data['size_value']!, _sizeValueMeta),
      );
    }
    if (data.containsKey('size_unit')) {
      context.handle(
        _sizeUnitMeta,
        sizeUnit.isAcceptableOrUnknown(data['size_unit']!, _sizeUnitMeta),
      );
    }
    if (data.containsKey('default_rent_minor')) {
      context.handle(
        _defaultRentMinorMeta,
        defaultRentMinor.isAcceptableOrUnknown(
          data['default_rent_minor']!,
          _defaultRentMinorMeta,
        ),
      );
    }
    if (data.containsKey('default_currency')) {
      context.handle(
        _defaultCurrencyMeta,
        defaultCurrency.isAcceptableOrUnknown(
          data['default_currency']!,
          _defaultCurrencyMeta,
        ),
      );
    }
    if (data.containsKey('private_notes')) {
      context.handle(
        _privateNotesMeta,
        privateNotes.isAcceptableOrUnknown(
          data['private_notes']!,
          _privateNotesMeta,
        ),
      );
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
    if (data.containsKey('archived_at')) {
      context.handle(
        _archivedAtMeta,
        archivedAt.isAcceptableOrUnknown(data['archived_at']!, _archivedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Unit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Unit(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      propertyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}property_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      unitType: $UnitsTable.$converterunitType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}unit_type'],
        )!,
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      floorOrLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}floor_or_level'],
      ),
      sizeValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}size_value'],
      ),
      sizeUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}size_unit'],
      ),
      defaultRentMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}default_rent_minor'],
      ),
      defaultCurrency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}default_currency'],
      )!,
      availabilityOverride: $UnitsTable.$converteravailabilityOverride.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}availability_override'],
        )!,
      ),
      privateNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}private_notes'],
      ),
      recordStatus: $UnitsTable.$converterrecordStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}record_status'],
        )!,
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      archivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}archived_at'],
      ),
    );
  }

  @override
  $UnitsTable createAlias(String alias) {
    return $UnitsTable(attachedDatabase, alias);
  }

  static TypeConverter<UnitType, String> $converterunitType =
      const SnakeCaseEnumConverter(UnitType.values);
  static TypeConverter<AvailabilityRestriction, String>
  $converteravailabilityOverride = const SnakeCaseEnumConverter(
    AvailabilityRestriction.values,
  );
  static TypeConverter<RecordStatus, String> $converterrecordStatus =
      const SnakeCaseEnumConverter(RecordStatus.values);
}

class UnitsCompanion extends UpdateCompanion<Unit> {
  final Value<String> id;
  final Value<String> propertyId;
  final Value<String> name;
  final Value<UnitType> unitType;
  final Value<String?> description;
  final Value<String?> floorOrLevel;
  final Value<double?> sizeValue;
  final Value<String?> sizeUnit;
  final Value<int?> defaultRentMinor;
  final Value<String> defaultCurrency;
  final Value<AvailabilityRestriction> availabilityOverride;
  final Value<String?> privateNotes;
  final Value<RecordStatus> recordStatus;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> archivedAt;
  final Value<int> rowid;
  const UnitsCompanion({
    this.id = const Value.absent(),
    this.propertyId = const Value.absent(),
    this.name = const Value.absent(),
    this.unitType = const Value.absent(),
    this.description = const Value.absent(),
    this.floorOrLevel = const Value.absent(),
    this.sizeValue = const Value.absent(),
    this.sizeUnit = const Value.absent(),
    this.defaultRentMinor = const Value.absent(),
    this.defaultCurrency = const Value.absent(),
    this.availabilityOverride = const Value.absent(),
    this.privateNotes = const Value.absent(),
    this.recordStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.archivedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UnitsCompanion.insert({
    required String id,
    required String propertyId,
    required String name,
    required UnitType unitType,
    this.description = const Value.absent(),
    this.floorOrLevel = const Value.absent(),
    this.sizeValue = const Value.absent(),
    this.sizeUnit = const Value.absent(),
    this.defaultRentMinor = const Value.absent(),
    this.defaultCurrency = const Value.absent(),
    required AvailabilityRestriction availabilityOverride,
    this.privateNotes = const Value.absent(),
    required RecordStatus recordStatus,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.archivedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       propertyId = Value(propertyId),
       name = Value(name),
       unitType = Value(unitType),
       availabilityOverride = Value(availabilityOverride),
       recordStatus = Value(recordStatus),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Unit> custom({
    Expression<String>? id,
    Expression<String>? propertyId,
    Expression<String>? name,
    Expression<String>? unitType,
    Expression<String>? description,
    Expression<String>? floorOrLevel,
    Expression<double>? sizeValue,
    Expression<String>? sizeUnit,
    Expression<int>? defaultRentMinor,
    Expression<String>? defaultCurrency,
    Expression<String>? availabilityOverride,
    Expression<String>? privateNotes,
    Expression<String>? recordStatus,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? archivedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (propertyId != null) 'property_id': propertyId,
      if (name != null) 'name': name,
      if (unitType != null) 'unit_type': unitType,
      if (description != null) 'description': description,
      if (floorOrLevel != null) 'floor_or_level': floorOrLevel,
      if (sizeValue != null) 'size_value': sizeValue,
      if (sizeUnit != null) 'size_unit': sizeUnit,
      if (defaultRentMinor != null) 'default_rent_minor': defaultRentMinor,
      if (defaultCurrency != null) 'default_currency': defaultCurrency,
      if (availabilityOverride != null)
        'availability_override': availabilityOverride,
      if (privateNotes != null) 'private_notes': privateNotes,
      if (recordStatus != null) 'record_status': recordStatus,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (archivedAt != null) 'archived_at': archivedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UnitsCompanion copyWith({
    Value<String>? id,
    Value<String>? propertyId,
    Value<String>? name,
    Value<UnitType>? unitType,
    Value<String?>? description,
    Value<String?>? floorOrLevel,
    Value<double?>? sizeValue,
    Value<String?>? sizeUnit,
    Value<int?>? defaultRentMinor,
    Value<String>? defaultCurrency,
    Value<AvailabilityRestriction>? availabilityOverride,
    Value<String?>? privateNotes,
    Value<RecordStatus>? recordStatus,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? archivedAt,
    Value<int>? rowid,
  }) {
    return UnitsCompanion(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      name: name ?? this.name,
      unitType: unitType ?? this.unitType,
      description: description ?? this.description,
      floorOrLevel: floorOrLevel ?? this.floorOrLevel,
      sizeValue: sizeValue ?? this.sizeValue,
      sizeUnit: sizeUnit ?? this.sizeUnit,
      defaultRentMinor: defaultRentMinor ?? this.defaultRentMinor,
      defaultCurrency: defaultCurrency ?? this.defaultCurrency,
      availabilityOverride: availabilityOverride ?? this.availabilityOverride,
      privateNotes: privateNotes ?? this.privateNotes,
      recordStatus: recordStatus ?? this.recordStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      archivedAt: archivedAt ?? this.archivedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (propertyId.present) {
      map['property_id'] = Variable<String>(propertyId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (unitType.present) {
      map['unit_type'] = Variable<String>(
        $UnitsTable.$converterunitType.toSql(unitType.value),
      );
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (floorOrLevel.present) {
      map['floor_or_level'] = Variable<String>(floorOrLevel.value);
    }
    if (sizeValue.present) {
      map['size_value'] = Variable<double>(sizeValue.value);
    }
    if (sizeUnit.present) {
      map['size_unit'] = Variable<String>(sizeUnit.value);
    }
    if (defaultRentMinor.present) {
      map['default_rent_minor'] = Variable<int>(defaultRentMinor.value);
    }
    if (defaultCurrency.present) {
      map['default_currency'] = Variable<String>(defaultCurrency.value);
    }
    if (availabilityOverride.present) {
      map['availability_override'] = Variable<String>(
        $UnitsTable.$converteravailabilityOverride.toSql(
          availabilityOverride.value,
        ),
      );
    }
    if (privateNotes.present) {
      map['private_notes'] = Variable<String>(privateNotes.value);
    }
    if (recordStatus.present) {
      map['record_status'] = Variable<String>(
        $UnitsTable.$converterrecordStatus.toSql(recordStatus.value),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (archivedAt.present) {
      map['archived_at'] = Variable<DateTime>(archivedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnitsCompanion(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('name: $name, ')
          ..write('unitType: $unitType, ')
          ..write('description: $description, ')
          ..write('floorOrLevel: $floorOrLevel, ')
          ..write('sizeValue: $sizeValue, ')
          ..write('sizeUnit: $sizeUnit, ')
          ..write('defaultRentMinor: $defaultRentMinor, ')
          ..write('defaultCurrency: $defaultCurrency, ')
          ..write('availabilityOverride: $availabilityOverride, ')
          ..write('privateNotes: $privateNotes, ')
          ..write('recordStatus: $recordStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('archivedAt: $archivedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$UnitInsertable implements Insertable<Unit> {
  Unit _object;
  _$UnitInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return UnitsCompanion(
      id: Value(_object.id),
      propertyId: Value(_object.propertyId),
      name: Value(_object.name),
      unitType: Value(_object.unitType),
      description: Value(_object.description),
      floorOrLevel: Value(_object.floorOrLevel),
      sizeValue: Value(_object.sizeValue),
      sizeUnit: Value(_object.sizeUnit),
      defaultRentMinor: Value(_object.defaultRentMinor),
      defaultCurrency: Value(_object.defaultCurrency),
      availabilityOverride: Value(_object.availabilityOverride),
      privateNotes: Value(_object.privateNotes),
      recordStatus: Value(_object.recordStatus),
      createdAt: Value(_object.createdAt),
      updatedAt: Value(_object.updatedAt),
      archivedAt: Value(_object.archivedAt),
    ).toColumns(false);
  }
}

extension UnitToInsertable on Unit {
  _$UnitInsertable toInsertable() {
    return _$UnitInsertable(this);
  }
}

class $TenantsTable extends Tenants with TableInfo<$TenantsTable, Tenant> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TenantsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _landlordIdMeta = const VerificationMeta(
    'landlordId',
  );
  @override
  late final GeneratedColumn<String> landlordId = GeneratedColumn<String>(
    'landlord_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES landlord_profiles (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<TenantType, String> tenantType =
      GeneratedColumn<String>(
        'tenant_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<TenantType>($TenantsTable.$convertertenantType);
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneNumberMeta = const VerificationMeta(
    'phoneNumber',
  );
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phone_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _alternativePhoneMeta = const VerificationMeta(
    'alternativePhone',
  );
  @override
  late final GeneratedColumn<String> alternativePhone = GeneratedColumn<String>(
    'alternative_phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _privateNotesMeta = const VerificationMeta(
    'privateNotes',
  );
  @override
  late final GeneratedColumn<String> privateNotes = GeneratedColumn<String>(
    'private_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<RecordStatus, String>
  recordStatus = GeneratedColumn<String>(
    'record_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<RecordStatus>($TenantsTable.$converterrecordStatus);
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
  static const VerificationMeta _archivedAtMeta = const VerificationMeta(
    'archivedAt',
  );
  @override
  late final GeneratedColumn<DateTime> archivedAt = GeneratedColumn<DateTime>(
    'archived_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    landlordId,
    tenantType,
    fullName,
    phoneNumber,
    alternativePhone,
    email,
    address,
    privateNotes,
    recordStatus,
    createdAt,
    updatedAt,
    archivedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tenants';
  @override
  VerificationContext validateIntegrity(
    Insertable<Tenant> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('landlord_id')) {
      context.handle(
        _landlordIdMeta,
        landlordId.isAcceptableOrUnknown(data['landlord_id']!, _landlordIdMeta),
      );
    } else if (isInserting) {
      context.missing(_landlordIdMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
        _phoneNumberMeta,
        phoneNumber.isAcceptableOrUnknown(
          data['phone_number']!,
          _phoneNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('alternative_phone')) {
      context.handle(
        _alternativePhoneMeta,
        alternativePhone.isAcceptableOrUnknown(
          data['alternative_phone']!,
          _alternativePhoneMeta,
        ),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('private_notes')) {
      context.handle(
        _privateNotesMeta,
        privateNotes.isAcceptableOrUnknown(
          data['private_notes']!,
          _privateNotesMeta,
        ),
      );
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
    if (data.containsKey('archived_at')) {
      context.handle(
        _archivedAtMeta,
        archivedAt.isAcceptableOrUnknown(data['archived_at']!, _archivedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tenant map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tenant(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      landlordId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}landlord_id'],
      )!,
      tenantType: $TenantsTable.$convertertenantType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}tenant_type'],
        )!,
      ),
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      )!,
      phoneNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_number'],
      )!,
      alternativePhone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}alternative_phone'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      privateNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}private_notes'],
      ),
      recordStatus: $TenantsTable.$converterrecordStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}record_status'],
        )!,
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      archivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}archived_at'],
      ),
    );
  }

  @override
  $TenantsTable createAlias(String alias) {
    return $TenantsTable(attachedDatabase, alias);
  }

  static TypeConverter<TenantType, String> $convertertenantType =
      const SnakeCaseEnumConverter(TenantType.values);
  static TypeConverter<RecordStatus, String> $converterrecordStatus =
      const SnakeCaseEnumConverter(RecordStatus.values);
}

class TenantsCompanion extends UpdateCompanion<Tenant> {
  final Value<String> id;
  final Value<String> landlordId;
  final Value<TenantType> tenantType;
  final Value<String> fullName;
  final Value<String> phoneNumber;
  final Value<String?> alternativePhone;
  final Value<String?> email;
  final Value<String?> address;
  final Value<String?> privateNotes;
  final Value<RecordStatus> recordStatus;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> archivedAt;
  final Value<int> rowid;
  const TenantsCompanion({
    this.id = const Value.absent(),
    this.landlordId = const Value.absent(),
    this.tenantType = const Value.absent(),
    this.fullName = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.alternativePhone = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.privateNotes = const Value.absent(),
    this.recordStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.archivedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TenantsCompanion.insert({
    required String id,
    required String landlordId,
    required TenantType tenantType,
    required String fullName,
    required String phoneNumber,
    this.alternativePhone = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.privateNotes = const Value.absent(),
    required RecordStatus recordStatus,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.archivedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       landlordId = Value(landlordId),
       tenantType = Value(tenantType),
       fullName = Value(fullName),
       phoneNumber = Value(phoneNumber),
       recordStatus = Value(recordStatus),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Tenant> custom({
    Expression<String>? id,
    Expression<String>? landlordId,
    Expression<String>? tenantType,
    Expression<String>? fullName,
    Expression<String>? phoneNumber,
    Expression<String>? alternativePhone,
    Expression<String>? email,
    Expression<String>? address,
    Expression<String>? privateNotes,
    Expression<String>? recordStatus,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? archivedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (landlordId != null) 'landlord_id': landlordId,
      if (tenantType != null) 'tenant_type': tenantType,
      if (fullName != null) 'full_name': fullName,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (alternativePhone != null) 'alternative_phone': alternativePhone,
      if (email != null) 'email': email,
      if (address != null) 'address': address,
      if (privateNotes != null) 'private_notes': privateNotes,
      if (recordStatus != null) 'record_status': recordStatus,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (archivedAt != null) 'archived_at': archivedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TenantsCompanion copyWith({
    Value<String>? id,
    Value<String>? landlordId,
    Value<TenantType>? tenantType,
    Value<String>? fullName,
    Value<String>? phoneNumber,
    Value<String?>? alternativePhone,
    Value<String?>? email,
    Value<String?>? address,
    Value<String?>? privateNotes,
    Value<RecordStatus>? recordStatus,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? archivedAt,
    Value<int>? rowid,
  }) {
    return TenantsCompanion(
      id: id ?? this.id,
      landlordId: landlordId ?? this.landlordId,
      tenantType: tenantType ?? this.tenantType,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      alternativePhone: alternativePhone ?? this.alternativePhone,
      email: email ?? this.email,
      address: address ?? this.address,
      privateNotes: privateNotes ?? this.privateNotes,
      recordStatus: recordStatus ?? this.recordStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      archivedAt: archivedAt ?? this.archivedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (landlordId.present) {
      map['landlord_id'] = Variable<String>(landlordId.value);
    }
    if (tenantType.present) {
      map['tenant_type'] = Variable<String>(
        $TenantsTable.$convertertenantType.toSql(tenantType.value),
      );
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (alternativePhone.present) {
      map['alternative_phone'] = Variable<String>(alternativePhone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (privateNotes.present) {
      map['private_notes'] = Variable<String>(privateNotes.value);
    }
    if (recordStatus.present) {
      map['record_status'] = Variable<String>(
        $TenantsTable.$converterrecordStatus.toSql(recordStatus.value),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (archivedAt.present) {
      map['archived_at'] = Variable<DateTime>(archivedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TenantsCompanion(')
          ..write('id: $id, ')
          ..write('landlordId: $landlordId, ')
          ..write('tenantType: $tenantType, ')
          ..write('fullName: $fullName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('alternativePhone: $alternativePhone, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('privateNotes: $privateNotes, ')
          ..write('recordStatus: $recordStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('archivedAt: $archivedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$TenantInsertable implements Insertable<Tenant> {
  Tenant _object;
  _$TenantInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return TenantsCompanion(
      id: Value(_object.id),
      landlordId: Value(_object.landlordId),
      tenantType: Value(_object.tenantType),
      fullName: Value(_object.fullName),
      phoneNumber: Value(_object.phoneNumber),
      alternativePhone: Value(_object.alternativePhone),
      email: Value(_object.email),
      address: Value(_object.address),
      privateNotes: Value(_object.privateNotes),
      recordStatus: Value(_object.recordStatus),
      createdAt: Value(_object.createdAt),
      updatedAt: Value(_object.updatedAt),
      archivedAt: Value(_object.archivedAt),
    ).toColumns(false);
  }
}

extension TenantToInsertable on Tenant {
  _$TenantInsertable toInsertable() {
    return _$TenantInsertable(this);
  }
}

class $TenanciesTable extends Tenancies
    with TableInfo<$TenanciesTable, Tenancy> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TenanciesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tenantIdMeta = const VerificationMeta(
    'tenantId',
  );
  @override
  late final GeneratedColumn<String> tenantId = GeneratedColumn<String>(
    'tenant_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tenants (id)',
    ),
  );
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<String> unitId = GeneratedColumn<String>(
    'unit_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES units (id)',
    ),
  );
  static const VerificationMeta _previousTenancyIdMeta = const VerificationMeta(
    'previousTenancyId',
  );
  @override
  late final GeneratedColumn<String> previousTenancyId =
      GeneratedColumn<String>(
        'previous_tenancy_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES tenancies (id)',
        ),
      );
  @override
  late final GeneratedColumnWithTypeConverter<AgreementType, String>
  agreementType = GeneratedColumn<String>(
    'agreement_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<AgreementType>($TenanciesTable.$converteragreementType);
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, String> startDate =
      GeneratedColumn<String>(
        'start_date',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<DateTime>($TenanciesTable.$converterstartDate);
  @override
  late final GeneratedColumnWithTypeConverter<DateTime?, String> endDate =
      GeneratedColumn<String>(
        'end_date',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<DateTime?>($TenanciesTable.$converterendDaten);
  static const VerificationMeta _agreedRentMinorMeta = const VerificationMeta(
    'agreedRentMinor',
  );
  @override
  late final GeneratedColumn<int> agreedRentMinor = GeneratedColumn<int>(
    'agreed_rent_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyMeta = const VerificationMeta(
    'currency',
  );
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(defaultCurrencyCode),
  );
  @override
  late final GeneratedColumnWithTypeConverter<PaymentFrequency, String>
  paymentFrequency = GeneratedColumn<String>(
    'payment_frequency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<PaymentFrequency>($TenanciesTable.$converterpaymentFrequency);
  static const VerificationMeta _customFrequencyMonthsMeta =
      const VerificationMeta('customFrequencyMonths');
  @override
  late final GeneratedColumn<int> customFrequencyMonths = GeneratedColumn<int>(
    'custom_frequency_months',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, String> firstDueDate =
      GeneratedColumn<String>(
        'first_due_date',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<DateTime>($TenanciesTable.$converterfirstDueDate);
  static const VerificationMeta _dueDayMeta = const VerificationMeta('dueDay');
  @override
  late final GeneratedColumn<int> dueDay = GeneratedColumn<int>(
    'due_day',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _securityDepositMinorMeta =
      const VerificationMeta('securityDepositMinor');
  @override
  late final GeneratedColumn<int> securityDepositMinor = GeneratedColumn<int>(
    'security_deposit_minor',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _advanceAmountMinorMeta =
      const VerificationMeta('advanceAmountMinor');
  @override
  late final GeneratedColumn<int> advanceAmountMinor = GeneratedColumn<int>(
    'advance_amount_minor',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _termsNotesMeta = const VerificationMeta(
    'termsNotes',
  );
  @override
  late final GeneratedColumn<String> termsNotes = GeneratedColumn<String>(
    'terms_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<TenancyStatus, String> status =
      GeneratedColumn<String>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<TenancyStatus>($TenanciesTable.$converterstatus);
  @override
  late final GeneratedColumnWithTypeConverter<DateTime?, String>
  effectiveTerminationDate =
      GeneratedColumn<String>(
        'effective_termination_date',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<DateTime?>(
        $TenanciesTable.$convertereffectiveTerminationDaten,
      );
  static const VerificationMeta _terminationReasonMeta = const VerificationMeta(
    'terminationReason',
  );
  @override
  late final GeneratedColumn<String> terminationReason =
      GeneratedColumn<String>(
        'termination_reason',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
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
    tenantId,
    unitId,
    previousTenancyId,
    agreementType,
    startDate,
    endDate,
    agreedRentMinor,
    currency,
    paymentFrequency,
    customFrequencyMonths,
    firstDueDate,
    dueDay,
    securityDepositMinor,
    advanceAmountMinor,
    termsNotes,
    status,
    effectiveTerminationDate,
    terminationReason,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tenancies';
  @override
  VerificationContext validateIntegrity(
    Insertable<Tenancy> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('tenant_id')) {
      context.handle(
        _tenantIdMeta,
        tenantId.isAcceptableOrUnknown(data['tenant_id']!, _tenantIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tenantIdMeta);
    }
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_unitIdMeta);
    }
    if (data.containsKey('previous_tenancy_id')) {
      context.handle(
        _previousTenancyIdMeta,
        previousTenancyId.isAcceptableOrUnknown(
          data['previous_tenancy_id']!,
          _previousTenancyIdMeta,
        ),
      );
    }
    if (data.containsKey('agreed_rent_minor')) {
      context.handle(
        _agreedRentMinorMeta,
        agreedRentMinor.isAcceptableOrUnknown(
          data['agreed_rent_minor']!,
          _agreedRentMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_agreedRentMinorMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(
        _currencyMeta,
        currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta),
      );
    }
    if (data.containsKey('custom_frequency_months')) {
      context.handle(
        _customFrequencyMonthsMeta,
        customFrequencyMonths.isAcceptableOrUnknown(
          data['custom_frequency_months']!,
          _customFrequencyMonthsMeta,
        ),
      );
    }
    if (data.containsKey('due_day')) {
      context.handle(
        _dueDayMeta,
        dueDay.isAcceptableOrUnknown(data['due_day']!, _dueDayMeta),
      );
    }
    if (data.containsKey('security_deposit_minor')) {
      context.handle(
        _securityDepositMinorMeta,
        securityDepositMinor.isAcceptableOrUnknown(
          data['security_deposit_minor']!,
          _securityDepositMinorMeta,
        ),
      );
    }
    if (data.containsKey('advance_amount_minor')) {
      context.handle(
        _advanceAmountMinorMeta,
        advanceAmountMinor.isAcceptableOrUnknown(
          data['advance_amount_minor']!,
          _advanceAmountMinorMeta,
        ),
      );
    }
    if (data.containsKey('terms_notes')) {
      context.handle(
        _termsNotesMeta,
        termsNotes.isAcceptableOrUnknown(data['terms_notes']!, _termsNotesMeta),
      );
    }
    if (data.containsKey('termination_reason')) {
      context.handle(
        _terminationReasonMeta,
        terminationReason.isAcceptableOrUnknown(
          data['termination_reason']!,
          _terminationReasonMeta,
        ),
      );
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
  Tenancy map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tenancy(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      tenantId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenant_id'],
      )!,
      unitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_id'],
      )!,
      previousTenancyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}previous_tenancy_id'],
      ),
      agreementType: $TenanciesTable.$converteragreementType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}agreement_type'],
        )!,
      ),
      startDate: $TenanciesTable.$converterstartDate.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}start_date'],
        )!,
      ),
      endDate: $TenanciesTable.$converterendDaten.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}end_date'],
        ),
      ),
      agreedRentMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}agreed_rent_minor'],
      )!,
      currency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency'],
      )!,
      paymentFrequency: $TenanciesTable.$converterpaymentFrequency.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}payment_frequency'],
        )!,
      ),
      customFrequencyMonths: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}custom_frequency_months'],
      ),
      firstDueDate: $TenanciesTable.$converterfirstDueDate.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}first_due_date'],
        )!,
      ),
      dueDay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}due_day'],
      ),
      securityDepositMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}security_deposit_minor'],
      ),
      advanceAmountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}advance_amount_minor'],
      ),
      termsNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}terms_notes'],
      ),
      status: $TenanciesTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
      effectiveTerminationDate: $TenanciesTable
          .$convertereffectiveTerminationDaten
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}effective_termination_date'],
            ),
          ),
      terminationReason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}termination_reason'],
      ),
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
  $TenanciesTable createAlias(String alias) {
    return $TenanciesTable(attachedDatabase, alias);
  }

  static TypeConverter<AgreementType, String> $converteragreementType =
      const SnakeCaseEnumConverter(AgreementType.values);
  static TypeConverter<DateTime, String> $converterstartDate =
      const DateOnlyConverter();
  static TypeConverter<DateTime, String> $converterendDate =
      const DateOnlyConverter();
  static TypeConverter<DateTime?, String?> $converterendDaten =
      NullAwareTypeConverter.wrap($converterendDate);
  static TypeConverter<PaymentFrequency, String> $converterpaymentFrequency =
      const SnakeCaseEnumConverter(PaymentFrequency.values);
  static TypeConverter<DateTime, String> $converterfirstDueDate =
      const DateOnlyConverter();
  static TypeConverter<TenancyStatus, String> $converterstatus =
      const SnakeCaseEnumConverter(TenancyStatus.values);
  static TypeConverter<DateTime, String> $convertereffectiveTerminationDate =
      const DateOnlyConverter();
  static TypeConverter<DateTime?, String?> $convertereffectiveTerminationDaten =
      NullAwareTypeConverter.wrap($convertereffectiveTerminationDate);
}

class TenanciesCompanion extends UpdateCompanion<Tenancy> {
  final Value<String> id;
  final Value<String> tenantId;
  final Value<String> unitId;
  final Value<String?> previousTenancyId;
  final Value<AgreementType> agreementType;
  final Value<DateTime> startDate;
  final Value<DateTime?> endDate;
  final Value<int> agreedRentMinor;
  final Value<String> currency;
  final Value<PaymentFrequency> paymentFrequency;
  final Value<int?> customFrequencyMonths;
  final Value<DateTime> firstDueDate;
  final Value<int?> dueDay;
  final Value<int?> securityDepositMinor;
  final Value<int?> advanceAmountMinor;
  final Value<String?> termsNotes;
  final Value<TenancyStatus> status;
  final Value<DateTime?> effectiveTerminationDate;
  final Value<String?> terminationReason;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const TenanciesCompanion({
    this.id = const Value.absent(),
    this.tenantId = const Value.absent(),
    this.unitId = const Value.absent(),
    this.previousTenancyId = const Value.absent(),
    this.agreementType = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.agreedRentMinor = const Value.absent(),
    this.currency = const Value.absent(),
    this.paymentFrequency = const Value.absent(),
    this.customFrequencyMonths = const Value.absent(),
    this.firstDueDate = const Value.absent(),
    this.dueDay = const Value.absent(),
    this.securityDepositMinor = const Value.absent(),
    this.advanceAmountMinor = const Value.absent(),
    this.termsNotes = const Value.absent(),
    this.status = const Value.absent(),
    this.effectiveTerminationDate = const Value.absent(),
    this.terminationReason = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TenanciesCompanion.insert({
    required String id,
    required String tenantId,
    required String unitId,
    this.previousTenancyId = const Value.absent(),
    required AgreementType agreementType,
    required DateTime startDate,
    this.endDate = const Value.absent(),
    required int agreedRentMinor,
    this.currency = const Value.absent(),
    required PaymentFrequency paymentFrequency,
    this.customFrequencyMonths = const Value.absent(),
    required DateTime firstDueDate,
    this.dueDay = const Value.absent(),
    this.securityDepositMinor = const Value.absent(),
    this.advanceAmountMinor = const Value.absent(),
    this.termsNotes = const Value.absent(),
    required TenancyStatus status,
    this.effectiveTerminationDate = const Value.absent(),
    this.terminationReason = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       tenantId = Value(tenantId),
       unitId = Value(unitId),
       agreementType = Value(agreementType),
       startDate = Value(startDate),
       agreedRentMinor = Value(agreedRentMinor),
       paymentFrequency = Value(paymentFrequency),
       firstDueDate = Value(firstDueDate),
       status = Value(status),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Tenancy> custom({
    Expression<String>? id,
    Expression<String>? tenantId,
    Expression<String>? unitId,
    Expression<String>? previousTenancyId,
    Expression<String>? agreementType,
    Expression<String>? startDate,
    Expression<String>? endDate,
    Expression<int>? agreedRentMinor,
    Expression<String>? currency,
    Expression<String>? paymentFrequency,
    Expression<int>? customFrequencyMonths,
    Expression<String>? firstDueDate,
    Expression<int>? dueDay,
    Expression<int>? securityDepositMinor,
    Expression<int>? advanceAmountMinor,
    Expression<String>? termsNotes,
    Expression<String>? status,
    Expression<String>? effectiveTerminationDate,
    Expression<String>? terminationReason,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tenantId != null) 'tenant_id': tenantId,
      if (unitId != null) 'unit_id': unitId,
      if (previousTenancyId != null) 'previous_tenancy_id': previousTenancyId,
      if (agreementType != null) 'agreement_type': agreementType,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (agreedRentMinor != null) 'agreed_rent_minor': agreedRentMinor,
      if (currency != null) 'currency': currency,
      if (paymentFrequency != null) 'payment_frequency': paymentFrequency,
      if (customFrequencyMonths != null)
        'custom_frequency_months': customFrequencyMonths,
      if (firstDueDate != null) 'first_due_date': firstDueDate,
      if (dueDay != null) 'due_day': dueDay,
      if (securityDepositMinor != null)
        'security_deposit_minor': securityDepositMinor,
      if (advanceAmountMinor != null)
        'advance_amount_minor': advanceAmountMinor,
      if (termsNotes != null) 'terms_notes': termsNotes,
      if (status != null) 'status': status,
      if (effectiveTerminationDate != null)
        'effective_termination_date': effectiveTerminationDate,
      if (terminationReason != null) 'termination_reason': terminationReason,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TenanciesCompanion copyWith({
    Value<String>? id,
    Value<String>? tenantId,
    Value<String>? unitId,
    Value<String?>? previousTenancyId,
    Value<AgreementType>? agreementType,
    Value<DateTime>? startDate,
    Value<DateTime?>? endDate,
    Value<int>? agreedRentMinor,
    Value<String>? currency,
    Value<PaymentFrequency>? paymentFrequency,
    Value<int?>? customFrequencyMonths,
    Value<DateTime>? firstDueDate,
    Value<int?>? dueDay,
    Value<int?>? securityDepositMinor,
    Value<int?>? advanceAmountMinor,
    Value<String?>? termsNotes,
    Value<TenancyStatus>? status,
    Value<DateTime?>? effectiveTerminationDate,
    Value<String?>? terminationReason,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return TenanciesCompanion(
      id: id ?? this.id,
      tenantId: tenantId ?? this.tenantId,
      unitId: unitId ?? this.unitId,
      previousTenancyId: previousTenancyId ?? this.previousTenancyId,
      agreementType: agreementType ?? this.agreementType,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      agreedRentMinor: agreedRentMinor ?? this.agreedRentMinor,
      currency: currency ?? this.currency,
      paymentFrequency: paymentFrequency ?? this.paymentFrequency,
      customFrequencyMonths:
          customFrequencyMonths ?? this.customFrequencyMonths,
      firstDueDate: firstDueDate ?? this.firstDueDate,
      dueDay: dueDay ?? this.dueDay,
      securityDepositMinor: securityDepositMinor ?? this.securityDepositMinor,
      advanceAmountMinor: advanceAmountMinor ?? this.advanceAmountMinor,
      termsNotes: termsNotes ?? this.termsNotes,
      status: status ?? this.status,
      effectiveTerminationDate:
          effectiveTerminationDate ?? this.effectiveTerminationDate,
      terminationReason: terminationReason ?? this.terminationReason,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (tenantId.present) {
      map['tenant_id'] = Variable<String>(tenantId.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<String>(unitId.value);
    }
    if (previousTenancyId.present) {
      map['previous_tenancy_id'] = Variable<String>(previousTenancyId.value);
    }
    if (agreementType.present) {
      map['agreement_type'] = Variable<String>(
        $TenanciesTable.$converteragreementType.toSql(agreementType.value),
      );
    }
    if (startDate.present) {
      map['start_date'] = Variable<String>(
        $TenanciesTable.$converterstartDate.toSql(startDate.value),
      );
    }
    if (endDate.present) {
      map['end_date'] = Variable<String>(
        $TenanciesTable.$converterendDaten.toSql(endDate.value),
      );
    }
    if (agreedRentMinor.present) {
      map['agreed_rent_minor'] = Variable<int>(agreedRentMinor.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (paymentFrequency.present) {
      map['payment_frequency'] = Variable<String>(
        $TenanciesTable.$converterpaymentFrequency.toSql(
          paymentFrequency.value,
        ),
      );
    }
    if (customFrequencyMonths.present) {
      map['custom_frequency_months'] = Variable<int>(
        customFrequencyMonths.value,
      );
    }
    if (firstDueDate.present) {
      map['first_due_date'] = Variable<String>(
        $TenanciesTable.$converterfirstDueDate.toSql(firstDueDate.value),
      );
    }
    if (dueDay.present) {
      map['due_day'] = Variable<int>(dueDay.value);
    }
    if (securityDepositMinor.present) {
      map['security_deposit_minor'] = Variable<int>(securityDepositMinor.value);
    }
    if (advanceAmountMinor.present) {
      map['advance_amount_minor'] = Variable<int>(advanceAmountMinor.value);
    }
    if (termsNotes.present) {
      map['terms_notes'] = Variable<String>(termsNotes.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
        $TenanciesTable.$converterstatus.toSql(status.value),
      );
    }
    if (effectiveTerminationDate.present) {
      map['effective_termination_date'] = Variable<String>(
        $TenanciesTable.$convertereffectiveTerminationDaten.toSql(
          effectiveTerminationDate.value,
        ),
      );
    }
    if (terminationReason.present) {
      map['termination_reason'] = Variable<String>(terminationReason.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TenanciesCompanion(')
          ..write('id: $id, ')
          ..write('tenantId: $tenantId, ')
          ..write('unitId: $unitId, ')
          ..write('previousTenancyId: $previousTenancyId, ')
          ..write('agreementType: $agreementType, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('agreedRentMinor: $agreedRentMinor, ')
          ..write('currency: $currency, ')
          ..write('paymentFrequency: $paymentFrequency, ')
          ..write('customFrequencyMonths: $customFrequencyMonths, ')
          ..write('firstDueDate: $firstDueDate, ')
          ..write('dueDay: $dueDay, ')
          ..write('securityDepositMinor: $securityDepositMinor, ')
          ..write('advanceAmountMinor: $advanceAmountMinor, ')
          ..write('termsNotes: $termsNotes, ')
          ..write('status: $status, ')
          ..write('effectiveTerminationDate: $effectiveTerminationDate, ')
          ..write('terminationReason: $terminationReason, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$TenancyInsertable implements Insertable<Tenancy> {
  Tenancy _object;
  _$TenancyInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return TenanciesCompanion(
      id: Value(_object.id),
      tenantId: Value(_object.tenantId),
      unitId: Value(_object.unitId),
      previousTenancyId: Value(_object.previousTenancyId),
      agreementType: Value(_object.agreementType),
      startDate: Value(_object.startDate),
      endDate: Value(_object.endDate),
      agreedRentMinor: Value(_object.agreedRentMinor),
      currency: Value(_object.currency),
      paymentFrequency: Value(_object.paymentFrequency),
      customFrequencyMonths: Value(_object.customFrequencyMonths),
      firstDueDate: Value(_object.firstDueDate),
      dueDay: Value(_object.dueDay),
      securityDepositMinor: Value(_object.securityDepositMinor),
      advanceAmountMinor: Value(_object.advanceAmountMinor),
      termsNotes: Value(_object.termsNotes),
      status: Value(_object.status),
      effectiveTerminationDate: Value(_object.effectiveTerminationDate),
      terminationReason: Value(_object.terminationReason),
      createdAt: Value(_object.createdAt),
      updatedAt: Value(_object.updatedAt),
    ).toColumns(false);
  }
}

extension TenancyToInsertable on Tenancy {
  _$TenancyInsertable toInsertable() {
    return _$TenancyInsertable(this);
  }
}

class $RentObligationsTable extends RentObligations
    with TableInfo<$RentObligationsTable, RentObligation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RentObligationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tenancyIdMeta = const VerificationMeta(
    'tenancyId',
  );
  @override
  late final GeneratedColumn<String> tenancyId = GeneratedColumn<String>(
    'tenancy_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tenancies (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, String> periodStart =
      GeneratedColumn<String>(
        'period_start',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<DateTime>($RentObligationsTable.$converterperiodStart);
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, String> periodEnd =
      GeneratedColumn<String>(
        'period_end',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<DateTime>($RentObligationsTable.$converterperiodEnd);
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, String> dueDate =
      GeneratedColumn<String>(
        'due_date',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<DateTime>($RentObligationsTable.$converterdueDate);
  static const VerificationMeta _amountDueMinorMeta = const VerificationMeta(
    'amountDueMinor',
  );
  @override
  late final GeneratedColumn<int> amountDueMinor = GeneratedColumn<int>(
    'amount_due_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyMeta = const VerificationMeta(
    'currency',
  );
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(defaultCurrencyCode),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<ObligationPaymentStatus?, String>
  statusOverride =
      GeneratedColumn<String>(
        'status_override',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<ObligationPaymentStatus?>(
        $RentObligationsTable.$converterstatusOverriden,
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
    tenancyId,
    periodStart,
    periodEnd,
    dueDate,
    amountDueMinor,
    currency,
    description,
    statusOverride,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rent_obligations';
  @override
  VerificationContext validateIntegrity(
    Insertable<RentObligation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('tenancy_id')) {
      context.handle(
        _tenancyIdMeta,
        tenancyId.isAcceptableOrUnknown(data['tenancy_id']!, _tenancyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tenancyIdMeta);
    }
    if (data.containsKey('amount_due_minor')) {
      context.handle(
        _amountDueMinorMeta,
        amountDueMinor.isAcceptableOrUnknown(
          data['amount_due_minor']!,
          _amountDueMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amountDueMinorMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(
        _currencyMeta,
        currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
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
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {tenancyId, periodStart, periodEnd},
  ];
  @override
  RentObligation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RentObligation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      tenancyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenancy_id'],
      )!,
      periodStart: $RentObligationsTable.$converterperiodStart.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}period_start'],
        )!,
      ),
      periodEnd: $RentObligationsTable.$converterperiodEnd.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}period_end'],
        )!,
      ),
      dueDate: $RentObligationsTable.$converterdueDate.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}due_date'],
        )!,
      ),
      amountDueMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_due_minor'],
      )!,
      currency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      statusOverride: $RentObligationsTable.$converterstatusOverriden.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status_override'],
        ),
      ),
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
  $RentObligationsTable createAlias(String alias) {
    return $RentObligationsTable(attachedDatabase, alias);
  }

  static TypeConverter<DateTime, String> $converterperiodStart =
      const DateOnlyConverter();
  static TypeConverter<DateTime, String> $converterperiodEnd =
      const DateOnlyConverter();
  static TypeConverter<DateTime, String> $converterdueDate =
      const DateOnlyConverter();
  static TypeConverter<ObligationPaymentStatus, String>
  $converterstatusOverride = const SnakeCaseEnumConverter(
    ObligationPaymentStatus.values,
  );
  static TypeConverter<ObligationPaymentStatus?, String?>
  $converterstatusOverriden = NullAwareTypeConverter.wrap(
    $converterstatusOverride,
  );
}

class RentObligationsCompanion extends UpdateCompanion<RentObligation> {
  final Value<String> id;
  final Value<String> tenancyId;
  final Value<DateTime> periodStart;
  final Value<DateTime> periodEnd;
  final Value<DateTime> dueDate;
  final Value<int> amountDueMinor;
  final Value<String> currency;
  final Value<String?> description;
  final Value<ObligationPaymentStatus?> statusOverride;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const RentObligationsCompanion({
    this.id = const Value.absent(),
    this.tenancyId = const Value.absent(),
    this.periodStart = const Value.absent(),
    this.periodEnd = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.amountDueMinor = const Value.absent(),
    this.currency = const Value.absent(),
    this.description = const Value.absent(),
    this.statusOverride = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RentObligationsCompanion.insert({
    required String id,
    required String tenancyId,
    required DateTime periodStart,
    required DateTime periodEnd,
    required DateTime dueDate,
    required int amountDueMinor,
    this.currency = const Value.absent(),
    this.description = const Value.absent(),
    this.statusOverride = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       tenancyId = Value(tenancyId),
       periodStart = Value(periodStart),
       periodEnd = Value(periodEnd),
       dueDate = Value(dueDate),
       amountDueMinor = Value(amountDueMinor),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<RentObligation> custom({
    Expression<String>? id,
    Expression<String>? tenancyId,
    Expression<String>? periodStart,
    Expression<String>? periodEnd,
    Expression<String>? dueDate,
    Expression<int>? amountDueMinor,
    Expression<String>? currency,
    Expression<String>? description,
    Expression<String>? statusOverride,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tenancyId != null) 'tenancy_id': tenancyId,
      if (periodStart != null) 'period_start': periodStart,
      if (periodEnd != null) 'period_end': periodEnd,
      if (dueDate != null) 'due_date': dueDate,
      if (amountDueMinor != null) 'amount_due_minor': amountDueMinor,
      if (currency != null) 'currency': currency,
      if (description != null) 'description': description,
      if (statusOverride != null) 'status_override': statusOverride,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RentObligationsCompanion copyWith({
    Value<String>? id,
    Value<String>? tenancyId,
    Value<DateTime>? periodStart,
    Value<DateTime>? periodEnd,
    Value<DateTime>? dueDate,
    Value<int>? amountDueMinor,
    Value<String>? currency,
    Value<String?>? description,
    Value<ObligationPaymentStatus?>? statusOverride,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return RentObligationsCompanion(
      id: id ?? this.id,
      tenancyId: tenancyId ?? this.tenancyId,
      periodStart: periodStart ?? this.periodStart,
      periodEnd: periodEnd ?? this.periodEnd,
      dueDate: dueDate ?? this.dueDate,
      amountDueMinor: amountDueMinor ?? this.amountDueMinor,
      currency: currency ?? this.currency,
      description: description ?? this.description,
      statusOverride: statusOverride ?? this.statusOverride,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (tenancyId.present) {
      map['tenancy_id'] = Variable<String>(tenancyId.value);
    }
    if (periodStart.present) {
      map['period_start'] = Variable<String>(
        $RentObligationsTable.$converterperiodStart.toSql(periodStart.value),
      );
    }
    if (periodEnd.present) {
      map['period_end'] = Variable<String>(
        $RentObligationsTable.$converterperiodEnd.toSql(periodEnd.value),
      );
    }
    if (dueDate.present) {
      map['due_date'] = Variable<String>(
        $RentObligationsTable.$converterdueDate.toSql(dueDate.value),
      );
    }
    if (amountDueMinor.present) {
      map['amount_due_minor'] = Variable<int>(amountDueMinor.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (statusOverride.present) {
      map['status_override'] = Variable<String>(
        $RentObligationsTable.$converterstatusOverriden.toSql(
          statusOverride.value,
        ),
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RentObligationsCompanion(')
          ..write('id: $id, ')
          ..write('tenancyId: $tenancyId, ')
          ..write('periodStart: $periodStart, ')
          ..write('periodEnd: $periodEnd, ')
          ..write('dueDate: $dueDate, ')
          ..write('amountDueMinor: $amountDueMinor, ')
          ..write('currency: $currency, ')
          ..write('description: $description, ')
          ..write('statusOverride: $statusOverride, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$RentObligationInsertable implements Insertable<RentObligation> {
  RentObligation _object;
  _$RentObligationInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return RentObligationsCompanion(
      id: Value(_object.id),
      tenancyId: Value(_object.tenancyId),
      periodStart: Value(_object.periodStart),
      periodEnd: Value(_object.periodEnd),
      dueDate: Value(_object.dueDate),
      amountDueMinor: Value(_object.amountDueMinor),
      currency: Value(_object.currency),
      description: Value(_object.description),
      statusOverride: Value(_object.statusOverride),
      createdAt: Value(_object.createdAt),
      updatedAt: Value(_object.updatedAt),
    ).toColumns(false);
  }
}

extension RentObligationToInsertable on RentObligation {
  _$RentObligationInsertable toInsertable() {
    return _$RentObligationInsertable(this);
  }
}

class $PaymentsTable extends Payments with TableInfo<$PaymentsTable, Payment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tenancyIdMeta = const VerificationMeta(
    'tenancyId',
  );
  @override
  late final GeneratedColumn<String> tenancyId = GeneratedColumn<String>(
    'tenancy_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tenancies (id)',
    ),
  );
  static const VerificationMeta _amountReceivedMinorMeta =
      const VerificationMeta('amountReceivedMinor');
  @override
  late final GeneratedColumn<int> amountReceivedMinor = GeneratedColumn<int>(
    'amount_received_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyMeta = const VerificationMeta(
    'currency',
  );
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(defaultCurrencyCode),
  );
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, String> receivedDate =
      GeneratedColumn<String>(
        'received_date',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<DateTime>($PaymentsTable.$converterreceivedDate);
  @override
  late final GeneratedColumnWithTypeConverter<PaymentMethod, String>
  paymentMethod = GeneratedColumn<String>(
    'payment_method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<PaymentMethod>($PaymentsTable.$converterpaymentMethod);
  static const VerificationMeta _referenceMeta = const VerificationMeta(
    'reference',
  );
  @override
  late final GeneratedColumn<String> reference = GeneratedColumn<String>(
    'reference',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<PaymentRecordStatus, String>
  recordStatus = GeneratedColumn<String>(
    'record_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<PaymentRecordStatus>($PaymentsTable.$converterrecordStatus);
  static const VerificationMeta _reversalReasonMeta = const VerificationMeta(
    'reversalReason',
  );
  @override
  late final GeneratedColumn<String> reversalReason = GeneratedColumn<String>(
    'reversal_reason',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
    tenancyId,
    amountReceivedMinor,
    currency,
    receivedDate,
    paymentMethod,
    reference,
    notes,
    recordStatus,
    reversalReason,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Payment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('tenancy_id')) {
      context.handle(
        _tenancyIdMeta,
        tenancyId.isAcceptableOrUnknown(data['tenancy_id']!, _tenancyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tenancyIdMeta);
    }
    if (data.containsKey('amount_received_minor')) {
      context.handle(
        _amountReceivedMinorMeta,
        amountReceivedMinor.isAcceptableOrUnknown(
          data['amount_received_minor']!,
          _amountReceivedMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amountReceivedMinorMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(
        _currencyMeta,
        currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta),
      );
    }
    if (data.containsKey('reference')) {
      context.handle(
        _referenceMeta,
        reference.isAcceptableOrUnknown(data['reference']!, _referenceMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('reversal_reason')) {
      context.handle(
        _reversalReasonMeta,
        reversalReason.isAcceptableOrUnknown(
          data['reversal_reason']!,
          _reversalReasonMeta,
        ),
      );
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
  Payment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Payment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      tenancyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tenancy_id'],
      )!,
      amountReceivedMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_received_minor'],
      )!,
      currency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency'],
      )!,
      receivedDate: $PaymentsTable.$converterreceivedDate.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}received_date'],
        )!,
      ),
      paymentMethod: $PaymentsTable.$converterpaymentMethod.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}payment_method'],
        )!,
      ),
      reference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reference'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      recordStatus: $PaymentsTable.$converterrecordStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}record_status'],
        )!,
      ),
      reversalReason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reversal_reason'],
      ),
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
  $PaymentsTable createAlias(String alias) {
    return $PaymentsTable(attachedDatabase, alias);
  }

  static TypeConverter<DateTime, String> $converterreceivedDate =
      const DateOnlyConverter();
  static TypeConverter<PaymentMethod, String> $converterpaymentMethod =
      const SnakeCaseEnumConverter(PaymentMethod.values);
  static TypeConverter<PaymentRecordStatus, String> $converterrecordStatus =
      const SnakeCaseEnumConverter(PaymentRecordStatus.values);
}

class PaymentsCompanion extends UpdateCompanion<Payment> {
  final Value<String> id;
  final Value<String> tenancyId;
  final Value<int> amountReceivedMinor;
  final Value<String> currency;
  final Value<DateTime> receivedDate;
  final Value<PaymentMethod> paymentMethod;
  final Value<String?> reference;
  final Value<String?> notes;
  final Value<PaymentRecordStatus> recordStatus;
  final Value<String?> reversalReason;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const PaymentsCompanion({
    this.id = const Value.absent(),
    this.tenancyId = const Value.absent(),
    this.amountReceivedMinor = const Value.absent(),
    this.currency = const Value.absent(),
    this.receivedDate = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.reference = const Value.absent(),
    this.notes = const Value.absent(),
    this.recordStatus = const Value.absent(),
    this.reversalReason = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PaymentsCompanion.insert({
    required String id,
    required String tenancyId,
    required int amountReceivedMinor,
    this.currency = const Value.absent(),
    required DateTime receivedDate,
    required PaymentMethod paymentMethod,
    this.reference = const Value.absent(),
    this.notes = const Value.absent(),
    required PaymentRecordStatus recordStatus,
    this.reversalReason = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       tenancyId = Value(tenancyId),
       amountReceivedMinor = Value(amountReceivedMinor),
       receivedDate = Value(receivedDate),
       paymentMethod = Value(paymentMethod),
       recordStatus = Value(recordStatus),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Payment> custom({
    Expression<String>? id,
    Expression<String>? tenancyId,
    Expression<int>? amountReceivedMinor,
    Expression<String>? currency,
    Expression<String>? receivedDate,
    Expression<String>? paymentMethod,
    Expression<String>? reference,
    Expression<String>? notes,
    Expression<String>? recordStatus,
    Expression<String>? reversalReason,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tenancyId != null) 'tenancy_id': tenancyId,
      if (amountReceivedMinor != null)
        'amount_received_minor': amountReceivedMinor,
      if (currency != null) 'currency': currency,
      if (receivedDate != null) 'received_date': receivedDate,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (reference != null) 'reference': reference,
      if (notes != null) 'notes': notes,
      if (recordStatus != null) 'record_status': recordStatus,
      if (reversalReason != null) 'reversal_reason': reversalReason,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PaymentsCompanion copyWith({
    Value<String>? id,
    Value<String>? tenancyId,
    Value<int>? amountReceivedMinor,
    Value<String>? currency,
    Value<DateTime>? receivedDate,
    Value<PaymentMethod>? paymentMethod,
    Value<String?>? reference,
    Value<String?>? notes,
    Value<PaymentRecordStatus>? recordStatus,
    Value<String?>? reversalReason,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return PaymentsCompanion(
      id: id ?? this.id,
      tenancyId: tenancyId ?? this.tenancyId,
      amountReceivedMinor: amountReceivedMinor ?? this.amountReceivedMinor,
      currency: currency ?? this.currency,
      receivedDate: receivedDate ?? this.receivedDate,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      reference: reference ?? this.reference,
      notes: notes ?? this.notes,
      recordStatus: recordStatus ?? this.recordStatus,
      reversalReason: reversalReason ?? this.reversalReason,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (tenancyId.present) {
      map['tenancy_id'] = Variable<String>(tenancyId.value);
    }
    if (amountReceivedMinor.present) {
      map['amount_received_minor'] = Variable<int>(amountReceivedMinor.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (receivedDate.present) {
      map['received_date'] = Variable<String>(
        $PaymentsTable.$converterreceivedDate.toSql(receivedDate.value),
      );
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(
        $PaymentsTable.$converterpaymentMethod.toSql(paymentMethod.value),
      );
    }
    if (reference.present) {
      map['reference'] = Variable<String>(reference.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (recordStatus.present) {
      map['record_status'] = Variable<String>(
        $PaymentsTable.$converterrecordStatus.toSql(recordStatus.value),
      );
    }
    if (reversalReason.present) {
      map['reversal_reason'] = Variable<String>(reversalReason.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentsCompanion(')
          ..write('id: $id, ')
          ..write('tenancyId: $tenancyId, ')
          ..write('amountReceivedMinor: $amountReceivedMinor, ')
          ..write('currency: $currency, ')
          ..write('receivedDate: $receivedDate, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('reference: $reference, ')
          ..write('notes: $notes, ')
          ..write('recordStatus: $recordStatus, ')
          ..write('reversalReason: $reversalReason, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$PaymentInsertable implements Insertable<Payment> {
  Payment _object;
  _$PaymentInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return PaymentsCompanion(
      id: Value(_object.id),
      tenancyId: Value(_object.tenancyId),
      amountReceivedMinor: Value(_object.amountReceivedMinor),
      currency: Value(_object.currency),
      receivedDate: Value(_object.receivedDate),
      paymentMethod: Value(_object.paymentMethod),
      reference: Value(_object.reference),
      notes: Value(_object.notes),
      recordStatus: Value(_object.recordStatus),
      reversalReason: Value(_object.reversalReason),
      createdAt: Value(_object.createdAt),
      updatedAt: Value(_object.updatedAt),
    ).toColumns(false);
  }
}

extension PaymentToInsertable on Payment {
  _$PaymentInsertable toInsertable() {
    return _$PaymentInsertable(this);
  }
}

class $PaymentAllocationsTable extends PaymentAllocations
    with TableInfo<$PaymentAllocationsTable, PaymentAllocation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentAllocationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paymentIdMeta = const VerificationMeta(
    'paymentId',
  );
  @override
  late final GeneratedColumn<String> paymentId = GeneratedColumn<String>(
    'payment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES payments (id)',
    ),
  );
  static const VerificationMeta _rentObligationIdMeta = const VerificationMeta(
    'rentObligationId',
  );
  @override
  late final GeneratedColumn<String> rentObligationId = GeneratedColumn<String>(
    'rent_obligation_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES rent_obligations (id)',
    ),
  );
  static const VerificationMeta _amountAllocatedMinorMeta =
      const VerificationMeta('amountAllocatedMinor');
  @override
  late final GeneratedColumn<int> amountAllocatedMinor = GeneratedColumn<int>(
    'amount_allocated_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    paymentId,
    rentObligationId,
    amountAllocatedMinor,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payment_allocations';
  @override
  VerificationContext validateIntegrity(
    Insertable<PaymentAllocation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('payment_id')) {
      context.handle(
        _paymentIdMeta,
        paymentId.isAcceptableOrUnknown(data['payment_id']!, _paymentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_paymentIdMeta);
    }
    if (data.containsKey('rent_obligation_id')) {
      context.handle(
        _rentObligationIdMeta,
        rentObligationId.isAcceptableOrUnknown(
          data['rent_obligation_id']!,
          _rentObligationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_rentObligationIdMeta);
    }
    if (data.containsKey('amount_allocated_minor')) {
      context.handle(
        _amountAllocatedMinorMeta,
        amountAllocatedMinor.isAcceptableOrUnknown(
          data['amount_allocated_minor']!,
          _amountAllocatedMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amountAllocatedMinorMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PaymentAllocation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PaymentAllocation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      paymentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_id'],
      )!,
      rentObligationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rent_obligation_id'],
      )!,
      amountAllocatedMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_allocated_minor'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PaymentAllocationsTable createAlias(String alias) {
    return $PaymentAllocationsTable(attachedDatabase, alias);
  }
}

class PaymentAllocationsCompanion extends UpdateCompanion<PaymentAllocation> {
  final Value<String> id;
  final Value<String> paymentId;
  final Value<String> rentObligationId;
  final Value<int> amountAllocatedMinor;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const PaymentAllocationsCompanion({
    this.id = const Value.absent(),
    this.paymentId = const Value.absent(),
    this.rentObligationId = const Value.absent(),
    this.amountAllocatedMinor = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PaymentAllocationsCompanion.insert({
    required String id,
    required String paymentId,
    required String rentObligationId,
    required int amountAllocatedMinor,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       paymentId = Value(paymentId),
       rentObligationId = Value(rentObligationId),
       amountAllocatedMinor = Value(amountAllocatedMinor),
       createdAt = Value(createdAt);
  static Insertable<PaymentAllocation> custom({
    Expression<String>? id,
    Expression<String>? paymentId,
    Expression<String>? rentObligationId,
    Expression<int>? amountAllocatedMinor,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (paymentId != null) 'payment_id': paymentId,
      if (rentObligationId != null) 'rent_obligation_id': rentObligationId,
      if (amountAllocatedMinor != null)
        'amount_allocated_minor': amountAllocatedMinor,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PaymentAllocationsCompanion copyWith({
    Value<String>? id,
    Value<String>? paymentId,
    Value<String>? rentObligationId,
    Value<int>? amountAllocatedMinor,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return PaymentAllocationsCompanion(
      id: id ?? this.id,
      paymentId: paymentId ?? this.paymentId,
      rentObligationId: rentObligationId ?? this.rentObligationId,
      amountAllocatedMinor: amountAllocatedMinor ?? this.amountAllocatedMinor,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (paymentId.present) {
      map['payment_id'] = Variable<String>(paymentId.value);
    }
    if (rentObligationId.present) {
      map['rent_obligation_id'] = Variable<String>(rentObligationId.value);
    }
    if (amountAllocatedMinor.present) {
      map['amount_allocated_minor'] = Variable<int>(amountAllocatedMinor.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentAllocationsCompanion(')
          ..write('id: $id, ')
          ..write('paymentId: $paymentId, ')
          ..write('rentObligationId: $rentObligationId, ')
          ..write('amountAllocatedMinor: $amountAllocatedMinor, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$PaymentAllocationInsertable implements Insertable<PaymentAllocation> {
  PaymentAllocation _object;
  _$PaymentAllocationInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return PaymentAllocationsCompanion(
      id: Value(_object.id),
      paymentId: Value(_object.paymentId),
      rentObligationId: Value(_object.rentObligationId),
      amountAllocatedMinor: Value(_object.amountAllocatedMinor),
      createdAt: Value(_object.createdAt),
    ).toColumns(false);
  }
}

extension PaymentAllocationToInsertable on PaymentAllocation {
  _$PaymentAllocationInsertable toInsertable() {
    return _$PaymentAllocationInsertable(this);
  }
}

class $NotificationPreferencesTable extends NotificationPreferences
    with TableInfo<$NotificationPreferencesTable, NotificationPreference> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationPreferencesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _landlordIdMeta = const VerificationMeta(
    'landlordId',
  );
  @override
  late final GeneratedColumn<String> landlordId = GeneratedColumn<String>(
    'landlord_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES landlord_profiles (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<NotificationEventType, String>
  eventType =
      GeneratedColumn<String>(
        'event_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<NotificationEventType>(
        $NotificationPreferencesTable.$convertereventType,
      );
  static const VerificationMeta _enabledMeta = const VerificationMeta(
    'enabled',
  );
  @override
  late final GeneratedColumn<bool> enabled = GeneratedColumn<bool>(
    'enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _daysBeforeMeta = const VerificationMeta(
    'daysBefore',
  );
  @override
  late final GeneratedColumn<int> daysBefore = GeneratedColumn<int>(
    'days_before',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
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
    landlordId,
    eventType,
    enabled,
    daysBefore,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notification_preferences';
  @override
  VerificationContext validateIntegrity(
    Insertable<NotificationPreference> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('landlord_id')) {
      context.handle(
        _landlordIdMeta,
        landlordId.isAcceptableOrUnknown(data['landlord_id']!, _landlordIdMeta),
      );
    } else if (isInserting) {
      context.missing(_landlordIdMeta);
    }
    if (data.containsKey('enabled')) {
      context.handle(
        _enabledMeta,
        enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta),
      );
    }
    if (data.containsKey('days_before')) {
      context.handle(
        _daysBeforeMeta,
        daysBefore.isAcceptableOrUnknown(data['days_before']!, _daysBeforeMeta),
      );
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
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {landlordId, eventType},
  ];
  @override
  NotificationPreference map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotificationPreference(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      landlordId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}landlord_id'],
      )!,
      eventType: $NotificationPreferencesTable.$convertereventType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}event_type'],
        )!,
      ),
      enabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}enabled'],
      )!,
      daysBefore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}days_before'],
      ),
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
  $NotificationPreferencesTable createAlias(String alias) {
    return $NotificationPreferencesTable(attachedDatabase, alias);
  }

  static TypeConverter<NotificationEventType, String> $convertereventType =
      const SnakeCaseEnumConverter(NotificationEventType.values);
}

class NotificationPreferencesCompanion
    extends UpdateCompanion<NotificationPreference> {
  final Value<String> id;
  final Value<String> landlordId;
  final Value<NotificationEventType> eventType;
  final Value<bool> enabled;
  final Value<int?> daysBefore;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const NotificationPreferencesCompanion({
    this.id = const Value.absent(),
    this.landlordId = const Value.absent(),
    this.eventType = const Value.absent(),
    this.enabled = const Value.absent(),
    this.daysBefore = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NotificationPreferencesCompanion.insert({
    required String id,
    required String landlordId,
    required NotificationEventType eventType,
    this.enabled = const Value.absent(),
    this.daysBefore = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       landlordId = Value(landlordId),
       eventType = Value(eventType),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<NotificationPreference> custom({
    Expression<String>? id,
    Expression<String>? landlordId,
    Expression<String>? eventType,
    Expression<bool>? enabled,
    Expression<int>? daysBefore,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (landlordId != null) 'landlord_id': landlordId,
      if (eventType != null) 'event_type': eventType,
      if (enabled != null) 'enabled': enabled,
      if (daysBefore != null) 'days_before': daysBefore,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NotificationPreferencesCompanion copyWith({
    Value<String>? id,
    Value<String>? landlordId,
    Value<NotificationEventType>? eventType,
    Value<bool>? enabled,
    Value<int?>? daysBefore,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return NotificationPreferencesCompanion(
      id: id ?? this.id,
      landlordId: landlordId ?? this.landlordId,
      eventType: eventType ?? this.eventType,
      enabled: enabled ?? this.enabled,
      daysBefore: daysBefore ?? this.daysBefore,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (landlordId.present) {
      map['landlord_id'] = Variable<String>(landlordId.value);
    }
    if (eventType.present) {
      map['event_type'] = Variable<String>(
        $NotificationPreferencesTable.$convertereventType.toSql(
          eventType.value,
        ),
      );
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    if (daysBefore.present) {
      map['days_before'] = Variable<int>(daysBefore.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationPreferencesCompanion(')
          ..write('id: $id, ')
          ..write('landlordId: $landlordId, ')
          ..write('eventType: $eventType, ')
          ..write('enabled: $enabled, ')
          ..write('daysBefore: $daysBefore, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class _$NotificationPreferenceInsertable
    implements Insertable<NotificationPreference> {
  NotificationPreference _object;
  _$NotificationPreferenceInsertable(this._object);
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return NotificationPreferencesCompanion(
      id: Value(_object.id),
      landlordId: Value(_object.landlordId),
      eventType: Value(_object.eventType),
      enabled: Value(_object.enabled),
      daysBefore: Value(_object.daysBefore),
      createdAt: Value(_object.createdAt),
      updatedAt: Value(_object.updatedAt),
    ).toColumns(false);
  }
}

extension NotificationPreferenceToInsertable on NotificationPreference {
  _$NotificationPreferenceInsertable toInsertable() {
    return _$NotificationPreferenceInsertable(this);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LandlordProfilesTable landlordProfiles = $LandlordProfilesTable(
    this,
  );
  late final $PropertiesTable properties = $PropertiesTable(this);
  late final $UnitsTable units = $UnitsTable(this);
  late final $TenantsTable tenants = $TenantsTable(this);
  late final $TenanciesTable tenancies = $TenanciesTable(this);
  late final $RentObligationsTable rentObligations = $RentObligationsTable(
    this,
  );
  late final $PaymentsTable payments = $PaymentsTable(this);
  late final $PaymentAllocationsTable paymentAllocations =
      $PaymentAllocationsTable(this);
  late final $NotificationPreferencesTable notificationPreferences =
      $NotificationPreferencesTable(this);
  late final Index propertiesLandlordId = Index(
    'properties_landlord_id',
    'CREATE INDEX properties_landlord_id ON properties (landlord_id)',
  );
  late final Index unitsPropertyId = Index(
    'units_property_id',
    'CREATE INDEX units_property_id ON units (property_id)',
  );
  late final Index tenantsLandlordId = Index(
    'tenants_landlord_id',
    'CREATE INDEX tenants_landlord_id ON tenants (landlord_id)',
  );
  late final Index tenanciesTenantId = Index(
    'tenancies_tenant_id',
    'CREATE INDEX tenancies_tenant_id ON tenancies (tenant_id)',
  );
  late final Index tenanciesUnitId = Index(
    'tenancies_unit_id',
    'CREATE INDEX tenancies_unit_id ON tenancies (unit_id)',
  );
  late final Index rentObligationsDueDate = Index(
    'rent_obligations_due_date',
    'CREATE INDEX rent_obligations_due_date ON rent_obligations (due_date)',
  );
  late final Index paymentsTenancyId = Index(
    'payments_tenancy_id',
    'CREATE INDEX payments_tenancy_id ON payments (tenancy_id)',
  );
  late final Index paymentAllocationsPaymentId = Index(
    'payment_allocations_payment_id',
    'CREATE INDEX payment_allocations_payment_id ON payment_allocations (payment_id)',
  );
  late final Index paymentAllocationsRentObligationId = Index(
    'payment_allocations_rent_obligation_id',
    'CREATE INDEX payment_allocations_rent_obligation_id ON payment_allocations (rent_obligation_id)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    landlordProfiles,
    properties,
    units,
    tenants,
    tenancies,
    rentObligations,
    payments,
    paymentAllocations,
    notificationPreferences,
    propertiesLandlordId,
    unitsPropertyId,
    tenantsLandlordId,
    tenanciesTenantId,
    tenanciesUnitId,
    rentObligationsDueDate,
    paymentsTenancyId,
    paymentAllocationsPaymentId,
    paymentAllocationsRentObligationId,
  ];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$LandlordProfilesTableCreateCompanionBuilder =
    LandlordProfilesCompanion Function({
      required String id,
      required String displayName,
      Value<String?> phoneNumber,
      Value<String?> email,
      Value<String> defaultCurrency,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$LandlordProfilesTableUpdateCompanionBuilder =
    LandlordProfilesCompanion Function({
      Value<String> id,
      Value<String> displayName,
      Value<String?> phoneNumber,
      Value<String?> email,
      Value<String> defaultCurrency,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$LandlordProfilesTableReferences
    extends
        BaseReferences<_$AppDatabase, $LandlordProfilesTable, LandlordProfile> {
  $$LandlordProfilesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$PropertiesTable, List<Property>>
  _propertiesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.properties,
    aliasName: 'landlord_profiles__id__properties__landlord_id',
  );

  $$PropertiesTableProcessedTableManager get propertiesRefs {
    final manager = $$PropertiesTableTableManager(
      $_db,
      $_db.properties,
    ).filter((f) => f.landlordId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_propertiesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TenantsTable, List<Tenant>> _tenantsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.tenants,
    aliasName: 'landlord_profiles__id__tenants__landlord_id',
  );

  $$TenantsTableProcessedTableManager get tenantsRefs {
    final manager = $$TenantsTableTableManager(
      $_db,
      $_db.tenants,
    ).filter((f) => f.landlordId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_tenantsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $NotificationPreferencesTable,
    List<NotificationPreference>
  >
  _notificationPreferencesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.notificationPreferences,
        aliasName:
            'landlord_profiles__id__notification_preferences__landlord_id',
      );

  $$NotificationPreferencesTableProcessedTableManager
  get notificationPreferencesRefs {
    final manager = $$NotificationPreferencesTableTableManager(
      $_db,
      $_db.notificationPreferences,
    ).filter((f) => f.landlordId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _notificationPreferencesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LandlordProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $LandlordProfilesTable> {
  $$LandlordProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get defaultCurrency => $composableBuilder(
    column: $table.defaultCurrency,
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

  Expression<bool> propertiesRefs(
    Expression<bool> Function($$PropertiesTableFilterComposer f) f,
  ) {
    final $$PropertiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.landlordId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableFilterComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> tenantsRefs(
    Expression<bool> Function($$TenantsTableFilterComposer f) f,
  ) {
    final $$TenantsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.landlordId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableFilterComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> notificationPreferencesRefs(
    Expression<bool> Function($$NotificationPreferencesTableFilterComposer f) f,
  ) {
    final $$NotificationPreferencesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.notificationPreferences,
          getReferencedColumn: (t) => t.landlordId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$NotificationPreferencesTableFilterComposer(
                $db: $db,
                $table: $db.notificationPreferences,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$LandlordProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $LandlordProfilesTable> {
  $$LandlordProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get defaultCurrency => $composableBuilder(
    column: $table.defaultCurrency,
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
}

class $$LandlordProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LandlordProfilesTable> {
  $$LandlordProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get defaultCurrency => $composableBuilder(
    column: $table.defaultCurrency,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> propertiesRefs<T extends Object>(
    Expression<T> Function($$PropertiesTableAnnotationComposer a) f,
  ) {
    final $$PropertiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.landlordId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableAnnotationComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> tenantsRefs<T extends Object>(
    Expression<T> Function($$TenantsTableAnnotationComposer a) f,
  ) {
    final $$TenantsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.landlordId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableAnnotationComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> notificationPreferencesRefs<T extends Object>(
    Expression<T> Function($$NotificationPreferencesTableAnnotationComposer a)
    f,
  ) {
    final $$NotificationPreferencesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.notificationPreferences,
          getReferencedColumn: (t) => t.landlordId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$NotificationPreferencesTableAnnotationComposer(
                $db: $db,
                $table: $db.notificationPreferences,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$LandlordProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LandlordProfilesTable,
          LandlordProfile,
          $$LandlordProfilesTableFilterComposer,
          $$LandlordProfilesTableOrderingComposer,
          $$LandlordProfilesTableAnnotationComposer,
          $$LandlordProfilesTableCreateCompanionBuilder,
          $$LandlordProfilesTableUpdateCompanionBuilder,
          (LandlordProfile, $$LandlordProfilesTableReferences),
          LandlordProfile,
          PrefetchHooks Function({
            bool propertiesRefs,
            bool tenantsRefs,
            bool notificationPreferencesRefs,
          })
        > {
  $$LandlordProfilesTableTableManager(
    _$AppDatabase db,
    $LandlordProfilesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LandlordProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LandlordProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LandlordProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<String?> phoneNumber = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String> defaultCurrency = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LandlordProfilesCompanion(
                id: id,
                displayName: displayName,
                phoneNumber: phoneNumber,
                email: email,
                defaultCurrency: defaultCurrency,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String displayName,
                Value<String?> phoneNumber = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String> defaultCurrency = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => LandlordProfilesCompanion.insert(
                id: id,
                displayName: displayName,
                phoneNumber: phoneNumber,
                email: email,
                defaultCurrency: defaultCurrency,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LandlordProfilesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                propertiesRefs = false,
                tenantsRefs = false,
                notificationPreferencesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (propertiesRefs) db.properties,
                    if (tenantsRefs) db.tenants,
                    if (notificationPreferencesRefs) db.notificationPreferences,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (propertiesRefs)
                        await $_getPrefetchedData<
                          LandlordProfile,
                          $LandlordProfilesTable,
                          Property
                        >(
                          currentTable: table,
                          referencedTable: $$LandlordProfilesTableReferences
                              ._propertiesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LandlordProfilesTableReferences(
                                db,
                                table,
                                p0,
                              ).propertiesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.landlordId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (tenantsRefs)
                        await $_getPrefetchedData<
                          LandlordProfile,
                          $LandlordProfilesTable,
                          Tenant
                        >(
                          currentTable: table,
                          referencedTable: $$LandlordProfilesTableReferences
                              ._tenantsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LandlordProfilesTableReferences(
                                db,
                                table,
                                p0,
                              ).tenantsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.landlordId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (notificationPreferencesRefs)
                        await $_getPrefetchedData<
                          LandlordProfile,
                          $LandlordProfilesTable,
                          NotificationPreference
                        >(
                          currentTable: table,
                          referencedTable: $$LandlordProfilesTableReferences
                              ._notificationPreferencesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LandlordProfilesTableReferences(
                                db,
                                table,
                                p0,
                              ).notificationPreferencesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.landlordId == item.id,
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

typedef $$LandlordProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LandlordProfilesTable,
      LandlordProfile,
      $$LandlordProfilesTableFilterComposer,
      $$LandlordProfilesTableOrderingComposer,
      $$LandlordProfilesTableAnnotationComposer,
      $$LandlordProfilesTableCreateCompanionBuilder,
      $$LandlordProfilesTableUpdateCompanionBuilder,
      (LandlordProfile, $$LandlordProfilesTableReferences),
      LandlordProfile,
      PrefetchHooks Function({
        bool propertiesRefs,
        bool tenantsRefs,
        bool notificationPreferencesRefs,
      })
    >;
typedef $$PropertiesTableCreateCompanionBuilder =
    PropertiesCompanion Function({
      required String id,
      required String landlordId,
      required String name,
      required PropertyType propertyType,
      Value<String?> description,
      Value<String?> addressLine,
      Value<String?> areaOrTown,
      Value<String?> district,
      Value<String?> region,
      Value<String> countryCode,
      Value<double?> latitude,
      Value<double?> longitude,
      Value<String?> privateNotes,
      required RecordStatus recordStatus,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> archivedAt,
      Value<int> rowid,
    });
typedef $$PropertiesTableUpdateCompanionBuilder =
    PropertiesCompanion Function({
      Value<String> id,
      Value<String> landlordId,
      Value<String> name,
      Value<PropertyType> propertyType,
      Value<String?> description,
      Value<String?> addressLine,
      Value<String?> areaOrTown,
      Value<String?> district,
      Value<String?> region,
      Value<String> countryCode,
      Value<double?> latitude,
      Value<double?> longitude,
      Value<String?> privateNotes,
      Value<RecordStatus> recordStatus,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> archivedAt,
      Value<int> rowid,
    });

final class $$PropertiesTableReferences
    extends BaseReferences<_$AppDatabase, $PropertiesTable, Property> {
  $$PropertiesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LandlordProfilesTable _landlordIdTable(_$AppDatabase db) => db
      .landlordProfiles
      .createAlias('properties__landlord_id__landlord_profiles__id');

  $$LandlordProfilesTableProcessedTableManager get landlordId {
    final $_column = $_itemColumn<String>('landlord_id')!;

    final manager = $$LandlordProfilesTableTableManager(
      $_db,
      $_db.landlordProfiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_landlordIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$UnitsTable, List<Unit>> _unitsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.units,
    aliasName: 'properties__id__units__property_id',
  );

  $$UnitsTableProcessedTableManager get unitsRefs {
    final manager = $$UnitsTableTableManager(
      $_db,
      $_db.units,
    ).filter((f) => f.propertyId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_unitsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PropertiesTableFilterComposer
    extends Composer<_$AppDatabase, $PropertiesTable> {
  $$PropertiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<PropertyType, PropertyType, String>
  get propertyType => $composableBuilder(
    column: $table.propertyType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get addressLine => $composableBuilder(
    column: $table.addressLine,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get areaOrTown => $composableBuilder(
    column: $table.areaOrTown,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get district => $composableBuilder(
    column: $table.district,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get region => $composableBuilder(
    column: $table.region,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get countryCode => $composableBuilder(
    column: $table.countryCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get privateNotes => $composableBuilder(
    column: $table.privateNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<RecordStatus, RecordStatus, String>
  get recordStatus => $composableBuilder(
    column: $table.recordStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$LandlordProfilesTableFilterComposer get landlordId {
    final $$LandlordProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landlordId,
      referencedTable: $db.landlordProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandlordProfilesTableFilterComposer(
            $db: $db,
            $table: $db.landlordProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> unitsRefs(
    Expression<bool> Function($$UnitsTableFilterComposer f) f,
  ) {
    final $$UnitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.propertyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableFilterComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PropertiesTableOrderingComposer
    extends Composer<_$AppDatabase, $PropertiesTable> {
  $$PropertiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get propertyType => $composableBuilder(
    column: $table.propertyType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get addressLine => $composableBuilder(
    column: $table.addressLine,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get areaOrTown => $composableBuilder(
    column: $table.areaOrTown,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get district => $composableBuilder(
    column: $table.district,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get region => $composableBuilder(
    column: $table.region,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get countryCode => $composableBuilder(
    column: $table.countryCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get privateNotes => $composableBuilder(
    column: $table.privateNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordStatus => $composableBuilder(
    column: $table.recordStatus,
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

  ColumnOrderings<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$LandlordProfilesTableOrderingComposer get landlordId {
    final $$LandlordProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landlordId,
      referencedTable: $db.landlordProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandlordProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.landlordProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PropertiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PropertiesTable> {
  $$PropertiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<PropertyType, String> get propertyType =>
      $composableBuilder(
        column: $table.propertyType,
        builder: (column) => column,
      );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get addressLine => $composableBuilder(
    column: $table.addressLine,
    builder: (column) => column,
  );

  GeneratedColumn<String> get areaOrTown => $composableBuilder(
    column: $table.areaOrTown,
    builder: (column) => column,
  );

  GeneratedColumn<String> get district =>
      $composableBuilder(column: $table.district, builder: (column) => column);

  GeneratedColumn<String> get region =>
      $composableBuilder(column: $table.region, builder: (column) => column);

  GeneratedColumn<String> get countryCode => $composableBuilder(
    column: $table.countryCode,
    builder: (column) => column,
  );

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get privateNotes => $composableBuilder(
    column: $table.privateNotes,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<RecordStatus, String> get recordStatus =>
      $composableBuilder(
        column: $table.recordStatus,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => column,
  );

  $$LandlordProfilesTableAnnotationComposer get landlordId {
    final $$LandlordProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landlordId,
      referencedTable: $db.landlordProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandlordProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.landlordProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> unitsRefs<T extends Object>(
    Expression<T> Function($$UnitsTableAnnotationComposer a) f,
  ) {
    final $$UnitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.propertyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableAnnotationComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PropertiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PropertiesTable,
          Property,
          $$PropertiesTableFilterComposer,
          $$PropertiesTableOrderingComposer,
          $$PropertiesTableAnnotationComposer,
          $$PropertiesTableCreateCompanionBuilder,
          $$PropertiesTableUpdateCompanionBuilder,
          (Property, $$PropertiesTableReferences),
          Property,
          PrefetchHooks Function({bool landlordId, bool unitsRefs})
        > {
  $$PropertiesTableTableManager(_$AppDatabase db, $PropertiesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PropertiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PropertiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PropertiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> landlordId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<PropertyType> propertyType = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> addressLine = const Value.absent(),
                Value<String?> areaOrTown = const Value.absent(),
                Value<String?> district = const Value.absent(),
                Value<String?> region = const Value.absent(),
                Value<String> countryCode = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<String?> privateNotes = const Value.absent(),
                Value<RecordStatus> recordStatus = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> archivedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PropertiesCompanion(
                id: id,
                landlordId: landlordId,
                name: name,
                propertyType: propertyType,
                description: description,
                addressLine: addressLine,
                areaOrTown: areaOrTown,
                district: district,
                region: region,
                countryCode: countryCode,
                latitude: latitude,
                longitude: longitude,
                privateNotes: privateNotes,
                recordStatus: recordStatus,
                createdAt: createdAt,
                updatedAt: updatedAt,
                archivedAt: archivedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String landlordId,
                required String name,
                required PropertyType propertyType,
                Value<String?> description = const Value.absent(),
                Value<String?> addressLine = const Value.absent(),
                Value<String?> areaOrTown = const Value.absent(),
                Value<String?> district = const Value.absent(),
                Value<String?> region = const Value.absent(),
                Value<String> countryCode = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<String?> privateNotes = const Value.absent(),
                required RecordStatus recordStatus,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> archivedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PropertiesCompanion.insert(
                id: id,
                landlordId: landlordId,
                name: name,
                propertyType: propertyType,
                description: description,
                addressLine: addressLine,
                areaOrTown: areaOrTown,
                district: district,
                region: region,
                countryCode: countryCode,
                latitude: latitude,
                longitude: longitude,
                privateNotes: privateNotes,
                recordStatus: recordStatus,
                createdAt: createdAt,
                updatedAt: updatedAt,
                archivedAt: archivedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PropertiesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({landlordId = false, unitsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (unitsRefs) db.units],
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
                    if (landlordId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.landlordId,
                                referencedTable: $$PropertiesTableReferences
                                    ._landlordIdTable(db),
                                referencedColumn: $$PropertiesTableReferences
                                    ._landlordIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (unitsRefs)
                    await $_getPrefetchedData<Property, $PropertiesTable, Unit>(
                      currentTable: table,
                      referencedTable: $$PropertiesTableReferences
                          ._unitsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$PropertiesTableReferences(db, table, p0).unitsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.propertyId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$PropertiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PropertiesTable,
      Property,
      $$PropertiesTableFilterComposer,
      $$PropertiesTableOrderingComposer,
      $$PropertiesTableAnnotationComposer,
      $$PropertiesTableCreateCompanionBuilder,
      $$PropertiesTableUpdateCompanionBuilder,
      (Property, $$PropertiesTableReferences),
      Property,
      PrefetchHooks Function({bool landlordId, bool unitsRefs})
    >;
typedef $$UnitsTableCreateCompanionBuilder =
    UnitsCompanion Function({
      required String id,
      required String propertyId,
      required String name,
      required UnitType unitType,
      Value<String?> description,
      Value<String?> floorOrLevel,
      Value<double?> sizeValue,
      Value<String?> sizeUnit,
      Value<int?> defaultRentMinor,
      Value<String> defaultCurrency,
      required AvailabilityRestriction availabilityOverride,
      Value<String?> privateNotes,
      required RecordStatus recordStatus,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> archivedAt,
      Value<int> rowid,
    });
typedef $$UnitsTableUpdateCompanionBuilder =
    UnitsCompanion Function({
      Value<String> id,
      Value<String> propertyId,
      Value<String> name,
      Value<UnitType> unitType,
      Value<String?> description,
      Value<String?> floorOrLevel,
      Value<double?> sizeValue,
      Value<String?> sizeUnit,
      Value<int?> defaultRentMinor,
      Value<String> defaultCurrency,
      Value<AvailabilityRestriction> availabilityOverride,
      Value<String?> privateNotes,
      Value<RecordStatus> recordStatus,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> archivedAt,
      Value<int> rowid,
    });

final class $$UnitsTableReferences
    extends BaseReferences<_$AppDatabase, $UnitsTable, Unit> {
  $$UnitsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PropertiesTable _propertyIdTable(_$AppDatabase db) =>
      db.properties.createAlias('units__property_id__properties__id');

  $$PropertiesTableProcessedTableManager get propertyId {
    final $_column = $_itemColumn<String>('property_id')!;

    final manager = $$PropertiesTableTableManager(
      $_db,
      $_db.properties,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_propertyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TenanciesTable, List<Tenancy>>
  _tenanciesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.tenancies,
    aliasName: 'units__id__tenancies__unit_id',
  );

  $$TenanciesTableProcessedTableManager get tenanciesRefs {
    final manager = $$TenanciesTableTableManager(
      $_db,
      $_db.tenancies,
    ).filter((f) => f.unitId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_tenanciesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UnitsTableFilterComposer extends Composer<_$AppDatabase, $UnitsTable> {
  $$UnitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<UnitType, UnitType, String> get unitType =>
      $composableBuilder(
        column: $table.unitType,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get floorOrLevel => $composableBuilder(
    column: $table.floorOrLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sizeValue => $composableBuilder(
    column: $table.sizeValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sizeUnit => $composableBuilder(
    column: $table.sizeUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get defaultRentMinor => $composableBuilder(
    column: $table.defaultRentMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get defaultCurrency => $composableBuilder(
    column: $table.defaultCurrency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    AvailabilityRestriction,
    AvailabilityRestriction,
    String
  >
  get availabilityOverride => $composableBuilder(
    column: $table.availabilityOverride,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get privateNotes => $composableBuilder(
    column: $table.privateNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<RecordStatus, RecordStatus, String>
  get recordStatus => $composableBuilder(
    column: $table.recordStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PropertiesTableFilterComposer get propertyId {
    final $$PropertiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableFilterComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> tenanciesRefs(
    Expression<bool> Function($$TenanciesTableFilterComposer f) f,
  ) {
    final $$TenanciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tenancies,
      getReferencedColumn: (t) => t.unitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenanciesTableFilterComposer(
            $db: $db,
            $table: $db.tenancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UnitsTableOrderingComposer
    extends Composer<_$AppDatabase, $UnitsTable> {
  $$UnitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitType => $composableBuilder(
    column: $table.unitType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get floorOrLevel => $composableBuilder(
    column: $table.floorOrLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sizeValue => $composableBuilder(
    column: $table.sizeValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sizeUnit => $composableBuilder(
    column: $table.sizeUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get defaultRentMinor => $composableBuilder(
    column: $table.defaultRentMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get defaultCurrency => $composableBuilder(
    column: $table.defaultCurrency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get availabilityOverride => $composableBuilder(
    column: $table.availabilityOverride,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get privateNotes => $composableBuilder(
    column: $table.privateNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordStatus => $composableBuilder(
    column: $table.recordStatus,
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

  ColumnOrderings<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PropertiesTableOrderingComposer get propertyId {
    final $$PropertiesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableOrderingComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UnitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UnitsTable> {
  $$UnitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<UnitType, String> get unitType =>
      $composableBuilder(column: $table.unitType, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get floorOrLevel => $composableBuilder(
    column: $table.floorOrLevel,
    builder: (column) => column,
  );

  GeneratedColumn<double> get sizeValue =>
      $composableBuilder(column: $table.sizeValue, builder: (column) => column);

  GeneratedColumn<String> get sizeUnit =>
      $composableBuilder(column: $table.sizeUnit, builder: (column) => column);

  GeneratedColumn<int> get defaultRentMinor => $composableBuilder(
    column: $table.defaultRentMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get defaultCurrency => $composableBuilder(
    column: $table.defaultCurrency,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<AvailabilityRestriction, String>
  get availabilityOverride => $composableBuilder(
    column: $table.availabilityOverride,
    builder: (column) => column,
  );

  GeneratedColumn<String> get privateNotes => $composableBuilder(
    column: $table.privateNotes,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<RecordStatus, String> get recordStatus =>
      $composableBuilder(
        column: $table.recordStatus,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => column,
  );

  $$PropertiesTableAnnotationComposer get propertyId {
    final $$PropertiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.propertyId,
      referencedTable: $db.properties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PropertiesTableAnnotationComposer(
            $db: $db,
            $table: $db.properties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> tenanciesRefs<T extends Object>(
    Expression<T> Function($$TenanciesTableAnnotationComposer a) f,
  ) {
    final $$TenanciesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tenancies,
      getReferencedColumn: (t) => t.unitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenanciesTableAnnotationComposer(
            $db: $db,
            $table: $db.tenancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UnitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UnitsTable,
          Unit,
          $$UnitsTableFilterComposer,
          $$UnitsTableOrderingComposer,
          $$UnitsTableAnnotationComposer,
          $$UnitsTableCreateCompanionBuilder,
          $$UnitsTableUpdateCompanionBuilder,
          (Unit, $$UnitsTableReferences),
          Unit,
          PrefetchHooks Function({bool propertyId, bool tenanciesRefs})
        > {
  $$UnitsTableTableManager(_$AppDatabase db, $UnitsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UnitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UnitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UnitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> propertyId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<UnitType> unitType = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> floorOrLevel = const Value.absent(),
                Value<double?> sizeValue = const Value.absent(),
                Value<String?> sizeUnit = const Value.absent(),
                Value<int?> defaultRentMinor = const Value.absent(),
                Value<String> defaultCurrency = const Value.absent(),
                Value<AvailabilityRestriction> availabilityOverride =
                    const Value.absent(),
                Value<String?> privateNotes = const Value.absent(),
                Value<RecordStatus> recordStatus = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> archivedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UnitsCompanion(
                id: id,
                propertyId: propertyId,
                name: name,
                unitType: unitType,
                description: description,
                floorOrLevel: floorOrLevel,
                sizeValue: sizeValue,
                sizeUnit: sizeUnit,
                defaultRentMinor: defaultRentMinor,
                defaultCurrency: defaultCurrency,
                availabilityOverride: availabilityOverride,
                privateNotes: privateNotes,
                recordStatus: recordStatus,
                createdAt: createdAt,
                updatedAt: updatedAt,
                archivedAt: archivedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String propertyId,
                required String name,
                required UnitType unitType,
                Value<String?> description = const Value.absent(),
                Value<String?> floorOrLevel = const Value.absent(),
                Value<double?> sizeValue = const Value.absent(),
                Value<String?> sizeUnit = const Value.absent(),
                Value<int?> defaultRentMinor = const Value.absent(),
                Value<String> defaultCurrency = const Value.absent(),
                required AvailabilityRestriction availabilityOverride,
                Value<String?> privateNotes = const Value.absent(),
                required RecordStatus recordStatus,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> archivedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UnitsCompanion.insert(
                id: id,
                propertyId: propertyId,
                name: name,
                unitType: unitType,
                description: description,
                floorOrLevel: floorOrLevel,
                sizeValue: sizeValue,
                sizeUnit: sizeUnit,
                defaultRentMinor: defaultRentMinor,
                defaultCurrency: defaultCurrency,
                availabilityOverride: availabilityOverride,
                privateNotes: privateNotes,
                recordStatus: recordStatus,
                createdAt: createdAt,
                updatedAt: updatedAt,
                archivedAt: archivedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UnitsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({propertyId = false, tenanciesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (tenanciesRefs) db.tenancies],
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
                    if (propertyId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.propertyId,
                                referencedTable: $$UnitsTableReferences
                                    ._propertyIdTable(db),
                                referencedColumn: $$UnitsTableReferences
                                    ._propertyIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tenanciesRefs)
                    await $_getPrefetchedData<Unit, $UnitsTable, Tenancy>(
                      currentTable: table,
                      referencedTable: $$UnitsTableReferences
                          ._tenanciesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$UnitsTableReferences(db, table, p0).tenanciesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.unitId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UnitsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UnitsTable,
      Unit,
      $$UnitsTableFilterComposer,
      $$UnitsTableOrderingComposer,
      $$UnitsTableAnnotationComposer,
      $$UnitsTableCreateCompanionBuilder,
      $$UnitsTableUpdateCompanionBuilder,
      (Unit, $$UnitsTableReferences),
      Unit,
      PrefetchHooks Function({bool propertyId, bool tenanciesRefs})
    >;
typedef $$TenantsTableCreateCompanionBuilder =
    TenantsCompanion Function({
      required String id,
      required String landlordId,
      required TenantType tenantType,
      required String fullName,
      required String phoneNumber,
      Value<String?> alternativePhone,
      Value<String?> email,
      Value<String?> address,
      Value<String?> privateNotes,
      required RecordStatus recordStatus,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> archivedAt,
      Value<int> rowid,
    });
typedef $$TenantsTableUpdateCompanionBuilder =
    TenantsCompanion Function({
      Value<String> id,
      Value<String> landlordId,
      Value<TenantType> tenantType,
      Value<String> fullName,
      Value<String> phoneNumber,
      Value<String?> alternativePhone,
      Value<String?> email,
      Value<String?> address,
      Value<String?> privateNotes,
      Value<RecordStatus> recordStatus,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> archivedAt,
      Value<int> rowid,
    });

final class $$TenantsTableReferences
    extends BaseReferences<_$AppDatabase, $TenantsTable, Tenant> {
  $$TenantsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LandlordProfilesTable _landlordIdTable(_$AppDatabase db) => db
      .landlordProfiles
      .createAlias('tenants__landlord_id__landlord_profiles__id');

  $$LandlordProfilesTableProcessedTableManager get landlordId {
    final $_column = $_itemColumn<String>('landlord_id')!;

    final manager = $$LandlordProfilesTableTableManager(
      $_db,
      $_db.landlordProfiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_landlordIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TenanciesTable, List<Tenancy>>
  _tenanciesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.tenancies,
    aliasName: 'tenants__id__tenancies__tenant_id',
  );

  $$TenanciesTableProcessedTableManager get tenanciesRefs {
    final manager = $$TenanciesTableTableManager(
      $_db,
      $_db.tenancies,
    ).filter((f) => f.tenantId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_tenanciesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TenantsTableFilterComposer
    extends Composer<_$AppDatabase, $TenantsTable> {
  $$TenantsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<TenantType, TenantType, String>
  get tenantType => $composableBuilder(
    column: $table.tenantType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get alternativePhone => $composableBuilder(
    column: $table.alternativePhone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get privateNotes => $composableBuilder(
    column: $table.privateNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<RecordStatus, RecordStatus, String>
  get recordStatus => $composableBuilder(
    column: $table.recordStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$LandlordProfilesTableFilterComposer get landlordId {
    final $$LandlordProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landlordId,
      referencedTable: $db.landlordProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandlordProfilesTableFilterComposer(
            $db: $db,
            $table: $db.landlordProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> tenanciesRefs(
    Expression<bool> Function($$TenanciesTableFilterComposer f) f,
  ) {
    final $$TenanciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tenancies,
      getReferencedColumn: (t) => t.tenantId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenanciesTableFilterComposer(
            $db: $db,
            $table: $db.tenancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TenantsTableOrderingComposer
    extends Composer<_$AppDatabase, $TenantsTable> {
  $$TenantsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenantType => $composableBuilder(
    column: $table.tenantType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get alternativePhone => $composableBuilder(
    column: $table.alternativePhone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get privateNotes => $composableBuilder(
    column: $table.privateNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordStatus => $composableBuilder(
    column: $table.recordStatus,
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

  ColumnOrderings<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$LandlordProfilesTableOrderingComposer get landlordId {
    final $$LandlordProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landlordId,
      referencedTable: $db.landlordProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandlordProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.landlordProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TenantsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TenantsTable> {
  $$TenantsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TenantType, String> get tenantType =>
      $composableBuilder(
        column: $table.tenantType,
        builder: (column) => column,
      );

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get alternativePhone => $composableBuilder(
    column: $table.alternativePhone,
    builder: (column) => column,
  );

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get privateNotes => $composableBuilder(
    column: $table.privateNotes,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<RecordStatus, String> get recordStatus =>
      $composableBuilder(
        column: $table.recordStatus,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => column,
  );

  $$LandlordProfilesTableAnnotationComposer get landlordId {
    final $$LandlordProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landlordId,
      referencedTable: $db.landlordProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandlordProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.landlordProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> tenanciesRefs<T extends Object>(
    Expression<T> Function($$TenanciesTableAnnotationComposer a) f,
  ) {
    final $$TenanciesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tenancies,
      getReferencedColumn: (t) => t.tenantId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenanciesTableAnnotationComposer(
            $db: $db,
            $table: $db.tenancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TenantsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TenantsTable,
          Tenant,
          $$TenantsTableFilterComposer,
          $$TenantsTableOrderingComposer,
          $$TenantsTableAnnotationComposer,
          $$TenantsTableCreateCompanionBuilder,
          $$TenantsTableUpdateCompanionBuilder,
          (Tenant, $$TenantsTableReferences),
          Tenant,
          PrefetchHooks Function({bool landlordId, bool tenanciesRefs})
        > {
  $$TenantsTableTableManager(_$AppDatabase db, $TenantsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TenantsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TenantsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TenantsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> landlordId = const Value.absent(),
                Value<TenantType> tenantType = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<String> phoneNumber = const Value.absent(),
                Value<String?> alternativePhone = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> privateNotes = const Value.absent(),
                Value<RecordStatus> recordStatus = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> archivedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TenantsCompanion(
                id: id,
                landlordId: landlordId,
                tenantType: tenantType,
                fullName: fullName,
                phoneNumber: phoneNumber,
                alternativePhone: alternativePhone,
                email: email,
                address: address,
                privateNotes: privateNotes,
                recordStatus: recordStatus,
                createdAt: createdAt,
                updatedAt: updatedAt,
                archivedAt: archivedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String landlordId,
                required TenantType tenantType,
                required String fullName,
                required String phoneNumber,
                Value<String?> alternativePhone = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> privateNotes = const Value.absent(),
                required RecordStatus recordStatus,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> archivedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TenantsCompanion.insert(
                id: id,
                landlordId: landlordId,
                tenantType: tenantType,
                fullName: fullName,
                phoneNumber: phoneNumber,
                alternativePhone: alternativePhone,
                email: email,
                address: address,
                privateNotes: privateNotes,
                recordStatus: recordStatus,
                createdAt: createdAt,
                updatedAt: updatedAt,
                archivedAt: archivedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TenantsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({landlordId = false, tenanciesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (tenanciesRefs) db.tenancies],
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
                    if (landlordId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.landlordId,
                                referencedTable: $$TenantsTableReferences
                                    ._landlordIdTable(db),
                                referencedColumn: $$TenantsTableReferences
                                    ._landlordIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tenanciesRefs)
                    await $_getPrefetchedData<Tenant, $TenantsTable, Tenancy>(
                      currentTable: table,
                      referencedTable: $$TenantsTableReferences
                          ._tenanciesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$TenantsTableReferences(db, table, p0).tenanciesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.tenantId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TenantsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TenantsTable,
      Tenant,
      $$TenantsTableFilterComposer,
      $$TenantsTableOrderingComposer,
      $$TenantsTableAnnotationComposer,
      $$TenantsTableCreateCompanionBuilder,
      $$TenantsTableUpdateCompanionBuilder,
      (Tenant, $$TenantsTableReferences),
      Tenant,
      PrefetchHooks Function({bool landlordId, bool tenanciesRefs})
    >;
typedef $$TenanciesTableCreateCompanionBuilder =
    TenanciesCompanion Function({
      required String id,
      required String tenantId,
      required String unitId,
      Value<String?> previousTenancyId,
      required AgreementType agreementType,
      required DateTime startDate,
      Value<DateTime?> endDate,
      required int agreedRentMinor,
      Value<String> currency,
      required PaymentFrequency paymentFrequency,
      Value<int?> customFrequencyMonths,
      required DateTime firstDueDate,
      Value<int?> dueDay,
      Value<int?> securityDepositMinor,
      Value<int?> advanceAmountMinor,
      Value<String?> termsNotes,
      required TenancyStatus status,
      Value<DateTime?> effectiveTerminationDate,
      Value<String?> terminationReason,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$TenanciesTableUpdateCompanionBuilder =
    TenanciesCompanion Function({
      Value<String> id,
      Value<String> tenantId,
      Value<String> unitId,
      Value<String?> previousTenancyId,
      Value<AgreementType> agreementType,
      Value<DateTime> startDate,
      Value<DateTime?> endDate,
      Value<int> agreedRentMinor,
      Value<String> currency,
      Value<PaymentFrequency> paymentFrequency,
      Value<int?> customFrequencyMonths,
      Value<DateTime> firstDueDate,
      Value<int?> dueDay,
      Value<int?> securityDepositMinor,
      Value<int?> advanceAmountMinor,
      Value<String?> termsNotes,
      Value<TenancyStatus> status,
      Value<DateTime?> effectiveTerminationDate,
      Value<String?> terminationReason,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$TenanciesTableReferences
    extends BaseReferences<_$AppDatabase, $TenanciesTable, Tenancy> {
  $$TenanciesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TenantsTable _tenantIdTable(_$AppDatabase db) =>
      db.tenants.createAlias('tenancies__tenant_id__tenants__id');

  $$TenantsTableProcessedTableManager get tenantId {
    final $_column = $_itemColumn<String>('tenant_id')!;

    final manager = $$TenantsTableTableManager(
      $_db,
      $_db.tenants,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tenantIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UnitsTable _unitIdTable(_$AppDatabase db) =>
      db.units.createAlias('tenancies__unit_id__units__id');

  $$UnitsTableProcessedTableManager get unitId {
    final $_column = $_itemColumn<String>('unit_id')!;

    final manager = $$UnitsTableTableManager(
      $_db,
      $_db.units,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_unitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TenanciesTable _previousTenancyIdTable(_$AppDatabase db) =>
      db.tenancies.createAlias('tenancies__previous_tenancy_id__tenancies__id');

  $$TenanciesTableProcessedTableManager? get previousTenancyId {
    final $_column = $_itemColumn<String>('previous_tenancy_id');
    if ($_column == null) return null;
    final manager = $$TenanciesTableTableManager(
      $_db,
      $_db.tenancies,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_previousTenancyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$RentObligationsTable, List<RentObligation>>
  _rentObligationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.rentObligations,
    aliasName: 'tenancies__id__rent_obligations__tenancy_id',
  );

  $$RentObligationsTableProcessedTableManager get rentObligationsRefs {
    final manager = $$RentObligationsTableTableManager(
      $_db,
      $_db.rentObligations,
    ).filter((f) => f.tenancyId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _rentObligationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PaymentsTable, List<Payment>> _paymentsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.payments,
    aliasName: 'tenancies__id__payments__tenancy_id',
  );

  $$PaymentsTableProcessedTableManager get paymentsRefs {
    final manager = $$PaymentsTableTableManager(
      $_db,
      $_db.payments,
    ).filter((f) => f.tenancyId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_paymentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TenanciesTableFilterComposer
    extends Composer<_$AppDatabase, $TenanciesTable> {
  $$TenanciesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<AgreementType, AgreementType, String>
  get agreementType => $composableBuilder(
    column: $table.agreementType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, String> get startDate =>
      $composableBuilder(
        column: $table.startDate,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<DateTime?, DateTime, String> get endDate =>
      $composableBuilder(
        column: $table.endDate,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get agreedRentMinor => $composableBuilder(
    column: $table.agreedRentMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<PaymentFrequency, PaymentFrequency, String>
  get paymentFrequency => $composableBuilder(
    column: $table.paymentFrequency,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get customFrequencyMonths => $composableBuilder(
    column: $table.customFrequencyMonths,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, String> get firstDueDate =>
      $composableBuilder(
        column: $table.firstDueDate,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get dueDay => $composableBuilder(
    column: $table.dueDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get securityDepositMinor => $composableBuilder(
    column: $table.securityDepositMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get advanceAmountMinor => $composableBuilder(
    column: $table.advanceAmountMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get termsNotes => $composableBuilder(
    column: $table.termsNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<TenancyStatus, TenancyStatus, String>
  get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime?, DateTime, String>
  get effectiveTerminationDate => $composableBuilder(
    column: $table.effectiveTerminationDate,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get terminationReason => $composableBuilder(
    column: $table.terminationReason,
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

  $$TenantsTableFilterComposer get tenantId {
    final $$TenantsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenantId,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableFilterComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UnitsTableFilterComposer get unitId {
    final $$UnitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableFilterComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TenanciesTableFilterComposer get previousTenancyId {
    final $$TenanciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.previousTenancyId,
      referencedTable: $db.tenancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenanciesTableFilterComposer(
            $db: $db,
            $table: $db.tenancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> rentObligationsRefs(
    Expression<bool> Function($$RentObligationsTableFilterComposer f) f,
  ) {
    final $$RentObligationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.rentObligations,
      getReferencedColumn: (t) => t.tenancyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RentObligationsTableFilterComposer(
            $db: $db,
            $table: $db.rentObligations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> paymentsRefs(
    Expression<bool> Function($$PaymentsTableFilterComposer f) f,
  ) {
    final $$PaymentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.tenancyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableFilterComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TenanciesTableOrderingComposer
    extends Composer<_$AppDatabase, $TenanciesTable> {
  $$TenanciesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get agreementType => $composableBuilder(
    column: $table.agreementType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get agreedRentMinor => $composableBuilder(
    column: $table.agreedRentMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentFrequency => $composableBuilder(
    column: $table.paymentFrequency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get customFrequencyMonths => $composableBuilder(
    column: $table.customFrequencyMonths,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstDueDate => $composableBuilder(
    column: $table.firstDueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dueDay => $composableBuilder(
    column: $table.dueDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get securityDepositMinor => $composableBuilder(
    column: $table.securityDepositMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get advanceAmountMinor => $composableBuilder(
    column: $table.advanceAmountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get termsNotes => $composableBuilder(
    column: $table.termsNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get effectiveTerminationDate => $composableBuilder(
    column: $table.effectiveTerminationDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get terminationReason => $composableBuilder(
    column: $table.terminationReason,
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

  $$TenantsTableOrderingComposer get tenantId {
    final $$TenantsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenantId,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableOrderingComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UnitsTableOrderingComposer get unitId {
    final $$UnitsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableOrderingComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TenanciesTableOrderingComposer get previousTenancyId {
    final $$TenanciesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.previousTenancyId,
      referencedTable: $db.tenancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenanciesTableOrderingComposer(
            $db: $db,
            $table: $db.tenancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TenanciesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TenanciesTable> {
  $$TenanciesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AgreementType, String> get agreementType =>
      $composableBuilder(
        column: $table.agreementType,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<DateTime, String> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime?, String> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<int> get agreedRentMinor => $composableBuilder(
    column: $table.agreedRentMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumnWithTypeConverter<PaymentFrequency, String>
  get paymentFrequency => $composableBuilder(
    column: $table.paymentFrequency,
    builder: (column) => column,
  );

  GeneratedColumn<int> get customFrequencyMonths => $composableBuilder(
    column: $table.customFrequencyMonths,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<DateTime, String> get firstDueDate =>
      $composableBuilder(
        column: $table.firstDueDate,
        builder: (column) => column,
      );

  GeneratedColumn<int> get dueDay =>
      $composableBuilder(column: $table.dueDay, builder: (column) => column);

  GeneratedColumn<int> get securityDepositMinor => $composableBuilder(
    column: $table.securityDepositMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get advanceAmountMinor => $composableBuilder(
    column: $table.advanceAmountMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get termsNotes => $composableBuilder(
    column: $table.termsNotes,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<TenancyStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime?, String>
  get effectiveTerminationDate => $composableBuilder(
    column: $table.effectiveTerminationDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get terminationReason => $composableBuilder(
    column: $table.terminationReason,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$TenantsTableAnnotationComposer get tenantId {
    final $$TenantsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenantId,
      referencedTable: $db.tenants,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenantsTableAnnotationComposer(
            $db: $db,
            $table: $db.tenants,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UnitsTableAnnotationComposer get unitId {
    final $$UnitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableAnnotationComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TenanciesTableAnnotationComposer get previousTenancyId {
    final $$TenanciesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.previousTenancyId,
      referencedTable: $db.tenancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenanciesTableAnnotationComposer(
            $db: $db,
            $table: $db.tenancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> rentObligationsRefs<T extends Object>(
    Expression<T> Function($$RentObligationsTableAnnotationComposer a) f,
  ) {
    final $$RentObligationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.rentObligations,
      getReferencedColumn: (t) => t.tenancyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RentObligationsTableAnnotationComposer(
            $db: $db,
            $table: $db.rentObligations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> paymentsRefs<T extends Object>(
    Expression<T> Function($$PaymentsTableAnnotationComposer a) f,
  ) {
    final $$PaymentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.tenancyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableAnnotationComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TenanciesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TenanciesTable,
          Tenancy,
          $$TenanciesTableFilterComposer,
          $$TenanciesTableOrderingComposer,
          $$TenanciesTableAnnotationComposer,
          $$TenanciesTableCreateCompanionBuilder,
          $$TenanciesTableUpdateCompanionBuilder,
          (Tenancy, $$TenanciesTableReferences),
          Tenancy,
          PrefetchHooks Function({
            bool tenantId,
            bool unitId,
            bool previousTenancyId,
            bool rentObligationsRefs,
            bool paymentsRefs,
          })
        > {
  $$TenanciesTableTableManager(_$AppDatabase db, $TenanciesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TenanciesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TenanciesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TenanciesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> tenantId = const Value.absent(),
                Value<String> unitId = const Value.absent(),
                Value<String?> previousTenancyId = const Value.absent(),
                Value<AgreementType> agreementType = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<int> agreedRentMinor = const Value.absent(),
                Value<String> currency = const Value.absent(),
                Value<PaymentFrequency> paymentFrequency = const Value.absent(),
                Value<int?> customFrequencyMonths = const Value.absent(),
                Value<DateTime> firstDueDate = const Value.absent(),
                Value<int?> dueDay = const Value.absent(),
                Value<int?> securityDepositMinor = const Value.absent(),
                Value<int?> advanceAmountMinor = const Value.absent(),
                Value<String?> termsNotes = const Value.absent(),
                Value<TenancyStatus> status = const Value.absent(),
                Value<DateTime?> effectiveTerminationDate =
                    const Value.absent(),
                Value<String?> terminationReason = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TenanciesCompanion(
                id: id,
                tenantId: tenantId,
                unitId: unitId,
                previousTenancyId: previousTenancyId,
                agreementType: agreementType,
                startDate: startDate,
                endDate: endDate,
                agreedRentMinor: agreedRentMinor,
                currency: currency,
                paymentFrequency: paymentFrequency,
                customFrequencyMonths: customFrequencyMonths,
                firstDueDate: firstDueDate,
                dueDay: dueDay,
                securityDepositMinor: securityDepositMinor,
                advanceAmountMinor: advanceAmountMinor,
                termsNotes: termsNotes,
                status: status,
                effectiveTerminationDate: effectiveTerminationDate,
                terminationReason: terminationReason,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String tenantId,
                required String unitId,
                Value<String?> previousTenancyId = const Value.absent(),
                required AgreementType agreementType,
                required DateTime startDate,
                Value<DateTime?> endDate = const Value.absent(),
                required int agreedRentMinor,
                Value<String> currency = const Value.absent(),
                required PaymentFrequency paymentFrequency,
                Value<int?> customFrequencyMonths = const Value.absent(),
                required DateTime firstDueDate,
                Value<int?> dueDay = const Value.absent(),
                Value<int?> securityDepositMinor = const Value.absent(),
                Value<int?> advanceAmountMinor = const Value.absent(),
                Value<String?> termsNotes = const Value.absent(),
                required TenancyStatus status,
                Value<DateTime?> effectiveTerminationDate =
                    const Value.absent(),
                Value<String?> terminationReason = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => TenanciesCompanion.insert(
                id: id,
                tenantId: tenantId,
                unitId: unitId,
                previousTenancyId: previousTenancyId,
                agreementType: agreementType,
                startDate: startDate,
                endDate: endDate,
                agreedRentMinor: agreedRentMinor,
                currency: currency,
                paymentFrequency: paymentFrequency,
                customFrequencyMonths: customFrequencyMonths,
                firstDueDate: firstDueDate,
                dueDay: dueDay,
                securityDepositMinor: securityDepositMinor,
                advanceAmountMinor: advanceAmountMinor,
                termsNotes: termsNotes,
                status: status,
                effectiveTerminationDate: effectiveTerminationDate,
                terminationReason: terminationReason,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TenanciesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                tenantId = false,
                unitId = false,
                previousTenancyId = false,
                rentObligationsRefs = false,
                paymentsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (rentObligationsRefs) db.rentObligations,
                    if (paymentsRefs) db.payments,
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
                        if (tenantId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.tenantId,
                                    referencedTable: $$TenanciesTableReferences
                                        ._tenantIdTable(db),
                                    referencedColumn: $$TenanciesTableReferences
                                        ._tenantIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (unitId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.unitId,
                                    referencedTable: $$TenanciesTableReferences
                                        ._unitIdTable(db),
                                    referencedColumn: $$TenanciesTableReferences
                                        ._unitIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (previousTenancyId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.previousTenancyId,
                                    referencedTable: $$TenanciesTableReferences
                                        ._previousTenancyIdTable(db),
                                    referencedColumn: $$TenanciesTableReferences
                                        ._previousTenancyIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (rentObligationsRefs)
                        await $_getPrefetchedData<
                          Tenancy,
                          $TenanciesTable,
                          RentObligation
                        >(
                          currentTable: table,
                          referencedTable: $$TenanciesTableReferences
                              ._rentObligationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TenanciesTableReferences(
                                db,
                                table,
                                p0,
                              ).rentObligationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.tenancyId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (paymentsRefs)
                        await $_getPrefetchedData<
                          Tenancy,
                          $TenanciesTable,
                          Payment
                        >(
                          currentTable: table,
                          referencedTable: $$TenanciesTableReferences
                              ._paymentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TenanciesTableReferences(
                                db,
                                table,
                                p0,
                              ).paymentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.tenancyId == item.id,
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

typedef $$TenanciesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TenanciesTable,
      Tenancy,
      $$TenanciesTableFilterComposer,
      $$TenanciesTableOrderingComposer,
      $$TenanciesTableAnnotationComposer,
      $$TenanciesTableCreateCompanionBuilder,
      $$TenanciesTableUpdateCompanionBuilder,
      (Tenancy, $$TenanciesTableReferences),
      Tenancy,
      PrefetchHooks Function({
        bool tenantId,
        bool unitId,
        bool previousTenancyId,
        bool rentObligationsRefs,
        bool paymentsRefs,
      })
    >;
typedef $$RentObligationsTableCreateCompanionBuilder =
    RentObligationsCompanion Function({
      required String id,
      required String tenancyId,
      required DateTime periodStart,
      required DateTime periodEnd,
      required DateTime dueDate,
      required int amountDueMinor,
      Value<String> currency,
      Value<String?> description,
      Value<ObligationPaymentStatus?> statusOverride,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$RentObligationsTableUpdateCompanionBuilder =
    RentObligationsCompanion Function({
      Value<String> id,
      Value<String> tenancyId,
      Value<DateTime> periodStart,
      Value<DateTime> periodEnd,
      Value<DateTime> dueDate,
      Value<int> amountDueMinor,
      Value<String> currency,
      Value<String?> description,
      Value<ObligationPaymentStatus?> statusOverride,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$RentObligationsTableReferences
    extends
        BaseReferences<_$AppDatabase, $RentObligationsTable, RentObligation> {
  $$RentObligationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TenanciesTable _tenancyIdTable(_$AppDatabase db) =>
      db.tenancies.createAlias('rent_obligations__tenancy_id__tenancies__id');

  $$TenanciesTableProcessedTableManager get tenancyId {
    final $_column = $_itemColumn<String>('tenancy_id')!;

    final manager = $$TenanciesTableTableManager(
      $_db,
      $_db.tenancies,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tenancyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PaymentAllocationsTable, List<PaymentAllocation>>
  _paymentAllocationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.paymentAllocations,
        aliasName:
            'rent_obligations__id__payment_allocations__rent_obligation_id',
      );

  $$PaymentAllocationsTableProcessedTableManager get paymentAllocationsRefs {
    final manager =
        $$PaymentAllocationsTableTableManager(
          $_db,
          $_db.paymentAllocations,
        ).filter(
          (f) => f.rentObligationId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _paymentAllocationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RentObligationsTableFilterComposer
    extends Composer<_$AppDatabase, $RentObligationsTable> {
  $$RentObligationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, String> get periodStart =>
      $composableBuilder(
        column: $table.periodStart,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<DateTime, DateTime, String> get periodEnd =>
      $composableBuilder(
        column: $table.periodEnd,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<DateTime, DateTime, String> get dueDate =>
      $composableBuilder(
        column: $table.dueDate,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get amountDueMinor => $composableBuilder(
    column: $table.amountDueMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    ObligationPaymentStatus?,
    ObligationPaymentStatus,
    String
  >
  get statusOverride => $composableBuilder(
    column: $table.statusOverride,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$TenanciesTableFilterComposer get tenancyId {
    final $$TenanciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenancyId,
      referencedTable: $db.tenancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenanciesTableFilterComposer(
            $db: $db,
            $table: $db.tenancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> paymentAllocationsRefs(
    Expression<bool> Function($$PaymentAllocationsTableFilterComposer f) f,
  ) {
    final $$PaymentAllocationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.paymentAllocations,
      getReferencedColumn: (t) => t.rentObligationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentAllocationsTableFilterComposer(
            $db: $db,
            $table: $db.paymentAllocations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RentObligationsTableOrderingComposer
    extends Composer<_$AppDatabase, $RentObligationsTable> {
  $$RentObligationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get periodStart => $composableBuilder(
    column: $table.periodStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get periodEnd => $composableBuilder(
    column: $table.periodEnd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountDueMinor => $composableBuilder(
    column: $table.amountDueMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statusOverride => $composableBuilder(
    column: $table.statusOverride,
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

  $$TenanciesTableOrderingComposer get tenancyId {
    final $$TenanciesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenancyId,
      referencedTable: $db.tenancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenanciesTableOrderingComposer(
            $db: $db,
            $table: $db.tenancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RentObligationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RentObligationsTable> {
  $$RentObligationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime, String> get periodStart =>
      $composableBuilder(
        column: $table.periodStart,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<DateTime, String> get periodEnd =>
      $composableBuilder(column: $table.periodEnd, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime, String> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<int> get amountDueMinor => $composableBuilder(
    column: $table.amountDueMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<ObligationPaymentStatus?, String>
  get statusOverride => $composableBuilder(
    column: $table.statusOverride,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$TenanciesTableAnnotationComposer get tenancyId {
    final $$TenanciesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenancyId,
      referencedTable: $db.tenancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenanciesTableAnnotationComposer(
            $db: $db,
            $table: $db.tenancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> paymentAllocationsRefs<T extends Object>(
    Expression<T> Function($$PaymentAllocationsTableAnnotationComposer a) f,
  ) {
    final $$PaymentAllocationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.paymentAllocations,
          getReferencedColumn: (t) => t.rentObligationId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PaymentAllocationsTableAnnotationComposer(
                $db: $db,
                $table: $db.paymentAllocations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$RentObligationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RentObligationsTable,
          RentObligation,
          $$RentObligationsTableFilterComposer,
          $$RentObligationsTableOrderingComposer,
          $$RentObligationsTableAnnotationComposer,
          $$RentObligationsTableCreateCompanionBuilder,
          $$RentObligationsTableUpdateCompanionBuilder,
          (RentObligation, $$RentObligationsTableReferences),
          RentObligation,
          PrefetchHooks Function({bool tenancyId, bool paymentAllocationsRefs})
        > {
  $$RentObligationsTableTableManager(
    _$AppDatabase db,
    $RentObligationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RentObligationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RentObligationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RentObligationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> tenancyId = const Value.absent(),
                Value<DateTime> periodStart = const Value.absent(),
                Value<DateTime> periodEnd = const Value.absent(),
                Value<DateTime> dueDate = const Value.absent(),
                Value<int> amountDueMinor = const Value.absent(),
                Value<String> currency = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<ObligationPaymentStatus?> statusOverride =
                    const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RentObligationsCompanion(
                id: id,
                tenancyId: tenancyId,
                periodStart: periodStart,
                periodEnd: periodEnd,
                dueDate: dueDate,
                amountDueMinor: amountDueMinor,
                currency: currency,
                description: description,
                statusOverride: statusOverride,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String tenancyId,
                required DateTime periodStart,
                required DateTime periodEnd,
                required DateTime dueDate,
                required int amountDueMinor,
                Value<String> currency = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<ObligationPaymentStatus?> statusOverride =
                    const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => RentObligationsCompanion.insert(
                id: id,
                tenancyId: tenancyId,
                periodStart: periodStart,
                periodEnd: periodEnd,
                dueDate: dueDate,
                amountDueMinor: amountDueMinor,
                currency: currency,
                description: description,
                statusOverride: statusOverride,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RentObligationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({tenancyId = false, paymentAllocationsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (paymentAllocationsRefs) db.paymentAllocations,
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
                        if (tenancyId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.tenancyId,
                                    referencedTable:
                                        $$RentObligationsTableReferences
                                            ._tenancyIdTable(db),
                                    referencedColumn:
                                        $$RentObligationsTableReferences
                                            ._tenancyIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (paymentAllocationsRefs)
                        await $_getPrefetchedData<
                          RentObligation,
                          $RentObligationsTable,
                          PaymentAllocation
                        >(
                          currentTable: table,
                          referencedTable: $$RentObligationsTableReferences
                              ._paymentAllocationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RentObligationsTableReferences(
                                db,
                                table,
                                p0,
                              ).paymentAllocationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.rentObligationId == item.id,
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

typedef $$RentObligationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RentObligationsTable,
      RentObligation,
      $$RentObligationsTableFilterComposer,
      $$RentObligationsTableOrderingComposer,
      $$RentObligationsTableAnnotationComposer,
      $$RentObligationsTableCreateCompanionBuilder,
      $$RentObligationsTableUpdateCompanionBuilder,
      (RentObligation, $$RentObligationsTableReferences),
      RentObligation,
      PrefetchHooks Function({bool tenancyId, bool paymentAllocationsRefs})
    >;
typedef $$PaymentsTableCreateCompanionBuilder =
    PaymentsCompanion Function({
      required String id,
      required String tenancyId,
      required int amountReceivedMinor,
      Value<String> currency,
      required DateTime receivedDate,
      required PaymentMethod paymentMethod,
      Value<String?> reference,
      Value<String?> notes,
      required PaymentRecordStatus recordStatus,
      Value<String?> reversalReason,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$PaymentsTableUpdateCompanionBuilder =
    PaymentsCompanion Function({
      Value<String> id,
      Value<String> tenancyId,
      Value<int> amountReceivedMinor,
      Value<String> currency,
      Value<DateTime> receivedDate,
      Value<PaymentMethod> paymentMethod,
      Value<String?> reference,
      Value<String?> notes,
      Value<PaymentRecordStatus> recordStatus,
      Value<String?> reversalReason,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$PaymentsTableReferences
    extends BaseReferences<_$AppDatabase, $PaymentsTable, Payment> {
  $$PaymentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TenanciesTable _tenancyIdTable(_$AppDatabase db) =>
      db.tenancies.createAlias('payments__tenancy_id__tenancies__id');

  $$TenanciesTableProcessedTableManager get tenancyId {
    final $_column = $_itemColumn<String>('tenancy_id')!;

    final manager = $$TenanciesTableTableManager(
      $_db,
      $_db.tenancies,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tenancyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PaymentAllocationsTable, List<PaymentAllocation>>
  _paymentAllocationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.paymentAllocations,
        aliasName: 'payments__id__payment_allocations__payment_id',
      );

  $$PaymentAllocationsTableProcessedTableManager get paymentAllocationsRefs {
    final manager = $$PaymentAllocationsTableTableManager(
      $_db,
      $_db.paymentAllocations,
    ).filter((f) => f.paymentId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _paymentAllocationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PaymentsTableFilterComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountReceivedMinor => $composableBuilder(
    column: $table.amountReceivedMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<DateTime, DateTime, String> get receivedDate =>
      $composableBuilder(
        column: $table.receivedDate,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<PaymentMethod, PaymentMethod, String>
  get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    PaymentRecordStatus,
    PaymentRecordStatus,
    String
  >
  get recordStatus => $composableBuilder(
    column: $table.recordStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get reversalReason => $composableBuilder(
    column: $table.reversalReason,
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

  $$TenanciesTableFilterComposer get tenancyId {
    final $$TenanciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenancyId,
      referencedTable: $db.tenancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenanciesTableFilterComposer(
            $db: $db,
            $table: $db.tenancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> paymentAllocationsRefs(
    Expression<bool> Function($$PaymentAllocationsTableFilterComposer f) f,
  ) {
    final $$PaymentAllocationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.paymentAllocations,
      getReferencedColumn: (t) => t.paymentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentAllocationsTableFilterComposer(
            $db: $db,
            $table: $db.paymentAllocations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PaymentsTableOrderingComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountReceivedMinor => $composableBuilder(
    column: $table.amountReceivedMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get receivedDate => $composableBuilder(
    column: $table.receivedDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reference => $composableBuilder(
    column: $table.reference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordStatus => $composableBuilder(
    column: $table.recordStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reversalReason => $composableBuilder(
    column: $table.reversalReason,
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

  $$TenanciesTableOrderingComposer get tenancyId {
    final $$TenanciesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenancyId,
      referencedTable: $db.tenancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenanciesTableOrderingComposer(
            $db: $db,
            $table: $db.tenancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PaymentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get amountReceivedMinor => $composableBuilder(
    column: $table.amountReceivedMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime, String> get receivedDate =>
      $composableBuilder(
        column: $table.receivedDate,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<PaymentMethod, String> get paymentMethod =>
      $composableBuilder(
        column: $table.paymentMethod,
        builder: (column) => column,
      );

  GeneratedColumn<String> get reference =>
      $composableBuilder(column: $table.reference, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumnWithTypeConverter<PaymentRecordStatus, String>
  get recordStatus => $composableBuilder(
    column: $table.recordStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reversalReason => $composableBuilder(
    column: $table.reversalReason,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$TenanciesTableAnnotationComposer get tenancyId {
    final $$TenanciesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tenancyId,
      referencedTable: $db.tenancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TenanciesTableAnnotationComposer(
            $db: $db,
            $table: $db.tenancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> paymentAllocationsRefs<T extends Object>(
    Expression<T> Function($$PaymentAllocationsTableAnnotationComposer a) f,
  ) {
    final $$PaymentAllocationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.paymentAllocations,
          getReferencedColumn: (t) => t.paymentId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PaymentAllocationsTableAnnotationComposer(
                $db: $db,
                $table: $db.paymentAllocations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PaymentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PaymentsTable,
          Payment,
          $$PaymentsTableFilterComposer,
          $$PaymentsTableOrderingComposer,
          $$PaymentsTableAnnotationComposer,
          $$PaymentsTableCreateCompanionBuilder,
          $$PaymentsTableUpdateCompanionBuilder,
          (Payment, $$PaymentsTableReferences),
          Payment,
          PrefetchHooks Function({bool tenancyId, bool paymentAllocationsRefs})
        > {
  $$PaymentsTableTableManager(_$AppDatabase db, $PaymentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> tenancyId = const Value.absent(),
                Value<int> amountReceivedMinor = const Value.absent(),
                Value<String> currency = const Value.absent(),
                Value<DateTime> receivedDate = const Value.absent(),
                Value<PaymentMethod> paymentMethod = const Value.absent(),
                Value<String?> reference = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<PaymentRecordStatus> recordStatus = const Value.absent(),
                Value<String?> reversalReason = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PaymentsCompanion(
                id: id,
                tenancyId: tenancyId,
                amountReceivedMinor: amountReceivedMinor,
                currency: currency,
                receivedDate: receivedDate,
                paymentMethod: paymentMethod,
                reference: reference,
                notes: notes,
                recordStatus: recordStatus,
                reversalReason: reversalReason,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String tenancyId,
                required int amountReceivedMinor,
                Value<String> currency = const Value.absent(),
                required DateTime receivedDate,
                required PaymentMethod paymentMethod,
                Value<String?> reference = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required PaymentRecordStatus recordStatus,
                Value<String?> reversalReason = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => PaymentsCompanion.insert(
                id: id,
                tenancyId: tenancyId,
                amountReceivedMinor: amountReceivedMinor,
                currency: currency,
                receivedDate: receivedDate,
                paymentMethod: paymentMethod,
                reference: reference,
                notes: notes,
                recordStatus: recordStatus,
                reversalReason: reversalReason,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PaymentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({tenancyId = false, paymentAllocationsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (paymentAllocationsRefs) db.paymentAllocations,
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
                        if (tenancyId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.tenancyId,
                                    referencedTable: $$PaymentsTableReferences
                                        ._tenancyIdTable(db),
                                    referencedColumn: $$PaymentsTableReferences
                                        ._tenancyIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (paymentAllocationsRefs)
                        await $_getPrefetchedData<
                          Payment,
                          $PaymentsTable,
                          PaymentAllocation
                        >(
                          currentTable: table,
                          referencedTable: $$PaymentsTableReferences
                              ._paymentAllocationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PaymentsTableReferences(
                                db,
                                table,
                                p0,
                              ).paymentAllocationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.paymentId == item.id,
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

typedef $$PaymentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PaymentsTable,
      Payment,
      $$PaymentsTableFilterComposer,
      $$PaymentsTableOrderingComposer,
      $$PaymentsTableAnnotationComposer,
      $$PaymentsTableCreateCompanionBuilder,
      $$PaymentsTableUpdateCompanionBuilder,
      (Payment, $$PaymentsTableReferences),
      Payment,
      PrefetchHooks Function({bool tenancyId, bool paymentAllocationsRefs})
    >;
typedef $$PaymentAllocationsTableCreateCompanionBuilder =
    PaymentAllocationsCompanion Function({
      required String id,
      required String paymentId,
      required String rentObligationId,
      required int amountAllocatedMinor,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$PaymentAllocationsTableUpdateCompanionBuilder =
    PaymentAllocationsCompanion Function({
      Value<String> id,
      Value<String> paymentId,
      Value<String> rentObligationId,
      Value<int> amountAllocatedMinor,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$PaymentAllocationsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $PaymentAllocationsTable,
          PaymentAllocation
        > {
  $$PaymentAllocationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PaymentsTable _paymentIdTable(_$AppDatabase db) =>
      db.payments.createAlias('payment_allocations__payment_id__payments__id');

  $$PaymentsTableProcessedTableManager get paymentId {
    final $_column = $_itemColumn<String>('payment_id')!;

    final manager = $$PaymentsTableTableManager(
      $_db,
      $_db.payments,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_paymentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $RentObligationsTable _rentObligationIdTable(_$AppDatabase db) =>
      db.rentObligations.createAlias(
        'payment_allocations__rent_obligation_id__rent_obligations__id',
      );

  $$RentObligationsTableProcessedTableManager get rentObligationId {
    final $_column = $_itemColumn<String>('rent_obligation_id')!;

    final manager = $$RentObligationsTableTableManager(
      $_db,
      $_db.rentObligations,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_rentObligationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PaymentAllocationsTableFilterComposer
    extends Composer<_$AppDatabase, $PaymentAllocationsTable> {
  $$PaymentAllocationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountAllocatedMinor => $composableBuilder(
    column: $table.amountAllocatedMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PaymentsTableFilterComposer get paymentId {
    final $$PaymentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paymentId,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableFilterComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RentObligationsTableFilterComposer get rentObligationId {
    final $$RentObligationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rentObligationId,
      referencedTable: $db.rentObligations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RentObligationsTableFilterComposer(
            $db: $db,
            $table: $db.rentObligations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PaymentAllocationsTableOrderingComposer
    extends Composer<_$AppDatabase, $PaymentAllocationsTable> {
  $$PaymentAllocationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountAllocatedMinor => $composableBuilder(
    column: $table.amountAllocatedMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PaymentsTableOrderingComposer get paymentId {
    final $$PaymentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paymentId,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableOrderingComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RentObligationsTableOrderingComposer get rentObligationId {
    final $$RentObligationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rentObligationId,
      referencedTable: $db.rentObligations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RentObligationsTableOrderingComposer(
            $db: $db,
            $table: $db.rentObligations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PaymentAllocationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaymentAllocationsTable> {
  $$PaymentAllocationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get amountAllocatedMinor => $composableBuilder(
    column: $table.amountAllocatedMinor,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$PaymentsTableAnnotationComposer get paymentId {
    final $$PaymentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paymentId,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableAnnotationComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RentObligationsTableAnnotationComposer get rentObligationId {
    final $$RentObligationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rentObligationId,
      referencedTable: $db.rentObligations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RentObligationsTableAnnotationComposer(
            $db: $db,
            $table: $db.rentObligations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PaymentAllocationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PaymentAllocationsTable,
          PaymentAllocation,
          $$PaymentAllocationsTableFilterComposer,
          $$PaymentAllocationsTableOrderingComposer,
          $$PaymentAllocationsTableAnnotationComposer,
          $$PaymentAllocationsTableCreateCompanionBuilder,
          $$PaymentAllocationsTableUpdateCompanionBuilder,
          (PaymentAllocation, $$PaymentAllocationsTableReferences),
          PaymentAllocation,
          PrefetchHooks Function({bool paymentId, bool rentObligationId})
        > {
  $$PaymentAllocationsTableTableManager(
    _$AppDatabase db,
    $PaymentAllocationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentAllocationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentAllocationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentAllocationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> paymentId = const Value.absent(),
                Value<String> rentObligationId = const Value.absent(),
                Value<int> amountAllocatedMinor = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PaymentAllocationsCompanion(
                id: id,
                paymentId: paymentId,
                rentObligationId: rentObligationId,
                amountAllocatedMinor: amountAllocatedMinor,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String paymentId,
                required String rentObligationId,
                required int amountAllocatedMinor,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => PaymentAllocationsCompanion.insert(
                id: id,
                paymentId: paymentId,
                rentObligationId: rentObligationId,
                amountAllocatedMinor: amountAllocatedMinor,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PaymentAllocationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({paymentId = false, rentObligationId = false}) {
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
                        if (paymentId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.paymentId,
                                    referencedTable:
                                        $$PaymentAllocationsTableReferences
                                            ._paymentIdTable(db),
                                    referencedColumn:
                                        $$PaymentAllocationsTableReferences
                                            ._paymentIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (rentObligationId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.rentObligationId,
                                    referencedTable:
                                        $$PaymentAllocationsTableReferences
                                            ._rentObligationIdTable(db),
                                    referencedColumn:
                                        $$PaymentAllocationsTableReferences
                                            ._rentObligationIdTable(db)
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

typedef $$PaymentAllocationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PaymentAllocationsTable,
      PaymentAllocation,
      $$PaymentAllocationsTableFilterComposer,
      $$PaymentAllocationsTableOrderingComposer,
      $$PaymentAllocationsTableAnnotationComposer,
      $$PaymentAllocationsTableCreateCompanionBuilder,
      $$PaymentAllocationsTableUpdateCompanionBuilder,
      (PaymentAllocation, $$PaymentAllocationsTableReferences),
      PaymentAllocation,
      PrefetchHooks Function({bool paymentId, bool rentObligationId})
    >;
typedef $$NotificationPreferencesTableCreateCompanionBuilder =
    NotificationPreferencesCompanion Function({
      required String id,
      required String landlordId,
      required NotificationEventType eventType,
      Value<bool> enabled,
      Value<int?> daysBefore,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$NotificationPreferencesTableUpdateCompanionBuilder =
    NotificationPreferencesCompanion Function({
      Value<String> id,
      Value<String> landlordId,
      Value<NotificationEventType> eventType,
      Value<bool> enabled,
      Value<int?> daysBefore,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$NotificationPreferencesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $NotificationPreferencesTable,
          NotificationPreference
        > {
  $$NotificationPreferencesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $LandlordProfilesTable _landlordIdTable(_$AppDatabase db) =>
      db.landlordProfiles.createAlias(
        'notification_preferences__landlord_id__landlord_profiles__id',
      );

  $$LandlordProfilesTableProcessedTableManager get landlordId {
    final $_column = $_itemColumn<String>('landlord_id')!;

    final manager = $$LandlordProfilesTableTableManager(
      $_db,
      $_db.landlordProfiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_landlordIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$NotificationPreferencesTableFilterComposer
    extends Composer<_$AppDatabase, $NotificationPreferencesTable> {
  $$NotificationPreferencesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    NotificationEventType,
    NotificationEventType,
    String
  >
  get eventType => $composableBuilder(
    column: $table.eventType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get daysBefore => $composableBuilder(
    column: $table.daysBefore,
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

  $$LandlordProfilesTableFilterComposer get landlordId {
    final $$LandlordProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landlordId,
      referencedTable: $db.landlordProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandlordProfilesTableFilterComposer(
            $db: $db,
            $table: $db.landlordProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotificationPreferencesTableOrderingComposer
    extends Composer<_$AppDatabase, $NotificationPreferencesTable> {
  $$NotificationPreferencesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get eventType => $composableBuilder(
    column: $table.eventType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get daysBefore => $composableBuilder(
    column: $table.daysBefore,
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

  $$LandlordProfilesTableOrderingComposer get landlordId {
    final $$LandlordProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landlordId,
      referencedTable: $db.landlordProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandlordProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.landlordProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotificationPreferencesTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotificationPreferencesTable> {
  $$NotificationPreferencesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<NotificationEventType, String>
  get eventType =>
      $composableBuilder(column: $table.eventType, builder: (column) => column);

  GeneratedColumn<bool> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  GeneratedColumn<int> get daysBefore => $composableBuilder(
    column: $table.daysBefore,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$LandlordProfilesTableAnnotationComposer get landlordId {
    final $$LandlordProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.landlordId,
      referencedTable: $db.landlordProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LandlordProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.landlordProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotificationPreferencesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotificationPreferencesTable,
          NotificationPreference,
          $$NotificationPreferencesTableFilterComposer,
          $$NotificationPreferencesTableOrderingComposer,
          $$NotificationPreferencesTableAnnotationComposer,
          $$NotificationPreferencesTableCreateCompanionBuilder,
          $$NotificationPreferencesTableUpdateCompanionBuilder,
          (NotificationPreference, $$NotificationPreferencesTableReferences),
          NotificationPreference,
          PrefetchHooks Function({bool landlordId})
        > {
  $$NotificationPreferencesTableTableManager(
    _$AppDatabase db,
    $NotificationPreferencesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotificationPreferencesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$NotificationPreferencesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$NotificationPreferencesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> landlordId = const Value.absent(),
                Value<NotificationEventType> eventType = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
                Value<int?> daysBefore = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NotificationPreferencesCompanion(
                id: id,
                landlordId: landlordId,
                eventType: eventType,
                enabled: enabled,
                daysBefore: daysBefore,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String landlordId,
                required NotificationEventType eventType,
                Value<bool> enabled = const Value.absent(),
                Value<int?> daysBefore = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => NotificationPreferencesCompanion.insert(
                id: id,
                landlordId: landlordId,
                eventType: eventType,
                enabled: enabled,
                daysBefore: daysBefore,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$NotificationPreferencesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({landlordId = false}) {
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
                    if (landlordId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.landlordId,
                                referencedTable:
                                    $$NotificationPreferencesTableReferences
                                        ._landlordIdTable(db),
                                referencedColumn:
                                    $$NotificationPreferencesTableReferences
                                        ._landlordIdTable(db)
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

typedef $$NotificationPreferencesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotificationPreferencesTable,
      NotificationPreference,
      $$NotificationPreferencesTableFilterComposer,
      $$NotificationPreferencesTableOrderingComposer,
      $$NotificationPreferencesTableAnnotationComposer,
      $$NotificationPreferencesTableCreateCompanionBuilder,
      $$NotificationPreferencesTableUpdateCompanionBuilder,
      (NotificationPreference, $$NotificationPreferencesTableReferences),
      NotificationPreference,
      PrefetchHooks Function({bool landlordId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LandlordProfilesTableTableManager get landlordProfiles =>
      $$LandlordProfilesTableTableManager(_db, _db.landlordProfiles);
  $$PropertiesTableTableManager get properties =>
      $$PropertiesTableTableManager(_db, _db.properties);
  $$UnitsTableTableManager get units =>
      $$UnitsTableTableManager(_db, _db.units);
  $$TenantsTableTableManager get tenants =>
      $$TenantsTableTableManager(_db, _db.tenants);
  $$TenanciesTableTableManager get tenancies =>
      $$TenanciesTableTableManager(_db, _db.tenancies);
  $$RentObligationsTableTableManager get rentObligations =>
      $$RentObligationsTableTableManager(_db, _db.rentObligations);
  $$PaymentsTableTableManager get payments =>
      $$PaymentsTableTableManager(_db, _db.payments);
  $$PaymentAllocationsTableTableManager get paymentAllocations =>
      $$PaymentAllocationsTableTableManager(_db, _db.paymentAllocations);
  $$NotificationPreferencesTableTableManager get notificationPreferences =>
      $$NotificationPreferencesTableTableManager(
        _db,
        _db.notificationPreferences,
      );
}
