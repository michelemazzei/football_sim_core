import 'package:flame/components.dart';
import 'package:football_sim_core/model/player_role.dart';

class Formation {
  final List<Vector2> positions;
  final List<PlayerRole> roles;

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

  PlayerRole getRole(int index) => roles[index];
}

final formation442 = Formation(
  [
    Vector2(0.05, 0.5), // Portiere
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
    Goalkeeper(),
    Defender(),
    Defender(),
    Defender(),
    Defender(),
    Midfielder(),
    Midfielder(),
    Midfielder(),
    Midfielder(),
    Attacker(),
    Attacker(),
  ],
);
