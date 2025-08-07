import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import '../game/football_game.dart';

class FieldComponent extends PositionComponent
    with HasGameReference<FootballGame> {
  FieldComponent() : super(anchor: Anchor.topLeft);

  @override
  void onGameResize(Vector2 screenSize) {
    super.onGameResize(screenSize);
    _resizeField(screenSize);
  }

  void _resizeField(Vector2 screenSize) {
    final fieldRatio = 16 / 9;
    final screenRatio = screenSize.x / screenSize.y;

    if (fieldRatio > screenRatio) {
      size = Vector2(screenSize.x, screenSize.x / fieldRatio);
    } else {
      size = Vector2(screenSize.y * fieldRatio, screenSize.y);
    }

    position = (screenSize - size) / 2;
  }

  @override
  void render(Canvas canvas) {
    final Paint grassPaint = Paint()..color = const Color(0xFF2E7D32);
    canvas.drawRect(size.toRect(), grassPaint);

    final Paint linePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Bordo campo
    canvas.drawRect(size.toRect(), linePaint);

    // Cerchio centrale
    final center = Offset(size.x / 2, size.y / 2);
    canvas.drawCircle(center, size.x * 0.1, linePaint);

    // Linea di centrocampo
    canvas.drawLine(
      Offset(size.x / 2, 0),
      Offset(size.x / 2, size.y),
      linePaint,
    );

    // Aree di rigore
    final areaWidth = size.x * 0.15;
    final areaHeight = size.y * 0.4;

    final leftArea = Rect.fromLTWH(
      0,
      size.y / 2 - areaHeight / 2,
      areaWidth,
      areaHeight,
    );
    final rightArea = Rect.fromLTWH(
      size.x - areaWidth,
      size.y / 2 - areaHeight / 2,
      areaWidth,
      areaHeight,
    );

    canvas.drawRect(leftArea, linePaint);
    canvas.drawRect(rightArea, linePaint);

    // Dischetto del rigore (pixel)
    final leftPenaltySpot = Offset(areaWidth * 0.8, size.y / 2);
    final rightPenaltySpot = Offset(size.x - areaWidth * 0.8, size.y / 2);

    final Paint pixelPaint = Paint()..color = Colors.white;
    canvas.drawPoints(PointMode.points, [
      leftPenaltySpot,
      rightPenaltySpot,
    ], pixelPaint);

    // Mezza luna attaccata all’area
    final arcRadius = size.x * 0.06;

    final leftArcRect = Rect.fromCircle(
      center: leftPenaltySpot,
      radius: arcRadius,
    );
    final rightArcRect = Rect.fromCircle(
      center: rightPenaltySpot,
      radius: arcRadius,
    );

    // Calcola angoli per attaccare la mezza luna all’area
    final double angle = acos((areaWidth - areaWidth * 0.8) / arcRadius);

    canvas.drawArc(leftArcRect, -angle, 2 * angle, false, linePaint);
    canvas.drawArc(rightArcRect, 3.14 - angle, 2 * angle, false, linePaint);

    // Porte
    _drawGoal(canvas, Offset(0, size.y / 2), true);
    _drawGoal(canvas, Offset(size.x, size.y / 2), false);
  }

  void _drawGoal(Canvas canvas, Offset origin, bool isLeft) {
    final Paint netPaint = Paint()
      ..color = Colors.white.withOpacity(0.6)
      ..strokeWidth = 1;

    final double goalHeight = size.y * 0.2;
    final double depth = size.x * 0.03;

    final path = Path();
    path.moveTo(origin.dx, origin.dy - goalHeight / 2);
    path.lineTo(origin.dx, origin.dy + goalHeight / 2);
    path.lineTo(
      isLeft ? origin.dx - depth : origin.dx + depth,
      origin.dy + goalHeight / 2,
    );
    path.lineTo(
      isLeft ? origin.dx - depth : origin.dx + depth,
      origin.dy - goalHeight / 2,
    );
    path.close();

    canvas.drawPath(path, netPaint);

    final int netLines = 5;
    for (int i = 1; i < netLines; i++) {
      final double v = i / netLines;
      canvas.drawLine(
        Offset(origin.dx, origin.dy - goalHeight / 2 + v * goalHeight),
        Offset(
          isLeft ? origin.dx - depth : origin.dx + depth,
          origin.dy - goalHeight / 2 + v * goalHeight,
        ),
        netPaint,
      );
    }
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    _resizeField(game.size);
  }
}
