import 'package:football_sim_core/ai/fsm/messaging/message.dart';
import 'package:football_sim_core/ai/fsm/messaging/message_receiver.dart';
import 'package:football_sim_core/ai/fsm/messaging/message_sender.dart';
import 'package:uuid/uuid.dart';

abstract interface class Telegram implements Comparable<Telegram> {
  String get id;
  MessageSender? get sender;
  MessageReceiver get receiver;
  Message get message;
  bool get cancelled;
  DateTime? get messageTime;
  DateTime? get timeOut;
  String? get additionalInfo;
}

class TelegramUnion implements Telegram {
  @override
  final String id;
  @override
  final MessageSender? sender;
  @override
  final MessageReceiver receiver;
  @override
  final Message message;
  @override
  final DateTime? messageTime;
  @override
  final DateTime? timeOut;
  @override
  final String? additionalInfo;

  @override
  bool cancelled; // Non final perché può essere annullato

  TelegramUnion({
    required this.id,
    this.sender,
    required this.receiver,
    required this.message,
    this.messageTime,
    this.timeOut,
    this.additionalInfo,
    this.cancelled = false,
  });

  // Factory Method: Create
  factory TelegramUnion.create({
    MessageSender? sender,
    required MessageReceiver receiver,
    required Message message,
    String? additionalInfo,
    DateTime? timeOut,
    DateTime? messageTime,
  }) => TelegramUnion(
    id: const Uuid().v4(),
    sender: sender,
    receiver: receiver,
    message: message,
    additionalInfo: additionalInfo,
    timeOut: timeOut,
    messageTime: messageTime,
  );

  // Factory Method: Immediate
  factory TelegramUnion.immediate({
    required MessageSender sender,
    required MessageReceiver receiver,
    required Message message,
    String? additionalInfo,
  }) => TelegramUnion(
    id: const Uuid().v4(),
    sender: sender,
    receiver: receiver,
    message: message,
    additionalInfo: additionalInfo,
  );

  // Factory Method: Delayed
  factory TelegramUnion.delayed({
    required MessageSender sender,
    required MessageReceiver receiver,
    required Message message,
    required DateTime messageTime,
    String? additionalInfo,
  }) => TelegramUnion(
    id: const Uuid().v4(),
    sender: sender,
    receiver: receiver,
    message: message,
    messageTime: messageTime,
    additionalInfo: additionalInfo,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Telegram && other.id == id);

  @override
  int get hashCode => id.hashCode;

  @override
  int compareTo(Telegram other) {
    if (this == other) return 0;
    if (messageTime == null && other.messageTime == null) return 0;
    if (messageTime == null) return -1;
    if (other.messageTime == null) return 1;
    return messageTime!.compareTo(other.messageTime!);
  }

  @override
  String toString() {
    return 'Telegram(id: ${id.substring(0, 8)}, sender: ${sender?.id ?? "None"}, receiver: ${receiver.id}, message: $message)';
  }
}

extension TelegramX on Telegram {
  bool get immediate => messageTime == null;

  bool isReady([DateTime? now]) {
    if (immediate) return true;
    return messageTime!.isBefore(now ?? DateTime.now());
  }

  bool isExpired() => timeOut != null && timeOut!.isBefore(DateTime.now());
}
