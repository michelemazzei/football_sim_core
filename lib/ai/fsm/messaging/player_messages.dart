// lib/messages/player_messages.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'message.dart';

part 'player_messages.freezed.dart';

@freezed
sealed class PlayerMessage with _$PlayerMessage implements Message {
  const factory PlayerMessage.goHome() = GoHome;
  const factory PlayerMessage.wait() = Wait;
  const factory PlayerMessage.placeToKickOff() = PlaceToKickOff;
  const factory PlayerMessage.receiveBall() = ReceiveBall;
  const factory PlayerMessage.passToMe() = PassToMe;
  const factory PlayerMessage.supportAttacker() = SupportAttacker;
  const factory PlayerMessage.ballChangeOwner() = BallChangeOwner;
}
