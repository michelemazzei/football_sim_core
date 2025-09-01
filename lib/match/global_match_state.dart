import 'package:football_sim_core/ai/fsm/core/game_state.dart';
import 'package:football_sim_core/match/ecs_match.dart';

class GlobalMatchState extends GameState<EcsMatch> {
  @override
  void enter(EcsMatch match) {}

  @override
  void execute(EcsMatch match, double dt) {
    match.elapsedTime += match.deltaTime;
  }

  @override
  void exit(EcsMatch match) {}
}
