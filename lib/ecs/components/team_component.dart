import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/model/team.dart';

class TeamComponent extends EcsComponent {
  final Team team;
  TeamComponent(this.team);
}
