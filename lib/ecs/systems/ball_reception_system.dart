import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ai/fsm/states/ball/ball_possession_state.dart';
import 'package:football_sim_core/ecs/components/ball_possession_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/components/team_reference_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';
import 'package:football_sim_core/game/football_game.dart';
import 'package:logging/logging.dart';

class BallReceptionSystem extends EcsSystem {
  final logger = Logger('systems.BallReceptionSystem');
  PlayerEntity? lastInterceptingPlayer;
  final FootballGame game;
  BallReceptionSystem(this.game);
  @override
  void update(EcsWorld world, double dt) {
    final players = world.entitiesOf<PlayerEntity>();
    final ball = world.entitiesOf<BallEntity>().firstOrNull;
    if (ball == null) return;

    final ballPos = ball.getComponent<MovingComponent>()?.currentPosition;
    final ballVel = ball.getComponent<MovingComponent>()?.velocity;
    if (ballPos == null || ballVel == null) return;

    for (final player in players) {
      final playerPos = player.position;

      final distance = (ballPos - playerPos).length;
      final ballSpeed = ballVel.length;
      final isApproaching =
          ballSpeed < 0.1 ||
          (ballVel.normalized().dot((playerPos - ballPos).normalized())) > 0.8;

      if (distance < SoccerParameters.possessionRadius && isApproaching) {
        // Intercettazione riuscita
        ball.addOrReplaceComponent(
          BallPossessionComponent(
            teamId: player.getComponent<TeamReferenceComponent>()!.teamId,

            playerId: player.id,
          ),
        );
        ball.getComponent<MovingComponent>()?.velocity.setZero();
        ball.getComponent<MovingComponent>()?.targetPosition = null;
        ball.fsm.changeState(BallPossessionState(owner: player));

        if (lastInterceptingPlayer?.id != player.id) {
          lastInterceptingPlayer = player;
          logger.info('Player ${player.id} has intercepted the ball!');
        }
      }
    }
  }
}
