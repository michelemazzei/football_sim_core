import 'package:flame/game.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/components/ecs_position_component.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';

class MovementSystem extends EcsSystem {
  @override
  void update(EcsWorld world, double dt) {
    // Cicla su tutte le entità che hanno VelocityComponent
    for (final e in world.entitiesWith<VelocityComponent>()) {
      final velComp = e.getComponent<VelocityComponent>()!;
      final posComp = e.getComponent<EcsPositionComponent>();
      final cfgComp = e.getComponent<MovementConfigComponent>();

      // Applica attrito e clamp
      if (cfgComp != null) {
        velComp.velocity *= cfgComp.frictionFactor;

        final speed = velComp.velocity.length;
        if (speed > cfgComp.maxVelocity) {
          velComp.velocity =
              velComp.velocity.normalized() * cfgComp.maxVelocity;
        } else if (speed < cfgComp.minVelocity) {
          velComp.velocity = Vector2.zero();
        }
      }

      // Muovi la posizione
      if (posComp != null) {
        posComp.x += velComp.velocity.x * dt;
        posComp.y += velComp.velocity.y * dt;
      }
    }
  }
}
