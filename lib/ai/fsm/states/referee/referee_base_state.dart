import 'package:football_sim_core/ai/fsm/core/game_state.dart';
import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';

abstract class RefereeBaseState extends GameState<RefereeEntity> {
  @override
  bool onMessage(RefereeEntity entity, Telegram telegram, EcsWorld world) =>
      false;
}
