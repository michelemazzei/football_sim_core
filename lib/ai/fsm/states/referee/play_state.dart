import 'package:football_sim_core/ai/fsm/states/referee/end_match_state.dart';
import 'package:football_sim_core/ai/fsm/states/referee/referee_base_state.dart';
import 'package:football_sim_core/ecs/components/fsm_component.dart';
import 'package:football_sim_core/ecs/components/referee_component.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:logging/logging.dart';

class PlayState extends RefereeBaseState {
  final logger = Logger('RefereeBaseState.PlayState');
  int lastTime = 0;
  @override
  void enter(RefereeEntity referee) {
    logger.info("Entering PlayState");
    referee.getComponent<GameClockComponent>()?.reset();
  }

  @override
  void execute(RefereeEntity referee, double dt) {
    final clock = referee.getComponent<GameClockComponent>();
    final time = clock!.elapsedTime.ceil();
    if (time != lastTime) {
      logger.fine("⚽ Time: $time");
      lastTime = time;
    }
    clock.update(dt);
    if (clock.isTimeUp) {
      logger.info("Time is up! Ending the match.");
      referee.getComponent<FsmComponent<RefereeEntity>>()?.fsm.changeState(
        EndMatchState(),
      );
    }
  }

  @override
  void exit(RefereeEntity entity) {
    logger.finer("Exiting PlayState");
  }
}
