import 'package:football_sim_core/ai/msg/telegram.dart';

/// Classe base per entità che possono ricevere messaggi.
class MessageReceiver {
  final String uuid;

  MessageReceiver(this.uuid);

  /// Metodo da sovrascrivere: gestisce un messaggio in arrivo.
  /// Ritorna `true` se il messaggio è stato gestito correttamente.
  bool handleMessage(Telegram telegram) {
    return false; // Di default non fa nulla.
  }
}
