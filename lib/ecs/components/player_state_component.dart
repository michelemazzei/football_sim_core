import 'package:football_sim_core/ecs/components/ecs_component.dart';

enum PlayerState { idle, running, passing, shooting }

class PlayerStateComponent extends EcsComponent {
  PlayerState state;
  PlayerStateComponent(this.state);
}
