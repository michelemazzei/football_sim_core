import 'package:flame/components.dart';
import 'package:football_sim_core/controllers/sprite_controller.dart';
import 'package:football_sim_core/model/sprite_model.dart';

import '../game/football_game.dart';

abstract class FieldBoundComponent<
  Controller extends SpriteController<Model>,
  Model extends SpriteModel
>
    extends PositionComponent
    with HasGameReference<FootballGame> {
  late final Controller controller;
  Model get model => controller.model;

  double sizeRatio = 0.05;
  bool _needsResize = true;

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    _needsResize = true;
  }

  void resizeAndReposition() {
    final field = game.fieldComponent;
    if (field.size.x <= 0 || field.size.y <= 0) return;

    final rawSize = field.size.x * sizeRatio;
    size = Vector2.all(rawSize.clamp(10, 30));

    position = controller.position + size / 2;
  }

  bool updateRelativePosition() {
    final field = game.fieldComponent;
    if (field.size.x <= 0 || field.size.y <= 0) return false;

    final fieldSizeSafe = field.size.clone();
    model.relativePosition = (position - field.position).clone()
      ..divide(fieldSizeSafe);

    return true;
  }

  void onPostUpdate(double dt) {}

  @override
  void update(double dt) {
    super.update(dt);

    if (_needsResize && game.fieldComponent.size.x > 0) {
      resizeAndReposition(); // ← imposta posizione da relativePosition
      _needsResize = false;
    } else {
      controller.update(dt); // ← aggiorna relativePosition
      position = controller.position + size / 2;
    }

    onPostUpdate(dt);
  }

  Vector2 toAbsolute(Vector2 relative) =>
      position + (size.clone()..multiply(relative));
  Vector2 toRelative(Vector2 absolute) =>
      (absolute - position).clone()..divide(size);
}
