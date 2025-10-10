import 'package:football_sim_core/core/ecs/components/tactical_intent_component.dart';
import 'package:football_sim_core/core/ecs/components/tactical_intents.dart';
import 'package:football_sim_core/core/ecs/components/tactical_priorities.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';

class TacticalIntentManager {
  static bool canOverride(EcsEntity player, TacticalPriority newPriority) {
    final current = player.getComponent<TacticalIntentComponent>();
    return (current == null) || newPriority >= current.priority;
  }

  static void assignIntent({
    required EcsEntity player,
    required TacticalIntent intent,
    TacticalPriority priority = const TacticalPriority.low(),
  }) {
    if (!canOverride(player, priority)) return;
    player.addOrReplaceComponent(
      TacticalIntentComponent(intent: intent, priority: priority),
    );
  }

  static void clearIntent(EcsEntity entity) {
    entity.removeComponent<TacticalIntentComponent>();
  }

  static bool isBusy(EcsEntity entity) {
    final intent = entity.getComponent<TacticalIntentComponent>()?.intent;
    return intent != null && intent != TacticalIntent.none();
  }

  static bool canBeRedirected(EcsEntity entity) {
    final intent = entity.getComponent<TacticalIntentComponent>()?.intent;
    return intent == null || intent == TacticalIntent.none();
  }

  static TacticalIntent? getIntent(EcsEntity entity) {
    return entity.getComponent<TacticalIntentComponent>()?.intent;
  }
}
