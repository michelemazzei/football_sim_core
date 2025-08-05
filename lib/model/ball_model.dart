import 'package:flame/components.dart';

class BallModel {
  Vector2 position;
  Vector2 velocity;

  BallModel({required this.position, required this.velocity});

  void update(double dt) {
    position += velocity * dt;
  }

  void applyFriction(double factor) {
    velocity *= factor;
  }

  void clampSpeed(double maxSpeed) {
    if (velocity.length > maxSpeed) {
      velocity = velocity.normalized() * maxSpeed;
    }
  }

  double get speed => velocity.length;
  Vector2 get direction => velocity.normalized();
  bool get isMoving => velocity.length > 0.1;
}
