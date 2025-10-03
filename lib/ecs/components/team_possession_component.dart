import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/model/team_id.dart';

class TeamPossessionComponent extends EcsComponent {
  TeamId? teamId;
  TeamPossessionComponent(this.teamId);
}
