import 'package:football_sim_core/ai/fsm/states/referee/initializing_state.dart';
import 'package:football_sim_core/ai/fsm/states/referee/kick_off_state.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';

class MatchStartSystem extends EcsSystem {
  bool _hasStarted = false;
  @override
  void update(EcsWorld world, double dt) {
    if (_hasStarted) return;
    final playersReady = world.entitiesWith<EcsPlayerComponent>().length == 22;
    final referee = world
        .entitiesWith<FsmComponent<RefereeEntity>>()
        .firstOrNull;

    if (playersReady && referee != null) {
      final fsm = referee.getComponent<FsmComponent<RefereeEntity>>();
      if (fsm?.currentState is InitializingState) {
        fsm?.fsm.changeState(KickoffState());
        _hasStarted = true;
        world.removeSystemLater(this); // 💥 Rimozione del sistema
      }
    }
  }
}
