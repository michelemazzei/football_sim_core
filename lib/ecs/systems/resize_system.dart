import 'package:flame/components.dart';
import 'package:football_sim_core/ecs/components/render_component.dart';
import 'package:football_sim_core/ecs/components/size_ratio_component.dart';
import 'package:football_sim_core/ecs/ecs_system.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/game/football_game.dart';

class ResizeSystem extends EcsSystem {
  final FootballGame game;

  ResizeSystem(this.game);

  @override
  void update(EcsWorld world, double dt) {
    final fieldSize = game.fieldComponent.size;
    if (fieldSize.x <= 0 || fieldSize.y <= 0) return;

    for (final entity in world.entitiesWith<RenderComponent>()) {
      final renderComp = entity.getComponent<RenderComponent>()!;
      final ratioComp = entity.getComponent<SizeRatioComponent>();
      if (ratioComp == null) continue;
      final rawSize = fieldSize.x * ratioComp.ratio;
      final double clampedSize = rawSize.clamp(5, 40);
      renderComp.component.size = Vector2.all(clampedSize);
    }
  }
}
