// lib/messages/player_messages.dart
import 'package:football_sim_core/ai/fsm/messaging/player_messages.dart';
import 'package:football_sim_core/core/field/zone.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tactic_messages.freezed.dart';

@unfreezed
sealed class TacticUnion with _$TacticUnion implements PlayerMessage {
  TacticUnion._();
  factory TacticUnion.moveToZone({
    required final EcsEntity receiver,
    @Default(false) bool cancelled,
    @Default(false) final bool requiresAck,
    final OnAck? onAck,
    required Zone targetZone,
  }) = TacticalMoveToZone;
}
