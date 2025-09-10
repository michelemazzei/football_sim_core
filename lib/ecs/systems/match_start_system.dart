import 'package:football_sim_core/ai/fsm/states/referee/initializing_state.dart';
import 'package:football_sim_core/ai/fsm/states/referee/kick_off_state.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/components/match_lifecycle_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';

class MatchStartSystem extends EcsSystem {
  bool alreadyCreated = false;
  MatchStartSystem() {
    assert(!alreadyCreated, "MatchStartSystem can only be created once.");
    alreadyCreated = true;
  }

  @override
  void update(EcsWorld world, double dt) {
    final playersReady = world.entitiesWith<EcsPlayerComponent>().length == 22;
    final referee = world
        .entitiesWith<FsmComponent<RefereeEntity>>()
        .firstOrNull;
    if (playersReady && referee != null) {
      final lifeCycle = referee.getComponent<MatchLifecycleComponent>();
      if (lifeCycle?.kickoffStarted ?? true) {
        return;
      }
      lifeCycle?.kickoffStarted = true;
      final fsm = referee.getComponent<FsmComponent<RefereeEntity>>();
      if (fsm?.currentState is InitializingState) {
        fsm?.fsm.changeState(KickoffState());
        world.removeSystemLater(this); // 💥 Rimozione del sistema
      }
    }
  }
}
