import 'package:football_sim_core/ai/fsm/messaging/message_dispatcher.dart';
import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';

abstract class GameState<EntityType> {
  final MessageDispatcher dispatcher;
  GameState() : dispatcher = MessageDispatcher();
  void enter(EntityType entity);
  void execute(EntityType entity, double dt);
  void exit(EntityType entity);
  bool onMessage(EntityType entity, Telegram telegram) => false;
  @override
  String toString() => runtimeType.toString();
}
