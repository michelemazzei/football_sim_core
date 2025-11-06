import 'package:freezed_annotation/freezed_annotation.dart';

part 'tactics_names.freezed.dart';

@freezed
sealed class TacticsName with _$TacticsName {
  const factory TacticsName.zoneTactics() = ZoneTactic;
  const factory TacticsName.ballFollowTactic() = BallFollowTactic;
}
