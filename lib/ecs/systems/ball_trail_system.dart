// lib/systems/ball_system.dart

import 'package:football_sim_core/components/ball_trail.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/components/ecs_position_component.dart';
import 'package:football_sim_core/ecs/ecs_system.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/systems/position_system.dart';
import 'package:football_sim_core/game/football_game.dart';

class BallTrailSystem extends EcsSystem {
  final EcsWorld world;
  final FootballGame game;
  final PositionSystem posSys;

  BallTrailSystem(this.game, this.posSys) : world = game.ecsWorld;

  @override
  void update(double dt) {
    for (final e in world.entitiesWith<EcsBallComponent>()) {
      final ballComp = e.getComponent<EcsBallComponent>()!;
      final velComp = e.getComponent<VelocityComponent>();
      final posComp = e.getComponent<EcsPositionComponent>();

      if (velComp != null && velComp.velocity.length2 > 1) {
        ballComp.angle += velComp.velocity.length * dt * ballComp.angleSpin;
      }

      if (velComp != null &&
          velComp.velocity.length2 > 0.2 &&
          posComp != null) {
        // Calcolo posizione assoluta con PositionSystem
        final absPos = game.positionSystem.getAbsolutePosition(e);
        game.add(BallTrail(absPos.clone()));
      }
    }
  }
}
