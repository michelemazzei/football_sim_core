import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';

class PlayerUtils {
  void kickBallTo(PlayerEntity passer, PlayerEntity receiver, BallEntity ball) {
    final from = passer.getComponent<MovingComponent>()!.currentPosition;
    final to = receiver.getComponent<MovingComponent>()!.currentPosition;
    final direction = (to - from).normalized();
    final velocity = direction * 300; // forza del passaggio

    ball.getComponent<MovingComponent>()!.targetPosition = to;
    ball.getComponent<MovingComponent>()!.velocity = velocity;
    MessageDispatcher.instance.dispatchMessage(
      sender: passer,
      receiver: receiver,
      message: BallKicked(fromPlayerId: passer.id, toPlayerId: receiver.id),
    );
  }

  static List<PlayerEntity> getTeammates(PlayerEntity entity) {
    final teamId = entity.getComponent<TeamComponent>()?.team.id;
    if (teamId == null) return [];
    final game = entity.getComponent<GameReferenceComponent>()?.game;
    if (game == null) return [];
    final world = game.ecsWorld;
    return world
        .entitiesOf<PlayerEntity>()
        .where(
          (p) =>
              p.getComponent<TeamComponent>()?.team.id == teamId &&
              p.id != entity.id,
        )
        .toList();
  }

  static PlayerEntity findClosestTeammate(
    PlayerEntity passer, {
    List<PlayerEntity>? teammates,
  }) {
    teammates ??= getTeammates(passer);
    final passerPos = passer.getComponent<MovingComponent>()!.currentPosition;
    PlayerEntity? closest;
    double minDistance = double.infinity;

    for (final teammate in teammates) {
      if (teammate == passer) continue;
      final pos = teammate.getComponent<MovingComponent>()!.currentPosition;
      final distance = (passerPos - pos).length2;
      if (distance < minDistance) {
        minDistance = distance;
        closest = teammate;
      }
    }

    return closest!;
  }

  static List<PlayerEntity> findClosestPlayersToBall(
    Iterable<PlayerEntity> players,
    BallEntity ball,
  ) {
    final ballPos = ball.getComponent<MovingComponent>()?.currentPosition;
    if (ballPos == null) return [];

    // Mappa ogni giocatore alla sua distanza dalla palla
    final playerDistances = <PlayerEntity, double>{};

    for (final player in players) {
      final posComp = player.getComponent<MovingComponent>()?.currentPosition;
      if (posComp == null) continue;

      final distance = posComp.distanceToSquared(ballPos);
      playerDistances[player] = distance;
    }

    // Ordina i giocatori in base alla distanza
    final sortedPlayers = playerDistances.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    // Ritorna solo la lista ordinata di PlayerEntity
    return sortedPlayers.map((entry) => entry.key).toList();
  }
}
