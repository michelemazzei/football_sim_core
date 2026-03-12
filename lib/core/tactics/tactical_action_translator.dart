import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/core/ecs/messages/tactic_messages.dart';
import 'package:football_sim_core/core/field/field_grid.dart';

class TacticalActionTranslator {
  static Telegram? translate(Telegram telegram, FieldGrid fieldGrid) {
    final message = telegram.message;

    // Se il messaggio è di tipo TacticMessage, usiamo il pattern matching
    if (message is TacticMessage) {
      return switch (message) {
        TacticalMoveToZone m => TelegramUnion.create(
          receiver: m.receiver,
          message: MoveToPosition(
            // Abbiamo tolto PlayerUnion. prima del nome classe
            receiver: m.receiver,
            target: fieldGrid.centerOfZone(m.targetZone),
            onAck: m.onAck,
            requiresAck: m.requiresAck,
          ),
        ),

        // Se aggiungerai altri TacticMessage (es. TacticalPressing), Dart ti chiederà di gestirli qui
        _ => null,
      };
    }

    return null;
  }
}
