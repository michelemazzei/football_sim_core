import 'package:football_sim_core/ai/fsm/core/game_state.dart';
import 'package:football_sim_core/ai/fsm/messaging/message_dispatcher.dart';
import 'package:football_sim_core/ai/fsm/messaging/messages.dart';
import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';
import 'package:football_sim_core/ecs/components/match_component.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';

class GlobalMatchState extends GameState<RefereeEntity> {
  @override
  void execute(RefereeEntity entity, double dt) {
    final match = entity.getComponent<MatchComponent>()?.match;

    // Esempio: aggiorna il timer
    match?.updateElapsedTime(dt);

    // Esempio: controlla se la partita è finita
    if (match != null && match.elapsedTime >= match.duration) {
      MessageDispatcher.instance.dispatchMessage(
        sender: entity,
        receiver: entity,
        message: Messages.matchEnded(),
      );
      // entity.addComponent(MatchEventComponent(MatchEvent.endMatch));
    }
  }

  @override
  void enter(RefereeEntity entity) {}
  @override
  void exit(RefereeEntity entity) {}
  @override
  bool onMessage(RefereeEntity entity, Telegram telegram) => false;
}
