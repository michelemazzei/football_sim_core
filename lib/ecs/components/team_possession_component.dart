import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/model/team.dart';

class TeamPossessionComponent extends EcsComponent {
  Team? team;
  TeamPossessionComponent(this.team);
}
