import 'package:football_sim_core/ecs/components/ball_possession_component.dart';
import 'package:football_sim_core/ecs/components/ball_touch_event_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';

class PossessionEventSystem extends EcsSystem {
  @override
  void update(EcsWorld world, double dt) {
    final referee = world.entitiesOf<RefereeEntity>().firstOrNull;
    if (referee == null) return;

    final events = world.entitiesWith<BallTouchEventComponent>();

    for (final event in events) {
      final playerId = event.getComponent<BallTouchEventComponent>()?.playerId;
      if (playerId == null) continue;

      // Aggiorna possesso di squadra (opzionale)
      final player = world
          .entitiesOf<PlayerEntity>()
          .where((player) => player.id == playerId)
          .firstOrNull;
      final teamComp = player?.getComponent<TeamComponent>();
      if (teamComp != null) {
        referee
          ..removeComponent<BallPossessionComponent>()
          ..addComponent(
            BallPossessionComponent(teamId: teamComp.team, playerId: playerId),
          );
      }
      break; // solo il primo evento per frame
    }
  }
}
