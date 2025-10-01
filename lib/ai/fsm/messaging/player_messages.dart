// lib/messages/player_messages.dart
import 'package:flame/game.dart';
import 'package:football_sim_core/ai/intents/move_player_intent.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'message.dart';

part 'player_messages.freezed.dart';

typedef OnAck = void Function();

abstract class PlayerMessage extends Message {
  OnAck? get onAck;
  bool get requiresAck;
  EcsEntity get receiver;
}

@freezed
sealed class PlayerUnion with _$PlayerUnion implements PlayerMessage {
  PlayerUnion._();
  factory PlayerUnion.receiveBallIntent({
    OnAck? onAck,
    @Default(false) bool requiresAck,
    required EcsEntity receiver,
    required Vector2 targetPosition,
  }) = ReceiveBallIntent;

  factory PlayerUnion.passToNearestTeammate({
    @Default(false) bool requiresAck,
    required EcsEntity receiver,
    OnAck? onAck,
  }) = PassToNearestTeammate;
  factory PlayerUnion.moveToPosition({
    required Vector2 target,
    required EcsEntity receiver,
    @Default(false) bool requiresAck,
    OnAck? onAck,
  }) = MoveToPosition;
  factory PlayerUnion.moveToBall({
    required EcsEntity receiver,
    required MovePlayerIntent intent,
    @Default(false) bool requiresAck,
    OnAck? onAck,
  }) = MoveToBall;

  factory PlayerUnion.placeToKickOff({
    required EcsEntity receiver,
    @Default(false) bool requiresAck,
    OnAck? onAck,
  }) = PlaceToKickOff;
  factory PlayerUnion.receiveBall({
    required EcsEntity receiver,
    @Default(false) bool requiresAck,
    OnAck? onAck,
  }) = ReceiveBall;
}
