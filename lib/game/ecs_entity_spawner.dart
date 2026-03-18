import 'package:collection/collection.dart';
import 'package:flame/components.dart';
import 'package:football_sim_core/core/ecs/components/tactical_role_component.dart';
import 'package:football_sim_core/core/tactics/tactical_roles.dart';
import 'package:football_sim_core/ecs/components/team_side_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:football_sim_core/ecs/entities/team_entity.dart';
import 'package:football_sim_core/game/football_game.dart';
import 'package:football_sim_core/model/tactical_setup.dart';
import 'package:football_sim_core/model/team.dart';

class EcsEntitySpawner {
  final EcsWorld world;
  EcsEntitySpawner(this.world);

  // Restituisce la palla esistente o ne crea una nuova
  BallEntity spawnBall() {
    final existing = world.ball;
    if (existing != null) return existing;

    return BallEntity(world.genId(), world)..addToWorld(world);
  }

  // Restituisce il giocatore o lo crea con tutti i suoi componenti
  // Dentro ecs_entity_spawner.dart
  PlayerEntity spawnPlayer({
    required Team team,
    required int number,
    required Vector2 position,
    required FootballGame game,
    required TacticalRole role,
  }) {
    final existing = world.players.firstWhereOrNull(
      (p) => p.teamId == team.id && p.number == number,
    );
    if (existing != null) return existing;

    final player = PlayerEntity(
      world.genId(),
      world,
      initialPosition: position,
      team: team,
      game: game,
      number: number,
      color: team.color,
    );

    // AGGIUNGI IL COMPONENTE DEL RUOLO QUI!
    player.addOrReplaceComponent(TacticalRoleComponent(role: role));

    world.addEntity(player);
    return player;
  }

  // Dentro EcsEntitySpawner
  RefereeEntity spawnReferee(FootballGame game) {
    final existing = world.referee;
    if (existing != null) return existing;

    final referee = RefereeEntity(world.genId(), game);
    world.addEntity(referee);
    return referee;
  }

  // Dentro EcsEntitySpawner
  TeamEntity spawnTeam({
    required Team team,
    required bool isLeftSide,
    required TacticalSetup tacticalSetup,
  }) {
    // Cerchiamo se esiste già un TeamEntity con questo ID
    final existing = world.entitiesOf<TeamEntity>().firstWhereOrNull(
      (t) => t.teamId == team.id,
    );

    if (existing != null) return existing;

    final teamEntity = TeamEntity(
      world.genId(),
      team: team,
      tacticalSetup: tacticalSetup,
    );

    // Aggiungiamo i componenti specifici
    teamEntity.addOrReplaceComponent(TeamSideComponent(isLeftSide));

    world.addEntity(teamEntity);
    return teamEntity;
  }
}
