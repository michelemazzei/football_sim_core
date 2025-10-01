import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/ecs/components/group_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';
import 'package:logging/logging.dart';

class MessageDispatcherSystem extends EcsSystem {
  final logger = Logger('ecs.systems.MessageDispatcherSystem');
  final dispatcher = MessageDispatcher();

  final EcsWorld world;

  MessageDispatcherSystem(this.world);

  void sendMessage({
    required EcsEntity sender,
    required Message message,
    required EcsEntity receiver,
  }) {
    dispatcher.dispatchMessage(
      sender: sender,
      message: message,
      receiver: receiver,
    );
  }

  void broadcast<T extends EcsComponent>({
    required EcsEntity sender,
    required Message message,
  }) {
    for (final entity in world.entitiesWith<T>()) {
      dispatcher.dispatchMessage(
        sender: sender,
        receiver: entity,
        message: message,
      );
    }
  }

  void sendToGroup({
    required EcsEntity sender,
    required String groupId,
    required Message message,
  }) {
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

  @override
  void update(EcsWorld world, double dt) {
    dispatcher.consume();
  }
}
