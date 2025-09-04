import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';

class PlayerUtils {
  static List<PlayerEntity> findClosestPlayersToBall(
    Iterable<PlayerEntity> players,
    BallEntity ball,
  ) {
    final ballPos = ball.getComponent<EcsPositionComponent>()?.position;
    if (ballPos == null) return [];

    // Mappa ogni giocatore alla sua distanza dalla palla
    final playerDistances = <PlayerEntity, double>{};

    for (final player in players) {
      final posComp = player.getComponent<EcsPositionComponent>();
      if (posComp == null) continue;

      final distance = posComp.position.distanceToSquared(ballPos);
      playerDistances[player] = distance;
    }

    // Ordina i giocatori in base alla distanza
    final sortedPlayers = playerDistances.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    // Ritorna solo la lista ordinata di PlayerEntity
    return sortedPlayers.map((entry) => entry.key).toList();
  }
}
