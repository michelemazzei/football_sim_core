import 'package:football_sim_core/core/ecs/components/applied_tactic_component.dart';
import 'package:football_sim_core/core/ecs/components/player_tactic_brain_component.dart';
import 'package:football_sim_core/core/ecs/components/team_tactic_queue_component.dart';
import 'package:football_sim_core/core/field/field_grid.dart';
import 'package:football_sim_core/core/tactics/game_phases.dart';
import 'package:football_sim_core/core/tactics/tactical_registry.dart';
import 'package:football_sim_core/ecs/components/action_queue_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';

class PlayerTacticDecisionSystem extends EcsSystem {
  @override
  void update(EcsWorld world, double dt) {
    final now = DateTime.now();
    final grid = world.getResource<FieldGrid>();
    if (grid == null) return;

    for (final player in world.entitiesOf<PlayerEntity>()) {
      final team = player.getTeam();
      final gamePhase = team?.gamePhase;
      final brain = player.getComponent<PlayerTacticBrainComponent>();
      final queue = player.getComponent<ActionQueueComponent>(
        ifAbsent: () => ActionQueueComponent(entity: player),
      );

      if (team == null ||
          brain == null ||
          queue == null ||
          gamePhase == null ||
          gamePhase == GamePhase.buildUp()) {
        //salta le tattiche se stiamo ancora nel build up
        continue;
      }
      final tacticQueue = team.getComponent<TeamTacticQueueComponent>();
      tacticQueue?.removeExpired(now);
      final tactic = tacticQueue?.highestPriority;
      if (tactic == null || !brain.accepts(tactic.name)) continue;

      final applied = player.getComponent<AppliedTacticComponent>();
      final alreadyApplied = applied != null && applied.tacticId == tactic.name;

      if (alreadyApplied) continue;

      final brick = TacticalRegistry.get(tactic.name);
      if (brick == null || !brick.isApplicable(player, world, tactic)) continue;

      // Nuova tattica → svuota la coda e applica
      queue.actions.clear();

      final messages = brick.generateMessages(player, grid, tactic);
      queue.actions.addAll(messages);

      player.addOrReplaceComponent(
        AppliedTacticComponent(tacticId: tactic.name, appliedAt: now),
      );
    }
  }
}
