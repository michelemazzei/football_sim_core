import 'package:football_sim_core/ai/fsm/player_fsm.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';

class PlayerFsmComponent extends EcsComponent {
  final PlayerFsm fsm;

  PlayerFsmComponent(this.fsm);
}
