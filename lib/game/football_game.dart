import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/components/player_component.dart';
import 'package:football_sim_core/components/spalti_component.dart';
import 'package:football_sim_core/ecs/entities/entity_manager.dart';
import 'package:football_sim_core/ecs/entities/team_id.dart';
import 'package:football_sim_core/model/formation.dart';
import 'package:football_sim_core/model/game_state.dart';
import 'package:football_sim_core/model/team.dart';

import '../components/ball_component.dart';
import '../components/field_component.dart';

class FootballGame extends FlameGame {
  late GameState gameState;
  late EntityManager entityManager;
  late FieldComponent fieldComponent;
  late BallComponent ballComponent;
  SpaltiComponent? spaltiComponent;

  final Vector2 padding = Vector2(40, 40);

  @override
  Color backgroundColor() => Colors.lightGreen.shade800;

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    if (spaltiComponent != null) {
      spaltiComponent!
        ..position = padding
        ..size = size;
    }
  }

  @override
  Future<void> onLoad() async {
    gameState = GameState();
    entityManager = EntityManager(gameState);

    // 🟩 Campo
    fieldComponent = FieldComponent();
    await add(fieldComponent);

    // 🏟️ Spalti
    spaltiComponent = SpaltiComponent.make(size: size, type: StadiumType.medium)
      ..position = padding;
    await add(spaltiComponent!);

    // ⚽ Palla
    final ballEntity = entityManager.createBall(
      position: Vector2(0.5, 0.5),
      onOutOfBounds: () {
        print('⚽ Palla fuori!');
      },
    );

    ballComponent = BallComponent(
      entity: ballEntity,
      game: this,
      maxSpeed: 800,
    );
    await add(ballComponent);

    // 🔵 Squadre
    final teamRed = _createTeam(
      id: TeamId.red,
      color: TeamId.red.color,
      formation: formation442,
      isLeftSide: true,
    );

    final teamBlue = _createTeam(
      id: TeamId.blue,
      color: TeamId.blue.color,
      formation: formation442,
      isLeftSide: false,
    );
  }

  Team _createTeam({
    required TeamId id,
    required Color color,
    required Formation formation,
    required bool isLeftSide,
  }) {
    final team = Team(id: id, color: color);
    _createPlayers(
      formation: formation,
      color: color,
      isLeftSide: isLeftSide,
      game: this,
      team: team,
    );
    gameState.teams[id] = team;
    return team;
  }

  void _createPlayers({
    required Formation formation,
    required bool isLeftSide,
    required Color color,
    required FootballGame game,
    required Team team,
  }) {
    for (int i = 0; i < 11; i++) {
      final position = formation.getPosition(i, isLeftSide);
      final role = formation.getRole(i);

      final playerEntity = entityManager.createPlayer(
        number: i + 1,
        color: color,
        game: game,
        role: role,
        team: team.id,
        position: position,
      );

      final playerComponent = PlayerComponent(
        color: color,
        entity: playerEntity,
        game: game,
      );

      add(playerComponent);
    }
  }
}
