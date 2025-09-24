import 'package:flame/components.dart';
import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ai/fsm/messaging/player_messages.dart';
import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';
import 'package:football_sim_core/ai/fsm/states/player/player_base_state.dart';
import 'package:football_sim_core/ai/fsm/states/player/player_idle_state.dart';
import 'package:football_sim_core/ai/steering/steering_behaviors.dart';
import 'package:football_sim_core/ecs/components/moving_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:logging/logging.dart';

class MoveToPositionState extends PlayerBaseState {
  final logger = Logger('MoveToPositionState');
  @override
  void enter(PlayerEntity entity, EcsWorld world) {
    logger.info('Player ${entity.id} entered MoveToPositionState');
  }

  @override
  void execute(PlayerEntity entity, double dt, EcsWorld world) {
    logger.info('Player ${entity.id} executes MoveToPositionState');
    final movingComp = entity.getComponent<MovingComponent>();

    if (movingComp == null || movingComp.targetPosition == null) return;

    final distance =
        (movingComp.targetPosition! - movingComp.currentPosition).length;
    // Steering con comportamento "arrive"
    final steering = SteeringBehaviors.arrive(
      target: movingComp.targetPosition!,
      position: movingComp.currentPosition,
      velocity: movingComp.velocity,
      maxSpeed: movingComp.maxSpeed,
      maxForce: SoccerParameters.playerMaxForce,
    );

    movingComp.velocity += steering;
    movingComp.targetPosition = movingComp.targetPosition!;
    if (distance < SoccerParameters.possessionRadius * 10) {
      entity.removeComponent<MovingComponent>();
      entity.fsm.changeState(PlayerIdleState());
    }
  }

  @override
  bool onMessage(PlayerEntity entity, Telegram telegram, EcsWorld world) {
    if (telegram.message is MoveToPosition) {
      final msg = telegram.message as MoveToPosition;

      entity.addOrReplaceComponent(
        MovingComponent(
          mass: 1.0,
          heading: (msg.target - entity.position).normalized(),
          currentPosition: entity.position,
          targetPosition: msg.target,
          velocity: Vector2(10, 10),
        ),
      );

      if (msg.requiresAck) {
        msg.onAck?.call();
      }

      return true;
    }

    return false;
  }

  @override
  void exit(PlayerEntity entity, EcsWorld world) {
    logger.info('Player ${entity.id} exiting MoveToPositionState');
  }
}
