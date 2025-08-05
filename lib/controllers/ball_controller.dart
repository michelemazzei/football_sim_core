import 'dart:ui';
import 'package:flame/components.dart';
import 'package:football_sim_core/model/ball_model.dart';

class BallController {
  final BallModel model;
  final Vector2 size;
  final Vector2 gameSize;
  final Vector2 initialPosition;

  final double friction = 0.98;
  final double maxSpeed = 800;

  VoidCallback? onBallOutOfBounds;

  BallController({
    required this.model,
    required this.size,
    required this.gameSize,
    required this.initialPosition,
    this.onBallOutOfBounds,
  });

  void update(double dt) {
    model.clampSpeed(maxSpeed);
    model.update(dt);
    model.applyFriction(friction);
    _handleBoundsCollision();
  }

  void _handleBoundsCollision() {
    final halfW = size.x / 2;
    final halfH = size.y / 2;
    final pos = model.position;

    final outLeft = pos.x - halfW < 0;
    final outRight = pos.x + halfW > gameSize.x;
    final outTop = pos.y - halfH < 0;
    final outBottom = pos.y + halfH > gameSize.y;

    if (outLeft || outRight || outTop || outBottom) {
      onBallOutOfBounds?.call();
    }
  }

  Vector2 get position => model.position;
  Vector2 get velocity => model.velocity;
  set velocity(Vector2 v) => model.velocity = v;
}
