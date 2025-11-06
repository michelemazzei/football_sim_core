import 'package:football_sim_core/core/tactics/player_tactics/player_tactic.dart';
import 'package:football_sim_core/core/tactics/tactics_names.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';

class PlayerTacticBrainComponent extends EcsComponent {
  late final Set<TacticsName> acceptedTactics;
  final List<PlayerTactic> activeTactics;

  PlayerTacticBrainComponent({
    Set<TacticsName>? tactics,
    this.activeTactics = const <PlayerTactic>[],
  }) {
    acceptedTactics = <TacticsName>{};
    tactics ??= {};
    acceptedTactics.addAll(tactics);
    acceptedTactics.add(
      TacticsName.zoneTactics(),
    ); // la zone Tactics deve essere sempre presente.
  }

  bool accepts(TacticsName name) => acceptedTactics.contains(name);

  void update(PlayerEntity player, EcsWorld world) {
    final best = activeTactics
        .map((t) => MapEntry(t, t.computeUtility(player, world)))
        .reduce((a, b) => a.value > b.value ? a : b);

    player.fsm.changeState(best.key.createState(player, world));
  }
}
