import 'package:football_sim_core/ai/fsm/core/game_state.dart';
import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:logging/logging.dart';

abstract class BallBaseState extends GameState<BallEntity> {
  final _logMsg = Logger('Ball MESSAGE');
  @override
  bool onMessage(BallEntity entity, Telegram telegram, EcsWorld world) {
    _logMsg.info(
      '${toString()} - Received message: ${telegram.message}  for Ball: ${entity.id}',
    );
    return true;
  }
}
