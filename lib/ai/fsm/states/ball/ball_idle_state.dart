import 'package:football_sim_core/ai/fsm/states/ball/ball_base_state.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:logging/logging.dart';

class BallIdleState extends BallBaseState {
  final logger = Logger('Ball IDLE State');
  @override
  void enter(BallEntity match) {
    logger.info('Ball is now idle');
  }

  @override
  void execute(BallEntity entity, double dt) {}

  @override
  void exit(BallEntity match) {}
}
