import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/core/ecs/systems/game_phase_system.dart';
import 'package:football_sim_core/core/ecs/systems/player_brain_system.dart';
import 'package:football_sim_core/core/ecs/systems/zone_tactic_activator_system.dart';
import 'package:football_sim_core/core/field/field_grid.dart';
import 'package:football_sim_core/core/tactics/tactical_roles.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:football_sim_core/ecs/entities/team_entity.dart';
import 'package:football_sim_core/ecs/systems/ball_fsm_system.dart';
import 'package:football_sim_core/ecs/systems/ball_interact_system.dart';
import 'package:football_sim_core/ecs/systems/ball_proximity_system.dart';
import 'package:football_sim_core/ecs/systems/ball_reception_system.dart';
import 'package:football_sim_core/ecs/systems/match_start_system.dart';
import 'package:football_sim_core/ecs/systems/movement_system.dart';
import 'package:football_sim_core/ecs/systems/player_action_handler_system.dart';
import 'package:football_sim_core/ecs/systems/player_fsm_system.dart';
import 'package:football_sim_core/ecs/systems/possession_event_system.dart';
import 'package:football_sim_core/ecs/systems/referee_fsm_system.dart';
import 'package:football_sim_core/ecs/systems/resize_system.dart';
import 'package:football_sim_core/game/ecs_entity_spawner.dart';
import 'package:football_sim_core/game/football_game.dart';
import 'package:football_sim_core/model/tactical_setup.dart';
import 'package:football_sim_core/model/team.dart';
import 'package:football_sim_core/model/team_id.dart';

class EcsEntityRegistry {
  static final EcsEntityRegistry _instance = EcsEntityRegistry._();
  factory EcsEntityRegistry.instance() => _instance;

  late EcsWorld ecsWorld;
  late EcsEntitySpawner spawner; // <--- Lo Spawner vive qui

  late final Team teamRed;
  late final Team teamBlue;
  bool _systemsAdded = false;

  EcsEntityRegistry._() {
    reset();
  }

  void reset() {
    ecsWorld = EcsWorld();
    spawner = EcsEntitySpawner(ecsWorld); // Inizializzato con il nuovo mondo
    _systemsAdded = false;

    // Aggiungiamo subito le risorse base
    ecsWorld.addResource<FieldGrid>(FieldGrid());

    // Inizializziamo i team predefiniti
    teamRed = Team(id: TeamId.home, name: 'Red Team', color: Colors.red);
    teamBlue = Team(id: TeamId.away, name: 'Blue Team', color: Colors.blue);

    ecsWorld.addResource<MatchComponent>(
      MatchComponent(home: teamRed.id, away: teamBlue.id),
    );
  }

  // --- LOGICA DI CREAZIONE IDEMPOTENTE (Interroga il World, non una mappa extra) ---

  BallEntity getOrAddBallEntity() => spawner.spawnBall();
  RefereeEntity getOrAddRefereeEntity(FootballGame game) =>
      spawner.spawnReferee(game);

  PlayerEntity getOrAddPlayerEntity({
    required Team team,
    required int number,
    required Vector2 position,
    required FootballGame game,
    required TacticalRole role,
  }) => spawner.spawnPlayer(
    team: team,
    number: number,
    position: position,
    game: game,
    role: role,
  );

  // Dentro EcsEntityRegistry
  TeamEntity getOrAddTeamEntity({
    required Team team,
    required bool isLeftSide,
    required TacticalSetup tacticalSetup,
  }) => spawner.spawnTeam(
    team: team,
    isLeftSide: isLeftSide,
    tacticalSetup: tacticalSetup,
  );

  // --- GESTIONE SISTEMI ---

  void addSystems(FootballGame game) {
    if (_systemsAdded) return;
    _systemsAdded = true;

    ecsWorld
      ..addSystem(MovementSystem(game))
      ..addSystem(PlayerActionHandlerSystem())
      ..addSystem(BallFsmSystem())
      ..addSystem(PlayerFsmSystem())
      ..addSystem(BallInteractSystem())
      ..addSystem(RefereeFsmSystem())
      ..addSystem(BallProximitySystem())
      ..addSystem(ResizeSystem(game))
      ..addSystem(BallReceptionSystem(game))
      ..addSystem(PossessionEventSystem())
      ..addSystem(MatchStartSystem())
      ..addSystem(GamePhaseSystem())
      ..addSystem(ZoneTacticActivatorSystem())
      ..addSystem(PlayerBrainSystem());
  }

  // Helper per il clock
  GameClockComponent getOrAddClock({
    double duration = 90.0,
    double speedFactor = 1.0,
  }) {
    var clock = ecsWorld.getResource<GameClockComponent>();
    if (clock == null) {
      clock = GameClockComponent(duration: duration, speedFactor: speedFactor);
      ecsWorld.addResource(clock);
    }
    return clock;
  }
}
