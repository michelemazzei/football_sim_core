import 'package:football_sim_core/ai/fsm/core/game_state.dart';
import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/match/ecs_match.dart';
import 'play_state.dart';

class KickoffState extends GameState<EcsMatch> {
  double _startTime = 0;

  @override
  void enter(EcsMatch match) {
    _startTime = match.elapsedTime;
    print('Kickoff!');
  }

  @override
  void execute(EcsMatch match) {
    if (match.elapsedTime - _startTime > 3.0) {
      match.fsm.changeState(PlayState());
    }
  }

  @override
  void exit(EcsMatch match) {
    print('Fine Kickoff');
  }

  @override
  bool onMessage(EcsMatch entity, Telegram telegram) => false;
}
