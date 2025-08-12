import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/components/spalti_component.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/entity_manager.dart';
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
  PositionComponent? wrapper;
  final wrapping = Vector2(40, 40);

  @override
  Color backgroundColor() => Colors.grey.shade900;

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    if (wrapper != null) {
      remove(wrapper!);
      wrapper = null;
      wrapper = PositionComponent()..position = wrapping;
      wrapper!.add(SpaltiComponent.make(size: size, type: StadiumType.medium));
      wrapper!.priority = -1;
      add(wrapper!);
    }
  }

  @override
  Future<void> onLoad() async {
    gameState = GameState();
    entityManager = EntityManager(gameState);

    // Campo
    fieldComponent = FieldComponent();
    await add(fieldComponent);

    // Spalti
    wrapper = PositionComponent()..position = wrapping;
    wrapper!.add(SpaltiComponent.make(size: size, type: StadiumType.medium));
    await add(wrapper!);

    // 🟠 Palla
    final ballEntity = entityManager.createBall(
      id: 0,
      position: Vector2(0.5, 0.5),
      size: Vector2.all(0.05),
      onOutOfBounds: () {
        print('⚽ Palla fuori!');
      },
    );

    ballComponent = BallComponent(
      entity: ballEntity as BallEntity,
      game: this,
      maxSpeed: 800,
    );
    await add(ballComponent);

    // 🔵 Squadre
    final teamA = Team(id: 'A', color: Colors.blue);
    final teamB = Team(id: 'B', color: Colors.red);

    teamA.initializePlayers(formation442, true);
    teamB.initializePlayers(formation442, false);
  }
}
