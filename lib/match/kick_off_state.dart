import 'package:football_sim_core/ai/fsm/core/game_state.dart';
import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/match/ecs_match.dart';
import 'package:logging/logging.dart';
import 'play_state.dart';

class KickoffState extends GameState<EcsMatch> {
  double _startTime = 0;
  final logger = Logger('KickoffState');
  @override
  void enter(EcsMatch match) {
    _startTime = match.elapsedTime;
    logger.info('Kickoff!');
  }

  @override
  void execute(EcsMatch match, double dt) {
    if (match.elapsedTime - _startTime > 3.0) {
      match.fsm.changeState(PlayState());
    }
  }

  @override
  void exit(EcsMatch match) {
    logger.info('Fine Kickoff');
  }

  @override
  bool onMessage(EcsMatch entity, Telegram telegram) => false;
}
