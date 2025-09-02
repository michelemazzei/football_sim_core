import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';

class StatsComponent extends EcsComponent {
  final Map<EcsEntity, double> possessionTimes = {};
  EcsEntity? currentPossessor;
  double possessionStart = 0;

  void updatePossession(EcsEntity? newPossessor, double dt) {
    if (currentPossessor != null) {
      final duration = dt - possessionStart;
      possessionTimes.update(
        currentPossessor!,
        (lastPos) => lastPos + duration,
        ifAbsent: () => duration,
      );
    }
    currentPossessor = newPossessor;
    possessionStart = dt;
  }
}
