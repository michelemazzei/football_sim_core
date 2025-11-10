import 'package:football_sim_core/core/ecs/components/tactical_intents.dart';
import 'package:football_sim_core/core/ecs/components/tactical_priorities.dart';
import 'package:football_sim_core/core/ecs/components/tactical_setup_component.dart';
import 'package:football_sim_core/core/ecs/components/team_phase_component.dart';
import 'package:football_sim_core/core/ecs/components/team_tactic_queue_component.dart';
import 'package:football_sim_core/core/tactics/game_phases.dart';
import 'package:football_sim_core/core/tactics/tactics.dart';
import 'package:football_sim_core/core/tactics/tactics_names.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/team_entity.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';

class ZoneTacticActivatorSystem extends EcsSystem {
  @override
  void update(EcsWorld world, double dt) {
    for (final team in world.entitiesOf<TeamEntity>()) {
      final phase = team.getComponent<TeamPhaseComponent>()?.current;
      final setup = team.getComponent<TacticalSetupComponent>()?.setup;
      final tacticQueue = team.getComponent<TeamTacticQueueComponent>();

      if (phase == null ||
          setup == null ||
          tacticQueue == null ||
          phase == GamePhase.buildUp() || // da attivare solo dopo il buildUp
          tacticQueue.lastZonePhase == phase) {
        // Se la fase non è cambiata, non aggiornare la tattica
        continue;
      }

      final tactic = Tactic(
        name: TacticsName.zoneTactic(),
        activatedAt: DateTime.now(),
        priority: TacticalPriority.low(),
        intent: TacticalIntent.coveringZone(),
        zoneAssignments: TacticsX.tacticFromTeam(team),
      );

      tacticQueue.updateTactic(tactic);
      tacticQueue.lastZonePhase = phase;
    }
  }
}
