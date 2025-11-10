import 'package:football_sim_core/core/tactics/player_tactic_registry.dart';
import 'package:football_sim_core/core/tactics/player_tactics/player_tactic.dart';
import 'package:football_sim_core/core/tactics/tactics_names.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:logging/logging.dart';

class PlayerTacticBrainComponent extends EcsComponent {
  final logger = Logger('PlayerTacticBrainComponent');
  final Map<TacticsName, PlayerTactic> acceptedTactics =
      PlayerTacticRegistry.getDefaultTactics();
  bool overrideByBrick = true;

  PlayerTactic? currentTactic;

  bool accepts(TacticsName name) => acceptedTactics.keys.contains(name);

  PlayerTactic? getByName(TacticsName name) {
    return acceptedTactics[name];
  }

  void update(PlayerEntity player, EcsWorld world) {
    if (acceptedTactics.isEmpty) return;
    if (overrideByBrick) return;

    final scores = <PlayerTactic, double>{};
    for (final entry in acceptedTactics.entries) {
      final tactic = entry.value;
      final score = tactic.computeUtility(player, world);
      scores[tactic] = score;

      logger.info(
        '[${player.toString()}] ${tactic.name} → ${score.toStringAsFixed(2)}',
      );
    }

    final best = scores.entries.reduce((a, b) => a.value > b.value ? a : b);

    if (best.key != currentTactic) {
      currentTactic = best.key;
      player.fsm.changeState(best.key.createState(player, world));
    }
  }
}
