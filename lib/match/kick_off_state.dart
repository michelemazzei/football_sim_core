import 'package:football_sim_core/ai/fsm/core/game_state.dart';
import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';
import 'package:football_sim_core/ecs/components/match_component.dart';
import 'package:football_sim_core/ecs/components/match_event_component.dart';
import 'package:football_sim_core/ecs/entities/match_entity.dart';

class KickoffState extends GameState<MatchEntity> {
  double _startTime = 0;

  @override
  void enter(MatchEntity entity) {
    final match = entity.getComponent<MatchComponent>()?.match;
    _startTime = match?.elapsedTime ?? 0;
  }

  @override
  void execute(MatchEntity entity, double dt) {
    final match = entity.getComponent<MatchComponent>()?.match;
    if (match != null && match.elapsedTime - _startTime > 3.0) {
      entity.addComponent(MatchEventComponent(MatchEvent.startPlay));
    }
  }

  @override
  void exit(MatchEntity entity) {}
  @override
  bool onMessage(MatchEntity entity, Telegram telegram) => false;
}
