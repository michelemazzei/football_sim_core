import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/components/spalti_component.dart';
import 'package:football_sim_core/ecs/commands/command_system.dart';
import 'package:football_sim_core/ecs/components/fsm_component.dart';
import 'package:football_sim_core/ecs/components/render_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:football_sim_core/ecs/entities/stats_entity.dart';
import 'package:football_sim_core/ecs/entities/team_id.dart';
import 'package:football_sim_core/ecs/systems/fsm_system.dart';
import 'package:football_sim_core/ecs/systems/movement_system.dart';
import 'package:football_sim_core/ecs/systems/player_fsm_system.dart';
import 'package:football_sim_core/ecs/systems/position_system.dart';
import 'package:football_sim_core/ecs/systems/possession_event_system.dart';
import 'package:football_sim_core/ecs/systems/possession_system.dart';
import 'package:football_sim_core/ecs/systems/resize_system.dart';
import 'package:football_sim_core/match/ecs_match.dart';
import 'package:football_sim_core/model/formation.dart';
import 'package:football_sim_core/model/team.dart';
import 'package:football_sim_core/utils/player_utils.dart';
import 'package:logging/logging.dart';

import '../components/ball_component.dart';
import '../components/field_component.dart';

class FootballGame extends FlameGame {
  final logger = Logger('FootballGame');
  late final EcsWorld ecsWorld;
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
    // Componenti grafici di gioco
    // 🟩 Campo
    fieldComponent = FieldComponent();
    await add(fieldComponent);

    // 🏟️ Spalti
    spaltiComponent = SpaltiComponent.make(size: size, type: StadiumType.medium)
      ..position = padding;
    await add(spaltiComponent!);

    // Registra  ECS Sybsystem
    //1 -   Crea il mondo ECS
    ecsWorld = EcsWorld();
    //2 - Registra sistemi
    ecsWorld.addSystem(FsmSystem());
    ecsWorld.addSystem(PositionSystem(this));
    ecsWorld.addSystem(PlayerFsmSystem());
    ecsWorld.addSystem(CommandSystem());
    ecsWorld.addSystem(PossessionSystem());
    ecsWorld.addSystem(MovementSystem());
    ecsWorld.addSystem(ResizeSystem(this));
    ecsWorld.addSystem(FsmSystem());
    ecsWorld.addSystem(PossessionEventSystem());
    //3 - Crea i Componenti ECS
    //.1 - ⚽ Crea la palla
    //.2 - ⚽ Crea e registra il componente ECS della palla
    final ballEntity = BallEntity(ecsWorld.genId());
    ecsWorld.addEntity(ballEntity);
    //.3 - ⚽ Crea e registra il componente grafico della palla
    ballComponent = BallComponent();
    ballEntity.addComponent(RenderComponent(ballComponent));
    //.4 - ⚽ aggiungi il componente grafico della palla a Flame
    await add(ballComponent);

    // 🔵 Squadre
    final teamRed = Team(id: TeamId.red, color: TeamId.red.color);
    final teamBlue = Team(id: TeamId.blue, color: TeamId.blue.color);

    // 1. Crea la partita
    final match = EcsMatch(teamA: teamRed, teamB: teamBlue);

    // 2. Crea l'entità
    final matchEntity = RefereeEntity(ecsWorld.genId(), this, match);

    // 3. Registra nel mondo
    ecsWorld.addEntity(matchEntity);
    ecsWorld.addEntity(StatsEntity(ecsWorld.genId(), this, match));

    createTeamFromFormation(
      formation: formation442,
      isLeftSide: true,
      team: teamRed,
      game: this,
      ecsWorld: ecsWorld,
    );
    createTeamFromFormation(
      formation: formation442,
      isLeftSide: false,
      team: teamBlue,
      game: this,
      ecsWorld: ecsWorld,
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    ecsWorld.update(dt);

    final matchEntity = ecsWorld
        .entitiesWith<FsmComponent<Match>>()
        .firstOrNull;
    final currentState = matchEntity
        ?.getComponent<FsmComponent<Match>>()
        ?.currentState
        ?.runtimeType;
    if (currentState != null) {
      logger.info('Stato corrente: $currentState');
    }
  }
}
