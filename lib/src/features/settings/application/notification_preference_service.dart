import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/transaction_runner.dart';
import '../../../core/domain/domain_exception.dart';
import '../../../core/utils/clock.dart';
import '../../../core/utils/id_generator.dart';
import '../data/notification_preference_repository.dart';
import '../domain/notification_preference.dart';

/// Reminder preferences: one record per landlord and event type.
class NotificationPreferenceService {
  NotificationPreferenceService(
    this._repository,
    this._transactions, {
    required this._ids,
    required this._clock,
  });

  /// Initial lead times (days) used when preferences are first created.
  static const defaultDaysBefore = {
    NotificationEventType.rentDue: 3,
    NotificationEventType.overdueRent: null,
    NotificationEventType.tenancyExpiry: 30,
    NotificationEventType.upcomingTenancy: 7,
  };

  final NotificationPreferenceRepository _repository;
  final TransactionRunner _transactions;
  final IdGenerator _ids;
  final Clock _clock;

  Stream<List<NotificationPreference>> watchPreferences(String landlordId) =>
      _repository.watchForLandlord(landlordId);

  /// Creates any missing preference (enabled, with [defaultDaysBefore]) and
  /// returns the full set. Safe to call repeatedly, e.g. after onboarding.
  Future<List<NotificationPreference>> ensureDefaults(String landlordId) {
    return _transactions.run(() async {
      final existing = await _repository.getForLandlord(landlordId);
      final present = {for (final p in existing) p.eventType};
      final now = _clock();
      final created = [
        for (final type in NotificationEventType.values)
          if (!present.contains(type))
            NotificationPreference(
              id: _ids(),
              landlordId: landlordId,
              eventType: type,
              enabled: true,
              daysBefore: defaultDaysBefore[type],
              createdAt: now,
              updatedAt: now,
            ),
      ];
      for (final preference in created) {
        await _repository.insert(preference);
      }
      return [...existing, ...created];
    });
  }

  Future<NotificationPreference> setEnabled(String id, bool enabled) async {
    final preference = await _get(id);
    final updated = preference.copyWith(enabled: enabled, updatedAt: _clock());
    await _repository.update(updated);
    return updated;
  }

  /// Sets the advance-reminder lead time; `null` means remind on the day.
  Future<NotificationPreference> setDaysBefore(String id, int? days) async {
    if (days != null && days < 0) {
      throw const ValidationException('Days before cannot be negative');
    }
    final preference = await _get(id);
    final updated = preference.copyWith(
      daysBefore: () => days,
      updatedAt: _clock(),
    );
    await _repository.update(updated);
    return updated;
  }

  Future<NotificationPreference> _get(String id) async =>
      await _repository.getById(id) ??
      (throw NotFoundException('NotificationPreference', id));
}

final notificationPreferenceServiceProvider =
    Provider<NotificationPreferenceService>(
      (ref) => NotificationPreferenceService(
        ref.watch(notificationPreferenceRepositoryProvider),
        ref.watch(transactionRunnerProvider),
        ids: ref.watch(idGeneratorProvider),
        clock: ref.watch(clockProvider),
      ),
    );
