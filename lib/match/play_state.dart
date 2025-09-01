import 'package:football_sim_core/ai/fsm/core/game_state.dart';
import 'package:football_sim_core/ecs/entities/match_entity.dart';
import 'package:logging/logging.dart';

class PlayState extends GameState<MatchEntity> {
  final logger = Logger('PlayState');
  @override
  void enter(MatchEntity entity) {
    logger.info("Entering PlayState");
  }

  @override
  void execute(MatchEntity entity, double dt) {
    // Logica di gioco attiva
  }

  @override
  void exit(MatchEntity entity) {
    logger.info("Exiting PlayState");
  }
}
