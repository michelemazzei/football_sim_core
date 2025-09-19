import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/components/spalti_component.dart';
import 'package:football_sim_core/ecs/components/fsm_component.dart';
import 'package:football_sim_core/ecs/components/render_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/game/ecs_entity_registry.dart';
import 'package:football_sim_core/model/formation.dart';
import 'package:football_sim_core/utils/coordinate_mapper.dart';
import 'package:football_sim_core/utils/player_utils.dart';
import 'package:logging/logging.dart';

import '../components/ball_component.dart';
import '../components/field_component.dart';

class FootballGame extends FlameGame {
  final logger = Logger('FootballGame');
  CoordinateMapper? mapper;

  late FieldComponent fieldComponent;
  late BallComponent ballComponent;
  SpaltiComponent? spaltiComponent;

  final Vector2 padding = Vector2(40, 40);
  EcsWorld get ecsWorld => registry.ecsWorld;

  final EcsEntityRegistry registry = EcsEntityRegistry.instance();

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
    mapper?.update(fieldComponent.position, fieldComponent.size);
  }

  bool _hasLoaded = false;
  @override
  Future<void> onLoad() async {
    if (_hasLoaded) return;
    _hasLoaded = true;

    // Componenti grafici di gioco
    // 🟩 Campo
    fieldComponent = FieldComponent();
    await add(fieldComponent);
    mapper = CoordinateMapper(fieldComponent.position, fieldComponent.size);

    // 🏟️ Spalti
    spaltiComponent = SpaltiComponent.make(size: size, type: StadiumType.medium)
      ..position = padding;
    await add(spaltiComponent!);

    // Registra  ECS Sybsystem
    //3 - Crea i Componenti ECS
    //.1 - ⚽ Crea la palla
    //.2 - ⚽ Crea e registra il componente ECS della palla
    final ballEntity = registry.getBallEntity();
    //.3 - ⚽ Crea e registra il componente grafico della palla
    ballComponent = BallComponent();
    ballEntity.addOrReplaceComponent(
      RenderComponent(entityId: ballEntity.id, component: ballComponent),
    );
    //.4 - ⚽ aggiungi il componente grafico della palla a Flame
    await add(ballComponent);

    // 🔵 Squadre
    final teamRed = registry.teamRed;
    final teamBlue = registry.teamBlue;
    // 🔵 Giocatori
    await createTeamFromFormation(
      formation: formation442,
      isLeftSide: true,
      team: teamRed,
      game: this,
      ecsWorld: ecsWorld,
    );
    await createTeamFromFormation(
      formation: formation442,
      isLeftSide: false,
      team: teamBlue,
      game: this,
      ecsWorld: ecsWorld,
    );

    // 2. Crea l'entità
    registry.getRefereeEntity(this);

    // 3. Registra nel mondo
    registry.getStatsEntity(this);

    //4. inizializza il clock di gioco
    registry.getClock(duration: 90.0, speedFactor: 1.0);
    //2 - Registra sistemi
    registry.addSystems(this);
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
      logger.fine('Stato corrente: $currentState');
    }
  }
}
