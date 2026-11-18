import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Returns the current instant. Injected so services and tests agree on time.
typedef Clock = DateTime Function();

DateTime utcNow() => DateTime.now().toUtc();

final clockProvider = Provider<Clock>((ref) => utcNow);
