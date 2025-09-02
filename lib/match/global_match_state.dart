import 'package:football_sim_core/ai/fsm/core/game_state.dart';
import 'package:football_sim_core/ecs/components/match_component.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';

class GlobalMatchState extends GameState<RefereeEntity> {
  @override
  void enter(RefereeEntity match) {}

  @override
  void execute(RefereeEntity entity, double dt) {
    final match = entity.getComponent<MatchComponent>()?.match;
    if (match != null) {
      match.updateElapsedTime(dt);
    }
  }

  @override
  void exit(RefereeEntity match) {}
}
