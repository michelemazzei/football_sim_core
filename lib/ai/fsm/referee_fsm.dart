import 'package:football_sim_core/ai/fsm/fsm.dart';
import 'package:football_sim_core/ai/fsm/states/referee/initializing_state.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';

import 'states/referee/global_referee_state.dart';

class RefereeFsm extends Fsm<RefereeEntity> {
  RefereeFsm(super.owner) {
    changeState(InitializingState());
    fsm.globalState = GlobalRefereeState();
  }
}
