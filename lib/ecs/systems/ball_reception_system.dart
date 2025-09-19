import 'dart:developer';

import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ai/fsm/states/ball/ball_idle_state.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';
import 'package:football_sim_core/game/football_game.dart';

class BallReceptionSystem extends EcsSystem {
  final FootballGame game;
  BallReceptionSystem(this.game);
  @override
  void update(EcsWorld world, double dt) {
    final players = world.entitiesOf<PlayerEntity>();
    final ball = world.entitiesOf<BallEntity>().firstOrNull;
    if (ball == null) return;

    final ballPos = ball.getComponent<MovingComponent>()?.currentPosition;
    final ballVel = ball.getComponent<MovingComponent>()?.velocity;
    if (ballPos == null || ballVel == null) return;

    for (final player in players) {
      final playerPos = player.getComponent<MovingComponent>()?.currentPosition;
      if (playerPos == null) continue;

      final distance = (ballPos - playerPos).length;
      final isApproaching =
          (ballVel.normalized().dot((playerPos - ballPos).normalized())) > 0.8;

      if (distance < SoccerParameters.possessionRadius && isApproaching) {
        // Intercettazione riuscita
        ballVel.setZero(); // ferma la palla
        ball.getComponent<FsmComponent<BallEntity>>()?.fsm.changeState(
          BallIdleState(),
        );

        log('Player ${player.id} has intercepted the ball!');
      }
    }
  }
}
