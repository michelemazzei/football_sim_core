import 'package:football_sim_core/components/fsm_component.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:logging/logging.dart';

class FsmSystem extends EcsSystem {
  final logger = Logger('FsmSystem');
  @override
  void update(EcsWorld world, double dt) {
    final entities = world.entitiesWith<FsmComponent<RefereeEntity>>();
    for (final entity in entities) {
      final fsmComponent = entity.getComponent<FsmComponent<RefereeEntity>>();
      fsmComponent?.updateFSM(dt);
    }
  }
}
