import 'package:football_sim_core/ai/fsm/messaging/player_messages.dart';
import 'package:football_sim_core/core/field/zone.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';

sealed class TacticMessage implements PlayerMessage {
  @override
  final EcsEntity receiver;
  final bool cancelled;
  final bool requiresAck;
  final OnAck? onAck;

  const TacticMessage({
    required this.receiver,
    this.cancelled = false,
    this.requiresAck = false,
    this.onAck,
  });
}

class TacticalMoveToZone extends TacticMessage {
  final Zone targetZone;

  const TacticalMoveToZone({
    required super.receiver,
    super.cancelled,
    super.requiresAck,
    super.onAck,
    required this.targetZone,
  });

  // Se ti serve il copyWith per annullare il messaggio
  TacticalMoveToZone copyWith({
    bool? cancelled,
    bool? requiresAck,
    Zone? targetZone,
  }) {
    return TacticalMoveToZone(
      receiver: receiver,
      cancelled: cancelled ?? this.cancelled,
      requiresAck: requiresAck ?? this.requiresAck,
      onAck: onAck,
      targetZone: targetZone ?? this.targetZone,
    );
  }
}
