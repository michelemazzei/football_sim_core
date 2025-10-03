import 'package:freezed_annotation/freezed_annotation.dart';

part 'zone_types.freezed.dart';

@freezed
class ZoneType with _$ZoneType {
  const factory ZoneType.goalLine() = GoalLineZone;
  const factory ZoneType.defensive() = DefensiveZone;
  const factory ZoneType.mildfield() = MildfieldZone;
  const factory ZoneType.attacking() = AttackingZone;
  const factory ZoneType.special() = SpecialZone;
}
