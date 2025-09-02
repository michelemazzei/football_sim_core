import 'package:football_sim_core/ai/fsm/fsm.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:football_sim_core/match/kick_off_state.dart';

import 'global_match_state.dart';

class RefereeFSM extends Fsm<RefereeEntity> {
  RefereeFSM(super.owner) {
    changeState(KickoffState());
    fsm.globalState = GlobalMatchState();
  }
}
