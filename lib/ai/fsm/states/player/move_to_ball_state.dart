import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/ai/fsm/states/player/player_base_state.dart';
import 'package:football_sim_core/ai/fsm/states/player/player_idle_state.dart';
import 'package:football_sim_core/ai/steering/steering_behaviors.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:logging/logging.dart';

class MoveToBallState extends PlayerBaseState {
  MovePlayerIntent intent;

  final logger = Logger('MoveToBallState');

  MoveToBallState({required this.intent});

  @override
  void enter(PlayerEntity entity) {
    logger.info('Player ${entity.id} entered MoveToBallState');
  }

  @override
  void execute(PlayerEntity entity, double dt) {
    final ball = entity
        .getComponent<GameReferenceComponent>()
        ?.game
        .ecsWorld
        .entitiesOf<BallEntity>()
        .firstOrNull;

    if (ball == null) {
      logger.warning('BallEntity not found for Player ${entity.id}');
      return;
    }

    final moving = entity.getComponent<MovingComponent>();
    final playerPos = moving?.currentPosition;
    final ballPos = ball.getComponent<MovingComponent>()?.currentPosition;

    if (moving == null || playerPos == null || ballPos == null) return;

    final distance = (playerPos - ballPos).length;
    // Steering con comportamento "arrive"
    final steering = SteeringBehaviors.arrive(
      target: ballPos,
      position: moving.currentPosition,
      velocity: moving.velocity,
      maxSpeed: moving.maxSpeed,
      maxForce: SoccerParameters.playerMaxForce,
    );

    moving.velocity += steering;
    moving.targetPosition = ballPos;
    if (distance < SoccerParameters.possessionRadius) {
      entity.getComponent<FsmComponent<PlayerEntity>>()!.fsm.changeState(
        PlayerIdleState(),
      );
    }
  }

  @override
  void exit(PlayerEntity entity) {
    logger.info('Player ${entity.id} exiting MoveToBallState');
  }

  @override
  bool onMessage(PlayerEntity entity, Telegram telegram) {
    logger.fine(
      '${toString()} - Received message: ${telegram.message.toString()}  for Player: ${entity.id}',
    );
    return true;
  }
}
