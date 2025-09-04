import 'package:football_sim_core/ai/steering/steering_behaviors.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';

class MovementSystem extends EcsSystem {
  @override
  void update(EcsWorld world, double dt) {
    for (final e in world.entitiesWith<MovingComponent>()) {
      final move = e.getComponent<MovingComponent>()!;
      final pos = move.currentPosition;
      final target = move.targetPosition;

      if (target != null && (target - pos).length2 > 0.01) {
        move.velocity = SteeringBehaviors.arrive(
          move,
          target,
          deceleration: Deceleration.normal,
        );
        // Applica movimento
        move.currentPosition += move.velocity * dt;
        // Aggiorna heading
        if (move.velocity.length2 > 0) {
          move.heading = move.velocity.normalized();
        }
      }
    }
  }
}
