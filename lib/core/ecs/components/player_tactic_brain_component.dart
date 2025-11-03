import 'package:football_sim_core/core/tactics/tactics_names.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';

class PlayerTacticBrainComponent extends EcsComponent {
  late final Set<TacticsName> acceptedTactics;

  PlayerTacticBrainComponent({Set<TacticsName>? tactics}) {
    acceptedTactics = <TacticsName>{};
    tactics ??= {};
    acceptedTactics.addAll(tactics);
    acceptedTactics.add(
      TacticsName.zoneTactics(),
    ); // la zone Tactics deve essere sempre presente.
  }

  bool accepts(TacticsName name) => acceptedTactics.contains(name);
}
