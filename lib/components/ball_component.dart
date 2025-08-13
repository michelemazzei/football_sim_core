import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/components/ball_trail.dart';
import 'package:football_sim_core/components/entity_component.dart';
import 'package:football_sim_core/controllers/ball_controller.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/game/football_game.dart';

class BallComponent extends EntityComponent<BallController> {
  final double angleSpin = 0.02;
  final double maxSpeed;
  final BallEntity entity;

  BallComponent({
    required this.entity,
    required FootballGame game,
    this.maxSpeed = 1.0,
  }) {
    this.game = game;
    anchor = Anchor.center;
    sizeRatio = 0.02;

    // Imposta il controller
    controller = BallController(entity: entity, game: game, maxSpeed: maxSpeed)
      ..size = size;

    // Registra la dimensione nel GameState
    final sizeComponent = entity.getComponent<SizeComponent>();
    if (sizeComponent != null) {
      sizeComponent.size = size;
    } else {
      entity.addComponent(SizeComponent(height: size.y, width: size.x));
    }
  }

  @override
  void render(Canvas canvas) {
    final center = Offset(size.x / 2, size.y / 2);
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

  @override
  void update(double dt) {
    super.update(dt);
    controller.update(dt);
    // 🔁 sincronizza posizione visiva
    position = controller.getRenderPosition();
  }

  @override
  void onPostUpdate(double dt) {
    if (controller.velocity.length2 > 1) {
      angle += controller.velocity.length * dt * angleSpin;
    }
    if (controller.relativeVelocity.length2 > 0.2) {
      game.add(BallTrail(position.clone()));
    }
  }

  void kick(Vector2 direction, double strength) {
    double clampedStrength = strength.clamp(0, maxSpeed);
    controller.relativeVelocity = direction.normalized() * clampedStrength;
  }
}
