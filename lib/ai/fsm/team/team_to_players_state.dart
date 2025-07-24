import 'package:football_sim_core/ai/entity/soccer_player.dart';
import 'package:football_sim_core/ai/entity/soccer_team.dart';
import 'package:football_sim_core/ai/fsm/state.dart';

class TeamToPlayersState extends State<SoccerTeam> {
  final State<SoccerPlayer> state;
  // var log = logFactory('Team');

  TeamToPlayersState(this.state);
  @override
  void enter(SoccerTeam entity) {
    for (var player in entity.players) {
      player.stateMachine.changeState(state);
    }
  }

  @override
  void execute(SoccerTeam entity) {
    // no code
  }

  @override
  void exit(SoccerTeam entity) {
    // no code
  }
}
