import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_id.freezed.dart';

@freezed
sealed class TeamId with _$TeamId {
  const factory TeamId.home() = _TeamIdHome;
  const factory TeamId.away() = _TeamIdAway;
}

extension TeamIdX on TeamId {
  TeamId get opposite =>
      this is _TeamIdHome ? const TeamId.away() : const TeamId.home();
  bool get isHome => this is _TeamIdHome;
  bool get isAway => this is _TeamIdAway;
}
