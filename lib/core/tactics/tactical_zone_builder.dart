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
  static final Map<GamePhase, Map<TacticalRole, Zone>> _phaseZones433 = {};

  TacticalZoneBuilder._();

  static final tacticalZoneMap442 = TacticalZoneBuilder.build442();
  static final tacticalZoneMap433 = TacticalZoneBuilder.build433();

  static TacticalZoneMap build442() {
    final builder = TacticalZoneBuilder._();
    builder._addBuildUpPhase(_phaseZones442);
    builder._addAttackPhase(_phaseZones442);
    builder._addDefensePhase(_phaseZones442);
    return TacticalZoneMap(_phaseZones442);
  }

  static TacticalZoneMap build433() {
    final builder = TacticalZoneBuilder._();
    builder._addBuildUpPhase(_phaseZones433);
    builder._addAttackPhase(_phaseZones433);
    builder._addDefensePhase(_phaseZones433);
    return TacticalZoneMap(_phaseZones433);
  }

  void _addBuildUpPhase(Map<GamePhase, Map<TacticalRole, Zone>> phaseZones) {
    final buildUp = <TacticalRole, Zone>{
      TacticalRole.goalkeeper: Zone(x: 0, y: 2.35, type: ZoneType.goalLine),
      TacticalRole.leftBack: Zone(x: 2, y: 1, type: ZoneType.defensive),
      TacticalRole.centerBackLeft: Zone(x: 2, y: 2, type: ZoneType.defensive),
      TacticalRole.centerBackRight: Zone(x: 2, y: 3, type: ZoneType.defensive),
      TacticalRole.rightBack: Zone(x: 2, y: 4, type: ZoneType.defensive),
      TacticalRole.leftWinger: Zone(x: 3, y: 1, type: ZoneType.midfield),
      TacticalRole.centralMidfielderLeft: Zone(
        x: 3,
        y: 2,
        type: ZoneType.midfield,
      ),
      TacticalRole.wideMidfielderLeft: Zone(
        x: 4,
        y: 1,
        type: ZoneType.midfield,
      ),
      TacticalRole.attackingMidfielderCenter: Zone(
        x: 5,
        y: 2,
        type: ZoneType.midfield,
      ),
      TacticalRole.wideMidfielderRight: Zone(
        x: 3,
        y: 4,
        type: ZoneType.midfield,
      ),
      TacticalRole.centralMidfielderRight: Zone(
        x: 3,
        y: 3,
        type: ZoneType.midfield,
      ),
      TacticalRole.rightWinger: Zone(x: 3, y: 4, type: ZoneType.midfield),
      TacticalRole.centerForward: Zone(x: 4, y: 2, type: ZoneType.attacking),
      TacticalRole.secondStriker: Zone(x: 4, y: 3, type: ZoneType.attacking),
    };

    // CORREZIONE: GamePhase.buildUp invece di GamePhase.buildUp()
    phaseZones[GamePhase.buildUp] = buildUp;
  }

  void _addAttackPhase(Map<GamePhase, Map<TacticalRole, Zone>> phaseZones) {
    _addAlternativePhase(GamePhase.attack, phaseZones, {
      ZoneType.goalLine: 0,
      ZoneType.defensive: 2,
      ZoneType.midfield: 3,
      ZoneType.attacking: 3,
      ZoneType.special: 0,
    });
  }

  void _addDefensePhase(Map<GamePhase, Map<TacticalRole, Zone>> phaseZones) {
    _addAlternativePhase(GamePhase.defense, phaseZones, {
      ZoneType.goalLine: 0,
      ZoneType.defensive: -1,
      ZoneType.midfield: -1,
      ZoneType.attacking: -1,
      ZoneType.special: 0,
    });
  }

  void _addAlternativePhase(
    GamePhase thePhase,
    Map<GamePhase, Map<TacticalRole, Zone>> phaseZones,
    Map<ZoneType, int> mapByType,
  ) {
    // Qui usiamo GamePhase.buildUp come chiave
    final buildUp = phaseZones[GamePhase.buildUp];
    if (buildUp == null) return;

    final result = <TacticalRole, Zone>{};

    for (final entry in buildUp.entries) {
      final role = entry.key;
      final zone = entry.value;
      final shiftedZone = _shiftZone(zone, byType: mapByType);
      result[role] = shiftedZone;
    }

    phaseZones[thePhase] = result;
  }

  Zone _shiftZone(Zone zone, {required Map<ZoneType, int> byType}) {
    final dx = byType[zone.type] ?? 0;

    // Calcoliamo la nuova X restando nei limiti del campo
    final double newX = (zone.x + dx).toDouble().clamp(0, fieldWidth - 1);

    // In un builder, è meglio creare una nuova Zone pulita.
    // Passiamo i tag e il peso della zona originale per non perderli.
    return Zone(
      x: newX,
      y: zone.y,
      type: zone.type,
      weight: zone.weight,
      tags: zone.tags,
    );
  }
}
