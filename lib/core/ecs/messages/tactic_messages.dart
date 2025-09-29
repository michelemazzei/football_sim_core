// lib/messages/player_messages.dart
import 'package:football_sim_core/ai/fsm/messaging/message.dart';
import 'package:football_sim_core/core/field/zone.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tactic_messages.freezed.dart';

@freezed
sealed class TacticMessage with _$TacticMessage implements Message {
  const factory TacticMessage.moveToZone({
    void Function()? onAck,
    @Default(false) bool requiresAck,
    required Zone targetZone,
  }) = MoveToZone;
}
