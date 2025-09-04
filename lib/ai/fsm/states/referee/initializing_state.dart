import 'package:football_sim_core/ai/fsm/states/referee/referee_base_state.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:logging/logging.dart';

class InitializingState extends RefereeBaseState {
  final logger = Logger('InitializingState');
  @override
  void enter(RefereeEntity referee) {
    logger.info('initializing match...');
  }

  @override
  void execute(RefereeEntity referee, double dt) {}

  @override
  void exit(RefereeEntity referee) {
    logger.info('ready to start match!');
  }
}
