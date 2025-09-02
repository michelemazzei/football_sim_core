import 'package:football_sim_core/ai/fsm/fsm.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:football_sim_core/match/global_match_state.dart';
import 'package:football_sim_core/match/kick_off_state.dart';

class MatchFSM extends Fsm<RefereeEntity> {
  MatchFSM(super.owner) {
    // Stato iniziale della partita
    changeState(KickoffState());

    // Stato globale (es. controllo palla, timer, ecc.)
    fsm.globalState = GlobalMatchState();
  }
}
