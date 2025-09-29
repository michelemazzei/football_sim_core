import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_phases.freezed.dart';

@freezed
class GamePhase with _$GamePhase {
  const factory GamePhase.buildUp() = BuildUpPhase;
  const factory GamePhase.possession() = PossessionPhase;
  const factory GamePhase.transition() = TrasitionPhase;
  const factory GamePhase.defense() = DefensePhase;
}
