import 'package:football_sim_core/ai/fsm/core/game_state.dart';
import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';
import 'package:football_sim_core/ecs/components/match_component.dart';
import 'package:football_sim_core/ecs/components/match_event_component.dart';
import 'package:football_sim_core/ecs/entities/match_entity.dart';

class GlobalMatchState extends GameState<MatchEntity> {
  @override
  void execute(MatchEntity entity, double dt) {
    final match = entity.getComponent<MatchComponent>()?.match;

    // Esempio: aggiorna il timer
    match?.updateElapsedTime(dt);

    // Esempio: controlla se la partita è finita
    if (match != null && match.elapsedTime >= match.duration) {
      entity.addComponent(MatchEventComponent(MatchEvent.endMatch));
    }
  }

  @override
  void enter(MatchEntity entity) {}
  @override
  void exit(MatchEntity entity) {}
  @override
  bool onMessage(MatchEntity entity, Telegram telegram) => false;
}
