import 'package:football_sim_core/ai/entity/soccer_player.dart';
import 'package:football_sim_core/ai/fsm/state.dart';
import 'package:football_sim_core/ai/pitch/sweet_spot/pitch_spot.dart';

class PlayerAttackState extends State<SoccerPlayer> {
  final List<PitchSpot> spots;

  PlayerAttackState(this.spots);
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
    // TODO: implement exit
  }
}
