import 'package:football_sim_core/ai/fsm/core/game_state.dart';
import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:logging/logging.dart';

abstract class PlayerBaseState extends GameState<PlayerEntity> {
  final _logMsg = Logger('Player MESSAGE');
  @override
  bool onMessage(PlayerEntity entity, Telegram telegram) {
    _logMsg.info(
      'Received message: ${telegram.message}  for Player: ${entity.id}',
    );
    return true;
  }
}
