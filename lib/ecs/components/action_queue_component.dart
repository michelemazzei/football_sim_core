import 'dart:collection';

import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';

class ActionQueueComponent extends EcsComponent {
  final Queue<PlayerMessage> actions = Queue<PlayerMessage>();

  void enqueue(PlayerMessage message) => actions.addLast(message);
  PlayerMessage? dequeue() => actions.isNotEmpty ? actions.removeFirst() : null;
  bool get isEmpty => actions.isEmpty;
}
