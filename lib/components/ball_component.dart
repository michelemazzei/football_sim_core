import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/game/football_game.dart';

class BallComponent extends PositionComponent
    with HasGameReference<FootballGame> {
  final double angleSpin = 0.02;

  BallComponent([Anchor anchor = Anchor.center])
    : super(anchor: anchor, size: Vector2.all(20.0));

  @override
  void render(Canvas canvas) {
    final center = Offset(size.x, size.y);
    final radius = size.x / 2;

    final whitePaint = Paint()..color = Colors.white;
    canvas.drawCircle(center, radius, whitePaint);

    final blackPaint = Paint()..color = Colors.black;
    _drawPolygon(canvas, center, radius / 3, 6, blackPaint);

    final pentagonRadius = radius / 4;
    for (int i = 0; i < 5; i++) {
      final angle = (2 * pi / 5) * i - pi / 2;
      final dx = center.dx + cos(angle) * radius * 0.6;
      final dy = center.dy + sin(angle) * radius * 0.6;
      _drawPolygon(canvas, Offset(dx, dy), pentagonRadius, 5, blackPaint);
    }

    final glossPaint = Paint()
      ..shader = RadialGradient(
        colors: [Colors.white.withAlpha(100), Colors.transparent],
        center: Alignment.topLeft,
        radius: 0.8,
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawCircle(center, radius, glossPaint);
  }

  void _drawPolygon(
    Canvas canvas,
    Offset center,
    double radius,
    int sides,
    Paint paint,
  ) {
    final path = Path();
    for (int i = 0; i < sides; i++) {
      final angle = (2 * pi / sides) * i - pi / 2;
      final x = center.dx + cos(angle) * radius;
      final y = center.dy + sin(angle) * radius;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }
}
