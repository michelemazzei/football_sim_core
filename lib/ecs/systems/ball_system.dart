// lib/systems/ball_system.dart

import 'package:football_sim_core/components/ball_trail.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/components/ecs_position_component.dart';
import 'package:football_sim_core/ecs/systems/position_system.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:football_sim_core/ecs/ecs_system.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/components/ball_component.dart';
import 'package:football_sim_core/game/football_game.dart';

class BallSystem extends EcsSystem {
  final EcsWorld world;
  final FootballGame game;
  final PositionSystem posSys;

  BallSystem(this.world, this.game, this.posSys);

  @override
  void update(double dt) {
    // Calcola parametri di campo una volta sola
    final fieldPos = game.fieldComponent.position;
    final fieldSize = game.fieldComponent.size;

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

  /// Calcia la palla: imposta direttamente la VelocityComponent
  void kick(EcsEntity e, Vector2 direction, double strength) {
    final velComp = e.getComponent<VelocityComponent>();
    final cfgComp = e.getComponent<MovementConfigComponent>();

    if (velComp == null) return;

    // Clamp sulla massima velocità configurata
    final maxSp = cfgComp?.maxVelocity ?? strength;
    final clamped = strength.clamp(0, maxSp);
    velComp.velocity = direction.normalized() * clamped;
  }
}
