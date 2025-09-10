import 'package:football_sim_core/components/player_component.dart';
import 'package:football_sim_core/ecs/components/render_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/game/football_game.dart';
import 'package:football_sim_core/model/formation.dart';
import 'package:football_sim_core/model/team.dart';

extension CreateTeamFromFormation on FootballGame {
  Future<void> createTeamFromFormation({
    required Formation formation,
    required bool isLeftSide,
    required Team team,
    required FootballGame game,
    required EcsWorld ecsWorld,
  }) async {
    for (int i = 0; i < 11; i++) {
      // Posizione normalizzata dalla formazione
      final position = formation.getPosition(i, isLeftSide);
      final role = formation.getRole(i);
      logger.fine('Creating player $i at position $position with role $role');
      // 1. Crea entità ECS

      final playerEntity = registry.getPlayerEntity(
        position,
        team,
        game,
        i + 1,
        role,
      );

      logger.fine('Player entity created: ${playerEntity.id}');

      // 2. Crea componente grafico
      final playerComponent = PlayerComponent('P${i + 1}', i + 1, team.color);
      // 3. Collega ECS → Flame
      playerEntity.addOrReplaceComponent(
        RenderComponent(entityId: playerEntity.id, component: playerComponent),
      );

      await game.add(playerComponent);
    }
  }
}
