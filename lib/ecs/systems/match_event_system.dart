import 'package:football_sim_core/ai/fsm/components/fsm_component.dart';
import 'package:football_sim_core/ecs/components/match_event_component.dart';
import 'package:football_sim_core/ecs/ecs_system.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/match_entity.dart';
import 'package:football_sim_core/match/play_state.dart';

class MatchEventSystem extends EcsSystem {
  @override
  void update(EcsWorld world, double dt) {
    for (final entity in world.entitiesWith<MatchEventComponent>()) {
      final event = entity.getComponent<MatchEventComponent>()?.event;

      switch (event) {
        case MatchEvent.startPlay:
          entity.getComponent<FsmComponent<MatchEntity>>()?.fsm.changeState(
            PlayState(),
          );
          break;
        // altri eventi...
        default:
          break;
      }

      entity.removeComponent<MatchEventComponent>();
    }
  }
}
