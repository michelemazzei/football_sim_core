import 'package:football_sim_core/core/field/zone.dart';
import 'package:football_sim_core/core/tactics/game_phases.dart';
import 'package:football_sim_core/core/tactics/tactical_roles.dart';

class TacticalZoneMap {
  // Usiamo direttamente GamePhase come chiave. È un'operazione O(1) velocissima.
  final Map<GamePhase, Map<TacticalRole, Zone>> _map;

  TacticalZoneMap(this._map);

  // Default a GamePhase.buildUp (senza parentesi perché è un enum)
  Zone? getZoneFor(TacticalRole role, [GamePhase phase = GamePhase.buildUp]) {
    return _map[phase]?[role];
  }

  Map<TacticalRole, Zone>? getPhaseMap(GamePhase phase) {
    return _map[phase];
  }

  TacticalZoneMap mirrored() {
    // Usiamo il tipo corretto della chiave
    final mirroredMap = <GamePhase, Map<TacticalRole, Zone>>{};

    for (final phase in _map.keys) {
      final roleMap = _map[phase]!;

      // Sfruttiamo il metodo mirrorZone() che abbiamo già nella classe Zone o nella sua extension
      final mirroredRoleMap = roleMap.map(
        (role, zone) => MapEntry(
          role,
          zone.mirrorZone(), // Molto più pulito che ricreare la Zone qui
        ),
      );

      mirroredMap[phase] = mirroredRoleMap;
    }
    return TacticalZoneMap(mirroredMap);
  }
}
