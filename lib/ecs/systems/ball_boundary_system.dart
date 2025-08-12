import 'package:flame/game.dart';
import 'package:football_sim_core/ecs/entities/entity.dart';
import 'package:football_sim_core/game/football_game.dart';
import 'package:football_sim_core/ecs/systems/position_system.dart';
import 'package:football_sim_core/model/game_state.dart';

class BallBoundarySystem {
  GameState get world => game.gameState;
  final FootballGame game;

  BallBoundarySystem(this.game);

  void checkBounds(Entity id) {
    final posSystem = PositionSystem(game);
    final pos = posSystem.getAbsolutePosition(id);
    final size = world.sizeMap[id]?.size ?? Vector2.all(32);
    final halfW = size.x / 2;
    final halfH = size.y / 2;
    final fieldSize = game.fieldComponent.size;

    final outLeft = pos.x - halfW < 0;
    final outRight = pos.x + halfW > fieldSize.x;
    final outTop = pos.y - halfH < 0;
    final outBottom = pos.y + halfH > fieldSize.y;

    if (outLeft || outRight || outTop || outBottom) {
      world.ballLogicMap[id]?.onOutOfBounds?.call();
    }
  }
}
