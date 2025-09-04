import 'package:flame/components.dart';
import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ai/steering/steering_behaviors.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';
import 'package:football_sim_core/game/football_game.dart';

class MovementSystem extends EcsSystem {
  final FootballGame game;

  MovementSystem(this.game);

  @override
  void update(EcsWorld world, double dt) {
    final fieldPos = game.fieldComponent.position;
    final fieldSize = game.fieldComponent.size;

    for (final entity
        in world.entitiesWithAll<MovingComponent, RenderComponent>()) {
      final moving = entity.getComponent<MovingComponent>()!;
      final render = entity.getComponent<RenderComponent>()!;
      final sizeComp = entity.getComponent<SizeComponent>();

      // 1. Calcolo della forza di steering
      Vector2 steeringForce = Vector2.zero();

      if (moving.targetPosition != null) {
        final distance =
            (moving.targetPosition! - moving.currentPosition).length;

        if (distance < 0.03) {
          moving.velocity = Vector2.zero();
          moving.targetPosition = null;
          return;
        }

        steeringForce = SteeringBehaviors.arrive(
          velocity: moving.velocity,
          maxForce: SoccerParameters.playerMaxForce,
          maxSpeed: SoccerParameters.playerMaxSpeed,
          position: moving.currentPosition,
          target: moving.targetPosition!,
        );
      }

      // 2. Aggiornamento della velocità e posizione logica
      moving.velocity += steeringForce;
      if (moving.velocity.length > moving.maxSpeed) {
        moving.velocity.length = moving.maxSpeed;
      }

      moving.currentPosition += moving.velocity * dt;

      // 3. Conversione in coordinate assolute
      final absolute = _getAbsolutePosition(
        relative: moving.currentPosition,
        fieldPosition: fieldPos,
        fieldSize: fieldSize,
        anchor: Anchor.center,
        size: sizeComp != null
            ? Vector2(sizeComp.width, sizeComp.height)
            : null,
      );

      // 4. Rendering
      render.component.position = absolute;
    }
  }

  Vector2 _getAbsolutePosition({
    required Vector2 relative,
    required Vector2 fieldPosition,
    required Vector2 fieldSize,
    Anchor anchor = Anchor.center,
    Vector2? size,
  }) {
    final offset = relative.clone()..multiply(fieldSize);
    final anchorOffset = _getAnchorOffset(anchor, size ?? Vector2.zero());
    return fieldPosition + offset - anchorOffset;
  }

  Vector2 _getAnchorOffset(Anchor anchor, Vector2 size) {
    switch (anchor) {
      case Anchor.topLeft:
        return Vector2.zero();
      case Anchor.topCenter:
        return Vector2(size.x / 2, 0);
      case Anchor.topRight:
        return Vector2(size.x, 0);
      case Anchor.centerLeft:
        return Vector2(0, size.y / 2);
      case Anchor.centerRight:
        return Vector2(size.x, size.y / 2);
      case Anchor.bottomLeft:
        return Vector2(0, size.y);
      case Anchor.bottomCenter:
        return Vector2(size.x / 2, size.y);
      case Anchor.bottomRight:
        return Vector2(size.x, size.y);
      default:
        return Vector2.zero();
    }
  }
}
