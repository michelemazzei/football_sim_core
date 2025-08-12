import 'dart:ui';

import 'package:flame/components.dart';
import 'package:football_sim_core/ecs/components/ball_logic_component.dart';
import 'package:football_sim_core/ecs/components/role_component.dart';
import 'package:football_sim_core/ecs/components/team_component.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/entity.dart';
import 'package:football_sim_core/ecs/entities/game_state_registrable.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/ecs/entities/team_id.dart';
import 'package:football_sim_core/game/football_game.dart';
import 'package:football_sim_core/model/game_state.dart';
import 'package:football_sim_core/model/player_role.dart';
import 'package:football_sim_core/model/team.dart';

class EntityManager {
  final GameState gameState;

  int _nextEntityId = 0;
  int get nextEntityId => _nextEntityId;
  int generateEntityId() => _nextEntityId++;

  EntityManager(this.gameState);

  final Map<int, Entity> entities = {};

  void register(Entity entity) {
    entities[entity.id] = entity;

    for (final component in entity.components) {
      if (component is GameStateRegistrable) {
        component.registerIn(gameState, entity);
      }
    }
  }

  T? getComponent<T extends Component>(Entity entity) =>
      entity.getComponent<T>();

  Iterable<PlayerEntity> get allPlayers =>
      entities.values.whereType<PlayerEntity>();
  BallEntity? get ball => entities.values.whereType<BallEntity>().firstOrNull;
  Team? getTeam(TeamId teamId) => gameState.teams[teamId];
  Iterable<PlayerEntity> getPlayersByTeam(TeamId teamId) => allPlayers.where(
    (p) => p.getComponent<TeamComponent>()?.team.id == teamId,
  );

  Iterable<PlayerEntity> getPlayersByRole(PlayerRole role) =>
      allPlayers.where((p) => p.getComponent<RoleComponent>()?.role == role);

  PlayerEntity createPlayer({
    required int number,
    required Color color,
    required FootballGame game,
    required PlayerRole role,
    required TeamId team,
    required Vector2 position,
  }) {
    final id = generateEntityId();
    final newEntity = PlayerEntity(
      id,
      number: number,
      color: color,
      game: game,
      role: role,
      team: team,
      initialPosition: position,
    );
    register(newEntity);
    return newEntity;
  }

  // Esempio: crea palla
  BallEntity createBall({
    required Vector2 position,
    required Vector2 size,
    required VoidCallback onOutOfBounds,
  }) {
    final ballEntity = BallEntity(generateEntityId(), position);
    gameState.ballLogicMap[ballEntity] = BallLogicComponent(
      onOutOfBounds: onOutOfBounds,
    );
    register(ballEntity);
    return ballEntity;
  }

  void debugPrintEntities() {
    for (final entity in entities.values) {
      print('Entity ${entity.id}: ${entity.runtimeType}');
    }
  }
}
