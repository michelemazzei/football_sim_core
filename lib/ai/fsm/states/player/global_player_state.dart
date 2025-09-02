import 'package:football_sim_core/ai/fsm/states/player/player_base_state.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';

class GlobalPlayerState extends PlayerBaseState {
  @override
  void enter(PlayerEntity match) {}

  @override
  void execute(PlayerEntity entity, double dt) {}

  @override
  void exit(PlayerEntity match) {}
}
