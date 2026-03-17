import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ai/steering/player_utils.dart';
import 'package:football_sim_core/ecs/components/ball_possession_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/components/team_reference_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';

class BallInteractSystem extends EcsSystem {
  @override
  void update(EcsWorld world, double dt) {
    final referee = world.requiredReferee;
    final ball = world.requiredBall;

    final ballPos = ball.position;

    final players = world
        .entitiesWith<EcsPlayerComponent>()
        .whereType<PlayerEntity>();

    final closestPlayers = PlayerUtils.findClosestPlayersToBall(players, ball);
    final closest = closestPlayers.firstOrNull;
    if (closest == null) {
      return;
    }
    final distance = closest
        .getComponent<MovingComponent>()!
        .currentPosition
        .distanceTo(ballPos);

    if (distance <= SoccerParameters.possessionRadius) {
      final teamComp = closest.getComponent<TeamReferenceComponent>();
      final ballPossession = referee.getComponent<BallPossessionComponent>();
      if (ballPossession == null) {
        referee.addOrReplaceComponent(
          BallPossessionComponent(
            lastPlayerId: closest.id,
            lastTeamId: teamComp!.teamId,
          ),
        );
      } else {
        if (ballPossession.lastPlayerId != closest.id) {
          ballPossession.updatePossession(
            newPlayerId: closest.id,
            newTeamId: teamComp!.teamId,
          );
        }
      }
    }
  }
}
