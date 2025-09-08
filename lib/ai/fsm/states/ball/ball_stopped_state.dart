import 'package:football_sim_core/ai/fsm/states/ball/ball_base_state.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';

class BallStoppedState extends BallBaseState {
  @override
  void enter(BallEntity match) {}

  @override
  void execute(BallEntity entity, double dt) {}

  @override
  void exit(BallEntity match) {}
}
