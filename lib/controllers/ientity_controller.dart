import 'package:flame/components.dart';

abstract class IEntityController {
  Vector2 get position;
  void update(double dt);
  Vector2 getRenderPosition(); // 👈 posizione assoluta per Flame

  Vector2 get velocity;
  set velocity(Vector2 v);
}
