import 'package:flame/game.dart';
import 'package:football_sim_core/ecs/components/ball_out_of_bounds_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/components/ecs_position_component.dart';
import 'package:football_sim_core/ecs/components/size_ratio_component.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';

class BallEntity extends EcsEntity {
  /// Returns the [BallEntity] associated with this [EcsEntity].
  BallEntity(super.id) {
    addComponent(EcsBallComponent());
    addComponent(EcsPositionComponent(x: 0.5, y: 0.5));
    addComponent(VelocityComponent(Vector2.zero()));
    addComponent(SizeComponent(height: 20.0, width: 20.0));
    addComponent(
      MovementConfigComponent(maxVelocity: 800, frictionFactor: 0.98),
    );
    addComponent(BallOutOfBoundsComponent())
    // Imposta il rapporto dimensionale (es. 5% della larghezza del campo)
    ;
    addComponent(const SizeRatioComponent(0.02));
  }
}
