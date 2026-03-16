import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/ai/config/field_geometry.dart';
import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/components/spalti_component.dart';
import 'package:football_sim_core/core/bootstrap/tactical_bootstrap.dart';
import 'package:football_sim_core/core/field/field_grid.dart';
import 'package:football_sim_core/core/field/zone.dart';
import 'package:football_sim_core/ecs/components/render_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/game/ecs_entity_registry.dart';
import 'package:football_sim_core/game/setup/setup_registry.dart';
import 'package:football_sim_core/model/tactical_setup.dart';
import 'package:football_sim_core/model/team.dart';
import 'package:football_sim_core/utils/coordinate_mapper.dart';
import 'package:football_sim_core/game/creation_team_from_formation.dart';
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

  // Accesso rapido al mondo ECS
  EcsWorld get ecsWorld => registry.ecsWorld;
  final EcsEntityRegistry registry = EcsEntityRegistry.instance();

  @override
  Color backgroundColor() => Colors.lightGreen.shade800;

  bool _hasLoaded = false;

  @override
  Future<void> onLoad() async {
    if (_hasLoaded) return;
    _hasLoaded = true;

    // 1. Setup Infrastruttura Grafica
    fieldComponent = FieldComponent();
    await add(fieldComponent);

    // Il mapper serve all'ECS per sapere dove disegnare
    mapper = CoordinateMapper(fieldComponent.position, fieldComponent.size);
    ecsWorld.addResource<CoordinateMapper>(mapper!);

    spaltiComponent = SpaltiComponent.make(size: size, type: StadiumType.medium)
      ..position = padding;
    await add(spaltiComponent!);

    // 2. Setup Logica ECS (Sistemi e Risorse base)
    TacticalBootstrap.registerAllTacticalBricks();
    setupPlayerMessageRegistry(ecsWorld);

    registry.addSystems(this);
    registry.getOrAddClock(duration: 90.0, speedFactor: 1.0);
    ecsWorld.addResource<FieldGrid>(FieldGrid());

    // 3. Creazione Entità (Idempotente tramite Registry)

    // ⚽ Palla
    final ballEntity = registry.getOrAddBallEntity();
    ballComponent = BallComponent();
    ballEntity.addOrReplaceComponent(
      RenderComponent(entityId: ballEntity.id, component: ballComponent),
    );
    if (!ballComponent.isMounted) await add(ballComponent);

    // 🔵 Squadre e Giocatori
    // Usiamo il metodo che interroga il world per non duplicare i giocatori
    await _initializeTeams();

    // 🏁 Arbitro
    registry.getOrAddRefereeEntity(this);

    // 4. Debug: Visualizzazione Griglia (Solo se serve)
    _renderDebugGrid();
  }

  Future<void> _initializeTeams() async {
    final teams = [
      {'data': registry.teamRed, 'side': true},
      {'data': registry.teamBlue, 'side': false},
    ];

    for (var t in teams) {
      await createTeamFromFormation(
        tacticalSetup: tacticalSetup442(),
        isLeftSide: t['side'] as bool,
        team: t['data'] as Team,
      );
    }
  }

  void _renderDebugGrid() {
    final grid = FieldGrid();
    final fieldSize = mapper!.fieldSize;

    for (int x = 0; x < SoccerParameters.numOfSpotsX; x++) {
      for (int y = 0; y < SoccerParameters.numOfSpotsY; y++) {
        final zone = Zone(x: x.toDouble(), y: y.toDouble());
        final center = mapper!.toScreen(grid.centerOfZone(zone));
        final rect = grid.rectOfZone(zone);

        add(
          RectangleComponent(
            position: mapper!.toScreen(Vector2(rect.left, rect.top)),
            size: Vector2(rect.width * fieldSize.x, rect.height * fieldSize.y),
            paint: Paint()
              ..color = Colors.black26
              ..style = PaintingStyle.stroke,
          ),
        );

        add(
          TextComponent(
            text: '(${zone.x.toInt()},${zone.y.toInt()})',
            position: center,
            anchor: Anchor.center,
            textRenderer: TextPaint(
              style: const TextStyle(fontSize: 10, color: Colors.black54),
            ),
          ),
        );
      }
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    // L'ECS World avanza seguendo il dt di Flame
    ecsWorld.update(dt);
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    spaltiComponent?.size = size;
    mapper?.update(fieldComponent.position, fieldComponent.size);
  }
}
