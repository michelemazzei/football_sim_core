import 'package:football_sim_core/ai/fsm/fsm.dart';
import 'package:football_sim_core/ai/fsm/messaging/message.dart';
import 'package:football_sim_core/ai/fsm/messaging/player_messages.dart';
import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';
import 'package:football_sim_core/ai/fsm/states/player/move_to_ball_state.dart';
import 'package:football_sim_core/ai/fsm/states/player/player_idle_state.dart';
import 'package:football_sim_core/ai/fsm/states/player/prepare_kick_state.dart';
import 'package:football_sim_core/ai/fsm/states/player/receive_ball_state.dart';
import 'package:football_sim_core/ai/intents/move_player_intent.dart';
import 'package:football_sim_core/ai/steering/player_utils.dart';
import 'package:football_sim_core/ecs/components/action_queue_component.dart';
import 'package:football_sim_core/ecs/components/ball_intent_component.dart';
import 'package:football_sim_core/ecs/components/cool_down_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/components/receive_ball_intent_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';
import 'package:logging/logging.dart';

class PlayerActionHandlerSystem extends EcsSystem {
  final logger = Logger('ecs.systems.PlayerActionHandlerSystem');
  final _validStates = {PlayerIdleState, PrepareKickState, ReceiveBallState};

  bool _canProcessNextAction(
    Fsm<PlayerEntity> fsm,
    CooldownComponent? cooldown,
  ) =>
      _validStates.contains(fsm.currentState.runtimeType) &&
      (cooldown?.isReady ?? true);

  @override
  void update(EcsWorld world, double dt) {
    final players = world.entitiesOf<PlayerEntity>();

    for (final player in players) {
      final fsm = player.getComponent<FsmComponent<PlayerEntity>>()?.fsm;
      if (fsm == null) continue;
      final queue = player.getComponent<ActionQueueComponent>();
      if (queue == null || queue.isEmpty) continue;

      final cooldown = player.getComponent<CooldownComponent>();
      cooldown?.update(world.scaledDt);
      final canAct = _canProcessNextAction(fsm, cooldown);

      if (!canAct) continue;

      final now = DateTime.now();
      final nextAction = queue.dequeueValid(now);
      if (nextAction != null) {
        cooldown?.start(0.5); // blocca per 0.5s dopo l’azione
        logger.info('✉️ Received $nextAction  for player: ${player.number}');

        logger.info('📨 Processing $nextAction');
        _handleActionMessage(
          player,
          Telegram(
            sender: player,
            receiver: player,
            message: nextAction.message,
          ),
          world,
          fsm,
        );
        logger.info('✅ Completed $nextAction');
      }
    }
  }

  bool _handleActionMessage(
    PlayerEntity entity,
    Telegram telegram,
    EcsWorld world,
    Fsm fsm,
  ) {
    logger.info(
      '📨 Processing ${telegram.message.toShortString()}  for Player: ${entity.id}',
    );
    if (entity.id != telegram.receiver.id) {
      return false;
    }

    final msg = telegram.message;
    if (msg is! PlayerMessage) return false;

    msg.maybeWhen(
      passToNearestTeammate: (bool requireAck, Function? onAck) {
        final teammate = PlayerUtils.findClosestTeammate(entity);
        logger.fine('closest  ${teammate.toString()}');
        final ball = world.entitiesOf<BallEntity>().firstOrNull;
        if (ball == null) return;

        final ballPos = ball.position;
        final teammatePos = teammate.position;

        final direction = (teammatePos - ballPos).normalized();
        final force = 3.0; // puoi tararlo in base alla distanza

        teammate.addComponent(
          ReceiveBallIntentComponent.fromMessage(
            ReceiveBallIntent(receiver: teammate, targetPosition: ballPos),
          ),
        );

        teammate.fsm.changeState(ReceiveBallState());

        ball.addComponent(
          BallIntentComponent(
            intent: BallIntent.kicked,
            direction: direction,
            force: force,
          ),
        );
      },

      moveToBall: (MovePlayerIntent intent, bool requireAck, Function? onAck) {
        entity.getComponent<FsmComponent<PlayerEntity>>()!.fsm.changeState(
          MoveToBallState(intent: intent),
        );
      },
      orElse: () {
        logger.finest(
          'Player  ${entity.number} received an unhandled message: ${telegram.message}.',
        );
      },
    );
    return true;
  }
}
