// lib/messages/match_messages.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'message.dart';

part 'match_messages.freezed.dart';

@freezed
sealed class MatchMessage with _$MatchMessage implements Message {
  const factory MatchMessage.kickoffStarted() = KickoffStarted;
  const factory MatchMessage.ballKicked({
    required int fromPlayerId,
    required int toPlayerId,
  }) = BallKicked;
  const factory MatchMessage.passCompleted({required int receiverId}) =
      PassCompleted;
  const factory MatchMessage.playStarted() = PlayStarted;
  const factory MatchMessage.started() = MatchStarted;
  const factory MatchMessage.firstHalfStarted() = MatchFirstHalfStarted;
  const factory MatchMessage.firstHalfEnded() = MatchFirstHalfEnded;
  const factory MatchMessage.secondHalfStarted() = MatchSecondHalfStarted;
  const factory MatchMessage.secondHalfEnded() = MatchSecondHalfEnded;
  const factory MatchMessage.firstExtraTimeStarted() =
      MatchFirstExtraTimeStarted;
  const factory MatchMessage.firstExtraTimeEnded() = MatchFirstExtraTimeEnded;
  const factory MatchMessage.secondExtraTimeStarted() =
      MatchSecondExtraTimeStarted;
  const factory MatchMessage.secondExtraTimeEnded() = MatchSecondExtraTimeEnded;
  const factory MatchMessage.shootOutStarted() = MatchShootOutStarted;
  const factory MatchMessage.shootOutEnded() = MatchShootOutEnded;
  const factory MatchMessage.ended() = MatchEnded;
  const factory MatchMessage.goalScored({required int teamId}) = GoalScored;
}
