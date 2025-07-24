import 'package:football_sim_core/ai/entity/soccer_team.dart';
import 'package:football_sim_core/ai/fsm/player/strategy/compactness_strategy.dart';
import 'package:football_sim_core/ai/fsm/state.dart';
import 'package:football_sim_core/ai/fsm/team/attacking_state.dart';
import 'package:football_sim_core/ai/fsm/team/defending_state.dart';
import 'package:football_sim_core/ai/fsm/team/team_to_players_state.dart';
import 'package:football_sim_core/ai/msg/messages.dart';
import 'package:football_sim_core/ai/msg/telegram.dart';

class PrepareForKickOffState extends State<SoccerTeam> {
  // final log = logFactory('⚽KickOff');
  final bool homeHasBall;

  PrepareForKickOffState(this.homeHasBall);
  @override
  void enter(SoccerTeam entity) {
    // log.i('Enter ${entity.name} and home has ball $homeHasBall');
    entity.controllingPlayer = null;
    entity.supportingPlayer = null;
    entity.receivingPlayer = null;
    entity.playerClosestToBall = null;
    entity.returnAllFieldPlayersToHome(
      (entity.isHome && homeHasBall) || (entity.isAway && !homeHasBall),
    );
  }

  @override
  bool onMessage(SoccerTeam entity, Telegram telegram) {
    entity.stateMachine.changeState(TeamToPlayersState(CompactnessStrategy()));
    switch (telegram.message) {
      case Attacking():
        entity.stateMachine.changeState(AttackingState());
        break;
      case Defending():
        entity.stateMachine.changeState(DefendingState());
        break;
      default:
        break;
    }
    return true;
  }

  @override
  void execute(SoccerTeam entity) {}

  @override
  void exit(SoccerTeam entity) {
    // log.i('Exit ${entity.name}');
  }

  @override
  String toString() => '⚽KickOff[homeHasBall= $homeHasBall]';
}
