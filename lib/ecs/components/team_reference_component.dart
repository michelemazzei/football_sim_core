import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/model/team_id.dart';

class TeamReferenceComponent extends EcsComponent {
  final TeamId teamId;
  TeamReferenceComponent(this.teamId);
}
