import 'package:football_sim_core/ai/fsm/messaging/message.dart';
import 'package:football_sim_core/ai/fsm/messaging/message_receiver.dart';
import 'package:football_sim_core/ai/fsm/messaging/message_sender.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'telegram.freezed.dart';

/// Rappresenta un messaggio tra agenti nel simulatore.
@Freezed(equal: false)
abstract class Telegram with _$Telegram {
  const Telegram._(); // Costruttore privato per metodi personalizzati
  factory Telegram.create({
    required String id,
    required MessageSender sender,
    required MessageReceiver receiver,
    required Message message,
    String? additionalInfo,
    DateTime? messageTime,
  }) = _Telegram;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Telegram && other.id == id);

  @override
  int get hashCode => id.hashCode;

  factory Telegram({
    required MessageSender sender,
    required MessageReceiver receiver,
    required Message message,
    String? additionalInfo,
    DateTime? messageTime,
  }) => Telegram.create(
    id: Uuid().v4(),
    sender: sender,
    receiver: receiver,
    message: message,
    additionalInfo: additionalInfo,
    messageTime: messageTime,
  );

  /// Indica se il messaggio va gestito subito.
  bool get immediate => messageTime == null;

  /// Ordina due Telegram in base al tempo di invio.
  bool isBefore(Telegram other) {
    if (immediate || other.messageTime == null) return true;
    return messageTime!.isBefore(other.messageTime!);
  }

  bool isElapsed([DateTime? now]) {
    if (immediate) return true;
    return messageTime!.isBefore(now ?? DateTime.now());
  }

  @override
  String toString() {
    return 'Telegram(sender: ${sender.id}, receiver: ${receiver.id}, message: $message, messageTime: $messageTime)';
  }
}
