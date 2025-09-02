import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/ecs/components/ecs_player_component.dart';
import 'package:football_sim_core/ecs/components/game_reference_component.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:football_sim_core/ai/fsm/states/referee/referee_base_state.dart';
import 'package:logging/logging.dart';

class EndMatchState extends RefereeBaseState {
  final logger = Logger('EndMatchState');
  @override
  void enter(RefereeEntity referee) {
    logger.info("Entering EndMatchState");
    final world = referee.getComponent<GameReferenceComponent>()!.game.ecsWorld;

    // Broadcast a 'matchEnded' message to all players
    for (final player in world.entitiesWith<EcsPlayerComponent>()) {
      MessageDispatcher.instance.dispatchMessage(
        sender: referee,
        receiver: player,
        message: Messages.matchEnded(),
      );
    }
  }

  @override
  void execute(RefereeEntity referee, double dt) {}

  @override
  void exit(RefereeEntity entity) {
    logger.info("Exiting EndMatchState");
  }
}
