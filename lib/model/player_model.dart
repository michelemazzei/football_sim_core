import 'package:flutter/material.dart';
import 'package:football_sim_core/model/player_role.dart';
import 'package:football_sim_core/model/sprite_model.dart';

class PlayerModel extends SpriteModel {
  final Color color;
  final int number;
  final PlayerRole role;
  final String teamId;

  PlayerModel({
    required this.teamId,
    required this.role,
    required super.relativePosition,
    required this.number,
    required this.color,
  });
}
