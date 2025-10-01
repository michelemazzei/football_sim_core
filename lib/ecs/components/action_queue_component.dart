import 'dart:collection';

import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';

class ActionQueueComponent extends EcsComponent {
  final Queue<Telegram> actions = Queue();
  final EcsEntity entity;
  bool isBusy = false;
  bool canInterrupt = true;

  ActionQueueComponent({
    this.canInterrupt = true,
    required this.entity,
    final Duration? timeout,
    this.isBusy = false,
    Iterable<PlayerMessage>? userAction,
  }) {
    final now = DateTime.now();
    actions.addAll(
      (userAction ?? []).map(
        (msg) => TelegramUnion.create(
          message: msg,
          messageTime: now,
          receiver: entity,
          timeOut: DateTime.now().add(timeout ?? Duration.zero),
        ),
      ),
    );
  }

  bool get isEmpty => actions.isEmpty;
  int get length => actions.length;
}
