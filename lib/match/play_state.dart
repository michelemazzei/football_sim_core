import 'package:football_sim_core/ai/fsm/core/game_state.dart';
import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/match/ecs_match.dart';
import 'package:logging/logging.dart';

class PlayState extends GameState<EcsMatch> {
  final logger = Logger('PlayState');
  @override
  void enter(EcsMatch match) {
    logger.info('Inizio gioco!');
  }

  @override
  void execute(EcsMatch match, double dt) {
    // Logica di gioco continua
  }

  @override
  void exit(EcsMatch match) {
    logger.info('Fine gioco');
  }

  @override
  bool onMessage(EcsMatch entity, Telegram telegram) => false;
}
