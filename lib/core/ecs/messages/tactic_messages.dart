// lib/messages/player_messages.dart
import 'package:football_sim_core/ai/fsm/messaging/player_messages.dart';
import 'package:football_sim_core/core/field/zone.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tactic_messages.freezed.dart';

@freezed
sealed class TacticMessage with _$TacticMessage implements PlayerMessage {
  TacticMessage._();
  factory TacticMessage.moveToZone({
    required EcsEntity receiver,
    @Default(false) bool cancelled,
    @Default(false) bool requiresAck,
    OnAck? onAck,
    required Zone targetZone,
  }) = TacticalMoveToZone;
}
