import 'package:flame/components.dart';
import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/ai/fsm/states/player/move_to_ball_state.dart';
import 'package:football_sim_core/ai/fsm/states/player/player_base_state.dart';
import 'package:football_sim_core/ecs/components/receive_ball_intent_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:logging/logging.dart';

class ReceiveBallState extends PlayerBaseState {
  final logger = Logger('ReceiveBallState');
  late Vector2 _target;
  bool _hasDispatchedMove = false;

  @override
  void enter(PlayerEntity entity, EcsWorld world) {
    logger.info('Player ${entity.id} entered ReceiveBallState');
    final intent = entity.getComponent<ReceiveBallIntentComponent>();
    if (intent == null) return;

    _target = intent.targetPosition;
    _hasDispatchedMove = false;
  }

  @override
  void execute(PlayerEntity entity, double dt, EcsWorld world) {
    logger.info('Player ${entity.id} executes ReceiveBallState');
    if (!_hasDispatchedMove) {
      entity.fsm.changeState(
        MoveToBallState(intent: MovePlayerIntent.intercept),
      );

      _hasDispatchedMove = true;
    }
  }

  @override
  void exit(PlayerEntity entity, EcsWorld world) {
    logger.info('Player ${entity.id} exiting ReceiveBallState');
    entity.removeComponent<ReceiveBallIntentComponent>();
  }

  @override
  bool onMessage(PlayerEntity entity, Telegram telegram, EcsWorld world) =>
      false;
}
