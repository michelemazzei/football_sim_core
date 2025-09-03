import 'package:flame/game.dart';
import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ecs/components/ball_proximity_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';

class BallEntity extends EcsEntity {
  /// Returns the [BallEntity] associated with this [EcsEntity].
  BallEntity(super.id) {
    addComponent(EcsBallComponent());
    addComponent(BallProximityComponent());
    addComponent(EcsPositionComponent(x: 0.5, y: 0.5));
    addComponent(
      MovingComponent(
        maxSpeed: SoccerParameters.ballMaxSpeed,
        heading: Vector2(1, 0),
        mass: SoccerParameters.ballMass,
        velocity: Vector2.zero(),
        currentPosition: Vector2(0.5, 0.5),
        targetPosition: Vector2(0.5, 0.5),
      ),
    );

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
