import 'package:football_sim_core/components/fsm_component.dart';
import 'package:football_sim_core/ai/fsm/messaging/messages.dart';
import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/ecs/components/message_sender_component.dart';
import 'package:football_sim_core/ecs/components/referee_component.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:football_sim_core/ai/fsm/states/referee/play_state.dart';
import 'package:football_sim_core/ai/fsm/states/referee/referee_base_state.dart';
import 'package:logging/logging.dart';

class KickoffState extends RefereeBaseState {
  static const double kickoffDelay = 3.0; // secondi simulati
  final logger = Logger('KickoffState');
  @override
  void enter(RefereeEntity referee) {
    // Reset del tempo
    referee.getComponent<GameClockComponent>()?.reset();
    logger.info('[KickoffState] Entrato. Attesa di $kickoffDelay secondi...');
  }

  @override
  void execute(RefereeEntity referee, double dt) {
    final clock = referee.getComponent<GameClockComponent>();
    clock?.update(dt);
    if (clock != null && clock.elapsedTime >= kickoffDelay) {
      logger.info('[KickoffState] Tempo scaduto. Inizio partita!');
      referee.getComponent<MessageSenderComponent>()?.broadcast(
        Messages.matchStarted(),
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
}
