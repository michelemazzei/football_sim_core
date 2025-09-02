// lib/commands/command.dart
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';

class CommandSystem extends EcsSystem {
  @override
  void update(EcsWorld world, double dt) {
    for (var e in world.entitiesWith<EcsBallComponent>()) {
      // final ball = e.getComponent<EcsBallComponent>()!.ball;
      // if (ball.commands.isEmpty) continue;

      // for (var c in List.from(ball.commands)) {
      //   if (c.type == CommandType.stopBall) {
      //     e.getComponent<VelocityComponent>()!.velocity = Vector2.zero();
      //   }
      //   // gestisci altri comandi…
      // }
      // ball.commands.clear();
    }
  }
}
