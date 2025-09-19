import 'package:football_sim_core/ai/fsm/states/referee/referee_base_state.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:logging/logging.dart';

class InitializingState extends RefereeBaseState {
  final logger = Logger('InitializingState');
  @override
  void enter(RefereeEntity entity, EcsWorld world) {
    logger.info('initializing match...');
  }

  @override
  void exit(RefereeEntity entity, EcsWorld world) {
    logger.info('ready to start match!');
  }
}
