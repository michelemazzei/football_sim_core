import 'package:freezed_annotation/freezed_annotation.dart';

part 'messages.freezed.dart';

@freezed
sealed class Messages with _$Messages {
  const factory Messages.matchStarted() = MatchStarted;
  const factory Messages.matchFirstHalfEnded() = MatchFirstHalfEnded;
  const factory Messages.matchFirstHalfStarted() = MatchFirstHalfStarted;
  const factory Messages.matchSecondHalfStarted() = MatchSecondHalfStarted;
  const factory Messages.matchSecondHalfEnded() = MatchSecondHalfEnded;
  const factory Messages.matchFirstExtraTimeStarted() =
      MatchFirstExtraTimeStarted;
  const factory Messages.matchFirstExtraTimeEnded() = MatchFirstExtraTimeEnded;
  const factory Messages.matchSecondExtraTimeStarted() =
      MatchSecondExtraTimeStarted;
  const factory Messages.matchSecondExtraTimeEnded() =
      MatchSecondExtraTimeEnded;
  const factory Messages.matchShootOutStarted() = MatchShootOutStarted;
  const factory Messages.matchShootOutEnded() = MatchShootOutEnded;
  const factory Messages.matchEnded() = MatchEnded;
  const factory Messages.goalScored({required int teamId}) = GoalScored;

  /// Ordina all'agente di tornare alla sua posizione originaria.
  const factory Messages.goHome() = GoHome;

  /// Posizionamento iniziale per il calcio d'inizio.
  const factory Messages.placeToKickOff() = PlaceToKickOff;

  /// L'agente deve aspettare (es. prima di entrare in gioco).
  const factory Messages.wait() = Wait;

  /// Cambia il proprietario del pallone dopo un passaggio o recupero.
  const factory Messages.ballChangeOwner() = BallChangeOwner;

  /// La squadra è in fase offensiva.
  const factory Messages.attacking() = Attacking;

  /// La squadra è in fase difensiva.
  const factory Messages.defending() = Defending;

  /// Un compagno deve ricevere il pallone.
  const factory Messages.passToMe() = PassToMe;

  /// Un compagno deve ricevere il pallone.
  const factory Messages.receiveBall() = ReceiveBall;

  /// L'agente si posiziona per supportare l'attaccante.

  const factory Messages.supportAttacker() = SupportAttacker;
}
