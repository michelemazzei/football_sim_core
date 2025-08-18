import 'package:football_sim_core/ai/fsm/fsm.dart';
import 'package:football_sim_core/ecs/models/ball.dart';
import 'package:football_sim_core/ecs/states/ecs_states.dart';

class BallFSM extends Fsm<Ball> {
  BallFSM(super.owner) {
    // changeState(IdleState());
    // fsm.globalState = GlobalBallState();
  }
}
