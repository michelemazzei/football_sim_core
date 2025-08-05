import 'package:flame/components.dart';

class SoccerBallModel {
  Vector2 position;
  Vector2 velocity;

  SoccerBallModel({required this.position, required this.velocity});

  void update(double dt) {
    position += velocity * dt;
  }

  bool get isMoving => velocity.length > 0.1;
}
