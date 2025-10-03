import 'package:football_sim_core/core/ecs/components/tactical_intent_component.dart';
import 'package:football_sim_core/core/ecs/components/tactical_intents.dart';
import 'package:football_sim_core/core/ecs/components/tactical_priorities.dart';
import 'package:football_sim_core/core/field/zone.dart';

class ZonePositionComponent extends TacticalIntentComponent {
  Zone zone;

  ZonePositionComponent(this.zone)
    : super(
        intent: const TacticalIntent.coveringZone(),
        priority: TacticalPriority.low(),
      );
}
