import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/domain_exception.dart';
import '../../../core/domain/record_status.dart';
import '../../../core/utils/clock.dart';
import '../../../core/utils/id_generator.dart';
import '../data/tenancy_repository.dart';
import '../data/tenant_repository.dart';
import '../domain/tenancy.dart';
import '../domain/tenant.dart';

/// Tenant record workflows. Tenants are archived, never deleted.
class TenantService {
  TenantService(
    this._tenants,
    this._tenancies, {
    required this._ids,
    required this._clock,
  });

  final TenantRepository _tenants;
  final TenancyRepository _tenancies;
  final IdGenerator _ids;
  final Clock _clock;

  Stream<List<Tenant>> watchTenants({
    required String landlordId,
    bool includeArchived = false,
  }) => _tenants.watchTenants(
    landlordId: landlordId,
    includeArchived: includeArchived,
  );

  Future<Tenant> getTenant(String id) async =>
      await _tenants.getById(id) ?? (throw NotFoundException('Tenant', id));

  Future<Tenant> createTenant({
    required String landlordId,
    required String fullName,
    required String phoneNumber,
    String? alternativePhone,
    String? email,
    String? address,
    String? privateNotes,
  }) async {
    final now = _clock();
    final tenant = Tenant(
      id: _ids(),
      landlordId: landlordId,
      tenantType: TenantType.individual,
      fullName: fullName.trim(),
      phoneNumber: phoneNumber.trim(),
      alternativePhone: alternativePhone,
      email: email,
      address: address,
      privateNotes: privateNotes,
      recordStatus: RecordStatus.active,
      createdAt: now,
      updatedAt: now,
    );
    _validate(tenant);
    await _tenants.insert(tenant);
    return tenant;
  }

  /// Updates contact details. Historical tenancy terms are unaffected.
  Future<Tenant> updateTenant(Tenant edited) async {
    final existing = await getTenant(edited.id);
    if (existing.isArchived) {
      throw const ConflictException('Archived tenants cannot be edited');
    }
    final tenant = edited.copyWith(
      fullName: edited.fullName.trim(),
      phoneNumber: edited.phoneNumber.trim(),
      updatedAt: _clock(),
    );
    _validate(tenant);
    await _tenants.update(tenant);
    return tenant;
  }

  /// Archives a tenant. Not allowed while they hold a confirmed tenancy.
  Future<void> archiveTenant(String id) async {
    await getTenant(id);
    final confirmed = await _tenancies.getTenancies(
      tenantId: id,
      statuses: TenancyStatus.confirmed,
    );
    if (confirmed.isNotEmpty) {
      throw const ConflictException(
        'End or terminate the tenant\'s current tenancy before archiving',
      );
    }
    await _tenants.archive(id, _clock());
  }

  void _validate(Tenant tenant) {
    if (tenant.fullName.isEmpty) {
      throw const ValidationException('Tenant name is required');
    }
    if (tenant.phoneNumber.isEmpty) {
      throw const ValidationException('Tenant phone number is required');
    }
  }
}

final tenantServiceProvider = Provider<TenantService>(
  (ref) => TenantService(
    ref.watch(tenantRepositoryProvider),
    ref.watch(tenancyRepositoryProvider),
    ids: ref.watch(idGeneratorProvider),
    clock: ref.watch(clockProvider),
  ),
);
