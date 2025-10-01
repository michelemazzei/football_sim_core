import 'package:football_sim_core/ai/fsm/messaging/player_messages.dart';
import 'package:football_sim_core/core/ecs/messages/tactic_messages.dart';
import 'package:football_sim_core/core/field/zone.dart';
import 'package:logging/logging.dart';

class TacticMessageTranslator {
  final logger = Logger('core.ecs.messages.TacticMessageTranslator');

  /// Traduce un messaggio tattico in una lista di messaggi di sistema
  List<PlayerMessage> translate(TacticMessage message) {
    return message.mapOrNull(
          moveToZone: (TacticalMoveToZone m) => <PlayerMessage>[
            MoveToPosition(receiver: m.receiver, target: m.targetZone.center),
          ],

          // altri casi tattici...
        ) ??
        _logUnhandled(message);
  }

  List<PlayerMessage> _logUnhandled(TacticMessage message) {
    logger.warning('⚠️ Unhandled TacticMessage: ${message.runtimeType}');
    return <PlayerMessage>[];
  }
}
