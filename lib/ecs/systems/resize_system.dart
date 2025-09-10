import 'package:flame/components.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';
import 'package:football_sim_core/game/football_game.dart';

class ResizeSystem extends EcsSystem {
  final FootballGame game;

  ResizeSystem(this.game);

  @override
  void update(EcsWorld world, double dt) {
    final fieldSize = game.fieldComponent.size;
    final fieldPos = game.fieldComponent.position;

    if (fieldSize.x <= 0 || fieldSize.y <= 0) return;

    for (final entity in world.entitiesWith<RenderComponent>()) {
      final renderComp = entity.getComponent<RenderComponent>()!;
      final ratioComp = entity.getComponent<SizeRatioComponent>();
      final movingComp = entity.getComponent<MovingComponent>();

      // 1. Resize
      if (ratioComp != null) {
        final rawSize = fieldSize.x * ratioComp.ratio;
        final clampedSize = rawSize.clamp(5, 40);
        renderComp.component.size = Vector2.all(clampedSize.toDouble());
      }

      // 2. Reposition
      if (movingComp != null) {
        final logicalPos = movingComp.currentPosition;
        final screenPos = _getAbsolutePosition(
          relative: logicalPos,
          fieldPosition: fieldPos,
          fieldSize: fieldSize,
          anchor: renderComp.component.anchor,
          size: renderComp.component.size,
        );
        renderComp.component.position = screenPos;
      }
    }
  }

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
        return Vector2(size.x / 2, size.y / 2); // fallback: center
    }
  }
}
