import 'package:football_sim_core/ai/entity/soccer_player.dart';
import 'package:football_sim_core/ai/fsm/player/wait_state.dart';
import 'package:football_sim_core/ai/fsm/state.dart';

class ReturnToHomeState extends State<SoccerPlayer> {
  // final log = logFactory('ReturnToHome');
  @override
  void enter(SoccerPlayer entity) {
    // log.i('Enter with ${entity.nameAndSurname}');
    var isInside = entity.region!.insideHalf(entity.currentPosition);
    if (!isInside) {
      entity.behaviors.arrive(entity.homePosition);
      // log.i('Arrive to Home ${entity.nameAndSurname}');
    }
  }

  @override
  void execute(SoccerPlayer entity) {
    var isInside = entity.region!.insideHalf(entity.currentPosition);
    if (isInside) {
      entity.stateMachine.changeState(WaitState());
    }
  }

  @override
  void exit(SoccerPlayer entity) {
    // log.i('Exit with ${entity.nameAndSurname}');
  }
}
