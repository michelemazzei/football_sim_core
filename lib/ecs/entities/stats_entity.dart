import 'package:football_sim_core/ecs/components/match_component.dart';
import 'package:football_sim_core/ecs/components/referee_component.dart';
import 'package:football_sim_core/ecs/components/stats_component.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/game/football_game.dart';
import 'package:football_sim_core/match/ecs_match.dart';

class StatsEntity extends EcsEntity {
  StatsEntity(super.id, FootballGame game, EcsMatch match) {
    // Componenti ECS
    addComponent(MatchComponent(match));
    addComponent(StatsComponent());
    // Gestione tempo simulato
    addComponent(ScoreComponent()); // Punteggio
  }
}
