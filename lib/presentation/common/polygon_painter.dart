import 'dart:math';

import 'package:flutter/cupertino.dart';

class PolygonPainter extends CustomPainter {
  const PolygonPainter({required this.sides, required this.radius, required this.backgroundColor});

  final int sides;
  final double radius;
  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double angle = (360 / sides) * (pi / 180);
    final Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;


    final path = Path();
    path.moveTo(centerX + radius * cos(0.0), centerY + radius * sin(0.0));

    for (int i = 1; i <= sides; i++) {
      double x = centerX + radius * cos(angle * i);
      double y = centerY + radius * sin(angle * i);
      path.lineTo(x, y);
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}