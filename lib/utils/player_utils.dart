import 'package:football_sim_core/ai/fsm/player_fsm.dart';
import 'package:football_sim_core/components/player_component.dart';
import 'package:football_sim_core/ecs/components/player_fsm_component.dart';
import 'package:football_sim_core/ecs/components/render_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/game/football_game.dart';
import 'package:football_sim_core/model/formation.dart';
import 'package:football_sim_core/model/team.dart';

Future<void> createTeamFromFormation({
  required Formation formation,
  required bool isLeftSide,
  required Team team,
  required FootballGame game,
  required EcsWorld ecsWorld,
}) async {
  for (int i = 0; i < 11; i++) {
    final id = ecsWorld.genId();

    // Posizione normalizzata dalla formazione
    final position = formation.getPosition(i, isLeftSide);
    final role = formation.getRole(i);

    // 1. Crea entità ECS
    final playerEntity = PlayerEntity.createPlayer(
      id,
      initialPosition: position,
      team: team.id,
      game: game,
      number: i + 1,
      color: team.color,
      role: role,
    );

    ecsWorld.addEntity(playerEntity);

    // 2. Crea componente grafico
    final playerComponent = PlayerComponent('P${i + 1}', i + 1, team.color);
    // 3. Collega ECS → Flame
    playerEntity.addComponent(RenderComponent(playerComponent));

    playerEntity.addComponent(PlayerFsmComponent(PlayerFsm(playerComponent)));
    await game.add(playerComponent);
  }
}
