import 'package:flame/components.dart';
import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ai/intents/move_player_intent.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';

enum Deceleration { fast, normal, slow, none }

class MovingComponent extends EcsComponent {
  Vector2 currentPosition;
  Vector2 velocity;
  Vector2 heading;
  MovePlayerIntent? intent;

  Vector2? targetPosition;

  double maxSpeed;
  final double mass;

  MovingComponent({
    this.intent,
    required this.currentPosition,
    required this.heading,
    this.maxSpeed = SoccerParameters.playerMaxSpeed,
    required this.mass,
    Vector2? velocity,
    this.targetPosition,
  }) : velocity = velocity ?? Vector2.zero();

  void setTarget(Vector2 target) {
    targetPosition = target;
  }

  void clearTarget() {
    targetPosition = null;
  }
}
