import 'package:football_sim_core/core/tactics/tactics_names.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';

class AppliedTacticComponent extends EcsComponent {
  final TacticsName tacticId;
  final DateTime appliedAt;

  AppliedTacticComponent({required this.tacticId, required this.appliedAt});
}
