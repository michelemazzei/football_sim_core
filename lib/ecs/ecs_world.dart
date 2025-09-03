import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';

class EcsWorld {
  final List<EcsEntity> _entities = [];
  final List<EcsSystem> _systems = [];
  int _nextId = 0;

  int genId() => _nextId++;

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
    for (final system in _systems) {
      system.update(this, dt);
    }
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
