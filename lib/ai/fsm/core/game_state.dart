import 'package:football_sim_core/ai/fsm/messaging/message_dispatcher.dart';
import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';

abstract class GameState<EntityType> {
  final MessageDispatcher dispatcher;
  GameState() : dispatcher = MessageDispatcher();
  void enter(EntityType entity, EcsWorld world) {}
  void execute(EntityType entity, double dt, EcsWorld world) {}
  void exit(EntityType entity, EcsWorld world) {}
  bool onMessage(EntityType entity, Telegram telegram, EcsWorld world) => false;
  @override
  String toString() => runtimeType.toString();
}
