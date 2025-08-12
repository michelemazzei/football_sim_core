import 'package:football_sim_core/ai/fsm/fsm.dart';
import 'package:football_sim_core/controllers/ball_controller.dart';

class BallFsm extends Fsm<BallController> {
  BallFsm(super) {
    changeState(IdleState()); // Stato iniziale
  }
}
