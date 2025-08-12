import 'package:football_sim_core/ai/fsm/core/state.dart';
import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';
import 'package:football_sim_core/controllers/ball_controller.dart';

class MovingState extends State<BallController> {
  @override
  void enter(BallController controller) {
    print("Ball starts moving.");
    // Inizia movimento, imposta velocità, ecc.
  }

  @override
  void execute(BallController controller) {
    // Logica di movimento continuo
  }

  @override
  void exit(BallController controller) {
    print("Ball stops moving.");
    // Ferma animazioni, reset velocità, ecc.
  }

  @override
  bool onMessage(BallController controller, Telegram telegram) {
    if (telegram.message == "kick") {
      print("Ball was already moving and got kicked again.");
      // Potresti aumentare velocità, cambiare direzione, ecc.
      return true;
    }
    return false;
  }
}
