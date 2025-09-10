import 'dart:collection';

import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';

class ActionQueueComponent extends EcsComponent {
  final actions = Queue<PlayerMessage>();

  bool isBusy = false;
  bool canInterrupt = true;
  final EcsEntity sender;
  ActionQueueComponent({
    required this.sender,
    this.canInterrupt = true,
    this.isBusy = false,
    Iterable<PlayerMessage>? userAction,
  }) {
    actions.addAll(userAction ?? Iterable<PlayerMessage>.empty());
  }

  void enqueue(PlayerMessage message) => actions.addLast(message);
  PlayerMessage? dequeue() => actions.isNotEmpty ? actions.removeFirst() : null;
  bool get isEmpty => actions.isEmpty;

  void clearQueue() => actions.clear();
  int get length => actions.length;
}
