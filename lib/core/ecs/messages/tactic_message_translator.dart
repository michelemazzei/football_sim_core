import 'package:flame/game.dart';
import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
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

    // Sostituiamo mapOrNull con lo switch di Dart 3
    return switch (message) {
      TacticalMoveToZone m => <PlayerMessage>[
        MoveToPosition(
          receiver: m.receiver,
          target: _getGridCenter(_grid!, m.targetZone),
          // Se serve passare anche ack/onAck, ora sono accessibili da m
          requiresAck: m.requiresAck,
          onAck: m.onAck,
        ),
      ],

      // Qui aggiungerai gli altri casi man mano che implementi nuove tattiche
      // Es: TacticalPressing m => ...
      _ => _logUnhandled(message),
    };
  }

  List<PlayerMessage> _logUnhandled(TacticMessage message) {
    logger.warning('⚠️ Unhandled TacticMessage: ${message.runtimeType}');
    return <PlayerMessage>[];
  }
}
