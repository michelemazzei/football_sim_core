import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/ecs/components/group_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';

class MessageSenderComponent extends EcsComponent {
  final MessageDispatcher dispatcher = MessageDispatcher();
  final EcsEntity sender;
  final EcsWorld world;

  MessageSenderComponent({required this.sender, required this.world});

  void sendMessage(Message message, EcsEntity receiver) {
    dispatcher.dispatchMessage(
      sender: sender,
      message: message,
      receiver: receiver,
    );
  }

  void broadcast(Message message) {
    for (final entity in world.entities()) {
      dispatcher.dispatchMessage(
        sender: sender,
        receiver: entity,
        message: message,
      );
    }
  }

  void sendToGroup(String groupId, Message message) {
    for (final entity in world.entities()) {
      final group = entity.getComponent<GroupComponent>();
      if (group != null && group.groupId == groupId) {
        dispatcher.dispatchMessage(
          sender: sender,
          receiver: entity,
          message: message,
        );
      }
    }
  }
}
