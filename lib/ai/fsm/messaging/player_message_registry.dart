import 'package:football_sim_core/ai/fsm/messaging/player_message_handler.dart';
import 'package:football_sim_core/ai/fsm/messaging/player_messages.dart';

class PlayerMessageRegistry {
  final Map<String, dynamic> _handlers = {};

  void register<T extends PlayerMessage>(PlayerMessageHandler<T> handler) {
    final key = T.toString();
    _handlers[key] = handler;
  }

  Function? getHandler<T extends PlayerMessage>(T message) {
    final handler = _handlers[message.runtimeType.toString()];
    return handler;
  }

  int get count => _handlers.length;
}
