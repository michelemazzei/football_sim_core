import 'dart:math' as math;

import 'package:flame/game.dart';
import 'package:football_sim_core/ai/fsm/states/ball/ball_base_state.dart';
import 'package:football_sim_core/ai/fsm/states/ball/ball_stopped_state.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';

class RollingState extends BallBaseState {
  final Vector2 direction;
  final double force;

  RollingState({required this.direction, required this.force});

  @override
  void enter(BallEntity entity, EcsWorld world) {
    final moving = entity.getComponent<MovingComponent>();
    if (moving != null) {
      moving.velocity = direction * force;
    }
  }

  @override
  void execute(BallEntity entity, double dt, EcsWorld world) {
    final moving = entity.getComponent<MovingComponent>();
    if (moving == null) return;

    // Simula attrito
    // Simula attrito proporzionale al tempo simulato
    double frictionFactor = 0.98;
    moving.velocity *= math.pow(frictionFactor, world.scaledDt).toDouble();

    if (moving.velocity.length < 0.03) {
      moving.velocity = Vector2.zero();
      entity.getComponent<FsmComponent<BallEntity>>()!.fsm.changeState(
        BallStoppedState(),
      );
    }
  }
}
