import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/ai/fsm/states/player/move_to_ball_state.dart';
import 'package:football_sim_core/ai/fsm/states/player/player_base_state.dart';
import 'package:football_sim_core/ai/steering/player_utils.dart';
import 'package:football_sim_core/ecs/components/ball_intent_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:logging/logging.dart';

class PlayerIdleState extends PlayerBaseState {
  final logger = Logger('PlayerBaseState.Idle');
  @override
  void enter(PlayerEntity entity) {
    logger.info('Entering IdleState');
  }

  @override
  void execute(PlayerEntity entity, double dt) {
    final possession = entity.getComponent<PossessionComponent>();
    if (possession?.hasBall == true) {
      logger.finest('Player ${entity.id} has the ball and is idle.');
    } else {
      logger.finest('Player ${entity.id} is idle without the ball.');
    }
  }

  @override
  bool onMessage(PlayerEntity entity, Telegram telegram) {
    logger.fine(
      '${toString()} - Received message: ${telegram.message.toString()}  for Player: ${entity.id}',
    );
    if (entity.id != telegram.receiver.id) {
      return false;
    }

    final number = entity.getComponent<PlayerNumberComponent>()?.number ?? -1;
    logger.fine('closest player id: ${entity.id} - #$number');
    final msg = telegram.message;
    if (msg is! PlayerMessage) return false;

    msg.maybeWhen(
      passToNearestTeammate: (bool requireAck, Function? onAck) {
        final teammate = PlayerUtils.findClosestTeammate(entity);
        final ball = entity
            .getComponent<GameReferenceComponent>()
            ?.game
            .ecsWorld
            .entitiesOf<BallEntity>()
            .firstOrNull;
        if (ball == null) return;

        final ballPos = ball.getComponent<MovingComponent>()?.currentPosition;
        final teammatePos = teammate
            .getComponent<MovingComponent>()
            ?.currentPosition;

        if (ballPos == null || teammatePos == null) return;

        final direction = (teammatePos - ballPos).normalized();
        final force = 120.0; // puoi tararlo in base alla distanza

        ball.addComponent(
          BallIntentComponent(
            intent: BallIntent.kicked,
            direction: direction,
            force: force,
          ),
        );
      },

      moveToBall: (MovePlayerIntent intent, bool requireAck, Function? onAck) {
        entity.getComponent<FsmComponent<PlayerEntity>>()!.fsm.changeState(
          MoveToBallState(intent: intent),
        );
      },
      orElse: () {
        logger.finest(
          'Player #$number received an unhandled message: ${telegram.message}.',
        );
      },
    );
    return true;
  }

  @override
  void exit(PlayerEntity entity) {
    logger.fine('Exiting IdleState');
  }
}
