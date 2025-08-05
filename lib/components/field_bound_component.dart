import 'package:flame/components.dart';

import '../game/football_game.dart';

abstract class FieldBoundComponent extends SpriteComponent
    with HasGameReference<FootballGame> {
  Vector2 relativePosition = Vector2(0.5, 0.5);
  double sizeRatio = 0.05;
  bool _needsResize = true;

  void onResizeAndReposition();

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    _needsResize = true;
  }

  bool updateRelativePosition() {
    final field = game.fieldComponent;
    if (field.size.x == 0 || field.size.y == 0) return false;

    relativePosition = (position - field.position).clone()..divide(field.size);
    return true;
  }

  void resizeAndReposition() {
    final field = game.fieldComponent;
    size = Vector2.all(field.size.x * sizeRatio);

    final offset = field.size.clone()..multiply(relativePosition);
    position = field.position + offset;

    onResizeAndReposition();
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (_needsResize && game.fieldComponent.size.x > 0) {
      resizeAndReposition();
      _needsResize = false;
    }
  }
}
