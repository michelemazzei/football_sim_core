import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/ecs/models/ball.dart';
import 'package:football_sim_core/ecs/systems/command_system.dart';
import 'package:football_sim_core/model/game_state.dart';

class IdleState extends GameState<Ball> {
  @override
  void enter(Ball b) {}
  @override
  void execute(Ball b) {
    for (var c in b.commands) {
      if (c.type == CommandType.stopBall) {
        b.commands.clear();
        fsm.changeState(MovingState());
      }
    }
  }

  @override
  void exit(Ball b) {}
  @override
  bool onMessage(Ball b, Telegram t) => false;
}

class GlobalBallState extends GameState<Ball> {
  @override
  void enter(Ball b) {}
  @override
  void execute(Ball b) {}
  @override
  void exit(Ball b) {}
  @override
  bool onMessage(Ball b, Telegram t) => false;
}
