import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/defaults.dart';
import '../../../core/domain/domain_exception.dart';
import '../../../core/utils/clock.dart';
import '../../../core/utils/id_generator.dart';
import '../data/landlord_profile_repository.dart';
import '../domain/landlord_profile.dart';

/// Creates and maintains the single local landlord profile.
class LandlordProfileService {
  LandlordProfileService(
    this._repository, {
    required this._ids,
    required this._clock,
  });

  final LandlordProfileRepository _repository;
  final IdGenerator _ids;
  final Clock _clock;

  Future<LandlordProfile?> getProfile() => _repository.getProfile();

  Stream<LandlordProfile?> watchProfile() => _repository.watchProfile();

  /// Creates the local profile. Fails if one already exists (MVP is
  /// single-landlord).
  Future<LandlordProfile> createProfile({
    required String displayName,
    String? phoneNumber,
    String? email,
    String defaultCurrency = defaultCurrencyCode,
  }) async {
    if (await _repository.getProfile() != null) {
      throw const ConflictException('A landlord profile already exists');
    }
    final now = _clock();
    final profile = LandlordProfile(
      id: _ids(),
      displayName: displayName.trim(),
      phoneNumber: _blankToNull(phoneNumber),
      email: _blankToNull(email),
      defaultCurrency: defaultCurrency,
      createdAt: now,
      updatedAt: now,
    );
    _validate(profile);
    await _repository.insert(profile);
    return profile;
  }

  Future<LandlordProfile> updateProfile(LandlordProfile edited) async {
    final existing = await _repository.getById(edited.id);
    if (existing == null) {
      throw NotFoundException('LandlordProfile', edited.id);
    }
    final profile = edited.copyWith(
      displayName: edited.displayName.trim(),
      updatedAt: _clock(),
    );
    _validate(profile);
    await _repository.update(profile);
    return profile;
  }

  void _validate(LandlordProfile profile) {
    if (profile.displayName.isEmpty) {
      throw const ValidationException('Display name is required');
    }
    if (!isValidCurrencyCode(profile.defaultCurrency)) {
      throw ValidationException(
        'Invalid currency code "${profile.defaultCurrency}"',
      );
    }
  }
}

String? _blankToNull(String? value) {
  final trimmed = value?.trim();
  return (trimmed == null || trimmed.isEmpty) ? null : trimmed;
}

final landlordProfileServiceProvider = Provider<LandlordProfileService>(
  (ref) => LandlordProfileService(
    ref.watch(landlordProfileRepositoryProvider),
    ids: ref.watch(idGeneratorProvider),
    clock: ref.watch(clockProvider),
  ),
);
