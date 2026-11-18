import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proprietor/src/features/properties/domain/unit_input.dart';

import '../../../core/database/transaction_runner.dart';
import '../../../core/domain/defaults.dart';
import '../../../core/domain/domain_exception.dart';
import '../../../core/domain/record_status.dart';
import '../../../core/utils/clock.dart';
import '../../../core/utils/id_generator.dart';
import '../data/property_repository.dart';
import '../domain/property.dart';
import '../domain/unit.dart';

/// Property and unit workflows.
///
/// Enforces: every property has at least one unit; records are archived, not
/// deleted.
class PropertyService {
  PropertyService(
    this._repository,
    this._transactions, {
    required this._ids,
    required this._clock,
  });

  final PropertyRepository _repository;
  final TransactionRunner _transactions;
  final IdGenerator _ids;
  final Clock _clock;

  Stream<List<Property>> watchProperties({
    required String landlordId,
    bool includeArchived = false,
  }) => _repository.watchProperties(
    landlordId: landlordId,
    includeArchived: includeArchived,
  );

  Stream<List<Unit>> watchUnits(
    String propertyId, {
    bool includeArchived = false,
  }) => _repository.watchUnits(propertyId, includeArchived: includeArchived);

  Future<Property> getProperty(String id) async =>
      await _repository.getProperty(id) ??
      (throw NotFoundException('Property', id));

  Future<Unit> getUnit(String id) async =>
      await _repository.getUnit(id) ?? (throw NotFoundException('Unit', id));

  /// Creates a property with its units in one transaction.
  ///
  /// When [units] is empty, a single `entireProperty` unit is created so the
  /// asset itself can be rented.
  Future<Property> createProperty({
    required String landlordId,
    required String name,
    required PropertyType propertyType,
    String? description,
    String? addressLine,
    String? areaOrTown,
    String? district,
    String? region,
    String countryCode = defaultCountryCode,
    double? latitude,
    double? longitude,
    String? privateNotes,
    List<UnitInput> units = const [],
  }) async {
    final now = _clock();
    final property = Property(
      id: _ids(),
      landlordId: landlordId,
      name: name.trim(),
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
      recordStatus: RecordStatus.active,
      createdAt: now,
      updatedAt: now,
    );
    _validateProperty(property);

    final unitInputs = units.isNotEmpty
        ? units
        : [
            const UnitInput(
              name: 'Entire property',
              unitType: UnitType.entireProperty,
            ),
          ];
    final newUnits = [
      for (final input in unitInputs) _buildUnit(property.id, input, now),
    ];

    await _transactions.run(() async {
      await _repository.insertProperty(property);
      for (final unit in newUnits) {
        await _repository.insertUnit(unit);
      }
    });
    return property;
  }

  Future<Property> updateProperty(Property edited) async {
    final existing = await getProperty(edited.id);
    if (existing.isArchived) {
      throw const ConflictException('Archived properties cannot be edited');
    }
    final property = edited.copyWith(
      name: edited.name.trim(),
      updatedAt: _clock(),
    );
    _validateProperty(property);
    await _repository.updateProperty(property);
    return property;
  }

  /// Archives the property and all of its active units. History is kept.
  Future<void> archiveProperty(String id) async {
    await getProperty(id);
    final now = _clock();
    await _transactions.run(() async {
      await _repository.archiveProperty(id, now);
      await _repository.archiveUnitsOfProperty(id, now);
    });
  }

  Future<Unit> addUnit(String propertyId, UnitInput input) async {
    final property = await getProperty(propertyId);
    if (property.isArchived) {
      throw const ConflictException('Cannot add units to an archived property');
    }
    final unit = _buildUnit(propertyId, input, _clock());
    await _repository.insertUnit(unit);
    return unit;
  }

  Future<Unit> updateUnit(Unit edited) async {
    final existing = await getUnit(edited.id);
    if (existing.isArchived) {
      throw const ConflictException('Archived units cannot be edited');
    }
    final unit = edited.copyWith(name: edited.name.trim(), updatedAt: _clock());
    _validateUnit(unit);
    await _repository.updateUnit(unit);
    return unit;
  }

  Future<void> archiveUnit(String id) async {
    await getUnit(id);
    await _repository.archiveUnit(id, _clock());
  }

  Unit _buildUnit(String propertyId, UnitInput input, DateTime now) {
    final unit = Unit(
      id: _ids(),
      propertyId: propertyId,
      name: input.name.trim(),
      unitType: input.unitType,
      description: input.description,
      floorOrLevel: input.floorOrLevel,
      sizeValue: input.sizeValue,
      sizeUnit: input.sizeUnit,
      defaultRentMinor: input.defaultRentMinor,
      defaultCurrency: input.defaultCurrency,
      availabilityOverride: input.availabilityOverride,
      privateNotes: input.privateNotes,
      recordStatus: RecordStatus.active,
      createdAt: now,
      updatedAt: now,
    );
    _validateUnit(unit);
    return unit;
  }

  void _validateProperty(Property property) {
    if (property.name.isEmpty) {
      throw const ValidationException('Property name is required');
    }
    final lat = property.latitude;
    final lng = property.longitude;
    if ((lat == null) != (lng == null)) {
      throw const ValidationException(
        'Latitude and longitude must be provided together',
      );
    }
    if (lat != null && (lat < -90 || lat > 90)) {
      throw const ValidationException('Latitude must be between -90 and 90');
    }
    if (lng != null && (lng < -180 || lng > 180)) {
      throw const ValidationException('Longitude must be between -180 and 180');
    }
  }

  void _validateUnit(Unit unit) {
    if (unit.name.isEmpty) {
      throw const ValidationException('Unit name is required');
    }
    if ((unit.sizeValue ?? 0) < 0) {
      throw const ValidationException('Unit size cannot be negative');
    }
    if ((unit.defaultRentMinor ?? 0) < 0) {
      throw const ValidationException('Default rent cannot be negative');
    }
    if (!isValidCurrencyCode(unit.defaultCurrency)) {
      throw ValidationException(
        'Invalid currency code "${unit.defaultCurrency}"',
      );
    }
  }
}

final propertyServiceProvider = Provider<PropertyService>(
  (ref) => PropertyService(
    ref.watch(propertyRepositoryProvider),
    ref.watch(transactionRunnerProvider),
    ids: ref.watch(idGeneratorProvider),
    clock: ref.watch(clockProvider),
  ),
);
