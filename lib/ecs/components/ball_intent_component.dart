import 'package:flame/game.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';

enum BallIntent { idle, kicked, stopped, outOfPlay }

class BallIntentComponent extends EcsComponent {
  final BallIntent intent;
  final Vector2 direction;
  final double force;
  BallIntentComponent({
    required this.direction,
    required this.force,
    required this.intent,
  });
}
