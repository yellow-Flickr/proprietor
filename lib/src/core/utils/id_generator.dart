import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Produces unique record identifiers.
typedef IdGenerator = String Function();

final _random = Random.secure();

/// RFC 4122 version-4 UUID, e.g. `3f2b8c1e-9d4a-4f6b-8a2e-1c5d7e9f0a3b`.
String uuidV4() {
  final bytes = List<int>.generate(16, (_) => _random.nextInt(256));
  bytes[6] = (bytes[6] & 0x0f) | 0x40; // version 4
  bytes[8] = (bytes[8] & 0x3f) | 0x80; // RFC 4122 variant
  final hex = bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
  return '${hex.substring(0, 8)}-${hex.substring(8, 12)}-'
      '${hex.substring(12, 16)}-${hex.substring(16, 20)}-${hex.substring(20)}';
}

final idGeneratorProvider = Provider<IdGenerator>((ref) => uuidV4);
