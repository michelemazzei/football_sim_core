import 'dart:ui';
import 'package:flame/components.dart';
import 'package:football_sim_core/game/football_game.dart';
import 'package:football_sim_core/model/sprite_model.dart';

abstract class SpriteController<Model extends SpriteModel> {
  final Model model;
  Vector2 size = Vector2.all(32); // Default size
  final FootballGame game;

  double friction = 0.98;
  double maxSpeed = 800;

  final VoidCallback? onBallOutOfBounds;

  SpriteController({
    this.maxSpeed = 800,
    this.friction = 0.98,
    required this.model,
    required this.game,
    this.onBallOutOfBounds,
  });

  Vector2 get gameSize => game.fieldComponent.size;

  // Posizione assoluta calcolata dalla relativa

  Vector2 get position {
    if (gameSize.x == 0 || gameSize.y == 0) return Vector2.zero();

    final offset = model.relativePosition.clone()..multiply(gameSize);
    final fieldPos = game.fieldComponent.position;
    return fieldPos + offset - size / 2;
  }

  Vector2 get velocity => model.velocity;
  set velocity(Vector2 v) => model.velocity = v;

  // Velocità relativa rispetto al campo
  Vector2 get relativeVelocity {
    if (gameSize.x == 0 || gameSize.y == 0) return Vector2.zero();
    return velocity.clone()..divide(gameSize);
  }

  set relativeVelocity(Vector2 v) {
    if (gameSize.x == 0 || gameSize.y == 0) return;
    velocity = v.clone()..multiply(gameSize);
  }

  void update(double dt) {
    model.clampSpeed(maxSpeed);

    // 🔧 Aggiorna la posizione relativa usando la velocità relativa
    model.relativePosition += relativeVelocity * dt;
    model.relativePosition.clamp(Vector2.zero(), Vector2.all(1.0));

    model.applyFriction(friction);
    _handleBoundsCollision();
  }

  void _handleBoundsCollision() {
    final halfW = size.x / 2;
    final halfH = size.y / 2;
    final pos = position;

    final outLeft = pos.x - halfW < 0;
    final outRight = pos.x + halfW > gameSize.x;
    final outTop = pos.y - halfH < 0;
    final outBottom = pos.y + halfH > gameSize.y;

    if (outLeft || outRight || outTop || outBottom) {
      onBallOutOfBounds?.call();
    }
  }
}
