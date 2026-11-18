/// Expected business failures raised by application services.
///
/// Controllers catch these and turn them into presentation state / messages.
/// Anything else that escapes a service is an unexpected (programming or
/// storage) error.
sealed class DomainException implements Exception {
  const DomainException(this.message);

  /// Developer-facing description. Map to localized text in presentation.
  final String message;

  @override
  String toString() => '$runtimeType: $message';
}

/// Input is invalid on its own (missing name, end date before start, ...).
class ValidationException extends DomainException {
  const ValidationException(super.message);
}

/// A referenced record does not exist.
class NotFoundException extends DomainException {
  const NotFoundException(this.entity, this.id)
    : super('$entity "$id" was not found');

  final String entity;
  final String id;
}

/// The operation conflicts with existing data or record state (overlapping
/// tenancy, over-allocation, editing a confirmed tenancy, ...).
class ConflictException extends DomainException {
  const ConflictException(super.message);
}
