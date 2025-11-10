import 'package:freezed_annotation/freezed_annotation.dart';

part 'zone_tag.freezed.dart';

@freezed
abstract class ZoneTag with _$ZoneTag {
  factory ZoneTag.goal({@Default('GOAL') String? name}) = GoalTag;
  factory ZoneTag.penalty({@Default('PENALTY') String? name}) = PenaltyTag;
  factory ZoneTag.left({@Default('LEFT') String? name}) = LeftTag;
  factory ZoneTag.center({@Default('CENTER') String? name}) = CenterTag;
  factory ZoneTag.right({@Default('RIGHT') String? name}) = RightTag;
  factory ZoneTag(String name) = _ZoneTag;
}
