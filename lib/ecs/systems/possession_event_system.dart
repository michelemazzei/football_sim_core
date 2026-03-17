import 'package:football_sim_core/ecs/components/ball_possession_component.dart';
import 'package:football_sim_core/ecs/components/ball_touch_event_component.dart';
import 'package:football_sim_core/ecs/components/team_reference_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';

class PossessionEventSystem extends EcsSystem {
  @override
  void update(EcsWorld world, double dt) {
    // 1. Recuperiamo la risorsa (Sappiamo che esiste grazie al Bootstrap)
    final possession = world.getResource<BallPossessionComponent>()!;
    // 2. Troviamo gli eventi di tocco palla
    final touchEvents = world.entitiesWith<BallTouchEventComponent>();
    if (touchEvents.isEmpty) return;

    // Prendiamo il tocco più rilevante (o l'ultimo, o il primo)
    final eventEntity = touchEvents.first;
    final touchData = eventEntity.getComponent<BallTouchEventComponent>()!;

    // 3. Recuperiamo il TeamId direttamente dal giocatore che ha toccato la palla
    // Supponendo che il giocatore abbia un TeamReferenceComponent
    final player = world.getEntityById<PlayerEntity>(touchData.playerId);
    final teamId = player?.getComponent<TeamReferenceComponent>()?.teamId;

    if (teamId != null) {
      possession.updatePossession(
        newPlayerId: touchData.playerId,
        newTeamId: teamId,
      );
    }

    // IMPORTANTE: Consumiamo gli eventi del frame corrente
    // per evitare di riprocessarli al prossimo tick.
    for (final e in touchEvents) {
      world.removeEntity(e);
      // Oppure: e.removeComponent<BallTouchEventComponent>();
    }
  }
}
