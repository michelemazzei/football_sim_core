import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';
import 'package:football_sim_core/ai/fsm/states/player/player_idle_state.dart';
import 'package:football_sim_core/ecs/components/action_queue_component.dart';
import 'package:football_sim_core/ecs/components/cool_down_component.dart';
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
      if (queue == null || queue.isEmpty || fsm == null) return;

      // Se il giocatore è pronto (Idle o Stopped), esegui la prossima azione
      final cooldown = player.getComponent<CooldownComponent>();
      cooldown?.update(world.scaledDt);

      if (fsm.isInState(PlayerIdleState()) && (cooldown?.isReady ?? true)) {
        final now = DateTime.now();
        final nextAction = queue.dequeueValid(now);
        if (nextAction != null) {
          cooldown?.start(0.5); // blocca per 0.5s dopo l’azione
          fsm.handleMessage(
            Telegram(
              sender: player,
              receiver: player,
              message: nextAction.message,
            ),
          );
          logger.info('Message next action $nextAction');
        }
      }
    }
  }
}
