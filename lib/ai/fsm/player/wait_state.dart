import 'package:football_sim_core/ai/entity/soccer_player.dart';
import 'package:football_sim_core/ai/fsm/state.dart';

class WaitState extends State<SoccerPlayer> {
  @override
  void enter(SoccerPlayer entity) {
    if (entity.isMoving()) {}
    entity.trackBall();
  }

  @override
  void execute(SoccerPlayer entity) {}

  @override
  void exit(SoccerPlayer entity) {}

  @override
  String toString() => '⏳';
}
