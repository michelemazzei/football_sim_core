import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/ai/fsm/states/referee/play_state.dart';
import 'package:football_sim_core/ai/fsm/states/referee/referee_base_state.dart';
import 'package:football_sim_core/ai/steering/player_utils.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:football_sim_core/model/team.dart';
import 'package:logging/logging.dart';

class KickoffState extends RefereeBaseState {
  static const double kickoffDelay = 3.0; // secondi simulati
  final logger = Logger('KickoffState');
  @override
  void enter(RefereeEntity referee) {
    logger.info('[KickoffState] Entrato. Attesa di $kickoffDelay secondi...');
    // Reset del tempo
    final team = _selectKickoffTeam(referee);
    if (team == null) return;
    logger.info(
      '[KickoffState] La squadra che effettua il kickoff è: ${team.id}',
    );
    referee.getComponent<GameClockComponent>()?.reset();
    final game = referee.getComponent<GameReferenceComponent>()!.game;
    // Recupera la palla
    final ball = game.ecsWorld.entitiesOf<BallEntity>().firstOrNull;
    if (ball == null) return;
    final players = game.ecsWorld
        .entitiesOf<PlayerEntity>()
        .where(
          (player) => player.getComponent<TeamComponent>()?.team.id == team.id,
        )
        .toList();
    if (players.isEmpty) return;

    // Trova il giocatore più vicino alla palla
    final closestPlayer = PlayerUtils.findClosestPlayerToBall(players, ball);
    if (closestPlayer == null) return;
    closestPlayer.getComponent<MovingComponent>()!.currentPosition = ball
        .getComponent<MovingComponent>()!
        .currentPosition;

    // Assegna la palla al giocatore
    logger.info(
      '[KickoffState] Il giocatore più vicino alla palla è: ${closestPlayer.id}',
    );
  }

  @override
  void execute(RefereeEntity referee, double dt) {
    final clock = referee.getComponent<GameClockComponent>();
    clock?.update(dt);
    if (clock != null && clock.elapsedTime >= kickoffDelay) {
      logger.info('[KickoffState] Tempo scaduto. Inizio partita!');
      referee.getComponent<MessageSenderComponent>()?.broadcast(
        MatchMessage.started(),
      );
      referee.getComponent<FsmComponent<RefereeEntity>>()?.fsm.changeState(
        PlayState(),
      );
    }
  }

  @override
  void exit(RefereeEntity referee) {
    logger.info('[KickoffState] Uscita dallo stato di kickoff.');
  }

  Team? _selectKickoffTeam(RefereeEntity referee) {
    final teamPossession = referee.getComponent<TeamPossessionComponent>();
    final match = referee.getComponent<MatchComponent>()?.match;

    // In futuro potresti usare sorteggio, ranking, ecc.
    teamPossession?.team = match?.teamA;
    return teamPossession?.team;
  }
}
