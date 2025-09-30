import 'package:football_sim_core/ai/fsm/components/fsm.dart';
import 'package:football_sim_core/ai/fsm/states/ball/ball_idle_state.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';

class BallFSM extends Fsm<BallEntity> {
  BallFSM(super.owner, super.world) {
    changeState(BallIdleState());
  }
}
