import 'package:flame/game.dart';
import 'package:football_sim_core/ecs/components/ball_out_of_bounds_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/components/ecs_position_component.dart';
import 'package:football_sim_core/ecs/components/size_ratio_component.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';

extension BallEntity on EcsEntity {
  /// Returns the [BallEntity] associated with this [EcsEntity].
  static EcsEntity createBall(int id, {required Vector2 position}) =>
      EcsEntity(id)
        ..addComponent(EcsBallComponent())
        ..addComponent(EcsPositionComponent(x: position.x, y: position.y))
        ..addComponent(VelocityComponent(Vector2.zero()))
        ..addComponent(SizeComponent(height: 20.0, width: 20.0))
        ..addComponent(
          MovementConfigComponent(maxVelocity: 800, frictionFactor: 0.98),
        )
        ..addComponent(BallOutOfBoundsComponent())
        // Imposta il rapporto dimensionale (es. 5% della larghezza del campo)
        ..addComponent(const SizeRatioComponent(0.05));
}
