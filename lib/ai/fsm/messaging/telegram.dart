import 'package:football_sim_core/ai/fsm/messaging/message.dart';
import 'package:football_sim_core/ai/fsm/messaging/message_receiver.dart';
import 'package:football_sim_core/ai/fsm/messaging/message_sender.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'telegram.freezed.dart';

abstract class Telegram implements Comparable<Telegram> {
  String get id;
  MessageSender? get sender;
  MessageReceiver get receiver;
  Message get message;
  bool get cancelled;

  DateTime? get messageTime;
  DateTime? get timeOut;
}

/// Rappresenta un messaggio tra agenti nel simulatore.
@unfreezed
abstract class TelegramUnion with _$TelegramUnion implements Telegram {
  const TelegramUnion._(); // Costruttore privato per metodi personalizzati
  factory TelegramUnion({
    required final String id,
    final MessageSender? sender,
    required final MessageReceiver receiver,
    final DateTime? timeOut,
    required final Message message,
    @Default(false) bool cancelled,
    final String? additionalInfo,
    final DateTime? messageTime,
  }) = _TelegramUnion;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Telegram && other.id == id);

  @override
  int compareTo(Telegram other) {
    if (this == other) return 0;
    if (messageTime == null && other.messageTime == null) return 0;
    if (messageTime == null) return -1;
    if (other.messageTime == null) return 1;
    return messageTime!.compareTo(other.messageTime!);
  }

  @override
  int get hashCode => id.hashCode;

  factory TelegramUnion.create({
    final MessageSender? sender,
    required final MessageReceiver receiver,
    required final Message message,
    final String? additionalInfo,
    final DateTime? timeOut,
    final DateTime? messageTime,
  }) => TelegramUnion(
    id: Uuid().v4(),
    sender: sender,
    cancelled: false,
    timeOut: timeOut,
    receiver: receiver,
    message: message,
    additionalInfo: additionalInfo,
    messageTime: messageTime,
  );

  factory TelegramUnion.delayed({
    required final MessageSender sender,
    required final MessageReceiver receiver,
    required final Message message,
    final String? additionalInfo,
    required final DateTime messageTime,
  }) => TelegramUnion(
    id: Uuid().v4(),
    sender: sender,
    cancelled: false,
    timeOut: null,
    receiver: receiver,
    message: message,
    additionalInfo: additionalInfo,
    messageTime: messageTime,
  );

  factory TelegramUnion.immediate({
    required final MessageSender sender,
    required final MessageReceiver receiver,
    required final Message message,
    final String? additionalInfo,
  }) => TelegramUnion(
    id: Uuid().v4(),
    sender: sender,
    cancelled: false,
    timeOut: null,
    receiver: receiver,
    message: message,
    additionalInfo: additionalInfo,
    messageTime: null,
  );

  @override
  String toString() {
    return 'Telegram(sender: ${sender?.id ?? -1}, receiver: ${receiver.id}, message: $message, messageTime: $messageTime)';
  }
}

extension TelegramExtension on Telegram {
  /// Indica se il messaggio va gestito subito.
  bool get immediate => messageTime == null;

  bool isReady([DateTime? now]) {
    if (immediate) return true;
    return messageTime!.isBefore(now ?? DateTime.now());
  }

  bool isExpired() {
    return messageTime != null && messageTime!.isBefore(DateTime.now());
  }
}
