import 'package:football_sim_core/ai/fsm/messaging/message.dart';
import 'package:football_sim_core/ai/fsm/messaging/message_receiver.dart';
import 'package:football_sim_core/ai/fsm/messaging/message_sender.dart';
import 'package:football_sim_core/ai/fsm/messaging/player_messages.dart';
import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:logging/logging.dart';
import 'package:collection/collection.dart';

/// Gestisce l'invio dei messaggi tra agenti.
/// Supporta messaggi immediati e ritardati.
class MessageDispatcher {
  final logger = Logger('ai.fsm.messaging.MessageDispatcher');
  // Costanti simboliche
  static const sendMsgImmediately = 0;
  static const noAdditionalInfo = 1;
  static const senderIdIrrelevant = -1;

  final _queue = PriorityQueue<Telegram>();

  /// Singleton instance
  static final instance = MessageDispatcher._();
  MessageDispatcher._();
  factory MessageDispatcher() => instance;

  void _discharge(Telegram telegram) {
    if (telegram.cancelled) {
      logger.fine('🗑️ Discarded message ${telegram.message.toShortString()}');
      return;
    }
    MessageReceiver receiver = telegram.receiver;
    if (receiver is EcsEntity) {
      final fsm = receiver.getComponent<FsmComponent>()?.fsm;
      final handled = fsm?.handleMessage(telegram) ?? false;

      if (!handled) {
        logger.fine('🗑️ Message not handled by $receiver');
      } else {
        logger.fine(
          '✅ Consumed ${telegram.message.runtimeType} at ${DateTime.now()}',
        );
        if (telegram.message is PlayerMessage) {
          final playerMessage = telegram.message as PlayerMessage;
          if (playerMessage.requiresAck) playerMessage.onAck?.call();
        }
      }
    } else {
      final handled = receiver.handleMessage(telegram);
      if (!handled) {
        logger.fine('🗑️ Message not handled by $receiver');
      }
    }
  }

  void consume() {
    if (_queue.isEmpty) return;
    final first = _queue.first;
    if (first.isReady() && _queue.remove(first)) _discharge(first);
  }

  /// Invia un messaggio, immediato o ritardato.
  void dispatchMessage({
    int delay = 0,
    required MessageSender sender,
    required MessageReceiver receiver,
    required Message message,
    dynamic additionalInfo,
  }) {
    final telegram = TelegramUnion.create(
      sender: sender,
      receiver: receiver,
      message: message,
      messageTime: delay == 0
          ? null
          : DateTime.now().add(Duration(seconds: delay)),
    );

    logger.fine('📲 - $telegram');
    _queue.add(telegram);
  }
}
