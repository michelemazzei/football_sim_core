import 'package:flame/components.dart';
import 'package:football_sim_core/core/tactics/tactical_roles.dart';

class Formation {
  final List<Vector2> positions;
  final List<TacticalRole> roles;

  Formation(this.positions, this.roles)
    : assert(
        positions.length == roles.length,
        'Positions and roles must match length',
      ),
      assert(
        positions.length == 11,
        'Positions and roles must be for a full team',
      );

  Vector2 getPosition(int index, bool isLeftSide) {
    final pos = positions[index];
    // Mirroring basato sull'asse X (0.0 - 1.0)
    return isLeftSide ? pos : Vector2(1 - pos.x, pos.y);
  }

  TacticalRole getRole(int index) => roles[index];
}

// 🔵 Formazione 4-4-2
final formation442 = Formation(
  [
    Vector2(0.02, 0.5), // Portiere
    Vector2(0.2, 0.2), // Difesa
    Vector2(0.2, 0.4),
    Vector2(0.2, 0.6),
    Vector2(0.2, 0.8),
    Vector2(0.3, 0.2), // Centrocampo
    Vector2(0.3, 0.4),
    Vector2(0.3, 0.6),
    Vector2(0.3, 0.8),
    Vector2(0.4, 0.4), // Attacco
    Vector2(0.4, 0.6),
  ],
  [
    // CORREZIONE: Niente parentesi per gli Enum
    TacticalRole.goalkeeper,
    TacticalRole.leftBack,
    TacticalRole.centerBackLeft,
    TacticalRole.centerBackRight,
    TacticalRole.rightBack,
    TacticalRole.wideMidfielderLeft,
    TacticalRole.centralMidfielderLeft,
    TacticalRole.centralMidfielderRight,
    TacticalRole.wideMidfielderRight,
    TacticalRole.centerForward,
    TacticalRole.secondStriker,
  ],
);

// 🔵 Formazione 4-3-3
final formation433 = Formation(
  [
    Vector2(0.02, 0.5),
    Vector2(0.2, 0.15),
    Vector2(0.2, 0.35),
    Vector2(0.2, 0.65),
    Vector2(0.2, 0.85),
    Vector2(0.3, 0.25),
    Vector2(0.3, 0.45),
    Vector2(0.3, 0.65),
    Vector2(0.4, 0.15),
    Vector2(0.4, 0.5),
    Vector2(0.4, 0.85),
  ],
  [
    TacticalRole.goalkeeper,
    TacticalRole.leftBack,
    TacticalRole.centerBackLeft,
    TacticalRole.centerBackRight,
    TacticalRole.rightBack,
    TacticalRole.defensiveMidfielder,
    TacticalRole.centralMidfielderLeft,
    TacticalRole.centralMidfielderRight,
    TacticalRole.leftWinger,
    TacticalRole.centerForward,
    TacticalRole.rightWinger,
  ],
);
