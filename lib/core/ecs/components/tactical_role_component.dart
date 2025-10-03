import 'package:football_sim_core/core/tactics/tactical_roles.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';

class TacticalRoleComponent implements EcsComponent {
  TacticalRole role;
  TacticalRoleComponent({required this.role});
}
