import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/core/ecs/messages/tactic_message_translator.dart';
import 'package:football_sim_core/core/ecs/messages/tactic_messages.dart';
import 'package:football_sim_core/ecs/components/action_queue_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';
import 'package:logging/logging.dart';

class FootballMessageSystem extends EcsSystem {
  final logger = Logger('core.ecs.systems.FootballMessageSystem');
  @override
  void update(EcsWorld world, double dt) {
    final sender = world.getResource<MessageSenderComponent>()?.dispatcher;
    if (sender == null) return;
    sender.consume<TacticUnion>(
      discharge: (Telegram telegram) {
        Message message = telegram.message;
        if (telegram.receiver is EcsEntity) {
          final translator = TacticMessageTranslator();
          final translated = translator.translate(message as TacticUnion);
          _enqueueTranslatedMessages(
            receiver: telegram.receiver as EcsEntity,
            messages: translated,
            cancelPending: true,
          );
          message.onAck?.call();
        } else {
          _logUnhandled(message);
        }
      },
    );
  }

  void _enqueueTranslatedMessages({
    required EcsEntity receiver,
    required List<PlayerMessage> messages,
    required bool cancelPending,
  }) {
    var queue = receiver.getComponent<ActionQueueComponent>();
    if (queue == null) {
      receiver.addComponent(ActionQueueComponent());
      queue = receiver.getComponent<ActionQueueComponent>();
      return;
    }
    for (final message in queue.actions) {
      message.message.cancelled = cancelPending;
    }

    for (final msg in messages) {
      queue.enqueue(msg);
      logger.fine('📥 Enqueued ${msg.runtimeType} for ${receiver.id}');
    }
  }

  Message? _logUnhandled(Message message) {
    logger.warning('⚠️ Unhandled TacticMessage: ${message.toShortString()}');
    return null;
  }
}
