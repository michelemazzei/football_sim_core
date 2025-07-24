import 'package:football_sim_core/ai/entity/soccer_referee.dart';
import 'package:football_sim_core/ai/fsm/state.dart';
import 'package:football_sim_core/ai/fsm/team/prepare_for_kick_off_state.dart';

class KickOffMatchState extends State<SoccerReferee> {
  // final log = logFactory('KickOffMatch');
  final bool homeHasBall;
  bool allPlayersInPosition = false;

  KickOffMatchState(this.homeHasBall);
  @override
  void enter(SoccerReferee entity) {
    // log.i('Enter');
    entity.home.stateMachine.changeState(PrepareForKickOffState(homeHasBall));
    entity.away.stateMachine.changeState(PrepareForKickOffState(homeHasBall));
  }

  @override
  void execute(SoccerReferee entity) {}

  @override
  void exit(SoccerReferee entity) {
    // log.i('Exit');
  }
}
