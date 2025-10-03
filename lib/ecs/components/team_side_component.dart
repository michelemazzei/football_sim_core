import 'package:football_sim_core/ecs/components/ecs_component.dart';

class TeamSideComponent extends EcsComponent {
  bool get isRightSide => !isLeftSide;
  final bool isLeftSide;
  TeamSideComponent(this.isLeftSide);
}
