import 'package:flame/components.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';

class EcsPositionComponent extends EcsComponent {
  double x;
  double y;

  EcsPositionComponent({required this.x, required this.y});

  Vector2 get position => Vector2(x, y);
}
