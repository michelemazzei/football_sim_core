import 'package:football_sim_core/ai/entity/soccer_player.dart';
import 'package:football_sim_core/ai/fsm/player/place_to_kick_off_state.dart';
import 'package:football_sim_core/ai/fsm/player/receive_ball.dart';
import 'package:football_sim_core/ai/fsm/player/return_to_home.dart';
import 'package:football_sim_core/ai/fsm/state.dart';
import 'package:football_sim_core/ai/msg/messages.dart';
import 'package:football_sim_core/ai/msg/telegram.dart';

class GlobalPlayerState extends State<SoccerPlayer> {
  // final log = logFactory('GlobalPlayerState');
  @override
  void enter(SoccerPlayer entity) {
    // TODO: implement enter
  }

  @override
  void execute(SoccerPlayer entity) {
    // TODO: implement execute
  }

  @override
  void exit(SoccerPlayer entity) {
    // no-ops
  }

  @override
  bool onMessage(SoccerPlayer entity, Telegram telegram) {
    // log.i('OnMessage ${telegram.message}');
    switch (telegram.message) {
      case Messages.receiveBall:
        entity.stateMachine.changeState(ReceiveBallState());
        return true;
      case Messages.goHome:
        entity.stateMachine.changeState(ReturnToHomeState());
        return true;
      case Messages.placeToKickOff:
        entity.stateMachine.changeState(PlaceToKickOffState());
        break;
      default:
        break;
    }
    return false;
  }
}
