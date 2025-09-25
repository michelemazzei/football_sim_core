import 'package:football_sim_core/ai/fsm/messaging/player_message_handler.dart';
import 'package:football_sim_core/ai/fsm/messaging/player_message_registry.dart';
import 'package:football_sim_core/ecs/components/player_message_registry_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';

PlayerMessageRegistry setupPlayerMessageRegistry(EcsWorld world) {
  PlayerMessageRegistry registry = PlayerMessageRegistry();
  registerPlayerMessageHandlers(registry);
  world.addResource(PlayerMessageRegistryComponent(registry));
  return registry;
}
