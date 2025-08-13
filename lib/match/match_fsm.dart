import 'package:football_sim_core/ai/fsm/fsm.dart';
import 'package:football_sim_core/match/kick_off_state.dart';
import 'package:football_sim_core/match/ecs_match.dart';
import 'global_match_state.dart';

class MatchFSM extends Fsm<EcsMatch> {
  MatchFSM(super.owner) {
    changeState(KickoffState());
    fsm.globalState = GlobalMatchState();
  }
}
