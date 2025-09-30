import 'package:football_sim_core/ai/fsm/components/fsm.dart';
import 'package:football_sim_core/ai/fsm/states/player/global_player_state.dart';
import 'package:football_sim_core/ai/fsm/states/player/player_idle_state.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';

class PlayerFsm extends Fsm<PlayerEntity> {
  PlayerFsm(super.player, super.world) {
    changeState(PlayerIdleState());
    fsm.globalState = GlobalPlayerState();
  }
}
