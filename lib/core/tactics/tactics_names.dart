import 'package:freezed_annotation/freezed_annotation.dart';

part 'tactics_names.freezed.dart';

@freezed
sealed class TacticsName with _$TacticsName {
  const factory TacticsName.coverZoneTactic() = CoverZoneTacticName;
  const factory TacticsName.zoneTactic() = ZoneTacticName;
  const factory TacticsName.ballFollowTactic() = BallFollowTacticName;
}
