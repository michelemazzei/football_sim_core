import 'package:football_sim_core/core/field/zone.dart';
import 'package:football_sim_core/core/field/zone_types.dart';
import 'package:football_sim_core/core/tactics/tactical_roles.dart';
import 'package:football_sim_core/core/tactics/game_phases.dart';
import 'package:football_sim_core/core/tactics/tactical_zone_map.dart';

final buildUp442 = {
  TacticalRole.goalkeeper(): Zone(x: 1, y: 3, type: ZoneType.defensive()),
  TacticalRole.leftBack(): Zone(x: 2, y: 1, type: ZoneType.defensive()),
  TacticalRole.centerBackLeft(): Zone(x: 2, y: 2, type: ZoneType.defensive()),
  TacticalRole.centerBackRight(): Zone(x: 2, y: 3, type: ZoneType.defensive()),
  TacticalRole.rightBack(): Zone(x: 2, y: 4, type: ZoneType.defensive()),
  TacticalRole.leftWinger(): Zone(x: 3, y: 1, type: ZoneType.mildfield()),
  TacticalRole.centralMidfielderLeft(): Zone(
    x: 3,
    y: 2,
    type: ZoneType.mildfield(),
  ),
  TacticalRole.centralMidfielderRight(): Zone(
    x: 3,
    y: 3,
    type: ZoneType.mildfield(),
  ),
  TacticalRole.rightWinger(): Zone(x: 3, y: 4, type: ZoneType.mildfield()),
  TacticalRole.centerForward(): Zone(x: 4, y: 2, type: ZoneType.attacking()),
  TacticalRole.secondStriker(): Zone(x: 4, y: 3, type: ZoneType.attacking()),
};

final tacticalZoneMap442 = TacticalZoneMap({GamePhase.buildUp(): buildUp442});
