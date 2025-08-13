import 'package:football_sim_core/ai/fsm/components/fsm_component.dart';
import 'package:football_sim_core/ecs/ecs_system.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';

class FsmSystem extends EcsSystem {
  final EcsWorld world;

  FsmSystem(this.world);

  @override
  void update(double dt) {
    final entities = world.entitiesWith<FsmComponent>();

    for (final entity in entities) {
      final fsmComponent = entity.getComponent<FsmComponent>();
      fsmComponent?.updateFSM();
    }
  }
}
