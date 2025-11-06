import 'package:football_sim_core/core/field/field_grid.dart';
import 'package:football_sim_core/core/field/zone.dart';
import 'package:football_sim_core/core/tactics/game_phases.dart';
import 'package:football_sim_core/core/tactics/tactical_roles.dart';

class TacticalZoneMap {
  final Map<GamePhase, Map<TacticalRole, Zone>> _map;

  TacticalZoneMap(this._map);

  Zone? getZoneFor(
    TacticalRole role, [
    GamePhase phase = const GamePhase.buildUp(),
  ]) {
    return _map[phase]?[role];
  }

  Map<TacticalRole, Zone>? getPhaseMap(GamePhase phase) {
    return _map[phase];
  }

  TacticalZoneMap mirrored() {
    final mirroredMap = <GamePhase, Map<TacticalRole, Zone>>{};
    for (final phase in _map.keys) {
      final roleMap = _map[phase]!;
      final mirroredRoleMap = <TacticalRole, Zone>{};
      for (final entry in roleMap.entries) {
        final zone = entry.value;
        final mirroredZone = Zone(
          x: FieldGrid.columns - 1 - zone.x,
          y: zone.y,
          type: zone.type,
          weight: zone.weight,
          tags: zone.tags,
        );
        mirroredRoleMap[entry.key] = mirroredZone;
      }
      mirroredMap[phase] = mirroredRoleMap;
    }
    return TacticalZoneMap(mirroredMap);
  }
}
