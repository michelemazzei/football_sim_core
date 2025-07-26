import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ai/entity/soccer_player.dart';
import 'package:football_sim_core/ai/fsm/ball/change_owner.dart';
import 'package:football_sim_core/ai/fsm/player/wait_state.dart';
import 'package:football_sim_core/ai/fsm/state.dart';
import 'package:football_sim_core/ai/msg/messages.dart';

class PlaceToKickOffState extends State<SoccerPlayer> {
  // final log = logFactory('⚽ Place To KickOff');
  @override
  void enter(SoccerPlayer entity) {
    // log.i('Enter with ${entity.nameAndSurname}');
    entity.behaviors.arrive(entity.soccerPitch.playground!.centerSpot);
  }

  @override
  void execute(SoccerPlayer entity) {
    if (entity.isNear(entity.soccerPitch.playground!.centerSpot)) {
      entity.game.soccerBall.stateMachine.changeState(ChangeOwnerState(entity));
      var neighbors = entity.behaviors.neighbors();
      var target = neighbors.first;
      entity.team.game.soccerBall.kick(
        (target.currentPosition - entity.currentPosition),
        SoccerParameters.lowForce,
      );

      dispatcher.dispatchMessage(
        sender: entity,
        receiver: entity.team.opponentTeam,
        message: Defending(),
      );
      dispatcher.dispatchMessage(
        sender: entity,
        receiver: entity.team,
        message: Attacking(),
      );

      dispatcher.dispatchMessage(
        sender: entity,
        receiver: target,
        message: ReceiveBall(),
      );
      entity.stateMachine.changeState(WaitState());
    }
  }

  @override
  void exit(SoccerPlayer entity) {
    // log.i('Exit with ${entity.nameAndSurname}');
  }
}
