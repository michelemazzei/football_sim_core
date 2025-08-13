import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/model/player_role.dart';

class RoleComponent extends EcsComponent {
  final PlayerRole role;
  RoleComponent(this.role);
}
