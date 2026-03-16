// lib/systems/ball_boundary_system.dart

import 'package:flutter/material.dart';
import 'package:football_sim_core/ai/config/field_geometry.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';
import 'package:football_sim_core/game/football_game.dart';

/// Controlla se la palla esce dal campo e, in tal caso, chiama
/// il callback onOutOfBounds sul suo BallLogicComponent.
class BallBoundarySystem extends EcsSystem {
  final FootballGame game;

  BallBoundarySystem(this.game);
  @override
  void update(EcsWorld world, double dt) {
    for (final e in world.entitiesWith<BallOutOfBoundsComponent>()) {
      final pos = e.getComponent<MovingComponent>()?.currentPosition;
      final outComp = e.getComponent<BallOutOfBoundsComponent>()!;

      if (pos == null || outComp.isOutOfBounds) continue;

      int lateralSign = FieldGeometry.checkLateralBounds(pos);
      int endLineSign = FieldGeometry.checkEndLineBounds(pos);

      if (lateralSign != 0) {
        outComp.isOutOfBounds = true;
        outComp.type = OutOfBoundsType.sideLine;
        debugPrint(
          "Palla fuori lateralmente verso ${lateralSign == -1 ? 'Sopra' : 'Sotto'}",
        );
      } else if (endLineSign != 0) {
        outComp.isOutOfBounds = true;
        int goal = FieldGeometry.checkGoal(pos);

        if (goal != 0) {
          outComp.type = OutOfBoundsType.goalScored;
          debugPrint("GOAL nella porta $goal!");
        } else {
          outComp.type = OutOfBoundsType.goalLine;
          debugPrint(
            "Fondo campo a ${endLineSign == -1 ? 'Sinistra' : 'Destra'}",
          );
        }
      }

      if (outComp.isOutOfBounds) {
        world.getResource<GameClockComponent>()?.speedFactor = 0.0;
      }
    }
  }
}
