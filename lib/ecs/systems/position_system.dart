import 'package:flame/components.dart';
import 'package:football_sim_core/ecs/components/ecs_position_component.dart';
import 'package:football_sim_core/ecs/components/render_component.dart';
import 'package:football_sim_core/ecs/components/size_component.dart';
import 'package:football_sim_core/ecs/ecs_system.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/game/football_game.dart';

class PositionSystem extends EcsSystem {
  final FootballGame game;
  final EcsWorld world;

  PositionSystem(this.game) : world = game.ecsWorld;

  @override
  void update(double dt) {
    final fieldPos = game.fieldComponent.position;
    final fieldSize = game.fieldComponent.size;

    for (final entity
        in world.entitiesWithAll<EcsPositionComponent, RenderComponent>()) {
      final posComp = entity.getComponent<EcsPositionComponent>()!;
      final renderComp = entity.getComponent<RenderComponent>()!;
      final sizeComp = entity.getComponent<SizeComponent>();

      final absolute = _getAbsolutePosition(
        relative: Vector2(posComp.x, posComp.y),
        fieldPosition: fieldPos,
        fieldSize: fieldSize,
        anchor: Anchor.center,
        size: sizeComp != null
            ? Vector2(sizeComp.width, sizeComp.height)
            : null,
      );

      renderComp.component.position = absolute;
    }
  }

  /// Metodo pubblico per ottenere la posizione assoluta di un'entità
  Vector2 getAbsolutePosition(EcsEntity entity) {
    final posComp = entity.getComponent<EcsPositionComponent>();
    if (posComp == null) return Vector2.zero();

    final sizeComp = entity.getComponent<SizeComponent>();
    return _getAbsolutePosition(
      relative: Vector2(posComp.x, posComp.y),
      fieldPosition: game.fieldComponent.position,
      fieldSize: game.fieldComponent.size,
      anchor: Anchor.center,
      size: sizeComp != null ? Vector2(sizeComp.width, sizeComp.height) : null,
    );
  }

  /// Calcolo della posizione assoluta sul campo
  Vector2 _getAbsolutePosition({
    required Vector2 relative,
    required Vector2 fieldPosition,
    required Vector2 fieldSize,
    Anchor anchor = Anchor.center,
    Vector2? size,
  }) {
    final offset = relative.clone()..multiply(fieldSize);
    final anchorOffset = _getAnchorOffset(anchor, size ?? Vector2.zero());
    return fieldPosition + offset - anchorOffset;
  }

  /// Calcolo dell’offset in base all’anchor
  Vector2 _getAnchorOffset(Anchor anchor, Vector2 size) {
    switch (anchor) {
      case Anchor.topLeft:
        return Vector2.zero();
      case Anchor.topCenter:
        return Vector2(size.x / 2, 0);
      case Anchor.topRight:
        return Vector2(size.x, 0);
      case Anchor.centerLeft:
        return Vector2(0, size.y / 2);
      case Anchor.centerRight:
        return Vector2(size.x, size.y / 2);
      case Anchor.bottomLeft:
        return Vector2(0, size.y);
      case Anchor.bottomCenter:
        return Vector2(size.x / 2, size.y);
      case Anchor.bottomRight:
        return Vector2(size.x, size.y);
      default:
        return Vector2(0, 0);
    }
  }
}
