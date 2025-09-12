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
    final fieldSize = game.fieldComponent.size;
    if (fieldSize.x <= 0 || fieldSize.y <= 0) return;

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

        if (distance < SoccerParameters.possessionRadius) {
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

      // 3. Conversione in coordinate assolute  e Rendering
      final mapper = game.mapper;
      if (mapper == null) continue;
      render.component.position = mapper.toScreen(
        moving.currentPosition,
        anchor: Anchor.center,
        size: sizeComp != null
            ? Vector2(sizeComp.width, sizeComp.height)
            : null,
      );
    }
  }
}
