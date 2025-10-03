import 'package:football_sim_core/core/ecs/components/tactical_intents.dart';
import 'package:football_sim_core/core/ecs/components/tactical_priorities.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';

class TacticalIntentComponent extends EcsComponent {
  TacticalIntent intent;
  DateTime assignedAt;
  TacticalPriority priority;

  TacticalIntentComponent({
    required this.intent,
    this.priority = const TacticalPriority.low(),
  }) : assignedAt = DateTime.now();
}
