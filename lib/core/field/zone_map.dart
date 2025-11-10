import 'package:football_sim_core/core/field/zone.dart';
import 'package:football_sim_core/core/field/zone_tag.dart';
import 'package:football_sim_core/core/field/zone_types.dart';

class ZoneMap {
  static Zone goalArea = Zone(
    x: 0,
    y: 2,
    type: ZoneType.special(),
    tags: [ZoneTag.goal()],
  );
  static Zone penaltyArea = Zone(
    x: 1,
    y: 2,
    type: ZoneType.defensive(),
    tags: [ZoneTag.penalty()],
  );
  static Zone leftBack = Zone(
    x: 2,
    y: 0,
    type: ZoneType.defensive(),
    tags: [ZoneTag.left()],
  );
  static Zone rightBack = Zone(
    x: 2,
    y: 4,
    type: ZoneType.defensive(),
    tags: [ZoneTag.right()],
  );
  static Zone centerCircle = Zone(
    x: 5,
    y: 2,
    type: ZoneType.mildfield(),
    tags: [ZoneTag.center()],
  );
  static Zone leftWingAttack = Zone(
    x: 8,
    y: 0,
    type: ZoneType.attacking(),
    tags: [ZoneTag.left()],
  );
  static Zone rightWingAttack = Zone(
    x: 8,
    y: 4,
    type: ZoneType.attacking(),
    tags: [ZoneTag.right()],
  );
  static Zone centralAttack = Zone(
    x: 9,
    y: 2,
    type: ZoneType.attacking(),
    tags: [ZoneTag.center()],
  );
  // Aggiungi tutte le altre zone necessarie
}
