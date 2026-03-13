import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/components/player_component.dart';
import 'package:football_sim_core/core/tactics/tactical_roles.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/game/football_game.dart';
import 'package:football_sim_core/model/player_role.dart';
import 'package:football_sim_core/model/tactical_setup.dart';
import 'package:football_sim_core/model/team.dart';

extension CreateTeamFromFormation on FootballGame {
  Future<void> createTeamFromFormation({
    required TacticalSetup tacticalSetup,
    required Team team,
    required bool isLeftSide,
  }) async {
    // 1. Team Entity (Idempotente)
    final teamEntity = registry.getOrAddTeamEntity(
      isLeftSide: isLeftSide,
      team: team,
      tacticalSetup: tacticalSetup,
    );

    for (int i = 0; i < 11; i++) {
      // 2. Recupero info base dalla formazione
      final TacticalRole specificRole = tacticalSetup.formation.getRole(i);
      final Vector2 initialPos = tacticalSetup.formation.getPosition(
        i,
        isLeftSide,
      );

      // 4. Registry/Spawner: Qui passiamo il ruolo specifico (specificRole)
      // in modo che l'entità venga creata con il TacticalRoleComponent corretto
      final playerEntity = registry.getOrAddPlayerEntity(
        team: team,
        game: this,
        number: i + 1,
        position: initialPos,
        role: specificRole, // <--- Fondamentale per il DefensiveDecisionModule!
      );

      // 5. Parte Grafica Flame (Gestita dal metodo sotto)
      _attachGraphics(playerEntity, i + 1, team.color);
    }

    logger.info(
      'Team ${team.name} initialized with ${isLeftSide ? "Left" : "Right"} side setup.',
    );
  }

  /// Converte il ruolo generico in un ruolo tattico specifico in base all'indice
  TacticalRole _mapToTacticalRole(PlayerRole role, int index) {
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
      _ => TacticalRole.centralMidfielderRight,
    };
  }

  /// Gestisce l'aggancio della grafica Flame all'entità ECS senza duplicazioni
  void _attachGraphics(PlayerEntity playerEntity, int number, Color teamColor) {
    var renderComp = playerEntity.getComponent<RenderComponent>();

    if (renderComp == null) {
      final playerVisual = PlayerComponent('P$number', number, teamColor);

      renderComp = RenderComponent(
        entityId: playerEntity.id,
        component: playerVisual,
      );

      playerEntity.addOrReplaceComponent(renderComp);
      add(playerVisual);

      logger.fine('Graphics attached for player #$number');
    } else {
      // Protezione per Hot Reload: se l'entità ha il componente ma non è a schermo
      if (!renderComp.component.isMounted && !renderComp.component.isLoading) {
        add(renderComp.component);
      }
    }
  }
}
