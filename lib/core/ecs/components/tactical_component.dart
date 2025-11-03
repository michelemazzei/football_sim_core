import 'package:football_sim_core/core/ecs/components/tactical_priorities.dart';
import 'package:football_sim_core/core/tactics/tactics.dart';
import 'package:football_sim_core/core/tactics/tactics_names.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';

class TacticalComponent extends EcsComponent {
  final List<Tactic> tactics = [];
  Tactic? activeTactic;
  TacticalPriority get priority =>
      activeTactic?.priority ?? TacticalPriority.low();

  void activate(TacticsName name) {
    final tactic = tactics.firstWhere(
      (t) => t.name == name,
      orElse: () => throw Exception('Tactic not found'),
    );
    tactic.activatedAt = DateTime.now();
    activeTactic = tactic;
  }

  void deactivate() {
    activeTactic = null;
  }

  void removeExpiredTactics() {
    tactics.removeWhere((t) => t.isExpired());
    if (activeTactic?.isExpired() ?? false) {
      deactivate();
    }
  }
}
