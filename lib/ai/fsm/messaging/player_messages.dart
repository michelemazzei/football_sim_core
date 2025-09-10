// lib/messages/player_messages.dart
import 'package:flame/game.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'message.dart';

part 'player_messages.freezed.dart';

enum MovePlayerIntent {
  prepareKick,
  intercept,
  markOpponent,
  receivePass,
  pressOpponent,
}

@freezed
sealed class PlayerMessage with _$PlayerMessage implements Message {
  const factory PlayerMessage.goHome({
    @Default(false) bool requiresAck,
    void Function()? onAck,
  }) = GoHome;
  const factory PlayerMessage.passToNearestTeammate({
    @Default(false) bool requiresAck,
    void Function()? onAck,
  }) = PassToNearestTeammate;
  const factory PlayerMessage.moveToPosition(
    Vector2 target, {
    @Default(false) bool requiresAck,
    void Function()? onAck,
  }) = MoveToPosition;
  const factory PlayerMessage.moveToBall({
    required MovePlayerIntent intent,
    @Default(false) bool requiresAck,
    void Function()? onAck,
  }) = MoveToBall;
  const factory PlayerMessage.wait({
    @Default(false) bool requiresAck,
    void Function()? onAck,
  }) = Wait;
  const factory PlayerMessage.placeToKickOff({
    @Default(false) bool requiresAck,
    void Function()? onAck,
  }) = PlaceToKickOff;
  const factory PlayerMessage.receiveBall({
    @Default(false) bool requiresAck,
    void Function()? onAck,
  }) = ReceiveBall;
  const factory PlayerMessage.passToMe({
    @Default(false) bool requiresAck,
    void Function()? onAck,
  }) = PassToMe;
  const factory PlayerMessage.supportAttacker({
    @Default(false) bool requiresAck,
    void Function()? onAck,
  }) = SupportAttacker;
  const factory PlayerMessage.ballChangeOwner({
    @Default(false) bool requiresAck,
    void Function()? onAck,
  }) = BallChangeOwner;
}
