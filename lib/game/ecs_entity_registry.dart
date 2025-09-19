import 'package:flame/game.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:football_sim_core/ecs/entities/stats_entity.dart';
import 'package:football_sim_core/ecs/entities/team_id.dart';
import 'package:football_sim_core/ecs/systems/action_queue_system.dart';
import 'package:football_sim_core/ecs/systems/ball_fsm_system.dart';
import 'package:football_sim_core/ecs/systems/ball_proximity_system.dart';
import 'package:football_sim_core/ecs/systems/ball_reception_system.dart';
import 'package:football_sim_core/ecs/systems/match_start_system.dart';
import 'package:football_sim_core/ecs/systems/movement_system.dart';
import 'package:football_sim_core/ecs/systems/player_fsm_system.dart';
import 'package:football_sim_core/ecs/systems/possession_event_system.dart';
import 'package:football_sim_core/ecs/systems/referee_fsm_system.dart';
import 'package:football_sim_core/ecs/systems/resize_system.dart';
import 'package:football_sim_core/game/football_game.dart';
import 'package:football_sim_core/match/ecs_match.dart';
import 'package:football_sim_core/model/team.dart';

class EcsEntityRegistry {
  static const String ball = 'Ball';
  static const String player = 'Player';
  static const String stats = 'Stats';
  static const String referee = 'Referee';
  static const String clock = 'Clock';
  bool _systemsAdded = false;

  // 🔵 Squadre
  late final Team teamRed;
  late final Team teamBlue;
  late final EcsMatch match;

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
    _systemsAdded = false;
    teamRed = Team(id: TeamId.red, color: TeamId.red.color);
    teamBlue = Team(id: TeamId.blue, color: TeamId.blue.color);
    match = EcsMatch(teamA: teamRed, teamB: teamBlue);
  }

  EcsComponent? getResource<T extends EcsComponent>() {
    return ecsWorld.getResource<T>();
  }

  void addSystems(FootballGame game) {
    if (_systemsAdded) return;
    _systemsAdded = true;
    ecsWorld.addSystem(ActionQueueSystem());
    ecsWorld.addSystem(BallFsmSystem());
    ecsWorld.addSystem(PlayerFsmSystem());
    ecsWorld.addSystem(RefereeFsmSystem());
    ecsWorld.addSystem(BallProximitySystem());
    ecsWorld.addSystem(MovementSystem(game));
    ecsWorld.addSystem(ResizeSystem(game));
    ecsWorld.addSystem(BallReceptionSystem(game));

    ecsWorld.addSystem(PossessionEventSystem());
    ecsWorld.addSystem(MatchStartSystem());
  }

  EcsEntity? getEntity(String type) => _registry[type];

  EcsEntity getBallEntity() =>
      _getOrAddEntity(ball, (int id) => BallEntity(id, ecsWorld));

  EcsEntity getRefereeEntity(FootballGame game) =>
      _getOrAddEntity(referee, (int id) => RefereeEntity(id, game, match));
  EcsEntity getStatsEntity(FootballGame game) =>
      _getOrAddEntity(stats, (int id) => StatsEntity(id, game, match));

  GameClockComponent getClock({
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

  EcsEntity getPlayerEntity(
    Vector2 position,
    Team team,
    FootballGame game,
    int number,
    role,
  ) {
    return _getOrAddEntity(
      '${player}_${team.id}_$number',
      (int id) => PlayerEntity(
        id,
        ecsWorld,
        initialPosition: position,
        team: team.id,
        game: game,
        number: number,
        color: team.color,
        role: role,
      ),
    );
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
