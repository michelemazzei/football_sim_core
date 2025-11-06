// lib/ai/fsm/states/follow_ball_state.dart

import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ai/fsm/entities/game_state.dart';
import 'package:football_sim_core/ai/steering/steering_behaviors.dart';
import 'package:football_sim_core/ecs/components/moving_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';

class FollowBallState extends GameState<PlayerEntity> {
  final EcsWorld world;

  FollowBallState(this.world);

  @override
  void doExecute(PlayerEntity entity, double dt, EcsWorld world) {
    final ball = world.entitiesOf<BallEntity>().firstOrNull;
    if (ball == null) return;

    final ballPos = ball.position;
    final moving = entity.getComponent<MovingComponent>();
    final playerPos = moving?.currentPosition;
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
    moving.heading = (ballPos - moving.currentPosition).normalized();
    moving.targetPosition = ballPos;
    if (distance < SoccerParameters.possessionRadius) {}
  }

  @override
  void doExit(PlayerEntity entity, EcsWorld world) {
    entity.getComponent<MovingComponent>()?.stopMoving();
  }
}
