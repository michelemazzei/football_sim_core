import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/model/team.dart';

class BallPossessionComponent extends EcsComponent {
  final int? playerId;
  final Team? teamId;

  BallPossessionComponent({this.playerId, this.teamId});
}
