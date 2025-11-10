import 'package:football_sim_core/ai/fsm/entities/game_state.dart';
import 'package:football_sim_core/core/fsm/state/follow_the_ball_state.dart';
import 'package:football_sim_core/core/tactics/player_tactics/player_tactic.dart';
import 'package:football_sim_core/core/tactics/tactics_names.dart';
import 'package:football_sim_core/ecs/components/possession_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';

class BallFollowTactic implements PlayerTactic {
  @override
  TacticsName get name => TacticsName.ballFollowTactic();

  @override
  double computeUtility(PlayerEntity player, EcsWorld world) {
    final ball = world.entitiesOf<BallEntity>().firstOrNull;
    if (ball == null) return 0.0;

    final ballPos = ball.position;
    final playerPos = player.position;
    final distance = ballPos.distanceTo(playerPos);

    final hasBall = ball.getComponent<PossessionComponent>()?.hasBall ?? false;
    if (hasBall) return 0.0;

    // Utility inversamente proporzionale alla distanza
    final normalized = (1.0 - (distance / 1.0)).clamp(0.0, 1.0);
    return normalized;
  }

  @override
  GameState<PlayerEntity> createState(PlayerEntity player, EcsWorld world) =>
      FollowBallState(world);
}
