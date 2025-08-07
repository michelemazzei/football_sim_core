import 'package:flame/components.dart';

abstract class SpriteModel {
  final minVelocity = 0.1;
  Vector2 relativePosition;
  late Vector2 velocity;

  SpriteModel({required this.relativePosition, Vector2? velocity})
    : velocity = velocity ?? Vector2.zero();

  // Non usiamo più update qui, lo spostiamo nel controller
  void applyFriction(double factor) {
    velocity *= factor;
  }

  void clampSpeed(double maxSpeed) {
    if (velocity.length > maxSpeed) {
      velocity = velocity.normalized() * maxSpeed;
    }
    if (velocity.length2 < minVelocity) {
      velocity = Vector2.zero(); //
    }
  }

  double get speed => velocity.length;
  Vector2 get direction => velocity.normalized();
  bool get isMoving => velocity.length2 > minVelocity;
}
