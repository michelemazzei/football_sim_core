import 'package:freezed_annotation/freezed_annotation.dart';

part 'tactical_intents.freezed.dart';

@freezed
sealed class TacticalIntent with _$TacticalIntent {
  const factory TacticalIntent.none() = _None;
  const factory TacticalIntent.kickoff() = _Kickoff;
  const factory TacticalIntent.pressing() = _Pressing;
  const factory TacticalIntent.attacking() = _Attacking;
  const factory TacticalIntent.defending() = _Defending;
  const factory TacticalIntent.coveringZone() = _CoveringZone;
  const factory TacticalIntent.supportingAttacker() = _SupportingAttacker;
}
