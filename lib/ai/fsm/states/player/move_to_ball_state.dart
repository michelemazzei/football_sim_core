import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/ai/fsm/states/player/player_base_state.dart';
import 'package:football_sim_core/ai/steering/steering_behaviors.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:logging/logging.dart';

class MoveToBallState extends PlayerBaseState {
  MovePlayerIntent intent;

  final logger = Logger('MoveToBallState');

  // Soglia di distanza per considerare il giocatore "arrivato"
  final double touchThreshold = 0.1;

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
    if (distance < touchThreshold) {
      // logger.info('Player ${entity.id} reached the ball');

      // Transizione a PrepareKickState
      // entity.getComponent<FsmComponent<PlayerEntity>>()!.fsm.changeState(
      //   PrepareKickState(),
      // );
    } else {}
  }

  @override
  void exit(PlayerEntity entity) {
    logger.info('Player ${entity.id} exiting MoveToBallState');
  }
}
