import 'package:football_sim_core/ai/fsm/fsm.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:football_sim_core/ai/fsm/states/referee/kick_off_state.dart';

import 'states/referee/global_referee_state.dart';

class RefereeFsm extends Fsm<RefereeEntity> {
  RefereeFsm(super.owner) {
    changeState(KickoffState());
    fsm.globalState = GlobalRefereeState();
  }
}
