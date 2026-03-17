import 'package:collection/collection.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/ecs/components/game_clock_component.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';
import 'package:football_sim_core/model/team_id.dart';

class EcsWorld {
  final List<EcsEntity> _entities = [];
  final Map<Type, EcsSystem> _systems = {};

  final Map<Type, dynamic> _resources = {};
  // 1. Aggiungiamo una mappa per l'accesso rapido O(1)
  final Map<int, EcsEntity> _entitiesById = {};

  void clear() {
    _entities.clear();
    _systems.clear();
    _resources.clear();
    _entitiesById.clear();
  }

  void addEntity(EcsEntity entity) {
    _entities.add(entity);
    _entitiesById[entity.id] = entity; // Registra l'ID
  }

  void removeEntity(EcsEntity entity) {
    _entities.remove(entity);
    _entitiesById.remove(entity.id); // Rimuovi l'ID
  }

  // 2. Il metodo richiesto: veloce e tipizzato
  T? getEntityById<T extends EcsEntity>(int id) {
    final entity = _entitiesById[id];
    if (entity is T) {
      return entity;
    }
    return null;
  }

  // Helper per ottenere tutte le entità di un tipo (già presente nel tuo codice)
  Iterable<T> entitiesOf<T extends EcsEntity>() {
    return _entities.whereType<T>();
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
    return _entities.where((e) => e.hasComponent<T>()).toList();
  }

  /// Utility: restituisce tutte le entità
  List<EcsEntity> entities() => _entities.toList();

  Iterable<EcsEntity>
  entitiesWithAll<T1 extends EcsComponent, T2 extends EcsComponent>() {
    return entitiesWith<T1>().where((e) => e.hasComponent<T2>());
  }
}

extension EcsWorldFinderX on EcsWorld {
  BallEntity? get ball => entitiesOf<BallEntity>().firstOrNull;
  BallEntity get requiredBall => entitiesOf<BallEntity>().first;

  RefereeEntity? get referee => entitiesOf<RefereeEntity>().firstOrNull;
  RefereeEntity get requiredReferee => entitiesOf<RefereeEntity>().first;

  PlayerEntity? player(TeamId teamId, int number) {
    return entitiesOf<PlayerEntity>().firstWhereOrNull(
      (p) => p.teamId == teamId && p.number == number,
    );
  }
}
