import 'package:flame/components.dart';
import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';

class ReceiveBallIntentComponent extends EcsComponent {
  final Vector2 targetPosition;
  final EcsEntity receiver;

  ReceiveBallIntentComponent({
    required this.receiver,
    required this.targetPosition,
  });

  factory ReceiveBallIntentComponent.fromMessage(ReceiveBallIntent message) {
    return ReceiveBallIntentComponent(
      receiver: message.receiver,
      targetPosition: message.targetPosition,
    );
  }
}
