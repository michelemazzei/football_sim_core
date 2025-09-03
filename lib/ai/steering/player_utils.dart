import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';

class PlayerUtils {
  static PlayerEntity? findClosestPlayerToBall(
    Iterable<PlayerEntity> players,
    BallEntity ball,
  ) {
    final ballPos = ball.getComponent<MovingComponent>()?.currentPosition;
    if (ballPos == null) return null;

    PlayerEntity? closest;
    double minDistance = double.infinity;

    for (final player in players) {
      final moving = player.getComponent<MovingComponent>();
      if (moving == null) continue;

      final distance = moving.currentPosition.distanceTo(ballPos);
      if (distance < minDistance) {
        minDistance = distance;
        closest = player;
      }
    }

    return closest;
  }
}
