import 'package:football_sim_core/ai/fsm/components/fsm_component.dart';
import 'package:football_sim_core/ai/fsm/match_fsm.dart';
import 'package:football_sim_core/ecs/components/game_reference_component.dart';
import 'package:football_sim_core/ecs/components/match_component.dart';
import 'package:football_sim_core/ecs/components/message_sender_component.dart';
import 'package:football_sim_core/ecs/components/referee_component.dart';
import 'package:football_sim_core/ecs/components/team_possession_component.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/game/football_game.dart';
import 'package:football_sim_core/match/ecs_match.dart';

class RefereeEntity extends EcsEntity {
  RefereeEntity(super.id, FootballGame game, EcsMatch match) {
    // Componenti ECS
    addComponent(MatchComponent(match));
    addComponent(GameReferenceComponent(game));
    addComponent(TeamPossessionComponent(null)); // Nessun possesso iniziale

    // Componenti arbitrali aggiuntivi
    addComponent(GameClockComponent());
    // Gestione tempo simulato
    addComponent(ScoreComponent()); // Punteggio

    addComponent(MessageSenderComponent(sender: this, world: game.ecsWorld));

    // FSM del match (ora gestita dal "arbitro")
    addComponent(FsmComponent<RefereeEntity>(MatchFSM(this)));
  }
}
