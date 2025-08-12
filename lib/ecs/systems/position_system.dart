import 'package:flame/game.dart';
import 'package:football_sim_core/ecs/entities/entity.dart';
import 'package:football_sim_core/game/football_game.dart';
import 'package:football_sim_core/model/game_state.dart';

class PositionSystem {
  GameState get world => game.gameState;

  final FootballGame game;

  PositionSystem(this.game);

  Vector2 getAbsolutePosition(Entity id) {
    final relPos = world.positionMap[id]?.position ?? Vector2.zero();
    final size = world.sizeMap[id]?.size ?? Vector2.all(32);
    final fieldSize = game.fieldComponent.size;
    final fieldPos = game.fieldComponent.position;

    final offset = relPos.clone()..multiply(fieldSize);
    return fieldPos + offset - size / 2;
  }

  Vector2 getRelativeVelocity(Entity id) {
    final vel = world.velocityMap[id]?.velocity ?? Vector2.zero();
    final fieldSize = game.fieldComponent.size;
    return vel.clone()..divide(fieldSize);
  }

  void setRelativeVelocity(Entity id, Vector2 v) {
    final fieldSize = game.fieldComponent.size;
    world.velocityMap[id]?.velocity = v.clone()..multiply(fieldSize);
  }
}
