import 'package:football_sim_core/ecs/components/possession_component.dart';
import 'package:football_sim_core/ecs/components/possession_timer_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';

class PossessionTimerSystem extends EcsSystem {
  @override
  void update(EcsWorld world, double dt) {
    for (final player
        in world
            .entitiesWithAll<PossessionComponent, PossessionTimerComponent>()) {
      final possession = player.getComponent<PossessionComponent>();
      final timer = player.getComponent<PossessionTimerComponent>();

      if (possession?.hasBall == true) {
        timer?.timeInPossession += dt;
      }
    }
  }
}
