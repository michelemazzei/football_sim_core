import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ai/fsm/states/ball/ball_possession_state.dart';
import 'package:football_sim_core/ai/fsm/states/player/player_base_state.dart';
import 'package:football_sim_core/ai/fsm/states/player/prepare_kick_state.dart';
import 'package:football_sim_core/ai/intents/move_player_intent.dart';
import 'package:football_sim_core/ai/steering/steering_behaviors.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:logging/logging.dart';

class MoveToBallState extends PlayerBaseState {
  MovePlayerIntent intent;

  final logger = Logger('MoveToBallState');

  MoveToBallState({required this.intent});

  @override
  void doExecute(PlayerEntity entity, double dt, EcsWorld world) {
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
    final ballPos = ball.position;

    if (moving == null || playerPos == null) return;

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
    moving.heading = moving.velocity.normalized();
    moving.targetPosition = ballPos;
    if (distance < SoccerParameters.possessionRadius) {
      // allVelocity.setZero();
      ball.fsm.changeState(BallPossessionState(owner: entity));

      entity.fsm.changeState(PrepareKickState());
    }
  }
}
