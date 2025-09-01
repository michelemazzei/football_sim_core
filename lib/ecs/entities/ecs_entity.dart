import 'package:football_sim_core/ecs/components/ecs_component.dart';

class EcsEntity {
  final int id;
  EcsEntity(this.id);
  final Map<Type, EcsComponent> _components = {};

  void addComponent(EcsComponent component) {
    _components[component.runtimeType] = component;
  }

  T? getComponent<T extends EcsComponent>() {
    return _components[T] as T?;
  }

  bool hasComponent<T extends EcsComponent>() {
    return _components.containsKey(T);
  }

  void removeComponent<T extends EcsComponent>() {
    _components.remove(T);
  }
}
