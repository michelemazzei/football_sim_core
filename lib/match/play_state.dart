import 'package:football_sim_core/ai/fsm/core/game_state.dart';
import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/match/ecs_match.dart';

class PlayState extends GameState<EcsMatch> {
  @override
  void enter(EcsMatch match) {
    print('Inizio gioco!');
  }

  @override
  void execute(EcsMatch match) {
    // Logica di gioco continua
  }

  @override
  void exit(EcsMatch match) {
    print('Fine gioco');
  }

  @override
  bool onMessage(EcsMatch entity, Telegram telegram) => false;
}
