import 'package:flame/components.dart';

class VelocityComponent {
  Vector2 velocity;
  VelocityComponent(Vector2? velocity) : velocity = velocity ?? Vector2.zero();
}
