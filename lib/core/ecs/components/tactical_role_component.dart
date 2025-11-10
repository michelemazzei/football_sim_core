import 'package:football_sim_core/core/field/zone.dart';
import 'package:football_sim_core/core/field/zone_tag.dart';
import 'package:football_sim_core/core/field/zone_types.dart';
import 'package:football_sim_core/core/tactics/tactical_roles.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';

class TacticalRoleComponent implements EcsComponent {
  TacticalRole role;
  final List<Zone> zones = List.empty(growable: true);
  TacticalRoleComponent({required this.role, List<Zone>? covering}) {
    if ((covering ?? []).isEmpty) {
      zones.addAll(getIdealZonesForRole(role));
    } else {
      zones.addAll(covering ?? []);
    }
  }

  List<Zone> getIdealZonesForRole(TacticalRole role) {
    Zone z(double x, double y, ZoneType type, List<ZoneTag> tags) =>
        Zone(x: x, y: y, type: type, tags: tags);

    switch (role) {
      case Goalkeeper():
        return [
          z(0, 2, ZoneType.special(), [ZoneTag.goal(), ZoneTag.center()]),
        ];

      case LeftBack():
        return [
          z(2, 0, ZoneType.defensive(), [ZoneTag.left()]),
          z(3, 0, ZoneType.defensive(), [ZoneTag.left()]),
        ];

      case RightBack():
        return [
          z(2, 4, ZoneType.defensive(), [ZoneTag.right()]),
          z(3, 4, ZoneType.defensive(), [ZoneTag.right()]),
        ];

      case CenterBackLeft():
        return [
          z(2, 1, ZoneType.defensive(), [ZoneTag.left()]),
          z(3, 1, ZoneType.defensive(), [ZoneTag.center()]),
        ];

      case CenterBackRight():
        return [
          z(2, 3, ZoneType.defensive(), [ZoneTag.right()]),
          z(3, 3, ZoneType.defensive(), [ZoneTag.center()]),
        ];

      case DefensiveMidfielder():
        return [
          z(4, 2, ZoneType.mildfield(), [ZoneTag.center()]),
          z(5, 2, ZoneType.mildfield(), [ZoneTag.center()]),
        ];

      case CentralMidfielderLeft():
        return [
          z(4, 1, ZoneType.mildfield(), [ZoneTag.left()]),
          z(5, 1, ZoneType.mildfield(), [ZoneTag.center()]),
        ];

      case CentralMidfielderRight():
        return [
          z(4, 3, ZoneType.mildfield(), [ZoneTag.right()]),
          z(5, 3, ZoneType.mildfield(), [ZoneTag.center()]),
        ];

      case AttackingMidfielderCenter():
        return [
          z(6, 2, ZoneType.attacking(), [ZoneTag.center()]),
          z(7, 2, ZoneType.attacking(), [ZoneTag.center()]),
        ];

      case WideMidfielderLeft():
        return [
          z(6, 1, ZoneType.attacking(), [ZoneTag.left()]),
          z(7, 1, ZoneType.attacking(), [ZoneTag.left()]),
        ];

      case WideMidfielderRight():
        return [
          z(6, 3, ZoneType.attacking(), [ZoneTag.right()]),
          z(7, 3, ZoneType.attacking(), [ZoneTag.right()]),
        ];

      case LeftWinger():
        return [
          z(8, 0, ZoneType.attacking(), [ZoneTag.left()]),
          z(9, 0, ZoneType.attacking(), [ZoneTag.left()]),
        ];

      case RightWinger():
        return [
          z(8, 4, ZoneType.attacking(), [ZoneTag.right()]),
          z(9, 4, ZoneType.attacking(), [ZoneTag.right()]),
        ];

      case CenterForward():
        return [
          z(8, 2, ZoneType.attacking(), [ZoneTag.center()]),
          z(9, 2, ZoneType.attacking(), [ZoneTag.center()]),
        ];

      case SecondStriker():
        return [
          z(7, 2, ZoneType.attacking(), [ZoneTag.center()]),
          z(8, 2, ZoneType.attacking(), [ZoneTag.center()]),
        ];
    }
  }
}
