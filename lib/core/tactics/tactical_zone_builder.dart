import 'package:football_sim_core/core/field/field_grid.dart';
import 'package:football_sim_core/core/field/zone.dart';
import 'package:football_sim_core/core/field/zone_types.dart';
import 'package:football_sim_core/core/tactics/game_phases.dart';
import 'package:football_sim_core/core/tactics/tactical_roles.dart';
import 'package:football_sim_core/core/tactics/tactical_zone_map.dart';

class TacticalZoneBuilder {
  static const int fieldWidth = FieldGrid.columns;
  static const int fieldHeight = FieldGrid.rows;

  static final Map<GamePhase, Map<TacticalRole, Zone>> _phaseZones442 = {};

  TacticalZoneBuilder._();

  static TacticalZoneMap build442() {
    final builder = TacticalZoneBuilder._();
    builder._addBuildUpPhase(_phaseZones442);
    builder._addAttackPhase(_phaseZones442);
    builder._addDefensePhase(_phaseZones442);
    return TacticalZoneMap(_phaseZones442);
  }

  void _addBuildUpPhase(Map<GamePhase, Map<TacticalRole, Zone>> phaseZones) {
    final buildUp = <TacticalRole, Zone>{
      TacticalRole.goalkeeper(): Zone(x: 1, y: 3, type: ZoneType.goalLine()),
      TacticalRole.leftBack(): Zone(x: 2, y: 1, type: ZoneType.defensive()),
      TacticalRole.centerBackLeft(): Zone(
        x: 2,
        y: 2,
        type: ZoneType.defensive(),
      ),
      TacticalRole.centerBackRight(): Zone(
        x: 2,
        y: 3,
        type: ZoneType.defensive(),
      ),
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
      TacticalRole.centerForward(): Zone(
        x: 4,
        y: 2,
        type: ZoneType.attacking(),
      ),
      TacticalRole.secondStriker(): Zone(
        x: 4,
        y: 3,
        type: ZoneType.attacking(),
      ),
    };

    phaseZones[GamePhase.buildUp()] = buildUp;
  }

  void _addAttackPhase(Map<GamePhase, Map<TacticalRole, Zone>> phaseZones) {
    final buildUp = phaseZones[GamePhase.buildUp()];
    if (buildUp == null) return;

    final attack = <TacticalRole, Zone>{};

    for (final entry in buildUp.entries) {
      final role = entry.key;
      final zone = entry.value;
      final shiftedZone = _shiftZone(
        zone,
        byType: {
          ZoneType.goalLine(): 0,
          ZoneType.defensive(): 2,
          ZoneType.mildfield(): 3,
          ZoneType.attacking(): 4,
          ZoneType.special(): 0,
        },
      );
      attack[role] = shiftedZone;
    }

    phaseZones[GamePhase.attack()] = attack;
  }

  void _addDefensePhase(Map<GamePhase, Map<TacticalRole, Zone>> phaseZones) {
    final buildUp = phaseZones[GamePhase.buildUp()];
    if (buildUp == null) return;

    final defense = <TacticalRole, Zone>{};

    for (final entry in buildUp.entries) {
      final role = entry.key;
      final zone = entry.value;
      final shiftedZone = _shiftZone(
        zone,
        byType: {
          ZoneType.goalLine(): 0,
          ZoneType.defensive(): -1,
          ZoneType.mildfield(): -2,
          ZoneType.attacking(): -3,
          ZoneType.special(): 0,
        },
      );
      defense[role] = shiftedZone;
    }

    phaseZones[GamePhase.defense()] = defense;
  }

  Zone _shiftZone(Zone zone, {required Map<ZoneType, int> byType}) {
    final dx = byType[zone.type] ?? 0;
    final newX = (zone.x + dx).clamp(0, fieldWidth - 1);
    return zone.copyWith(x: newX);
  }
}
