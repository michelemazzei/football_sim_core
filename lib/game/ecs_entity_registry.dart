import 'package:flame/game.dart';
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
  bool _systemsAdded = false;

  // 🔵 Squadre
  late final Team teamRed;
  late final Team teamBlue;
  late final EcsMatch match;

  final ecsWorld = EcsWorld();

  final Map<String, EcsEntity> _registry = {};

  EcsEntityRegistry() {
    teamRed = Team(id: TeamId.red, color: TeamId.red.color);
    teamBlue = Team(id: TeamId.blue, color: TeamId.blue.color);
    match = EcsMatch(teamA: teamRed, teamB: teamBlue);
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

    ecsWorld.addSystem(PossessionEventSystem());
    ecsWorld.addSystem(MatchStartSystem());
  }

  EcsEntity? getEntity(String type) => _registry[type];

  EcsEntity getBallEntity() =>
      _getOrAddEntity(ball, (int id) => BallEntity(id));

  EcsEntity getRefereeEntity(FootballGame game) =>
      _getOrAddEntity(referee, (int id) => RefereeEntity(id, game, match));
  EcsEntity getStatsEntity(FootballGame game) =>
      _getOrAddEntity(stats, (int id) => StatsEntity(id, game, match));

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
}
