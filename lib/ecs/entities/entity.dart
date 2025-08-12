class Entity {
  final int id;
  final Map<Type, dynamic> _components = {};

  Entity(this.id);

  void addComponent<T>(T component) {
    _components[T] = component;
  }

  T? getComponent<T>() {
    return _components[T] as T?;
  }

  bool hasComponent<T>() => _components.containsKey(T);
}
