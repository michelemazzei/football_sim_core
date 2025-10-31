import 'package:football_sim_core/core/tactics/tactics_names.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';

class PlayerTacticBrainComponent extends EcsComponent {
  final Set<TacticsName> acceptedTactics;

  PlayerTacticBrainComponent({required this.acceptedTactics});

  bool accepts(TacticsName name) => acceptedTactics.contains(name);
}
