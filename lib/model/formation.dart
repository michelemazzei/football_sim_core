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
    return isLeftSide ? pos : Vector2(1 - pos.x, pos.y); // Mirroring
  }

  TacticalRole getRole(int index) => roles[index];
}

final formation442 = Formation(
  [
    Vector2(0.02, 0.5), // Portiere
    Vector2(0.2, 0.2),
    Vector2(0.2, 0.4),
    Vector2(0.2, 0.6),
    Vector2(0.2, 0.8), // Difensori
    Vector2(0.3, 0.2),
    Vector2(0.3, 0.4),
    Vector2(0.3, 0.6),
    Vector2(0.3, 0.8), // Centrocampisti
    Vector2(0.4, 0.4),
    Vector2(0.4, 0.6), // Attaccanti
  ],
  [
    TacticalRole.goalkeeper(),
    TacticalRole.leftBack(),
    TacticalRole.centerBackLeft(),
    TacticalRole.centerBackRight(),
    TacticalRole.rightBack(),
    TacticalRole.wideMidfielderLeft(),
    TacticalRole.centralMidfielderLeft(),
    TacticalRole.centralMidfielderRight(),
    TacticalRole.wideMidfielderRight(),
    TacticalRole.centerForward(),
    TacticalRole.secondStriker(),
  ],
);
final formation433 = Formation(
  [
    Vector2(0.02, 0.5), // Portiere
    Vector2(0.2, 0.15), // Terzino sinistro
    Vector2(0.2, 0.35), // Difensore centrale sinistro
    Vector2(0.2, 0.65), // Difensore centrale destro
    Vector2(0.2, 0.85), // Terzino destro
    Vector2(0.3, 0.25), // Centrocampista difensivo
    Vector2(0.3, 0.45), // Centrocampista centrale sinistro
    Vector2(0.3, 0.65), // Centrocampista centrale destro
    Vector2(0.4, 0.15), // Ala sinistra
    Vector2(0.4, 0.5), // Punta centrale
    Vector2(0.4, 0.85), // Ala destra
  ],
  [
    TacticalRole.goalkeeper(),
    TacticalRole.leftBack(),
    TacticalRole.centerBackLeft(),
    TacticalRole.centerBackRight(),
    TacticalRole.rightBack(),
    TacticalRole.defensiveMidfielder(),
    TacticalRole.centralMidfielderLeft(),
    TacticalRole.centralMidfielderRight(),
    TacticalRole.leftWinger(),
    TacticalRole.centerForward(),
    TacticalRole.rightWinger(),
  ],
);
