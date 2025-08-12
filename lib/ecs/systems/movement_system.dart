import 'package:flame/game.dart';
import 'package:football_sim_core/game/football_game.dart';
import 'package:football_sim_core/model/game_state.dart';

class MovementSystem {
  GameState get world => game.gameState;
  final FootballGame game;

  MovementSystem(this.game);

  void update(double dt) {
    for (final entity in world.velocityMap.keys) {
      final velComp = world.velocityMap[entity]!;
      final posComp = world.positionMap[entity];
      final config = world.movementConfigMap[entity];

      if (config != null) {
        velComp.velocity = _applyFriction(
          velComp.velocity,
          config.frictionFactor,
        );
        velComp.velocity = _clampSpeed(
          velComp.velocity,
          config.minVelocity,
          config.maxVelocity,
        );
      }
      if (posComp != null) {
        posComp.position += velComp.velocity * dt;
      }
    }
  }

  // Non usiamo più update qui, lo spostiamo nel controller
  Vector2 _applyFriction(Vector2 velocity, double factor) => velocity *= factor;

  Vector2 _clampSpeed(Vector2 velocity, double minSpeed, double maxSpeed) {
    Vector2 result = velocity.clone();
    if (velocity.length > maxSpeed) {
      result = velocity.normalized() * maxSpeed;
    }
    if (velocity.length2 < minSpeed) {
      result = Vector2.zero(); //
    }
    return result;
  }
}
