import 'dart:developer';

import 'package:football_sim_core/ai/steering/player_utils.dart';
import 'package:football_sim_core/ecs/components/ball_possession_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';

class BallInteractSystem extends EcsSystem {
  static const double touchThreshold =
      0.02; // distanza minima per considerare il contatto

  @override
  void update(EcsWorld world, double dt) {
    final referee = world.entitiesOf<RefereeEntity>().firstOrNull;
    if (referee == null) return; // Aggiorna possesso di squadra (opzionale)
    final ball = world.entitiesOf<BallEntity>().firstOrNull;
    if (ball == null) return;

    final ballPos = ball.getComponent<MovingComponent>()?.currentPosition;
    if (ballPos == null) return;

    final players = world
        .entitiesWith<EcsPlayerComponent>()
        .whereType<PlayerEntity>();

    final closestPlayers = PlayerUtils.findClosestPlayersToBall(players, ball);
    if (closestPlayers.isEmpty) {
      return;
    }

    final closest = closestPlayers.first;
    final distance = closest
        .getComponent<EcsPositionComponent>()!
        .position
        .distanceTo(ballPos);

    if (distance <= touchThreshold) {
      final teamComp = closest.getComponent<TeamComponent>();
      if (teamComp != null) {
        referee
          ..removeComponent<BallPossessionComponent>()
          ..addComponent(
            BallPossessionComponent(
              teamId: teamComp.team,
              playerId: closest.id,
            ),
          );

        log(
          '👟 Ball touched by player ${closest.id} at distance $distance',
          name: 'BallInteractSystem',
        );
      }
    }
  }
}
