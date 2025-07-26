import 'package:freezed_annotation/freezed_annotation.dart';

part 'pitch_role.freezed.dart';

@freezed
sealed class PitchRole with _$PitchRole {
  const PitchRole._();
  const factory PitchRole.d() = RoleDefender;
  const factory PitchRole.dm() = RoleDefensiveMidfielder;
  const factory PitchRole.m() = RoleMidfielder;
  const factory PitchRole.am() = RoleAttackingMidfielder;
  const factory PitchRole.f() = RoleForward;
  const factory PitchRole.gk() = RoleGoalkeeper;

  factory PitchRole.fromString(String role, {PitchRole? onError}) {
    return switch (role.toLowerCase()) {
      'd' => const RoleDefender(),
      'dm' => const RoleDefensiveMidfielder(),
      'm' => const RoleMidfielder(),
      'am' => const RoleAttackingMidfielder(),
      'f' => const RoleForward(),
      'gk' => const RoleGoalkeeper(),
      _ => onError ?? (throw ArgumentError('Unknown role: $role')),
    };
  }

  String get name => switch (this) {
    RoleDefender() => 'd',
    RoleDefensiveMidfielder() => 'dm',
    RoleMidfielder() => 'm',
    RoleAttackingMidfielder() => 'am',
    RoleForward() => 'f',
    RoleGoalkeeper() => 'gk',
  };
}
