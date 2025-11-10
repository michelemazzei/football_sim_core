import 'package:football_sim_core/core/ecs/components/player_tactic_brain_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';

class PlayerBrainSystem extends EcsSystem {
  @override
  void update(EcsWorld world, double dt) {
    for (final player in world.entitiesOf<PlayerEntity>()) {
      final brain = player.getComponent<PlayerTacticBrainComponent>();
      if (brain != null) {
        brain.update(player, world);
      }
    }
  }
}
