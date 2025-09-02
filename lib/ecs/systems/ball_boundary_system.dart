// lib/systems/ball_boundary_system.dart

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/ecs/components/ball_out_of_bounds_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/components/ecs_position_component.dart';

import 'package:football_sim_core/ecs/systems/ecs_system.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';

import 'package:football_sim_core/game/football_game.dart';

/// Controlla se la palla esce dal campo e, in tal caso, chiama
/// il callback onOutOfBounds sul suo BallLogicComponent.
class BallBoundarySystem extends EcsSystem {
  final FootballGame game;

  BallBoundarySystem(this.game);

  @override
  void update(EcsWorld world, double dt) {
    final fieldPos = game.fieldComponent.position;
    final fieldSize = game.fieldComponent.size;
    final leftBound = fieldPos.x;
    final rightBound = fieldPos.x + fieldSize.x;
    final topBound = fieldPos.y;
    final bottomBound = fieldPos.y + fieldSize.y;

    // Filtra solo le entità che hanno un BallLogicComponent
    for (final e in world.entitiesWith<BallOutOfBoundsComponent>()) {
      final posComp = e.getComponent<EcsPositionComponent>();
      final sizeComp = e.getComponent<SizeComponent>();

      if (posComp == null) continue;

      // Calcola posizione assoluta (campo + percentuale)
      final absX = fieldPos.x + posComp.x * fieldSize.x;
      final absY = fieldPos.y + posComp.y * fieldSize.y;
      final absolute = Vector2(absX, absY);

      // Determina la mezza dimensione (per l’anchor center)

      final Vector2 size = sizeComp?.size ?? Vector2.all(32);
      final halfSize = size / 2;

      // Verifica fuori campo
      final outLeft = absolute.x - halfSize.x < leftBound;
      final outRight = absolute.x + halfSize.x > rightBound;
      final outTop = absolute.y - halfSize.y < topBound;
      final outBottom = absolute.y + halfSize.y > bottomBound;

      if (outLeft || outRight || outTop || outBottom) {
        debugPrint('out of bounds: $absolute');
      }
    }
  }
}
