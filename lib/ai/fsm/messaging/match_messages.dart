import 'message.dart';

sealed class MatchMessage implements Message {
  const MatchMessage();
}

// Messaggi con dati
class BallKicked extends MatchMessage {
  final int fromPlayerId;
  final int toPlayerId;
  const BallKicked({required this.fromPlayerId, required this.toPlayerId});
}

class PassCompleted extends MatchMessage {
  final int receiverId;
  const PassCompleted({required this.receiverId});
}

class GoalScored extends MatchMessage {
  final int teamId;
  const GoalScored({required this.teamId});
}

// Messaggi di stato (costanti per risparmiare memoria)
class KickoffStarted extends MatchMessage {
  const KickoffStarted();
}

class PlayStarted extends MatchMessage {
  const PlayStarted();
}

class MatchStarted extends MatchMessage {
  const MatchStarted();
}

class MatchFirstHalfStarted extends MatchMessage {
  const MatchFirstHalfStarted();
}

class MatchFirstHalfEnded extends MatchMessage {
  const MatchFirstHalfEnded();
}

class MatchSecondHalfStarted extends MatchMessage {
  const MatchSecondHalfStarted();
}

class MatchSecondHalfEnded extends MatchMessage {
  const MatchSecondHalfEnded();
}

class MatchFirstExtraTimeStarted extends MatchMessage {
  const MatchFirstExtraTimeStarted();
}

class MatchFirstExtraTimeEnded extends MatchMessage {
  const MatchFirstExtraTimeEnded();
}

class MatchSecondExtraTimeStarted extends MatchMessage {
  const MatchSecondExtraTimeStarted();
}

class MatchSecondExtraTimeEnded extends MatchMessage {
  const MatchSecondExtraTimeEnded();
}

class MatchShootOutStarted extends MatchMessage {
  const MatchShootOutStarted();
}

class MatchShootOutEnded extends MatchMessage {
  const MatchShootOutEnded();
}

class MatchEnded extends MatchMessage {
  const MatchEnded();
}
