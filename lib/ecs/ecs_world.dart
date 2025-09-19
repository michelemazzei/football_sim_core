import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/ecs/components/game_clock_component.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';

class EcsWorld {
  final List<EcsEntity> _entities = [];
  final List<EcsSystem> _systems = [];

  final Map<Type, EcsComponent> _resources = {};

  void addResource(EcsComponent resource) {
    _resources[resource.runtimeType] = resource;
  }

  T? getResource<T extends EcsComponent>() {
    return _resources[T] as T?;
  }

  void removeResource<T extends EcsComponent>() {
    _resources.remove(T);
  }

  int _nextId = 0;

  int genId() => _nextId++;

  double _lastDt = 0.0;
  double get lastDt => _lastDt;
  GameClockComponent? _clockComponent;
  double get scaledDt {
    _clockComponent ??= getResource<GameClockComponent>();
    return _lastDt * (_clockComponent?.speedFactor ?? 1.0);
  }

  final List<EcsSystem> _pendingRemovals = [];

  void removeSystemLater(EcsSystem system) {
    _pendingRemovals.add(system);
  }

  void addEntity(EcsEntity entity) {
    _entities.add(entity);
  }

  void removeEntity(EcsEntity entity) {
    _entities.remove(entity);
  }

  void addSystem(EcsSystem system) {
    _systems.add(system);
  }

  void update(double dt) {
    _lastDt = dt;
    for (final system in _systems) {
      system.update(this, dt);
    }
    // Rimuovi dopo l’update
    _systems.removeWhere((s) => _pendingRemovals.contains(s));
    _pendingRemovals.clear();
  }

  /// Utility: restituisce tutte le entità che hanno un dato componente
  List<EcsEntity> entitiesWith<T extends EcsComponent>() {
    return _entities.where((e) => e.hasComponent<T>()).toList();
  }

  /// Utility: restituisce tutte le entità di tipo T
  List<T> entitiesOf<T extends EcsEntity>() {
    return _entities.whereType<T>().toList();
  }

  /// Utility: restituisce tutte le entità
  List<EcsEntity> entities() => _entities.toList();

  Iterable<EcsEntity>
  entitiesWithAll<T1 extends EcsComponent, T2 extends EcsComponent>() {
    return entitiesWith<T1>().where((e) => e.hasComponent<T2>());
  }
}
