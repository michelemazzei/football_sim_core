import 'package:football_sim_core/ai/fsm/entities/game_state.dart';
import 'package:football_sim_core/ai/fsm/states/player/player_idle_state.dart';
import 'package:football_sim_core/core/fsm/state/follow_the_ball_state.dart';
import 'package:football_sim_core/core/tactics/player_tactics/player_tactic.dart';
import 'package:football_sim_core/core/tactics/tactics_names.dart';
import 'package:football_sim_core/ecs/components/possession_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';

class BallFollowTactic implements PlayerTactic {
  @override
  TacticsName get name => TacticsName.ballFollowTactic;

  double _distance = double.maxFinite;
  final arrivalThreshold = 10.0; // distanza minima per considerarsi "arrivato"

  @override
  double computeUtility(PlayerEntity player, EcsWorld world) {
    final ball = world.entitiesOf<BallEntity>().firstOrNull;
    if (ball == null) return 0.0;

    final ballPos = ball.position;
    final playerPos = player.position;
    _distance = ballPos.distanceTo(playerPos);

    final hasBall = ball.getComponent<PossessionComponent>()?.hasBall ?? false;
    if (hasBall) return 0.0;

    // Utility inversamente proporzionale alla distanza
    final normalized = (1.0 - (_distance / 1.0)).clamp(0.0, 1.0);
    return normalized;
  }

  @override
  GameState<PlayerEntity> createState(PlayerEntity player, EcsWorld world) {
    if (_distance < arrivalThreshold) {
      return PlayerIdleState();
    }
    return FollowBallState(world);
  }
}
