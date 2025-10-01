import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';

abstract class GameState<EntityType> {
  GameState();
  void enter(EntityType entity);
  void execute(EntityType entity);
  void exit(EntityType entity);
  bool onMessage(EntityType entity, Telegram telegram) => false;
  @override
  String toString() => runtimeType.toString();
}
