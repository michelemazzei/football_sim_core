import 'package:football_sim_core/ai/fsm/core/game_state.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';

class GlobalMatchState extends GameState<RefereeEntity> {
  @override
  void enter(RefereeEntity match) {}

  @override
  void execute(RefereeEntity entity, double dt) {}

  @override
  void exit(RefereeEntity match) {}
}
