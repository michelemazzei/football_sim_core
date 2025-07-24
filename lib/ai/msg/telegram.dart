import 'package:football_sim_core/ai/msg/message_receiver.dart';
import 'package:football_sim_core/ai/msg/messages.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'telegram.freezed.dart';

/// Rappresenta un messaggio tra agenti nel simulatore.
@freezed
abstract class Telegram with _$Telegram {
  const Telegram._(); // Costruttore privato per metodi personalizzati

  factory Telegram({
    required MessageReceiver sender,
    required MessageReceiver receiver,
    required Messages message,
    String? additionalInfo,
    DateTime? messageTime,
  }) = _Telegram;

  /// Indica se il messaggio va gestito subito.
  bool get immediate => messageTime == null;

  /// Ordina due Telegram in base al tempo di invio.
  bool isBefore(Telegram other) {
    if (immediate || other.messageTime == null) return true;
    return messageTime!.isBefore(other.messageTime!);
  }

  @override
  String toString() {
    return 'Telegram(sender: ${sender.uuid}, receiver: ${receiver.uuid}, message: $message, messageTime: $messageTime)';
  }
}
