import 'package:football_sim_core/ai/fsm/messaging/player_message_registry.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';

class PlayerMessageRegistryComponent extends EcsComponent {
  final PlayerMessageRegistry registry;

  PlayerMessageRegistryComponent(this.registry);
}
