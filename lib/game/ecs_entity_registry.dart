import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/core/ecs/systems/game_phase_system.dart';
import 'package:football_sim_core/core/ecs/systems/player_brain_system.dart';
import 'package:football_sim_core/core/ecs/systems/zone_tactic_activator_system.dart';
import 'package:football_sim_core/core/field/field_grid.dart';
import 'package:football_sim_core/core/tactics/tactical_roles.dart';
import 'package:football_sim_core/ecs/components/ball_possession_component.dart';
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
    // Aggiungiamo il possesso, anche se vuoto all'inizio
    ecsWorld.addResource<BallPossessionComponent>(BallPossessionComponent());
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
      // 1. GESTIONE STATO GLOBALE E FASI
      ..addSystem(
        MatchStartSystem(),
      ) // Gestisce l'inizio (kick-off, posizionamento)
      ..addSystem(
        GamePhaseSystem(),
      ) // Verifica se la palla è uscita, goal, ecc.
      ..addSystem(
        ZoneTacticActivatorSystem(),
      ) // Aggiorna le zone tattiche in base alla fase
      // 2. INTELLIGENZA E DECISIONI (Brain & FSM)
      ..addSystem(
        PlayerBrainSystem(),
      ) // L'IA decide cosa fare in base alla tattica
      ..addSystem(
        PlayerFsmSystem(),
      ) // Aggiorna lo stato del giocatore (Idle -> Run -> Kick)
      ..addSystem(
        BallFsmSystem(),
      ) // Aggiorna lo stato della palla (Free -> Controlled)
      ..addSystem(RefereeFsmSystem()) // L'arbitro valuta la situazione
      // 3. INTERAZIONE E PROSSIMITÀ
      ..addSystem(BallProximitySystem()) // Calcola chi è vicino alla palla
      ..addSystem(BallInteractSystem()) // Gestisce il contatto fisico/contrasti
      ..addSystem(
        BallReceptionSystem(game),
      ) // Gestisce lo stop e il controllo palla
      ..addSystem(
        PossessionEventSystem(),
      ) // Notifica il cambio di possesso (ora che i dati sono certi)
      // 4. ESECUZIONE AZIONI E MOVIMENTO
      ..addSystem(
        PlayerActionHandlerSystem(),
      ) // Esegue materialmente il calcio o il passaggio
      ..addSystem(
        MovementSystem(game),
      ) // Applica i vettori di movimento alle entità
      // 5. UTILITY E RENDER (Sistemi di servizio)
      ..addSystem(
        ResizeSystem(game),
      ); // Adatta il campo se la finestra cambia  }
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
