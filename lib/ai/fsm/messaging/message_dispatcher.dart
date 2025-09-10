import 'dart:developer';

import 'package:football_sim_core/ai/fsm/messaging/message.dart';
import 'package:football_sim_core/ai/fsm/messaging/message_receiver.dart';
import 'package:football_sim_core/ai/fsm/messaging/message_sender.dart';
import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:logging/logging.dart';

/// Gestisce l'invio dei messaggi tra agenti.
/// Supporta messaggi immediati e ritardati.
class MessageDispatcher {
  final logger = Logger('Logging.MessageDispatcher');
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

  void discharge(MessageReceiver receiver, Telegram telegram) {
    if (receiver is EcsEntity) {
      final fsm = receiver.getFsmComponent();
      final handled =
          fsm?.handleMessage(telegram) ?? receiver.handleMessage(telegram);

      if (!handled) {
        logger.fine('🗑️ Message not handled by $receiver');
      }
    } else {
      final handled = receiver.handleMessage(telegram);
      if (!handled) {
        logger.fine('🗑️ Message not handled by $receiver');
      }
    }
  }

  /// Controlla e invia messaggi ritardati che sono maturati.
  void dispatchDelayedMessages() {
    final now = DateTime.now();

    final readyMessages = priorityQueue
        .where((msg) => msg.messageTime?.isBefore(now) ?? true)
        .toList();

    for (final msg in readyMessages) {
      discharge(msg.receiver, msg);
    }

    priorityQueue.removeWhere((msg) => msg.messageTime?.isBefore(now) ?? true);
  }

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

    if (delay == 0) {
      logger.fine('Send message from: $sender to $receiver message: $message');
      discharge(receiver, telegram);
    } else {
      priorityQueue.add(telegram);
      log('Recorded delayed message $telegram', name: '📲');
    }
  }
}
