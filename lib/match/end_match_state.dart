import 'package:football_sim_core/ai/fsm/components/fsm_component.dart';
import 'package:football_sim_core/ai/fsm/core/game_state.dart';
import 'package:football_sim_core/ecs/components/referee_component.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:logging/logging.dart';

class EndMatchState extends GameState<RefereeEntity> {
  final logger = Logger('EndMatchState');
  @override
  void enter(RefereeEntity referee) {
    logger.info("Entering PlayState");
  }

  @override
  void execute(RefereeEntity referee, double dt) {}

  @override
  void exit(RefereeEntity entity) {
    logger.info("Exiting EndMatchState");
  }
}
