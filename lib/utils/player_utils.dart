import 'package:football_sim_core/components/player_component.dart';
import 'package:football_sim_core/core/tactics/tactical_roles.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/game/football_game.dart';
import 'package:football_sim_core/model/player_role.dart';
import 'package:football_sim_core/model/tactical_setup.dart';
import 'package:football_sim_core/model/team.dart';

extension CreateTeamFromFormation on FootballGame {
  // CORREZIONE: Rimosse tutte le parentesi () dai TacticalRole
  TacticalRole mapToTacticalRole(PlayerRole role, int index) {
    return switch (role) {
      PlayerRole.goalkeeper => TacticalRole.goalkeeper,
      PlayerRole.defender => switch (index) {
        0 => TacticalRole.leftBack,
        1 => TacticalRole.centerBackLeft,
        2 => TacticalRole.centerBackRight,
        3 => TacticalRole.rightBack,
        _ => TacticalRole.centerBackLeft,
      },
      PlayerRole.midfielder => switch (index) {
        0 => TacticalRole.centralMidfielderLeft,
        1 => TacticalRole.centralMidfielderRight,
        2 => TacticalRole.attackingMidfielderCenter,
        _ => TacticalRole.centralMidfielderLeft,
      },
      PlayerRole.attacker => switch (index) {
        0 => TacticalRole.leftWinger,
        1 => TacticalRole.centerForward,
        2 => TacticalRole.secondStriker,
        3 => TacticalRole.rightWinger,
        _ => TacticalRole.centerForward,
      },
      // Caso di fallback se PlayerRole ha nuovi valori non gestiti
      _ => TacticalRole.centralMidfielderRight,
    };
  }

  Future<void> createTeamFromFormation({
    required TacticalSetup tacticalSetup,
    required Team team,
    required FootballGame game,
    required EcsWorld ecsWorld,
    required bool isLeftSide,
  }) async {
    // Il registry si occupa di creare l'entità Team e aggiungerla al mondo
    final teamEntity = registry.getOrAddTeamEntity(
      isLeftSide: isLeftSide,
      team: team,
      tacticalSetup: tacticalSetup,
    );

    logger.fine('Team entity created: ${teamEntity.id}');

    for (int i = 0; i < 11; i++) {
      // 1. Crea l'entità Player tramite il registry (che ora gestisce correttamente TeamId Enum)
      final playerEntity = registry.getOrAddPlayerEntity(
        team,
        game,
        i + 1,
        tacticalSetup,
        isLeftSide,
      );

      logger.fine('Player entity created: ${playerEntity.id}');

      // 2. Crea componente grafico (Flame)
      // Assicurati che PlayerComponent accetti il colore della squadra
      final playerComponent = PlayerComponent('P${i + 1}', i + 1, team.color);

      // 3. Collega ECS → Flame tramite RenderComponent
      playerEntity.addOrReplaceComponent(
        RenderComponent(entityId: playerEntity.id, component: playerComponent),
      );

      // Aggiunge il componente grafico al game loop di Flame
      await game.add(playerComponent);
    }
  }
}
