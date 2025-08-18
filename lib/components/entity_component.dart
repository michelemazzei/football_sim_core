import 'package:flame/components.dart';
import 'package:football_sim_core/ecs/components/ecs_position_component.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/game/football_game.dart';

@Deprecated('Use EntityComponent instead')
abstract class EntityComponent extends PositionComponent
    with HasGameReference<FootballGame> {
  final EcsEntity entity;
  final FootballGame footballGame;

  double sizeRatio = 0.05;
  bool _needsResize = true;

  EntityComponent({required this.entity, required this.footballGame})
    : super() {
    anchor = Anchor.center;
  }
  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    _needsResize = true;
  }

  void resizeAndReposition() {
    final posComp = entity.getComponent<EcsPositionComponent>();
    if (posComp == null) return;
    final field = game.fieldComponent;
    if (field.size.x <= 0 || field.size.y <= 0) return;

    final rawSize = field.size.x * sizeRatio;
    size = Vector2.all(rawSize.clamp(10, 30));
    position = posComp.position + size / 2;
  }

  void onPostUpdate(double dt) {}

  @override
  void update(double dt) {
    super.update(dt);

    if (_needsResize && game.fieldComponent.size.x > 0) {
      resizeAndReposition();
      _needsResize = false;
    } else {
      final posComp = entity.getComponent<EcsPositionComponent>();
      if (posComp == null) return;
      position = posComp.position + size / 2;
    }

    onPostUpdate(dt);
  }

  /// Metodo per convertire coordinate relative in assolute
  Vector2 getAbsolutePosition({
    required Vector2 relative,
    required double radius,
    required Vector2 fieldPosition,
    required Vector2 fieldSize,
    required Anchor anchor,
  }) {
    final offset = relative.clone()..multiply(fieldSize);

    Vector2 anchorOffset;
    switch (anchor) {
      case Anchor.topLeft:
        anchorOffset = Vector2.zero();
        break;
      case Anchor.center:
        anchorOffset = Vector2(radius, radius);
        break;
      case Anchor.bottomRight:
        anchorOffset = Vector2(radius * 2, radius * 2);
        break;
      default:
        anchorOffset = Vector2(radius, radius);
    }

    return fieldPosition + offset - anchorOffset;
  }

  Vector2 toAbsolute(Vector2 relative) =>
      position + (size.clone()..multiply(relative));
  Vector2 toRelative(Vector2 absolute) =>
      (absolute - position).clone()..divide(size);
}
