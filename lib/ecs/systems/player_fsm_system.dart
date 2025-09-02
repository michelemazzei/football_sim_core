import 'package:football_sim_core/components/fsm_component.dart';
import 'package:football_sim_core/ecs/components/ecs_player_component.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';

class PlayerFsmSystem extends EcsSystem {
  @override
  void update(EcsWorld world, double dt) {
    final entities = world.entitiesWith<EcsPlayerComponent>();
    for (final entity in entities) {
      final fsm = entity.getComponent<FsmComponent<PlayerEntity>>()?.fsm;
      fsm?.update(dt);
    }
  }

  @override
  bool filter(EcsEntity entity) => entity.hasComponent<EcsPlayerComponent>();
}
