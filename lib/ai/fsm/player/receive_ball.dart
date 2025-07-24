import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ai/entity/soccer_player.dart';
import 'package:football_sim_core/ai/fsm/player/wait_state.dart';
import 'package:football_sim_core/ai/fsm/state.dart';
import 'package:football_sim_core/ai/fsm/team/attacking_state.dart';
import 'package:football_sim_core/ai/fsm/team/defending_state.dart';

class ReceiveBallState extends State<SoccerPlayer> {
  @override
  void enter(SoccerPlayer entity) {
    //let the team know this player is receiving the ball
    entity.team.receivingPlayer = entity;
    //this player is also now the controlling player
    entity.team.controllingPlayer = entity;
    if (entity.team.isOpponentWithinRadius(
      entity.currentPosition,
      SoccerParameters.playerPanicDistance,
    )) {
      entity.behaviors.arrive(entity.game.soccerBall.currentPosition);
    }
  }

  @override
  void execute(SoccerPlayer entity) {
    if (!entity.isNear(entity.game.soccerBall.currentPosition)) {
      entity.behaviors.arrive(entity.game.soccerBall.currentPosition);
    } else {
      entity.game.soccerBall.owner = entity;
      entity.stateMachine.changeState(WaitState());
      entity.team.stateMachine.changeState(AttackingState());
      entity.team.opponentTeam.stateMachine.changeState(DefendingState());
    }
  }

  @override
  void exit(SoccerPlayer entity) {}
}
