import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/ecs/ecs_system.dart';

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
      system.update(dt);
    }
  }

  /// Utility: restituisce tutte le entità che hanno un dato componente
  List<EcsEntity> entitiesWith<T extends EcsComponent>() {
    return _entities.where((e) => e.hasComponent<T>()).toList();
  }
}
