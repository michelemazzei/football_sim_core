import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';

abstract class EcsEntity implements MessageReceiver, MessageSender {
  @override
  final int id;
  EcsEntity(this.id);
  final Map<Type, EcsComponent> _components = {};

  bool isPlayer() {
    return hasComponent<EcsPlayerComponent>();
  }

  bool isBall() {
    return hasComponent<EcsBallComponent>();
  }

  void addComponent(EcsComponent component) {
    _components[component.runtimeType] = component;
  }

  void addOrReplaceComponent<T extends EcsComponent>(T component) {
    if (hasComponent<T>()) {
      removeComponent<T>();
    }
    addComponent(component);
  }

  T? getComponent<T extends EcsComponent>() => _components[T] as T?;

  IsFsmComponent? getFsmComponent() {
    for (final comp in _components.values) {
      if (comp is IsFsmComponent) return comp;
    }
    return null;
  }

  bool hasComponent<T extends EcsComponent>() {
    return _components.containsKey(T);
  }

  void removeComponent<T extends EcsComponent>() {
    _components.remove(T);
  }

  @override
  bool handleMessage(Telegram telegram) {
    final fsm = getComponent<FsmComponent>()?.fsm;
    return fsm?.handleMessage(telegram) ?? false;
  }
}
