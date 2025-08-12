import 'package:football_sim_core/ai/fsm/messaging/message_dispatcher.dart';
import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';

abstract class State<EntityType> {
  final MessageDispatcher dispatcher;
  State() : dispatcher = MessageDispatcher();
  void enter(EntityType entity);
  void execute(EntityType entity);
  void exit(EntityType entity);
  bool onMessage(EntityType entity, Telegram telegram) => false;
  @override
  String toString() => runtimeType.toString();
}
