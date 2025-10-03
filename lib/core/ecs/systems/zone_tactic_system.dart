import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';
import 'package:football_sim_core/core/ecs/components/tactical_priorities.dart';
import 'package:football_sim_core/core/ecs/components/tactical_role_component.dart';
import 'package:football_sim_core/core/ecs/components/tactical_setup_component.dart';
import 'package:football_sim_core/core/ecs/components/team_phase_component.dart';
import 'package:football_sim_core/core/ecs/components/zone_position_component.dart';
import 'package:football_sim_core/core/ecs/messages/tactic_messages.dart';
import 'package:football_sim_core/core/field/field_grid.dart';
import 'package:football_sim_core/core/tactics/game_phases.dart';
import 'package:football_sim_core/core/tactics/tactical_action_translator.dart';
import 'package:football_sim_core/core/tactics/tactical_intent_manager.dart';
import 'package:football_sim_core/ecs/components/action_queue_component.dart';
import 'package:football_sim_core/ecs/components/team_reference_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';
import 'package:logging/logging.dart';

class ZoneTacticSystem extends EcsSystem {
  final logger = Logger('core.ecs.systems.ZoneTacticSystem');

  FieldGrid? fieldGrid;

  @override
  void update(EcsWorld world, double dt) {
    fieldGrid ??= world.getResource<FieldGrid>();
    if (fieldGrid == null) return;

    for (final player in world.entitiesOf<PlayerEntity>()) {
      TacticalRoleComponent? tacticalRoleComp = player
          .getComponent<TacticalRoleComponent>();
      TeamReferenceComponent? teamComp = player
          .getComponent<TeamReferenceComponent>();
      if (tacticalRoleComp == null || teamComp == null) {
        continue;
      }
      final team = player.getTeam();
      if (team == null) continue;
      final currentPhase = team.getComponent<TeamPhaseComponent>(
        ifAbsent: () => TeamPhaseComponent(GamePhase.buildUp()),
      );

      // Salta se il giocatore ha già un intento tattico attivo
      if (!TacticalIntentManager.canOverride(player, TacticalPriority.low())) {
        continue;
      }
      final setup = team.getComponent<TacticalSetupComponent>();
      if (setup == null) return;
      // Ottieni la zona tattica corretta
      var zone = setup.setup.map.getZoneFor(
        tacticalRoleComp.role,
        currentPhase!.current,
      );
      if (zone == null) continue;
      // Inverti la zona se la squadra è sul lato destro
      if (team.isRightSide) {
        zone = fieldGrid!.mirrorZone(zone);
      }
      player.addOrReplaceComponent<ZonePositionComponent>(
        ZonePositionComponent(zone),
      );

      // Cancella eventuali messaggi MoveToZone già presenti
      final queue = player.getComponent<ActionQueueComponent>(
        ifAbsent: () => ActionQueueComponent(entity: player),
      );
      queue!.actions.removeWhere((a) => a.message is TacticalMoveToZone);
      final telegram = TacticalActionTranslator.translate(
        TelegramUnion.create(
          sender: player,
          receiver: player,
          message: TacticalMoveToZone(receiver: player, targetZone: zone),
        ),
        fieldGrid!,
      );
      if (telegram != null) queue.actions.add(telegram);
    }
  }
}
