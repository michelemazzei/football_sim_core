import 'package:football_sim_core/model/player_role.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tactical_roles.freezed.dart';

@freezed
sealed class TacticalRole with _$TacticalRole {
  const factory TacticalRole.goalkeeper() = Goalkeeper;

  // Difensori
  const factory TacticalRole.leftBack() = LeftBack;
  const factory TacticalRole.rightBack() = RightBack;
  const factory TacticalRole.centerBackLeft() = CenterBackLeft;
  const factory TacticalRole.centerBackRight() = CenterBackRight;

  // Centrocampisti
  const factory TacticalRole.defensiveMidfielder() = DefensiveMidfielder;
  const factory TacticalRole.centralMidfielderLeft() = CentralMidfielderLeft;
  const factory TacticalRole.centralMidfielderRight() = CentralMidfielderRight;
  const factory TacticalRole.attackingMidfielderCenter() =
      AttackingMidfielderCenter;
  const factory TacticalRole.wideMidfielderLeft() = WideMidfielderLeft;
  const factory TacticalRole.wideMidfielderRight() = WideMidfielderRight;

  // Attaccanti
  const factory TacticalRole.leftWinger() = LeftWinger;
  const factory TacticalRole.rightWinger() = RightWinger;
  const factory TacticalRole.centerForward() = CenterForward;
  const factory TacticalRole.secondStriker() = SecondStriker;
}

extension TacticalRoleX on TacticalRole {
  PlayerRole toPlayerRole() {
    return switch (this) {
      Goalkeeper() => PlayerRole.goalkeeper(),
      LeftBack() => PlayerRole.defender(),
      RightBack() => PlayerRole.defender(),
      CenterBackLeft() => PlayerRole.defender(),
      CenterBackRight() => PlayerRole.defender(),
      DefensiveMidfielder() => PlayerRole.midfielder(),
      CentralMidfielderLeft() => PlayerRole.midfielder(),
      CentralMidfielderRight() => PlayerRole.midfielder(),
      AttackingMidfielderCenter() => PlayerRole.midfielder(),
      WideMidfielderLeft() => PlayerRole.midfielder(),
      WideMidfielderRight() => PlayerRole.midfielder(),
      LeftWinger() => PlayerRole.attacker(),
      RightWinger() => PlayerRole.attacker(),
      CenterForward() => PlayerRole.attacker(),
      SecondStriker() => PlayerRole.attacker(),
    };
  }
}
