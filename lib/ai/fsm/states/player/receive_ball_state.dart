import 'package:flame/components.dart';
import 'package:football_sim_core/ai/fsm/states/player/move_to_ball_state.dart';
import 'package:football_sim_core/ai/fsm/states/player/player_base_state.dart';
import 'package:football_sim_core/ai/intents/move_player_intent.dart';
import 'package:football_sim_core/ecs/components/receive_ball_intent_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:logging/logging.dart';

class ReceiveBallState extends PlayerBaseState {
  final logger = Logger('ReceiveBallState');
  late Vector2 _target;
  bool _hasDispatchedMove = false;

  @override
  void doEnter(PlayerEntity entity, EcsWorld world) {
    final intent = entity.getComponent<ReceiveBallIntentComponent>();
    if (intent == null) return;

    _target = intent.targetPosition;
    _hasDispatchedMove = false;
  }

  @override
  void doExecute(PlayerEntity entity, double dt, EcsWorld world) {
    if (!_hasDispatchedMove) {
      entity.fsm.changeState(
        MoveToBallState(intent: MovePlayerIntent.intercept()),
      );

      _hasDispatchedMove = true;
    }
  }

  @override
  void doExit(PlayerEntity entity, EcsWorld world) {
    entity.removeComponent<ReceiveBallIntentComponent>();
  }
}
