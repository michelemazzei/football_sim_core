import 'package:football_sim_core/ai/fsm/states/referee/end_match_state.dart';
import 'package:football_sim_core/ai/fsm/states/referee/referee_base_state.dart';
import 'package:football_sim_core/ecs/components/fsm_component.dart';
import 'package:football_sim_core/ecs/components/game_clock_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:logging/logging.dart';

class PlayState extends RefereeBaseState {
  final logger = Logger('RefereeBaseState.PlayState');
  int lastLoggedMinute = 0;

  @override
  void doEnter(RefereeEntity entity, EcsWorld world) {
    world.getResource<GameClockComponent>()?.reset();
    entity.getComponent<GameClockComponent>()?.reset();
  }

  @override
  void doExecute(RefereeEntity entity, double dt, EcsWorld world) {
    final clock = entity.getComponent<GameClockComponent>();
    if (clock == null) {
      logger.warning("⚠️ GameClockComponent not found on referee");
      return;
    }

    // Aggiorna il tempo simulato
    clock.update(dt);

    // Log ogni minuto simulato
    final currentMinute = clock.minutes.floor();
    if (currentMinute != lastLoggedMinute) {
      logger.fine(
        "⏱️ Minute: $currentMinute / ${(clock.duration / 60.0).toStringAsFixed(1)}",
      );
      lastLoggedMinute = currentMinute;
    }

    // Controlla se il tempo è scaduto
    if (clock.isTimeUp) {
      logger.info("⏹️ Time is up! Ending the match.");
      entity.getComponent<FsmComponent<RefereeEntity>>()?.fsm.changeState(
        EndMatchState(),
      );
    }
  }
}
