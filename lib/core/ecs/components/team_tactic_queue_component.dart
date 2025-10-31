import 'package:collection/collection.dart';
import 'package:football_sim_core/core/ecs/components/tactical_priorities.dart';
import 'package:football_sim_core/core/tactics/game_phases.dart';
import 'package:football_sim_core/core/tactics/tactics.dart';
import 'package:football_sim_core/core/tactics/tactics_names.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';

class TeamTacticQueueComponent extends EcsComponent {
  final Map<TacticsName, Tactic> activeTactics = {};
  GamePhase? lastZonePhase;

  Iterable<Tactic> get tactics => activeTactics.values.toList().sorted((a, b) {
    final priorityCompare = b.priority.value.compareTo(a.priority.value);
    if (priorityCompare != 0) return priorityCompare;

    final dateA = a.activatedAt ?? DateTime(2000);
    final dateB = b.activatedAt ?? DateTime(2000);
    return -dateA.compareTo(dateB);
  });

  void updateTactic(Tactic tactic) {
    activeTactics.update(tactic.name, (old) => tactic, ifAbsent: () => tactic);
  }

  void removeExpired(DateTime now) {
    activeTactics.removeWhere((name, tactic) => tactic.isExpired(now));
  }

  Tactic? get highestPriority => tactics.firstOrNull;
}
