import 'dart:collection';

import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';

class QueuedPlayerMessage {
  final PlayerMessage message;
  final DateTime timestamp;
  final Duration timeout;

  QueuedPlayerMessage({
    required this.message,
    required this.timestamp,
    required this.timeout,
  });

  @override
  String toString() =>
      'QueuedPlayerMessage(message: ${message.toShortString()}, timestamp: $timestamp, timeout: $timeout)';
  bool isExpired(DateTime now) => now.difference(timestamp) > timeout;
}

class ActionQueueComponent extends EcsComponent {
  final Queue<QueuedPlayerMessage> actions = Queue();

  bool isBusy = false;
  bool canInterrupt = true;
  final EcsEntity sender;
  static const _longTimeout = Duration(seconds: 90);

  ActionQueueComponent({
    required this.sender,
    this.canInterrupt = true,
    this.isBusy = false,
    Iterable<PlayerMessage>? userAction,
  }) {
    final now = DateTime.now();
    actions.addAll(
      (userAction ?? []).map(
        (msg) => QueuedPlayerMessage(
          message: msg,
          timestamp: now,
          timeout: _longTimeout,
        ),
      ),
    );
  }

  void enqueue(PlayerMessage message, {Duration timeout = _longTimeout}) {
    actions.addLast(
      QueuedPlayerMessage(
        message: message,
        timestamp: DateTime.now(),
        timeout: timeout,
      ),
    );
  }

  QueuedPlayerMessage? dequeueValid(DateTime now) {
    while (actions.isNotEmpty) {
      final next = actions.first;
      if (next.isExpired(now)) {
        actions.removeFirst(); // scarta messaggio scaduto
      } else {
        return actions.removeFirst(); // valido
      }
    }
    return null;
  }

  bool get isEmpty => actions.isEmpty;
  void clearQueue() => actions.clear();
  int get length => actions.length;
}
