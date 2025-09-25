import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/ecs/systems/fsm_system.dart';

class PlayerFsmSystem extends FsmSystem {
  @override
  void update(EcsWorld world, double dt) {
    final entities = world.entitiesWith<FsmComponent<PlayerEntity>>();
    for (final entity in entities) {
      entity.getComponent<FsmComponent<PlayerEntity>>()?.updateFSM(dt);
    }
  }
}
