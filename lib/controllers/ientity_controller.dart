import 'package:flame/components.dart';

abstract class IEntityController {
  Vector2 get position;
  void update(double dt);
}
