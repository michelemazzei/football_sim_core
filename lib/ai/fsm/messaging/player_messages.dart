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
  const factory PlayerMessage.goHome() = GoHome;
  const factory PlayerMessage.passToNearestTeammate() = PassToNearestTeammate;
  const factory PlayerMessage.moveToPosition(Vector2 target) = MoveToPosition;
  const factory PlayerMessage.moveToBall({required MovePlayerIntent intent}) =
      MoveToBall;
  const factory PlayerMessage.wait() = Wait;
  const factory PlayerMessage.placeToKickOff() = PlaceToKickOff;
  const factory PlayerMessage.receiveBall() = ReceiveBall;
  const factory PlayerMessage.passToMe() = PassToMe;
  const factory PlayerMessage.supportAttacker() = SupportAttacker;
  const factory PlayerMessage.ballChangeOwner() = BallChangeOwner;
}
