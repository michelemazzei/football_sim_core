import 'package:football_sim_core/ai/fsm/messaging/player_message_telegram.dart';
import 'package:football_sim_core/ecs/components/action_queue_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';
import 'package:logging/logging.dart';

class ActionQueueSystem extends EcsSystem {
  final logger = Logger('EcsSystem.ActionQueueSystem');
  @override
  void update(EcsWorld world, double dt) {
    for (final entity in world.entitiesWith<ActionQueueComponent>()) {
      final queue = entity.getComponent<ActionQueueComponent>();
      final fsm = entity.getFsmComponent();
      if (queue == null || fsm == null) continue;
      logger.fine(
        'Processing ActionQueue for entity: ${entity.id} - queue length: ${queue.actions.length}',
      );

      if (!queue.isBusy || queue.canInterrupt) {
        final next = queue.dequeue();
        if (next != null) {
          logger.fine('Dequeue action: $next for entity: ${entity.id}');
          fsm.handleMessage(
            next.toTelegram(receiver: entity, sender: queue.sender),
          );
          queue.isBusy = true;
        }
      }
    }
  }
}
