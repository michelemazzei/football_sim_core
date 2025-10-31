import 'package:football_sim_core/core/ecs/components/tactical_intents.dart';
import 'package:football_sim_core/core/ecs/components/tactical_priorities.dart';
import 'package:football_sim_core/core/ecs/components/tactical_setup_component.dart';
import 'package:football_sim_core/core/ecs/components/team_phase_component.dart';
import 'package:football_sim_core/core/field/zone.dart';
import 'package:football_sim_core/core/tactics/game_phases.dart';
import 'package:football_sim_core/core/tactics/tactical_roles.dart';
import 'package:football_sim_core/core/tactics/tactics_names.dart';
import 'package:football_sim_core/ecs/entities/team_entity.dart';
import 'package:football_sim_core/model/tactical_setup.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tactics.freezed.dart';

@unfreezed
abstract class Tactic with _$Tactic {
  factory Tactic({
    required final TacticsName name,
    @Default(TacticalPriority.low()) TacticalPriority priority,
    @Default(TacticalIntent.none()) TacticalIntent intent,
    Duration? expiration,
    DateTime? activatedAt,
    required Map<TacticalRole, Zone> zoneAssignments,
  }) = _Tactic;
}

extension TacticsX on Tactic {
  bool isExpired([DateTime? theTime]) {
    final now = theTime ?? DateTime.now();
    if (expiration == null || activatedAt == null) return false;
    return now.difference(activatedAt!) > expiration!;
  }

  static Map<TacticalRole, Zone> tacticFromTeam(TeamEntity team) {
    final phase = team.getComponent<TeamPhaseComponent>(
      ifAbsent: () => TeamPhaseComponent(GamePhase.buildUp()),
    );
    final assignment = <TacticalRole, Zone>{};

    final setup = team.getComponent<TacticalSetupComponent>()?.setup;
    if (setup == null) {
      return {};
    }
    for (final role in setup.formation.roles) {
      final zone = setup.map.getZoneFor(role, phase!.current);
      if (zone != null) {
        assignment[role] = zone;
      }
    }
    return assignment;
  }

  static Tactic tacticFromSetup({
    required TacticsName name,
    required TacticalSetup setup,
    GamePhase gamePhase = const GamePhase.buildUp(),
    TacticalPriority priority = const TacticalPriority.low(),
    TacticalIntent intent = const TacticalIntent.coveringZone(),
  }) {
    final map = setup.map;
    final zoneAssignments = <TacticalRole, Zone>{};

    for (final role in setup.formation.roles) {
      final zone = map.getZoneFor(role, gamePhase); // o fase dinamica
      if (zone != null) {
        zoneAssignments[role] = zone;
      }
    }

    return Tactic(
      name: name,
      priority: priority,
      intent: intent,
      zoneAssignments: zoneAssignments,
    );
  }
}
