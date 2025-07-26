import 'package:freezed_annotation/freezed_annotation.dart';
part 'pitch_side.freezed.dart';

@freezed
sealed class PitchSide with _$PitchSide {
  const PitchSide._();
  const factory PitchSide.r() = SideRight;
  const factory PitchSide.l() = SideLeft;
  const factory PitchSide.c() = SideCenter;

  factory PitchSide.fromString(String side, {PitchSide? onError}) {
    return switch (side.toLowerCase()) {
      'r' => const SideRight(),
      'l' => const SideLeft(),
      'c' => const SideCenter(),
      _ => onError ?? (throw ArgumentError('Unknown side: $side')),
    };
  }

  String get name => switch (this) {
    SideRight() => 'r',
    SideLeft() => 'l',
    SideCenter() => 'c',
  };
}
