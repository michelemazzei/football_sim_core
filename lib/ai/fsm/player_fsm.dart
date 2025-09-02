import 'package:football_sim_core/ai/fsm/fsm.dart';
import 'package:football_sim_core/ai/fsm/states/player/global_player_state.dart';
import 'package:football_sim_core/ai/fsm/states/player/idle_state.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';

class PlayerFsm extends Fsm<PlayerEntity> {
  PlayerFsm(super.player) {
    changeState(IdleState());
    fsm.globalState = GlobalPlayerState();
  }
}
