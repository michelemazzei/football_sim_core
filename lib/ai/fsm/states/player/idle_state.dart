import 'package:football_sim_core/ai/fsm/states/player/player_base_state.dart';
import 'package:football_sim_core/ecs/components/possession_component.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:logging/logging.dart';

class IdleState extends PlayerBaseState {
  final logger = Logger('IdleState');

  @override
  void enter(PlayerEntity entity) {
    logger.info('Entering IdleState');
  }

  @override
  void execute(PlayerEntity entity, double dt) {
    final possession = entity.getComponent<PossessionComponent>();
    if (possession?.hasBall == true) {
      logger.info('Player ${entity.id} has the ball and is idle.');
    } else {
      // logger.info('Player ${entity.id} is idle without the ball.');
    }
  }

  @override
  void exit(PlayerEntity entity) {
    logger.info('Exiting IdleState');
  }
}
