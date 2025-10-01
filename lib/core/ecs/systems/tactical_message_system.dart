import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/core/ecs/messages/tactic_message_translator.dart';
import 'package:football_sim_core/core/ecs/messages/tactic_messages.dart';
import 'package:football_sim_core/ecs/components/action_queue_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';
import 'package:football_sim_core/ecs/systems/message_dispatcher_system.dart';
import 'package:logging/logging.dart';

class TacticalMessageSystem extends EcsSystem {
  final logger = Logger('core.ecs.systems.TacticalMessageSystem');
  @override
  void update(EcsWorld world, double dt) {
    // final dispatcher = world.getResource<MessageDispatcherSystem>();

    // if (dispatcher == null) return;
    // for (final entity in world.entitiesWith<TacticalMessageComponent>()) {
    //   final telegram = entity
    //       .getComponent<TacticalMessageComponent>()
    //       ?.telegram;
    //   if (telegram == null) continue;
    //   Message message = telegram.message;
    //   final translator = TacticMessageTranslator();
    //   final translated = translator.translate(message as TacticMessage);
    //   _enqueueTranslatedMessages(
    //     receiver: telegram.receiver,
    //     messages: translated,
    //     cancelPending: true,
    //     dispatcher: dispatcher,
    //   );
    //   message.onAck?.call();
    //   dispatcher.sendMessage(
    //     sender: entity,
    //     receiver: entity,
    //     message: tacticMessage,
    //   );
    //   entity.removeComponent<TacticalMessageComponent>();
    // }
  }

  void _enqueueTranslatedMessages({
    required EcsEntity receiver,
    required List<PlayerMessage> messages,
    required bool cancelPending,
    required MessageDispatcherSystem dispatcher,
  }) {
    // var queue = receiver.getComponent<ActionQueueComponent>();
    // if (queue == null) {
    //   receiver.addComponent(ActionQueueComponent());
    //   queue = receiver.getComponent<ActionQueueComponent>();
    //   return;
    // }
    // for (final message in queue.actions) {
    //   message.message.cancelled = cancelPending;
    // }

    // for (final msg in messages) {
    //   _enqueue(queue, msg);
    //   logger.fine('📥 Enqueued ${msg.runtimeType} for ${receiver.id}');
    // }
  }

  Message? _logUnhandled(Message message) {
    logger.warning('⚠️ Unhandled TacticMessage: ${message.toShortString()}');
    return null;
  }
}
