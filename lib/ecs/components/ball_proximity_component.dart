import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/ecs/entities/team_id.dart';

class BallProximityComponent extends EcsComponent {
  PlayerEntity? playerEntity;
  double? distance;
  TeamId? teamId;
  BallProximityComponent({this.playerEntity, this.distance, this.teamId});
}
