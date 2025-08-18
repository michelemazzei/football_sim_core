import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/ai/fsm/components/fsm_component.dart';
import 'package:football_sim_core/components/spalti_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/components/match_component.dart';
import 'package:football_sim_core/ecs/components/render_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/ecs/entities/team_id.dart';
import 'package:football_sim_core/ecs/commands/command_system.dart';
import 'package:football_sim_core/ecs/systems/ball_system.dart';
import 'package:football_sim_core/ecs/systems/fsm_system.dart';
import 'package:football_sim_core/ecs/systems/movement_system.dart';
import 'package:football_sim_core/ecs/systems/position_system.dart';
import 'package:football_sim_core/match/ecs_match.dart';
import 'package:football_sim_core/model/team.dart';

import '../components/ball_component.dart';
import '../components/field_component.dart';

class FootballGame extends FlameGame {
  late final EcsWorld ecsWorld;
  late final PositionSystem positionSystem;
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
    // 🟩 Campo
    fieldComponent = FieldComponent();
    await add(fieldComponent);

    // 🏟️ Spalti
    spaltiComponent = SpaltiComponent.make(size: size, type: StadiumType.medium)
      ..position = padding;
    await add(spaltiComponent!);

    // ECS Sybsystem
    ecsWorld = EcsWorld();
    // 1) costruisci e registra PositionSystem
    positionSystem = PositionSystem(this);
    final ballSystem = BallSystem(this, positionSystem);
    // 1) Registra sistemi
    ecsWorld.addSystem(FsmSystem(ecsWorld));
    ecsWorld.addSystem(CommandSystem(ecsWorld));
    ecsWorld.addSystem(MovementSystem(ecsWorld));
    ecsWorld.addSystem(positionSystem);
    // ⚽ Palla
    // 2) Crea la palla
    final ballEntity = BallEntity(ecsWorld.genId(), Vector2.zero());

    ecsWorld.addEntity(ballEntity);

    ballComponent = BallComponent(
      entity: ballEntity,
      game: this,
      maxSpeed: 800,
    );
    ballEntity.addComponent(RenderComponent(ballComponent));

    await add(ballComponent);

    // 🔵 Squadre
    final teamRed = _createTeam(id: TeamId.red, color: TeamId.red.color);

    final teamBlue = _createTeam(id: TeamId.blue, color: TeamId.blue.color);

    // 1. Crea la partita
    final match = EcsMatch(teamA: teamRed, teamB: teamBlue);

    // 2. Crea l'entità
    final matchEntity = EcsEntity(ecsWorld.genId())
      ..addComponent(MatchComponent(match))
      ..addComponent(FsmComponent<EcsMatch>(match.fsm));

    // 3. Registra nel mondo
    ecsWorld.addEntity(matchEntity);
    ecsWorld.addSystem(FsmSystem(ecsWorld));
  }

  Team _createTeam({required TeamId id, required Color color}) {
    final team = Team(id: id, color: color);

    return team;
  }

  @override
  void update(double dt) {
    super.update(dt);
    ecsWorld.update(dt);

    final ballEnt = ecsWorld.entitiesWith<EcsBallComponent>().firstOrNull;
    if (ballEnt != null) {
      ballEnt.getComponent<EcsBallComponent>()!.onPostUpdate(ballEnt, this, dt);
    }

    final matchEntity = ecsWorld
        .entitiesWith<FsmComponent<Match>>()
        .firstOrNull;
    final currentState = matchEntity
        ?.getComponent<FsmComponent<Match>>()
        ?.currentState
        ?.runtimeType;
    if (currentState != null) {
      print('Stato corrente: $currentState');
    }
  }
}
