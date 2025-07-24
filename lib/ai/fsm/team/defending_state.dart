import 'package:football_sim_core/ai/entity/soccer_team.dart';
import 'package:football_sim_core/ai/fsm/state.dart';
import 'package:football_sim_core/ai/fsm/team/attacking_state.dart';

class DefendingState extends State<SoccerTeam> {
  @override
  void enter(SoccerTeam entity) {
    // log.i('Enter DEFENDING');
  }

  @override
  void execute(SoccerTeam entity) {
    if (entity.inControl()) {
      entity.stateMachine.changeState(AttackingState());
    }
  }

  @override
  void exit(SoccerTeam entity) {}
}
