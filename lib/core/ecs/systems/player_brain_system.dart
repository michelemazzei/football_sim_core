import 'package:football_sim_core/ai/decision/decision_module.dart';
import 'package:football_sim_core/core/ecs/components/applied_tactic_component.dart';
import 'package:football_sim_core/core/ecs/components/player_brain_component.dart';
import 'package:football_sim_core/core/ecs/components/player_tactic_brain_component.dart';
import 'package:football_sim_core/core/ecs/components/user_input_component.dart';
import 'package:football_sim_core/core/tactics/bricks/tactical_brick.dart';
import 'package:football_sim_core/core/tactics/tactical_registry.dart';
import 'package:football_sim_core/ecs/components/ball_possession_component.dart';
import 'package:football_sim_core/ecs/components/team_reference_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';

class PlayerBrainSystem extends EcsSystem {
  @override
  void update(EcsWorld world, double dt) {
    final userInput = world.getResource<UserInputComponent>()!;
    final possession = world.getResource<BallPossessionComponent>()!;
    final players = world.entitiesOf<PlayerEntity>().toList();
    for (final me in players) {
      final brain = me.getComponent<PlayerBrainComponent>();
      final teamComp = me.getComponent<TeamReferenceComponent>();
      final tacticBrain = me.getComponent<PlayerTacticBrainComponent>();

      if (brain == null || teamComp == null || tacticBrain == null) continue;

      // Reset dello stato override per questo frame
      brain.isUserControlled = false;

      // --- LIVELLO 1: INPUT UTENTE (Tiro manuale) ---
      // Se l'utente ha chiesto di tirare, il comando è valido temporalmente
      // e IO ho la palla, allora il cervello imposta l'intent "Shoot"
      if (userInput.hasValidShootIntent(dt) &&
          possession.lastPlayerId == me.id) {
        brain.setIntent(ShootIntent(), fromUser: true);
        userInput.consumeShoot();
        continue; // Salta il resto della logica AI per questo frame
      }

      // --- LIVELLO 2: LOGICA TATTICA (Mentalità) ---
      // Se la mentalità non è Balanced, recuperiamo il modificatore
      TacticalBrick? mentalityModifier;
      if (userInput.teamMentality != TeamMentality.balanced) {
        // Qui caricheremo il brick corrispondente alla mentalità
      }

      // --- LIVELLO 2: IDENTIFICAZIONE DEL BRICK ---
      // Recuperiamo la tattica applicata (es. Tiki-Taka, Pressing)
      final applied = me.getComponent<AppliedTacticComponent>();
      final currentBrick = (applied != null)
          ? TacticalRegistry.get(applied.tacticId)
          : null;

      // --- LIVELLO 3: SELEZIONE MODULO & FUSIONE ---
      final bool iHaveBall = (possession.lastPlayerId == me.id);
      final bool teamHasPossession = (possession.lastTeamId == teamComp.teamId);

      DecisionModule activeModule;
      if (iHaveBall) {
        activeModule = brain.ballCarrierModule;
      } else if (teamHasPossession) {
        activeModule = brain.supportModule;
      } else {
        activeModule = brain.defensiveModule;
      }

      // --- LIVELLO 4: GENERAZIONE INTENTO ---
      // Passiamo il 'currentBrick' come modificatore per influenzare i pesi delle scelte
      final teammates = players
          .where((p) => p != me && p.teamId == teamComp.teamId)
          .toList();
      final opponents = players
          .where((p) => p.teamId != teamComp.teamId)
          .toList();

      final intent = activeModule.decideAction(
        me,
        teammates,
        opponents,
        modifier: currentBrick, // Il Tiki-Taka o il Catenaccio entrano qui
      );

      // Salviamo l'intenzione che verrà eseguita dall'ActionHandler
      me.setComponent(PlayerIntentComponent(intent));
    }
  }

  void _handleUserOverride(PlayerEntity me) {
    // Trasforma l'input fisico dell'utente in un ActionIntent immediato
    // (es. premendo 'B' sulla tastiera si genera un Intent di tipo Shoot)
  }
}
