import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:football_sim_core/ecs/systems/fsm_system.dart';

class RefereeFsmSystem extends FsmSystem {
  @override
  void update(EcsWorld world, double dt) {
    final entities = world.entitiesWith<FsmComponent<RefereeEntity>>();
    for (final entity in entities) {
      entity.getComponent<FsmComponent<RefereeEntity>>()?.updateFSM(dt);
    }
  }
}
