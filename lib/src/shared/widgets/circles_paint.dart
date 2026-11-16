import 'dart:math';

import 'package:flutter/material.dart';

/// Decorative concentric-circle pattern used behind headers, banners and the
/// drawer backdrop across features.
class CirclesPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    var radius = size.width / 2;
    const angle = 2 * pi / 15;
    final center = Offset(size.width / 2, size.height / 2);

    for (int i = 0; i < 20; i++) {
      final point = Offset(
        center.dx + radius * cos(angle * i),
        center.dy + radius * sin(angle * i),
      );
      canvas.drawCircle(point, radius, paint);
      radius -= 10;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
