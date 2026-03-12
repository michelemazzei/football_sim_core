import 'package:flame/game.dart';
import 'package:football_sim_core/ai/intents/move_player_intent.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';

import 'message.dart';

typedef OnAck = void Function();

abstract interface class PlayerMessage implements Message {
  OnAck? get onAck;
  bool get requiresAck;
  EcsEntity get receiver;
}

sealed class PlayerUnion implements PlayerMessage {
  @override
  final OnAck? onAck;
  @override
  final bool requiresAck;
  @override
  final EcsEntity receiver;

  const PlayerUnion({
    required this.receiver,
    this.requiresAck = false,
    this.onAck,
  });
}

class ReceiveBallIntent extends PlayerUnion {
  final Vector2 targetPosition;
  const ReceiveBallIntent({
    required super.receiver,
    required this.targetPosition,
    super.requiresAck,
    super.onAck,
  });
}

class PassToNearestTeammate extends PlayerUnion {
  const PassToNearestTeammate({
    required super.receiver,
    super.requiresAck,
    super.onAck,
  });
}

class MoveToPosition extends PlayerUnion {
  final Vector2 target;
  const MoveToPosition({
    required super.receiver,
    required this.target,
    super.requiresAck,
    super.onAck,
  });
}

class MoveToBall extends PlayerUnion {
  final MovePlayerIntent intent;
  const MoveToBall({
    required super.receiver,
    required this.intent,
    super.requiresAck,
    super.onAck,
  });
}

class PlaceToKickOff extends PlayerUnion {
  const PlaceToKickOff({
    required super.receiver,
    super.requiresAck,
    super.onAck,
  });
}

class ReceiveBall extends PlayerUnion {
  const ReceiveBall({required super.receiver, super.requiresAck, super.onAck});
}
