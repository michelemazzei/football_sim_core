import 'package:collection/collection.dart';
import 'package:football_sim_core/ecs/components/ball_touch_event_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';

class BallHistorySystem extends EcsSystem {
  @override
  void update(EcsWorld world, double dt) {
    // Usiamo la tua extension 'ball' per accedere all'entità palla
    final ball = world.ball;
    if (ball == null) return;

    // 1. Controlliamo se in questo frame c'è stato un evento di tocco
    final touchEvent = ball.getComponent<BallTouchEventComponent>();

    if (touchEvent != null) {
      // 2. Troviamo il giocatore che ha generato il tocco
      // Usiamo entitiesOf<PlayerEntity>() che hai già nel world
      final player = world.entitiesOf<PlayerEntity>().firstWhereOrNull(
        (p) => p.id == touchEvent.playerId,
      );

      if (player != null) {
        // 3. Aggiorniamo il BallOutOfBoundsComponent con l'ultimo tocco "storico"
        final outComp = ball.getComponent<BallOutOfBoundsComponent>();

        if (outComp != null) {
          outComp.lastPlayerId = player.id;
          outComp.lastTeamId = player.teamId;
        }
      }

      // Nota: In alcuni ECS il BallTouchEventComponent verrebbe rimosso qui
      // ma se gestisci la rimozione in un sistema di "cleanup" a fine frame,
      // qui non devi fare altro.
    }
  }
}
