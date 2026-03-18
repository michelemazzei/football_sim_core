import 'package:collection/collection.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/ecs/components/game_clock_component.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:football_sim_core/ecs/entities_index.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';
import 'package:football_sim_core/model/team_id.dart';

class EcsWorld {
  // 1. Aggiungiamo una mappa per l'accesso rapido O(1)
  final EntitiesIndex _entitiesById = EntitiesIndex();
  // 1. Aggiungiamo una mappa per l'accesso rapido O(1)
  final EntitiesByType _entitiesByType = EntitiesByType();
  final PlayersIndex _playersIndex = PlayersIndex();

  // final List<EcsEntity> _entities = [];
  final Map<Type, EcsSystem> _systems = {};

  final Map<Type, dynamic> _resources = {};

  void clear() {
    _entitiesById.clear();
    _entitiesByType.clear();
    _playersIndex.clear();
    _systems.clear();
    _resources.clear();
  }

  void addEntity(EcsEntity entity) {
    _entitiesByType.add(entity);
    _entitiesById.add(entity); // Registra l'ID
    if (entity.runtimeType == PlayerEntity) {
      _playersIndex.add(entity as PlayerEntity);
    }
  }

  void removeEntity(EcsEntity entity) {
    // _entities.remove(entity);
    _entitiesById.remove(entity); // Rimuovi l'ID
    _entitiesByType.remove(entity);
    if (entity.runtimeType == PlayerEntity) {
      _playersIndex.remove(entity as PlayerEntity);
    }
  }

  // 2. Il metodo richiesto: veloce e tipizzato
  T? getEntityById<T extends EcsEntity>(int id) {
    final entity = _entitiesById[id];
    if (entity is T) {
      return entity;
    }
    return null;
  }

  T addResource<T>(T resource) {
    _resources[resource.runtimeType] = resource;
    return resource;
  }

  T? getResource<T>({T Function()? ifAbsent}) {
    T? item = _resources[T] as T?;
    if (item == null && ifAbsent != null) {
      item = ifAbsent();
      if (item != null) {
        addResource<T>(item);
      }
    }
    return item;
  }

  T removeResource<T>() => _resources.remove(T);

  int _nextId = 0;

  int genId() => _nextId++;

  double _lastDt = 0.0;
  double get lastDt => _lastDt;
  GameClockComponent? _clockComponent;
  double get scaledDt {
    _clockComponent ??= getResource<GameClockComponent>();
    return _lastDt * (_clockComponent?.speedFactor ?? 1.0);
  }

  final List<Type> _pendingRemovals = [];

  void removeSystemLater<T>(T system) {
    _pendingRemovals.add(system.runtimeType);
  }

  void addSystem(EcsSystem system) {
    _systems.putIfAbsent(system.runtimeType, () => system);
  }

  void update(double dt) {
    _lastDt = dt;
    for (final system in _systems.values) {
      system.update(this, dt);
    }
    // Rimuovi dopo l’update
    _systems.removeWhere((key, value) => _pendingRemovals.contains(key));
    _pendingRemovals.clear();
  }

  /// Utility: restituisce tutte le entità che hanno un dato componente
  List<EcsEntity> entitiesWith<T extends EcsComponent>() {
    return _entitiesById.get().where((e) => e.hasComponent<T>()).toList();
  }

  /// Utility: restituisce tutte le entità
  Iterable<EcsEntity> entities() => _entitiesById.get();

  Iterable<EcsEntity>
  entitiesWithAll<T1 extends EcsComponent, T2 extends EcsComponent>() {
    return entitiesWith<T1>().where((e) => e.hasComponent<T2>());
  }
}

extension EcsWorldFinderX on EcsWorld {
  Iterable<T> entitiesOf<T extends EcsEntity>() {
    return _entitiesByType.byType(T).whereType<T>();
  }

  Iterable<PlayerEntity> get players {
    // 1. Chiamiamo l'indice usando il tipo 'BallEntity' come chiave
    return _entitiesByType.byType(PlayerEntity).whereType<PlayerEntity>();
  }

  Iterable<PlayerEntity> playersInTeam(TeamId team) =>
      _playersIndex.byTeams(team);
  BallEntity? get ball {
    // 1. Chiamiamo l'indice usando il tipo 'BallEntity' come chiave
    final Iterable<EcsEntity> results = _entitiesByType.byType(BallEntity);

    // 2. Usiamo .firstOrNull (dalla libreria collection o standard Dart)
    // e facciamo il cast a BallEntity
    return results.firstOrNull as BallEntity?;
  }

  BallEntity get requiredBall {
    // 1. Chiamiamo l'indice usando il tipo 'BallEntity' come chiave
    final Iterable<EcsEntity> results = _entitiesByType.byType(BallEntity);

    // 2. Usiamo .firstOrNull (dalla libreria collection o standard Dart)
    // e facciamo il cast a BallEntity
    return results.first as BallEntity;
  }

  RefereeEntity? get referee {
    // 1. Chiamiamo l'indice usando il tipo 'BallEntity' come chiave
    final Iterable<EcsEntity> results = _entitiesByType.byType(RefereeEntity);

    // 2. Usiamo .firstOrNull (dalla libreria collection o standard Dart)
    // e facciamo il cast a BallEntity
    return results.firstOrNull as RefereeEntity?;
  }

  RefereeEntity? get requiredReferee {
    // 1. Chiamiamo l'indice usando il tipo 'BallEntity' come chiave
    final Iterable<EcsEntity> results = _entitiesByType.byType(RefereeEntity);

    // 2. Usiamo .firstOrNull (dalla libreria collection o standard Dart)
    // e facciamo il cast a BallEntity
    return results.first as RefereeEntity;
  }
}
