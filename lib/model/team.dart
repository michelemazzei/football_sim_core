import 'package:flutter/material.dart';
import 'package:football_sim_core/ecs/components/role_component.dart';
import 'package:football_sim_core/ecs/components/team_component.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/game/football_game.dart';
import 'package:football_sim_core/model/formation.dart';

class Team {
  final String id;
  final Color color;
  final List<PlayerEntity> players = [];

  Team({required this.id, required this.color});

  void initializePlayers(
    Formation formation,
    bool isLeftSide,
    FootballGame game,
  ) {
    for (int i = 0; i < 11; i++) {
      final position = formation.getPosition(i, isLeftSide);
      final role = formation.getRole(i);

      final playerEntity = PlayerEntity(
        number: i + 1,
        color: color,
        game: game,
        initialPosition: position,
      );

      // Aggiungi ruolo e teamId come componenti
      playerEntity.addComponent(RoleComponent(role));
      playerEntity.addComponent(TeamComponent(id));

      players.add(playerEntity);
    }
  }
}
