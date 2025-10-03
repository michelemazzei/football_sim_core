import 'package:football_sim_core/ai/fsm/messaging/player_messages.dart';
import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';
import 'package:football_sim_core/core/ecs/messages/tactic_messages.dart';
import 'package:football_sim_core/core/field/field_grid.dart';

class TacticalActionTranslator {
  static Telegram? translate(Telegram telegram, FieldGrid fieldGrid) {
    final message = telegram.message;

    if (message is TacticMessage) {
      message.when(
        moveToZone: (receiver, cancelled, requiresAck, onAck, targetZone) {
          final target = fieldGrid.centerOfZone(targetZone);
          return TelegramUnion.create(
            receiver: receiver,
            message: PlayerUnion.moveToPosition(
              receiver: receiver,
              target: target,
              onAck: onAck,
              requiresAck: requiresAck,
            ),
          );
        },
      );
    }
    return null;
  }
}
