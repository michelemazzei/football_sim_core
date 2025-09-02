import 'package:football_sim_core/ai/fsm/core/game_state.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:logging/logging.dart';

class PlayState extends GameState<RefereeEntity> {
  final logger = Logger('PlayState');
  @override
  void enter(RefereeEntity entity) {
    logger.info("Entering PlayState");
  }

  @override
  void execute(RefereeEntity entity, double dt) {
    // Logica di gioco attiva
  }

  @override
  void exit(RefereeEntity entity) {
    logger.info("Exiting PlayState");
  }
}
