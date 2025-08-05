import 'dart:ui';

import 'package:flame/components.dart';

import 'package:football_sim_core/model/soccer_ball_model.dart';

class SoccerBallController {
  /// Velocità corrente (unità: pixel/secondo)
  Vector2 velocity = Vector2.zero();

  /// Angolo della palla
  double angle = 0.0;

  /// Coefficiente di attrito: riduce la velocità ogni frame
  final double friction = 0.98;

  /// Velocità massima
  final double maxSpeed = 800;

  final SoccerBallModel model;
  Vector2? impactDirection;
  bool hasCollided = false;
  late final Vector2 position;
  final Vector2 size;
  final Vector2 gameSize;
  final Vector2 initialPosition;

  VoidCallback? onBallOutOfBounds;

  SoccerBallController({
    required this.model,
    required this.size,
    required this.gameSize,
    required this.initialPosition,
    this.onBallOutOfBounds,
  }) {
    position = initialPosition.clone();
  }

  void update(double dt) {
    model.update(dt);

    // 4. Applica movimento
    if (!velocity.isZero()) {
      // Limita la velocità
      if (velocity.length > maxSpeed) {
        velocity = velocity.normalized() * maxSpeed;
      }

      // Muovi la palla
      position += velocity * dt;

      // Applica attrito
      velocity *= friction;

      angle += velocity.length * dt * velocity.length2 / maxSpeed * 0.001;
      // Gestione rimbalzo sui bordi del campo
      _handleBoundsCollision();
    }
  }

  bool get isOutOfBounds =>
      position.x < 0 ||
      position.x > gameSize.x ||
      position.y < 0 ||
      position.y > gameSize.y;

  void _handleBoundsCollision() {
    final halfW = size.x / 2;
    final halfH = size.y / 2;

    bool isOutOfBounds = false;

    if (position.x - halfW < 0 ||
        position.x + halfW > gameSize.x ||
        position.y - halfH < 0 ||
        position.y + halfH > gameSize.y) {
      isOutOfBounds = true;
    }

    if (isOutOfBounds) {
      onBallOutOfBounds?.call();
    }
  }
}
