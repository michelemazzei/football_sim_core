import 'package:flame/components.dart';
import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ai/intents/move_player_intent.dart';
import 'package:football_sim_core/ai/steering/steering_behaviors.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';
import 'package:football_sim_core/game/football_game.dart';
import 'package:logging/logging.dart';

class MovementSystem extends EcsSystem {
  final logger = Logger('ecs.systems.MovementSystem');
  final FootballGame game;

  MovementSystem(this.game);

  @override
  void update(EcsWorld world, double dt) {
    final fieldSize = game.fieldComponent.size;
    if (fieldSize.x <= 0 || fieldSize.y <= 0) return;
    // Recupera il GameClockComponent come risorsa globale
    final scaledDt = world.scaledDt;

    for (final entity
        in world.entitiesWithAll<MovingComponent, RenderComponent>()) {
      final moving = entity.getComponent<MovingComponent>()!;
      final render = entity.getComponent<RenderComponent>()!;
      final sizeComp = entity.getComponent<SizeComponent>();

      // 1. Calcolo della forza di steering
      Vector2 steeringForce = Vector2.zero();
      var maxSpeed = 0.0;

      if (entity.isPlayer()) {
        maxSpeed = moving.intent?.speed ?? SoccerParameters.playerMaxSpeed;
      } else {
        maxSpeed = SoccerParameters.ballMaxSpeed;
      }
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
          maxSpeed: maxSpeed,
          position: moving.currentPosition,
          target: moving.targetPosition!,
        );
      }

      // 2. Aggiornamento della velocità e posizione logica
      moving.maxSpeed = maxSpeed;
      moving.velocity += steeringForce;
      if (moving.velocity.length > moving.maxSpeed) {
        moving.velocity.length = moving.maxSpeed;
      }

      moving.currentPosition += moving.velocity * scaledDt;
      assert(
        () {
          if (moving.currentPosition.x < 0 || moving.currentPosition.x > 1) {
            logger.warning(
              'Entity ${entity.id} out of bounds x: ${moving.currentPosition.x}',
            );
          }
          if (moving.currentPosition.y < 0 || moving.currentPosition.y > 1) {
            logger.warning(
              'Entity ${entity.id} out of bounds y: ${moving.currentPosition.y}',
            );
          }

          return true;
        }(),
      ); // assert(moving.currentPosition.x < 1 && moving.currentPosition.x > 0);
      // assert(moving.currentPosition.y < 1 && moving.currentPosition.y > 0);
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
