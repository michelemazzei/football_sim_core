import 'package:football_sim_core/ai/decision/action_intent.dart';

class ActionProposal {
  /// Il punteggio di utilità (Utility Score).
  /// Deve essere normalizzato tra 0.0 (inutile) e 1.0 (massima urgenza/opportunità).
  final double score;

  /// L'istruzione pratica che il giocatore dovrà eseguire se questa azione vince.
  final ActionIntent intent;

  /// (Opzionale) Una descrizione per il debug.
  /// Ti aiuterà tantissimo a capire perché un giocatore ha scelto un'azione.
  final String debugSource;

  ActionProposal({
    required this.score,
    required this.intent,
    this.debugSource = "Unknown",
  });

  /// Metodo di utilità per copiare e modificare il punteggio (es. per pesi tattici)
  ActionProposal copyWith({double? newScore}) {
    return ActionProposal(
      score: newScore ?? this.score,
      intent: this.intent,
      debugSource: this.debugSource,
    );
  }

  @override
  String toString() =>
      '[$debugSource] Score: ${score.toStringAsFixed(2)} | $intent';
}
