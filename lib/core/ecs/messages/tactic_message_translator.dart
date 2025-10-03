import 'package:flame/game.dart';
import 'package:football_sim_core/ai/fsm/messaging/player_messages.dart';
import 'package:football_sim_core/core/ecs/messages/tactic_messages.dart';
import 'package:football_sim_core/core/field/field_grid.dart';
import 'package:football_sim_core/core/field/zone.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:logging/logging.dart';

class TacticMessageTranslator {
  final EcsWorld world;
  FieldGrid? _grid;
  final logger = Logger('core.ecs.messages.TacticMessageTranslator');

  TacticMessageTranslator(this.world);

  Vector2 _getGridCenter(FieldGrid grid, Zone zone) => grid.centerOfZone(zone);

  /// Traduce un messaggio tattico in una lista di messaggi di sistema
  List<PlayerMessage> translate(TacticMessage message) {
    _grid ??= world.getResource<FieldGrid>();
    if (_grid == null) return [];
    return message.mapOrNull(
          moveToZone: (TacticalMoveToZone m) => <PlayerMessage>[
            MoveToPosition(
              receiver: m.receiver,
              target: _getGridCenter(_grid!, m.targetZone),
            ),
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
