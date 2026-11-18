import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

/// Produces unique record identifiers (UUID v4). Injected so tests can
/// supply predictable IDs if they need to.
typedef IdGenerator = String Function();

final idGeneratorProvider = Provider<IdGenerator>((ref) => const Uuid().v4);
