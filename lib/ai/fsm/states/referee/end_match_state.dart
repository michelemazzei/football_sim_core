import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/ai/fsm/states/referee/referee_base_state.dart';
import 'package:football_sim_core/ecs/components/ecs_player_component.dart';
import 'package:football_sim_core/ecs/components/game_reference_component.dart';
import 'package:football_sim_core/ecs/components/match_lifecycle_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:football_sim_core/ecs/systems/message_dispatcher_system.dart';
import 'package:logging/logging.dart';

class EndMatchState extends RefereeBaseState {
  final logger = Logger('EndMatchState');

  @override
  void doEnter(RefereeEntity entity, EcsWorld world) {
    // Nota: stai prendendo il world due volte, una passata e una dal componente.
    // Se entity.world è già quello corretto, usa quello.
    final gameWorld =
        entity.getComponent<GameReferenceComponent>()?.game.ecsWorld ?? world;
    final lifeCycle = entity.getComponent<MatchLifecycleComponent>();
    final dispatcher = gameWorld.getResource<MessageDispatcherSystem>();

    if (dispatcher == null) return;

    // CORREZIONE: MatchMessage.ended() -> MatchEnded()
    // Poiché è un messaggio di stato senza dati, lo inviamo come nuova istanza (o const)
    dispatcher.broadcast<EcsPlayerComponent>(
      sender: entity,
      message: const MatchEnded(),
    );

    lifeCycle?.matchEnded = true;
    lifeCycle?.kickoffStarted = false;
  }
}
