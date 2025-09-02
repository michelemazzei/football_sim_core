import 'package:football_sim_core/ecs/components/possession_component.dart';
import 'package:football_sim_core/ecs/components/stats_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';

class PossessionEventSystem extends EcsSystem {
  EcsEntity? lastPossessor;

  @override
  void update(EcsWorld world, double dt) {
    EcsEntity? currentPossessor;

    for (final player in world.entitiesWith<PossessionComponent>()) {
      final possession = player.getComponent<PossessionComponent>();
      if (possession?.hasBall == true) {
        currentPossessor = player;
        break;
      }
    }

    if (currentPossessor != lastPossessor) {
      final stats = world.entitiesWith<StatsComponent>().firstOrNull;
      stats?.getComponent<StatsComponent>()?.updatePossession(
        currentPossessor,
        dt,
      );
      lastPossessor = currentPossessor;
    }
  }
}
