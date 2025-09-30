import 'package:football_sim_core/ai/fsm/messaging/message.dart';
import 'package:football_sim_core/ai/fsm/messaging/message_receiver.dart';
import 'package:football_sim_core/ai/fsm/messaging/message_sender.dart';
import 'package:football_sim_core/ai/fsm/messaging/player_messages.dart';
import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:logging/logging.dart';

/// Gestisce l'invio dei messaggi tra agenti.
/// Supporta messaggi immediati e ritardati.
class MessageDispatcher {
  final logger = Logger('ai.fsm.messaging.MessageDispatcher');
  // Costanti simboliche
  static const sendMsgImmediately = 0;
  static const noAdditionalInfo = 1;
  static const senderIdIrrelevant = -1;

  /// Coda dei messaggi ritardati
  final priorityQueue = <Telegram>[];

  /// Singleton instance
  static final instance = MessageDispatcher._();
  MessageDispatcher._();
  factory MessageDispatcher() => instance;

  void _discharge(Telegram telegram) {
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

  void consume<MessageType extends Message>({
    void Function(Telegram message)? discharge,

    int numerOfMessages = 1,
  }) {
    final now = DateTime.now();

    priorityQueue.sort(
      (a, b) => a.messageTime?.compareTo(b.messageTime ?? now) ?? 0,
    );
    final readyMessages = priorityQueue
        .where(
          (msg) =>
              msg.messageTime?.isBefore(now) ??
              true && msg.message is MessageType,
        )
        .take(numerOfMessages)
        .toList();

    for (final msg in readyMessages) {
      discharge != null ? discharge(msg) : _discharge(msg);
    }
    priorityQueue.removeWhere((msg) => readyMessages.contains(msg));
  }

  void consumeElapsed<MessageType extends Message>({
    void Function(Telegram message)? discharge,
  }) => consume<MessageType>(numerOfMessages: 100, discharge: discharge);

  /// Invia un messaggio, immediato o ritardato.
  void dispatchMessage({
    int delay = 0,
    required MessageSender sender,
    required MessageReceiver receiver,
    required Message message,
    dynamic additionalInfo,
  }) {
    final telegram = Telegram(
      sender: sender,
      receiver: receiver,
      message: message,
      messageTime: delay == 0
          ? null
          : DateTime.now().add(Duration(seconds: delay)),
    );

    logger.fine('📲 - $telegram');
    priorityQueue.add(telegram);
  }
}
