// lib/systems/position_system.dart

import 'package:flame/components.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/components/ecs_position_component.dart';
import 'package:football_sim_core/ecs/components/render_component.dart';
import 'package:football_sim_core/ecs/ecs_system.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';

import 'package:football_sim_core/game/football_game.dart';

class PositionSystem extends EcsSystem {
  final EcsWorld world;
  final FootballGame game;

  PositionSystem(this.game) : world = game.ecsWorld;

  @override
  void update(double dt) {
    // Pre-lettura di campo e dimensioni
    final fieldPos = game.fieldComponent.position;
    final fieldSize = game.fieldComponent.size;

    // Per ogni entità che ha sia PositionComponent che RenderComponent
    for (final e in world.entitiesWith<EcsPositionComponent>()) {
      final posComp = e.getComponent<EcsPositionComponent>()!;
      final renderComp = e.getComponent<RenderComponent>();
      if (renderComp == null) continue;

      // Coordinate assolute sul campo
      final absX = fieldPos.x + posComp.x * fieldSize.x;
      final absY = fieldPos.y + posComp.y * fieldSize.y;
      final absolute = Vector2(absX, absY);

      // Se c’è un SizeComponent, centriamo l’anchor
      final sizeComp = e.getComponent<SizeComponent>();
      if (sizeComp != null) {
        absolute.x -= sizeComp.width / 2;
        absolute.y -= sizeComp.height / 2;
      }

      // Applica al Positionable di Flame
      renderComp.component.position = absolute;
    }
  }

  Vector2 getAbsolutePosition(EcsEntity ecsEntity) {
    final posComp = ecsEntity.getComponent<EcsPositionComponent>();
    if (posComp == null) {
      return Vector2.zero();
    }
    final fieldPos = game.fieldComponent.position;
    final fieldSize = game.fieldComponent.size;

    Vector2 relative = Vector2(posComp.x, posComp.y);
    return _getAbsolutePosition(
      relative: relative,
      fieldPosition: fieldPos,
      fieldSize: fieldSize,
      anchor: Anchor.center,
    );
  }

  // Calcolo dell’offset di rendering (resta identico)
  Vector2 _getAbsolutePosition({
    required Vector2 relative,
    required Vector2 fieldPosition,
    required Vector2 fieldSize,
    Anchor anchor = Anchor.center,
  }) {
    final offset = relative.clone()..multiply(fieldSize);
    // ... stessa logica di prima per gli anchor
    // ritorna fieldPosition + offset - anchorOffset
    // (puoi ricopiare il tuo switch su Anchor)
    return fieldPosition + offset;
  }
}
