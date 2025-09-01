import 'package:football_sim_core/ecs/components/player_fsm_component.dart';
import 'package:football_sim_core/ecs/ecs_system.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';

class PlayerFsmSystem extends EcsSystem {
  @override
  void update(EcsWorld world, double dt) {
    final entities = world.entitiesWith<PlayerFsmComponent>();
    for (final entity in entities) {
      final fsm = entity.getComponent<PlayerFsmComponent>()?.fsm;
      fsm?.update(dt);
    }
  }

  @override
  bool filter(EcsEntity entity) {
    return entity.hasComponent<PlayerFsmComponent>();
  }
}
