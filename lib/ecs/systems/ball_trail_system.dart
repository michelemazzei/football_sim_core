// lib/systems/ball_system.dart

import 'package:flame/components.dart';
import 'package:football_sim_core/components/ball_trail.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/components/ecs_position_component.dart';
import 'package:football_sim_core/ecs/ecs_system.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/systems/position_system.dart';
import 'package:football_sim_core/game/football_game.dart';
import 'package:football_sim_core/utils/position_utils.dart';

class BallTrailSystem extends EcsSystem {
  final FootballGame game;
  final PositionSystem posSys;

  BallTrailSystem(this.game, this.posSys);

  @override
  void update(EcsWorld world, double dt) {
    for (final e in world.entitiesWith<EcsBallComponent>()) {
      final ballComp = e.getComponent<EcsBallComponent>()!;
      final sizeComp = e.getComponent<SizeComponent>();
      final velComp = e.getComponent<VelocityComponent>();
      final posComp = e.getComponent<EcsPositionComponent>();

      if (velComp != null && velComp.velocity.length2 > 1) {
        ballComp.angle += velComp.velocity.length * dt * ballComp.angleSpin;
      }

      if (velComp != null &&
          velComp.velocity.length2 > 0.2 &&
          posComp != null) {
        // Calcolo posizione assoluta con PositionSystem
        final absPos = PositionUtils.getAbsolutePosition(
          relative: Vector2(posComp.x, posComp.y),
          radius: sizeComp?.width ?? 20.0,
          fieldPosition: game.fieldComponent.position,
          fieldSize: game.fieldComponent.size,
          anchor: Anchor.center,
        );
        game.add(BallTrail(absPos.clone()));
      }
    }
  }
}
