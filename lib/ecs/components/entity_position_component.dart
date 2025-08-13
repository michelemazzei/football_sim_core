import 'package:flame/components.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';

class EntityPositionComponent extends EcsComponent {
  Vector2 position;
  EntityPositionComponent(this.position);
}
