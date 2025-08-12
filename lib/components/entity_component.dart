import 'package:flame/components.dart';
import 'package:football_sim_core/controllers/ientity_controller.dart';
import 'package:football_sim_core/game/football_game.dart';

abstract class EntityComponent<Controller extends IEntityController>
    extends PositionComponent
    with HasGameReference<FootballGame> {
  late final Controller controller;

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

  void onPostUpdate(double dt) {}

  @override
  void update(double dt) {
    super.update(dt);

    if (_needsResize && game.fieldComponent.size.x > 0) {
      resizeAndReposition();
      _needsResize = false;
    } else {
      controller.update(dt);
      position = controller.position + size / 2;
    }

    onPostUpdate(dt);
  }

  Vector2 toAbsolute(Vector2 relative) =>
      position + (size.clone()..multiply(relative));
  Vector2 toRelative(Vector2 absolute) =>
      (absolute - position).clone()..divide(size);
}
