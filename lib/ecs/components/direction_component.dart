import 'package:flame/components.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';

class DirectionComponent extends EcsComponent {
  Vector2 direction;
  DirectionComponent(this.direction);
}
