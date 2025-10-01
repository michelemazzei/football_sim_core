import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/ai/fsm/states/referee/play_state.dart';
import 'package:football_sim_core/ai/fsm/states/referee/referee_base_state.dart';
import 'package:football_sim_core/ai/intents/move_player_intent.dart';
import 'package:football_sim_core/ai/steering/player_utils.dart';
import 'package:football_sim_core/ecs/components/action_queue_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:football_sim_core/ecs/systems/message_dispatcher_system.dart';
import 'package:football_sim_core/model/team.dart';
import 'package:logging/logging.dart';

class KickoffState extends RefereeBaseState {
  static const double kickoffDelay = 1.0; // secondi simulati
  final logger = Logger('KickoffState');
  var _executed = false;

  @override
  void doEnter(RefereeEntity entity, EcsWorld world) {
    // Reset del tempo
    final team = _selectKickoffTeam(entity);
    if (team == null) return;
    logger.info(
      '[KickoffState] La squadra che effettua il kickoff è: ${team.id}',
    );
    world.getResource<GameClockComponent>();

    entity.getComponent<GameClockComponent>()?.reset();
    final game = entity.getComponent<GameReferenceComponent>()!.game;
    // Recupera la palla
    final ball = game.ecsWorld.entitiesOf<BallEntity>().firstOrNull;
    if (ball == null) return;
    final players = game.ecsWorld
        .entitiesOf<PlayerEntity>()
        .where(
          (player) => player.getComponent<TeamComponent>()?.team.id == team.id,
        )
        .toList();
    logger.info('players nel team: ${players.length}');
    if (players.isEmpty) return;
    assert(() {
      final ballPosition = ball
          .getComponent<MovingComponent>()
          ?.currentPosition;
      logger.info('ballPosition - $ballPosition');
      for (final p in players) {
        final position = p.getComponent<MovingComponent>()?.currentPosition;
        logger.info('player id: ${p.id} - $position');
      }
      return true;
    }());

    // Trova il giocatore più vicino alla palla
    final closestPlayers = PlayerUtils.findClosestPlayersToBall(players, ball);
    if (closestPlayers.isEmpty) return;
    assert(() {
      for (final p in closestPlayers) {
        final position = p.getComponent<MovingComponent>()?.currentPosition;
        logger.info('closest player id: ${p.id} - $position');
      }
      return true;
    }());

    closestPlayers.first.addOrReplaceComponent(
      ActionQueueComponent(
        entity: entity,
        canInterrupt: false,
        userAction: [
          MoveToBall(receiver: entity, intent: MovePlayerIntent.prepareKick()),
          PassToNearestTeammate(
            requiresAck: true,
            receiver: entity,
            onAck: () {
              logger.info(
                '[KickoffState] Passaggio effettuato da ${closestPlayers.first.id}',
              );
              _executed = true;
            },
          ),
        ],
      ),
    );

    // Assegna la palla al giocatore
    logger.fine(
      '[KickoffState] Il giocatore più vicino alla palla è: ${closestPlayers.first.id}',
    );
  }

  @override
  void doExecute(RefereeEntity entity, double dt, EcsWorld world) {
    if (!_executed) {
      return;
    }
    logger.fine('[KickoffState] Esecuzione del kickoff in corso...');
    final clock = entity.getComponent<GameClockComponent>();
    clock?.update(dt);
    if (clock != null && clock.elapsedTime >= kickoffDelay) {
      logger.info('[KickoffState] Tempo scaduto. Inizio partita!');

      world.getResource<MessageDispatcherSystem>()?.broadcast(
        message: MatchMessage.started(),
        sender: entity,
      );
      entity.getComponent<FsmComponent<RefereeEntity>>()?.fsm.changeState(
        PlayState(),
      );
    }
  }

  Team? _selectKickoffTeam(RefereeEntity referee) {
    final teamPossession = referee.getComponent<TeamPossessionComponent>();
    final match = referee.getComponent<MatchComponent>()?.match;

    // In futuro potresti usare sorteggio, ranking, ecc.
    teamPossession?.team = match?.teamA;
    return teamPossession?.team;
  }
}
