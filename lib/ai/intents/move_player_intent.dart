import 'package:freezed_annotation/freezed_annotation.dart';

part 'move_player_intent.freezed.dart';

@freezed
sealed class MovePlayerIntent with _$MovePlayerIntent {
  const factory MovePlayerIntent.receivePass() = ReceivePassIntent;
  const factory MovePlayerIntent.intercept() = InterceptIntent;
  const factory MovePlayerIntent.chaseBall() = ChaseBallIntent;
  const factory MovePlayerIntent.pressOpponent() = PressOpponentIntent;
  const factory MovePlayerIntent.idle() = IdleIntent;
  const factory MovePlayerIntent.prepareKick() = PrepareKickIntent;
}

extension MovePlayerIntentSpeed on MovePlayerIntent {
  double get speed => map(
    receivePass: (_) => 0.5,
    intercept: (_) => 1.2,
    chaseBall: (_) => 0.8,
    pressOpponent: (_) => 0.9,
    idle: (_) => 0.0,
    prepareKick: (_) => 0.4,
  );
}
