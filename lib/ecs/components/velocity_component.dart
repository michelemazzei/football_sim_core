import 'package:flame/components.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';

class VelocityComponent extends EcsComponent {
  Vector2 velocity;

  VelocityComponent(this.velocity);
}
