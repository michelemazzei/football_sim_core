import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/components/ecs_player_component.dart';
import 'package:football_sim_core/ecs/components/ecs_position_component.dart';
import 'package:football_sim_core/ecs/components/possession_component.dart';
import 'package:football_sim_core/ecs/components/referee_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';

class PossessionSystem extends EcsSystem {
  final double possessionRadius = 0.1; // metri

  @override
  void update(EcsWorld world, double dt) {
    final clock = world.entitiesWith<GameClockComponent>().firstOrNull;
    final timeIsUp =
        (clock != null && clock.getComponent<GameClockComponent>()!.isTimeUp);
    final ball = world.entitiesWith<EcsBallComponent>().firstOrNull;
    final ballPos = ball?.getComponent<EcsPositionComponent>()?.position;

    for (final player in world.entitiesWith<EcsPlayerComponent>()) {
      final playerPos = player.getComponent<EcsPositionComponent>()?.position;
      final possession = player.getComponent<PossessionComponent>();

      if (ballPos != null && playerPos != null && possession != null) {
        final distance = (ballPos - playerPos).length;
        possession.hasBall = distance < possessionRadius && !timeIsUp;
      }
    }
  }
}
