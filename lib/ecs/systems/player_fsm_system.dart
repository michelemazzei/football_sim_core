import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';
import 'package:football_sim_core/ai/fsm/states/player/player_idle_state.dart';
import 'package:football_sim_core/ecs/components/action_queue_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/ecs/systems/fsm_system.dart';

class PlayerFsmSystem extends FsmSystem {
  @override
  void update(EcsWorld world, double dt) {
    final entities = world.entitiesWith<FsmComponent<PlayerEntity>>();
    for (final entity in entities) {
      entity.getComponent<FsmComponent<PlayerEntity>>()?.updateFSM(dt);
    }

    final players = world
        .entitiesWithAll<ActionQueueComponent, FsmComponent<PlayerEntity>>();
    for (final player in players) {
      final queue = player.getComponent<ActionQueueComponent>();
      final fsm = player.getComponent<FsmComponent<PlayerEntity>>()?.fsm;
      if (queue == null || fsm == null) return;

      // Se il giocatore è pronto (Idle o Stopped), esegui la prossima azione
      if (fsm.isInState(PlayerIdleState())) {
        final nextAction = queue.dequeue();
        if (nextAction != null) {
          fsm.handleMessage(
            Telegram(sender: player, receiver: player, message: nextAction),
          );
        }
      }
    }
  }
}
