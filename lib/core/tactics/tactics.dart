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

class Tactic {
  final TacticsName name;
  TacticalPriority priority;
  TacticalIntent intent;
  Duration? expiration;
  DateTime? activatedAt;
  final Map<TacticalRole, Zone> zoneAssignments;

  Tactic({
    required this.name,
    this.priority = TacticalPriority.low,
    this.intent = TacticalIntent.none,
    this.expiration,
    this.activatedAt,
    required this.zoneAssignments,
  });

  bool isExpired([DateTime? theTime]) {
    final now = theTime ?? DateTime.now();
    if (expiration == null || activatedAt == null) return false;
    return now.difference(activatedAt!) > expiration!;
  }

  // Metodi statici portati dentro la classe per ordine
  static Map<TacticalRole, Zone> tacticFromTeam(TeamEntity team) {
    final phaseComponent = team.getComponent<TeamPhaseComponent>(
      ifAbsent: () => TeamPhaseComponent(GamePhase.buildUp),
    );

    final phase = phaseComponent?.current ?? GamePhase.buildUp;
    final assignment = <TacticalRole, Zone>{};

    final setup = team.getComponent<TacticalSetupComponent>()?.setup;
    if (setup == null) return {};

    for (final role in setup.formation.roles) {
      final zone = setup.map.getZoneFor(role, phase);
      if (zone != null) {
        assignment[role] = zone;
      }
    }
    return assignment;
  }

  static Tactic tacticFromSetup({
    required TacticsName name,
    required TacticalSetup setup,
    GamePhase gamePhase = GamePhase.buildUp,
    TacticalPriority priority = TacticalPriority.low,
    TacticalIntent intent = TacticalIntent.coveringZone,
  }) {
    final map = setup.map;
    final zoneAssignments = <TacticalRole, Zone>{};

    for (final role in setup.formation.roles) {
      final zone = map.getZoneFor(role, gamePhase);
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
