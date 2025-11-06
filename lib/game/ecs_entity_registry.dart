import 'package:flutter/material.dart';
import 'package:football_sim_core/core/ecs/components/tactical_role_component.dart';
import 'package:football_sim_core/core/ecs/systems/game_phase_system.dart';
import 'package:football_sim_core/core/ecs/systems/player_tactic_decision_system.dart';
import 'package:football_sim_core/core/ecs/systems/zone_tactic_activator_system.dart';
import 'package:football_sim_core/core/field/field_grid.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/components/team_side_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:football_sim_core/ecs/entities/team_entity.dart';
import 'package:football_sim_core/ecs/systems/ball_fsm_system.dart';
import 'package:football_sim_core/ecs/systems/ball_interact_system.dart';
import 'package:football_sim_core/ecs/systems/ball_proximity_system.dart';
import 'package:football_sim_core/ecs/systems/ball_reception_system.dart';
import 'package:football_sim_core/ecs/systems/match_start_system.dart';
import 'package:football_sim_core/ecs/systems/message_dispatcher_system.dart';
import 'package:football_sim_core/ecs/systems/movement_system.dart';
import 'package:football_sim_core/ecs/systems/player_action_message_system.dart';
import 'package:football_sim_core/ecs/systems/player_fsm_system.dart';
import 'package:football_sim_core/ecs/systems/possession_event_system.dart';
import 'package:football_sim_core/ecs/systems/referee_fsm_system.dart';
import 'package:football_sim_core/ecs/systems/resize_system.dart';
import 'package:football_sim_core/game/football_game.dart';
import 'package:football_sim_core/model/tactical_setup.dart';
import 'package:football_sim_core/model/team.dart';
import 'package:football_sim_core/model/team_id.dart';

class EcsEntityRegistry {
  static const String ball = 'Ball';
  static const String player = 'Player';
  static const String stats = 'Stats';
  static const String referee = 'Referee';
  static const String theMatch = 'Match';
  static const String clock = 'Clock';
  bool _systemsAdded = false;

  // 🔵 Squadre
  late final Team teamRed;
  late final Team teamBlue;

  late EcsWorld ecsWorld;

  final Map<String, EcsEntity> _registry = {};
  final Map<String, EcsComponent> _resources = {};

  static final EcsEntityRegistry _instance = EcsEntityRegistry._();
  factory EcsEntityRegistry.instance() => _instance;

  EcsEntityRegistry._() {
    reset();
  }
  void reset() {
    _registry.clear();
    _resources.clear();
    ecsWorld = EcsWorld();
    final dispatcherSystem = MessageDispatcherSystem(ecsWorld);
    ecsWorld.addSystem(dispatcherSystem);
    ecsWorld.addResource<MessageDispatcherSystem>(dispatcherSystem);
    ecsWorld.addResource<FieldGrid>(FieldGrid());

    _systemsAdded = false;
    teamRed = Team(id: TeamId.home(), name: 'Red Team', color: Colors.red);
    teamBlue = Team(id: TeamId.away(), name: 'Blue Team', color: Colors.blue);
    ecsWorld.addResource<MatchComponent>(
      MatchComponent(home: teamRed.id, away: teamBlue.id),
    );
  }

  EcsComponent? getResource<T extends EcsComponent>() {
    return ecsWorld.getResource<T>();
  }

  void addSystems(FootballGame game) {
    if (_systemsAdded) return;
    _systemsAdded = true;
    ecsWorld.addSystem(MovementSystem(game));
    ecsWorld.addSystem(PlayerActionHandlerSystem());
    ecsWorld.addSystem(BallFsmSystem());
    ecsWorld.addSystem(PlayerFsmSystem());
    ecsWorld.addSystem(BallInteractSystem());
    ecsWorld.addSystem(RefereeFsmSystem());
    ecsWorld.addSystem(BallProximitySystem());
    ecsWorld.addSystem(ResizeSystem(game));
    ecsWorld.addSystem(BallReceptionSystem(game));
    ecsWorld.addSystem(PossessionEventSystem());
    ecsWorld.addSystem(MatchStartSystem());
    ecsWorld.addSystem(GamePhaseSystem());
    ecsWorld.addSystem(ZoneTacticActivatorSystem());
    ecsWorld.addSystem(PlayerTacticDecisionSystem());
  }

  EcsEntity? getEntity(String type) => _registry[type];

  EcsEntity getOrAddBallEntity() =>
      _getOrAddEntity(ball, (int id) => BallEntity(id, ecsWorld));

  EcsEntity getOrAddRefereeEntity(FootballGame game) =>
      _getOrAddEntity(referee, (int id) => RefereeEntity(id, game));

  GameClockComponent getOrAddClock({
    double duration = 90.0,
    double speedFactor = 10.0, // es. 10x più veloce
  }) {
    return _getOrAddResource(
          clock,
          (int id) =>
              GameClockComponent(duration: duration, speedFactor: speedFactor),
        )
        as GameClockComponent;
  }

  EcsEntity getOrAddPlayerEntity(
    Team team,
    FootballGame game,
    int number,
    TacticalSetup tacticalSetup,
    bool isLeftSide,
  ) {
    final position = tacticalSetup.formation.getPosition(
      number - 1,
      isLeftSide,
    );
    final role = tacticalSetup.formation.getRole(number - 1);

    final ecsPlayer = _getOrAddEntity(
      '${player}_${team.id}_$number',
      (int id) => PlayerEntity(
        id,
        ecsWorld,
        initialPosition: position,
        team: team,
        game: game,
        number: number,
        color: team.color,
      ),
    );

    ecsPlayer.addOrReplaceComponent(TacticalRoleComponent(role: role));
    return ecsPlayer;
  }

  EcsEntity getOrAddTeamEntity({
    required Team team,
    required bool isLeftSide,
    required TacticalSetup tacticalSetup,
  }) {
    return _getOrAddEntity(
      '${Team}_${team.id}',
      (int id) => TeamEntity(id, team: team, tacticalSetup: tacticalSetup),
    )..addOrReplaceComponent(TeamSideComponent(isLeftSide));
  }

  EcsEntity _getOrAddEntity(
    String type,
    EcsEntity Function(int id) constructor,
  ) {
    var entity = _registry[type];
    if (entity == null) {
      final ecsEntity = constructor(ecsWorld.genId());
      ecsWorld.addEntity(ecsEntity);
      entity = ecsEntity;
      _registry[type] = entity;
    }
    return entity;
  }

  EcsComponent _getOrAddResource(
    String type,
    EcsComponent Function(int id) constructor,
  ) {
    var entity = _resources[type];
    if (entity == null) {
      final ecsEntity = constructor(ecsWorld.genId());
      ecsWorld.addResource(ecsEntity);
      entity = ecsEntity;
      _resources[type] = entity;
    }
    return entity;
  }
}
