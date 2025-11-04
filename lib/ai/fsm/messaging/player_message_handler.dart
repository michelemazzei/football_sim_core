import 'package:football_sim_core/ai/fsm/components/fsm.dart';
import 'package:football_sim_core/ai/fsm/messaging/player_message_registry.dart';
import 'package:football_sim_core/ai/fsm/messaging/player_messages.dart';
import 'package:football_sim_core/ai/fsm/states/player/move_to_ball_state.dart';
import 'package:football_sim_core/ai/fsm/states/player/receive_ball_state.dart';
import 'package:football_sim_core/ai/steering/player_utils.dart';
import 'package:football_sim_core/core/ecs/messages/tactic_messages.dart';
import 'package:football_sim_core/core/fsm/state/move_to_zone_state.dart';
import 'package:football_sim_core/ecs/components/ball_intent_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/components/receive_ball_intent_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:logging/logging.dart';

typedef PlayerMessageHandler<T extends PlayerMessage> =
    void Function(
      T message,
      PlayerEntity player,
      EcsWorld world,
      Fsm<EcsEntity> fsm,
    );

final _logger = Logger('fsm.messaging.PlayerMessageHandler');

void registerPlayerMessageHandlers(PlayerMessageRegistry registry) {
  registry.register<MoveToBall>((
    MoveToBall message,
    PlayerEntity player,
    EcsWorld world,
    Fsm<EcsEntity> fsm,
  ) {
    player.getComponent<FsmComponent<PlayerEntity>>()!.fsm.changeState(
      MoveToBallState(intent: message.intent),
    );
  });

  registry.register<PassToNearestTeammate>((
    PassToNearestTeammate msg,
    PlayerEntity entity,
    EcsWorld world,
    Fsm<EcsEntity> fsm,
  ) {
    final teammate = PlayerUtils.findClosestTeammate(entity);
    _logger.fine('closest  ${teammate.toString()}');
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
  });

  registry.register<TacticalMoveToZone>((
    TacticalMoveToZone message,
    PlayerEntity player,
    EcsWorld world,
    Fsm<EcsEntity> fsm,
  ) {
    fsm.changeState(
      MoveToZoneState(targetZone: message.targetZone),
      forceToChange: true,
    );
  });
}
