import 'package:football_sim_core/ai/fsm/core/game_state.dart';
import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';

abstract class PlayerBaseState extends GameState<PlayerEntity> {
  @override
  bool onMessage(PlayerEntity entity, Telegram telegram, EcsWorld world) =>
      true;
}
