import 'package:flame/components.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';

class SizeComponent extends EcsComponent {
  double width;
  double height;

  /// Costruisci con width e height espliciti
  SizeComponent({required this.width, required this.height});

  /// Costruisci con width e height espliciti
  SizeComponent.fromSize(Vector2 size) : width = size.x, height = size.y;

  Vector2 get size => Vector2(width, height);

  set size(Vector2 size) {
    width = size.x;
    height = size.y;
  }
}
