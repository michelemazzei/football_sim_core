import 'package:football_sim_core/ai/fsm/components/fsm_component.dart';
import 'package:football_sim_core/ai/fsm/match_fsm.dart';
import 'package:football_sim_core/ecs/components/game_reference_component.dart';
import 'package:football_sim_core/ecs/components/match_component.dart';
import 'package:football_sim_core/ecs/components/match_state_component.dart';
import 'package:football_sim_core/ecs/components/team_possession_component.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/game/football_game.dart';
import 'package:football_sim_core/match/ecs_match.dart';
import 'package:football_sim_core/match/kick_off_state.dart';

class MatchEntity extends EcsEntity {
  MatchEntity(super.id, FootballGame game, EcsMatch match) {
    // Componenti ECS
    // Aggiungi il componente ECS che lo incapsula
    addComponent(MatchComponent(match));
    addComponent(GameReferenceComponent(game));
    addComponent(MatchStateComponent(MatchPhase.kickoff));
    addComponent(TeamPossessionComponent(null)); // Nessun possesso iniziale

    // FSM del match
    final matchFsm = MatchFSM(this);
    matchFsm.changeState(KickoffState()); // Stato iniziale

    addComponent(FsmComponent<MatchEntity>(matchFsm));
  }
}
