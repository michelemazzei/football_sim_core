import 'package:football_sim_core/core/field/zone.dart';
import 'package:football_sim_core/core/field/zone_tag.dart';
import 'package:football_sim_core/core/field/zone_types.dart';
import 'package:football_sim_core/core/tactics/tactical_roles.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';

class TacticalRoleComponent implements EcsComponent {
  TacticalRole role;
  final List<Zone> zones = [];

  TacticalRoleComponent({required this.role, List<Zone>? covering}) {
    if ((covering ?? []).isEmpty) {
      zones.addAll(getIdealZonesForRole(role));
    } else {
      zones.addAll(covering!);
    }
  }

  List<Zone> getIdealZonesForRole(TacticalRole role) {
    // Helper semplificato: ora usiamo direttamente le Enum
    Zone z(double x, double y, ZoneType type, List<ZoneTag> tags) =>
        Zone(x: x, y: y, type: type, tags: tags);

    // Nota: Ho rimosso le parentesi () dai case se TacticalRole è una Enum.
    // Se TacticalRole è ancora una Sealed Class, lo switch va bene,
    // ma i valori ZoneType e ZoneTag devono essere Enum.
    switch (role) {
      case TacticalRole.goalkeeper:
        return [
          z(0, 2, ZoneType.special, [ZoneTag.goal, ZoneTag.center]),
        ];

      case TacticalRole.leftBack:
        return [
          z(2, 0, ZoneType.defensive, [ZoneTag.left]),
          z(3, 0, ZoneType.defensive, [ZoneTag.left]),
        ];

      case TacticalRole.rightBack:
        return [
          z(2, 4, ZoneType.defensive, [ZoneTag.right]),
          z(3, 4, ZoneType.defensive, [ZoneTag.right]),
        ];

      case TacticalRole.centerBackLeft:
        return [
          z(2, 1, ZoneType.defensive, [ZoneTag.left]),
          z(3, 1, ZoneType.defensive, [ZoneTag.center]),
        ];

      case TacticalRole.centerBackRight:
        return [
          z(2, 3, ZoneType.defensive, [ZoneTag.right]),
          z(3, 3, ZoneType.defensive, [ZoneTag.center]),
        ];

      case TacticalRole.defensiveMidfielder:
        return [
          z(4, 2, ZoneType.midfield, [ZoneTag.center]),
          z(5, 2, ZoneType.midfield, [ZoneTag.center]),
        ];

      case TacticalRole.centralMidfielderLeft:
        return [
          z(4, 1, ZoneType.midfield, [ZoneTag.left]),
          z(5, 1, ZoneType.midfield, [ZoneTag.center]),
        ];

      case TacticalRole.centralMidfielderRight:
        return [
          z(4, 3, ZoneType.midfield, [ZoneTag.right]),
          z(5, 3, ZoneType.midfield, [ZoneTag.center]),
        ];

      case TacticalRole.attackingMidfielderCenter:
        return [
          z(6, 2, ZoneType.attacking, [ZoneTag.center]),
          z(7, 2, ZoneType.attacking, [ZoneTag.center]),
        ];

      case TacticalRole.wideMidfielderLeft:
        return [
          z(6, 1, ZoneType.attacking, [ZoneTag.left]),
          z(7, 1, ZoneType.attacking, [ZoneTag.left]),
        ];

      case TacticalRole.wideMidfielderRight:
        return [
          z(6, 3, ZoneType.attacking, [ZoneTag.right]),
          z(7, 3, ZoneType.attacking, [ZoneTag.right]),
        ];

      case TacticalRole.leftWinger:
        return [
          z(8, 0, ZoneType.attacking, [ZoneTag.left]),
          z(9, 0, ZoneType.attacking, [ZoneTag.left]),
        ];

      case TacticalRole.rightWinger:
        return [
          z(8, 4, ZoneType.attacking, [ZoneTag.right]),
          z(9, 4, ZoneType.attacking, [ZoneTag.right]),
        ];

      case TacticalRole.centerForward:
        return [
          z(8, 2, ZoneType.attacking, [ZoneTag.center]),
          z(9, 2, ZoneType.attacking, [ZoneTag.center]),
        ];

      case TacticalRole.secondStriker:
        return [
          z(7, 2, ZoneType.attacking, [ZoneTag.center]),
          z(8, 2, ZoneType.attacking, [ZoneTag.center]),
        ];

      default:
        return [];
    }
  }
}
