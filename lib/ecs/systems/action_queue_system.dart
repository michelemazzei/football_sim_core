import 'package:football_sim_core/ecs/components/match_lifecycle_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';
import 'package:logging/logging.dart';

class ActionQueueSystem extends EcsSystem {
  final logger = Logger('EcsSystem.ActionQueueSystem');
  bool _endMessage = false;
  @override
  void update(EcsWorld world, double dt) {
    final referee = world.entitiesOf<RefereeEntity>().firstOrNull;
    final lifeCycle = referee?.getComponent<MatchLifecycleComponent>();
    if (lifeCycle?.matchEnded == true) {
      if (!_endMessage) {
        logger.info('Match has ended. Skipping ActionQueue processing.');
        _endMessage = true;
      }
      return;
    }
  }
}
