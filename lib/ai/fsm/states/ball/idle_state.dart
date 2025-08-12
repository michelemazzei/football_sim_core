import 'package:football_sim_core/ai/fsm/core/state.dart';
import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';
import 'package:football_sim_core/controllers/ball_controller.dart';

class IdleState extends State<BallController> {
  @override
  void enter(BallController controller) {
    print("Ball is now idle.");
    // Puoi aggiungere animazioni o logica di reset
  }

  @override
  void execute(BallController controller) {
    // Logica da eseguire ogni frame mentre è idle
  }

  @override
  void exit(BallController controller) {
    print("Ball is leaving idle state.");
  }

  @override
  bool onMessage(BallController controller, Telegram telegram) {
    if (telegram.message == "kick") {
      print("Ball received 'kick' while idle. Switching to MovingState.");
      controller.fsm.changeState(MovingState());
      return true;
    }
    return false;
  }
}
