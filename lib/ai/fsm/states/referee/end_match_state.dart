import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/ai/fsm/states/referee/referee_base_state.dart';
import 'package:football_sim_core/ecs/components/ecs_player_component.dart';
import 'package:football_sim_core/ecs/components/game_reference_component.dart';
import 'package:football_sim_core/ecs/components/match_lifecycle_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:logging/logging.dart';

class EndMatchState extends RefereeBaseState {
  final logger = Logger('EndMatchState');
  @override
  void doEnter(RefereeEntity entity, EcsWorld world) {
    final world = entity.getComponent<GameReferenceComponent>()!.game.ecsWorld;
    final lifeCycle = entity.getComponent<MatchLifecycleComponent>();

    // Broadcast a 'matchEnded' message to all players
    for (final player in world.entitiesWith<EcsPlayerComponent>()) {
      MessageDispatcher.instance.dispatchMessage(
        sender: entity,
        receiver: player,
        message: MatchMessage.ended(),
      );
    }
    lifeCycle?.matchEnded = true;
    lifeCycle?.kickoffStarted = false;
  }
}
