enum NotificationEventType {
  rentDue,
  overdueRent,
  tenancyExpiry,
  upcomingTenancy,
}

/// Landlord preference for one kind of local reminder.
///
/// Configuration only: the database records remain authoritative even if a
/// reminder is missed or disabled.
class NotificationPreference {
  const NotificationPreference({
    required this.id,
    required this.landlordId,
    required this.eventType,
    required this.enabled,
    this.daysBefore,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String landlordId;
  final NotificationEventType eventType;
  final bool enabled;

  /// Lead time for an advance reminder; `null` means remind on the day.
  final int? daysBefore;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// `daysBefore` takes a function so it can be explicitly cleared:
  /// `copyWith(daysBefore: () => null)`.
  NotificationPreference copyWith({
    bool? enabled,
    int? Function()? daysBefore,
    DateTime? updatedAt,
  }) {
    return NotificationPreference(
      id: id,
      landlordId: landlordId,
      eventType: eventType,
      enabled: enabled ?? this.enabled,
      daysBefore: daysBefore == null ? this.daysBefore : daysBefore(),
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
