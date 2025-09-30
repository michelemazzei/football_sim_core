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
  bool get cancelled => false; // default: non cancellato
  set cancelled(bool isCancelled); // default: non cancellato
}

@unfreezed
sealed class PlayerUnion with _$PlayerUnion implements PlayerMessage {
  PlayerUnion._();
  factory PlayerUnion.receiveBallIntent({
    OnAck? onAck,
    @Default(false) bool cancelled,
    @Default(false) final bool requiresAck,
    required final EcsEntity receiver,
    required final Vector2 targetPosition,
  }) = ReceiveBallIntent;

  factory PlayerUnion.passToNearestTeammate({
    @Default(false) bool cancelled,
    @Default(false) final bool requiresAck,
    required final EcsEntity receiver,
    final OnAck? onAck,
  }) = PassToNearestTeammate;
  factory PlayerUnion.moveToPosition({
    @Default(false) bool cancelled,
    required final Vector2 target,
    required final EcsEntity receiver,
    @Default(false) final bool requiresAck,
    final OnAck? onAck,
  }) = MoveToPosition;
  factory PlayerUnion.moveToBall({
    @Default(false) bool cancelled,
    required final EcsEntity receiver,
    required final MovePlayerIntent intent,
    @Default(false) final bool requiresAck,
    final OnAck? onAck,
  }) = MoveToBall;

  factory PlayerUnion.placeToKickOff({
    required final EcsEntity receiver,
    @Default(false) bool cancelled,
    @Default(false) final bool requiresAck,
    final OnAck? onAck,
  }) = PlaceToKickOff;
  factory PlayerUnion.receiveBall({
    required final EcsEntity receiver,
    @Default(false) bool cancelled,
    @Default(false) final bool requiresAck,
    final OnAck? onAck,
  }) = ReceiveBall;
}
