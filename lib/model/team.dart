import 'package:flutter/material.dart';
import 'package:football_sim_core/model/formation.dart';
import 'package:football_sim_core/model/player_model.dart';

class Team {
  final String id;
  final Color color;
  final List<PlayerModel> players;

  Team({required this.id, required this.color}) : players = [];

  void initializePlayers(Formation formation, bool isLeftSide) {
    for (int i = 0; i < 11; i++) {
      final position = formation.getPosition(i, isLeftSide);
      players.add(
        PlayerModel(
          number: i + 1,
          color: color,
          role: formation.getRole(i),
          relativePosition: position,
          teamId: id,
        ),
      );
    }
  }
}
