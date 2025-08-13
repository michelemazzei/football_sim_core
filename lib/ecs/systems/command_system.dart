// lib/commands/command.dart
import 'package:flame/game.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_system.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';

enum CommandType { stopBall, passTo }

class Command {
  final CommandType type;
  final Map<String, dynamic> data;
  Command(this.type, [this.data = const {}]);
  static Command stopBall() => Command(CommandType.stopBall);
}

class CommandSystem extends EcsSystem {
  final EcsWorld world;
  CommandSystem(this.world);

  @override
  void update(double dt) {
    for (var e in world.entitiesWith<EcsBallComponent>()) {
      final ball = e.getComponent<EcsBallComponent>()!.ball;
      if (ball.commands.isEmpty) continue;

      for (var c in List.from(ball.commands)) {
        if (c.type == CommandType.stopBall) {
          e.getComponent<VelocityComponent>()!.velocity = Vector2.zero();
        }
        // gestisci altri comandi…
      }
      ball.commands.clear();
    }
  }
}
