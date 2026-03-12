import 'package:football_sim_core/model/player_role.dart';

enum TacticalRole {
  // Portiere
  goalkeeper(PlayerCategory.goalkeeper),

  // Difensori
  leftBack(PlayerCategory.defender),
  rightBack(PlayerCategory.defender),
  centerBackLeft(PlayerCategory.defender),
  centerBackRight(PlayerCategory.defender),

  // Centrocampisti
  defensiveMidfielder(PlayerCategory.midfielder),
  centralMidfielderLeft(PlayerCategory.midfielder),
  centralMidfielderRight(PlayerCategory.midfielder),
  attackingMidfielderCenter(PlayerCategory.midfielder),
  wideMidfielderLeft(PlayerCategory.midfielder),
  wideMidfielderRight(PlayerCategory.midfielder),

  // Attaccanti
  leftWinger(PlayerCategory.attacker),
  rightWinger(PlayerCategory.attacker),
  centerForward(PlayerCategory.attacker),
  secondStriker(PlayerCategory.attacker);

  final PlayerCategory category;
  const TacticalRole(this.category);

  /// Sostituisce la vecchia extension toPlayerRole()
  /// Assicurati che PlayerRole accetti queste categorie o usa direttamente l'enum
  PlayerRole toPlayerRole() {
    return switch (category) {
      PlayerCategory.goalkeeper => PlayerRole.goalkeeper,
      PlayerCategory.defender => PlayerRole.defender,
      PlayerCategory.midfielder => PlayerRole.midfielder,
      PlayerCategory.attacker => PlayerRole.attacker,
    };
  }
}

/// Helper interno per mappare i ruoli macro
enum PlayerCategory { goalkeeper, defender, midfielder, attacker }
