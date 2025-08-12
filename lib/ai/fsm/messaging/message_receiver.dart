import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';

/// Classe base per entità che possono ricevere messaggi.
mixin MessageReceiver {
  String get uuid;

  // MessageReceiver(this.uuid);

  /// Metodo da sovrascrivere: gestisce un messaggio in arrivo.
  /// Ritorna `true` se il messaggio è stato gestito correttamente.
  bool handleMessage(Telegram telegram) => false;
}
