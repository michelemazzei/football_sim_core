import 'dart:ui';

import 'package:flame/components.dart';
import 'package:football_sim_core/components/ball_trail.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/components/ecs_position_component.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/game/football_game.dart';

class EcsBallComponent extends EcsComponent {
  double angle = 0.0;
  double angleSpin = 1.0;

  /// Chiamalo dopo `world.update(dt)` in FootballGame
  void onPostUpdate(EcsEntity entity, FootballGame game, double dt) {
    final velComp = entity.getComponent<VelocityComponent>();
    final posComp = entity.getComponent<EcsPositionComponent>();

    if (velComp != null && velComp.velocity.length2 > 1) {
      angle += velComp.velocity.length * dt * angleSpin;
    }

    if (velComp != null && velComp.velocity.length2 > 0.2 && posComp != null) {
      // Calcolo posizione assoluta con PositionSystem
      final absPos = game.positionSystem.getAbsolutePosition(entity);
      game.add(BallTrail(absPos.clone()));
    }
  }

  /// Inietta la forza di calcio modificando direttamente il VelocityComponent
  void kick(EcsEntity entity, Vector2 direction, double strength) {
    final velComp = entity.getComponent<VelocityComponent>();
    final cfgComp = entity.getComponent<MovementConfigComponent>();

    if (velComp != null) {
      final maxSp = cfgComp?.maxVelocity ?? strength;
      final double clamped = strength.clamp(0, maxSp);
      velComp.velocity = direction.normalized() * clamped;
    }
  }
}
