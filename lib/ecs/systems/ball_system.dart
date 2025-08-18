// lib/systems/ball_system.dart

import 'package:flame/components.dart';
import 'package:football_sim_core/components/ball_trail.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/components/ecs_position_component.dart';
import 'package:football_sim_core/ecs/ecs_system.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/ecs/systems/position_system.dart';
import 'package:football_sim_core/game/football_game.dart';

class BallSystem extends EcsSystem {
  final EcsWorld world;
  final FootballGame game;
  final PositionSystem posSys;

  BallSystem(this.game, this.posSys) : world = game.ecsWorld;

  @override
  void update(double dt) {
    for (final e in world.entitiesWith<EcsBallComponent>()) {
      final ballComp = e.getComponent<EcsBallComponent>()!;
      final velComp = e.getComponent<VelocityComponent>();
      final posComp = e.getComponent<EcsPositionComponent>();

      if (velComp != null) {
        // 1) Aggiorna l’angolo di spin
        if (velComp.velocity.length2 > 1) {
          ballComp.angle += velComp.velocity.length * dt * ballComp.angleSpin;
        }

        // 2) Emetti una scia se veloce
        if (velComp.velocity.length2 > 0.2 && posComp != null) {
          final absPos = posSys.getAbsolutePosition(e);
          game.add(BallTrail(absPos.clone()));
        }
      }
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
