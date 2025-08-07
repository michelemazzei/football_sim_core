import 'package:flutter/material.dart';
import 'package:football_sim_core/model/sprite_model.dart';

class PlayerModel extends SpriteModel {
  final Color color;
  final int number;

  PlayerModel({
    required super.relativePosition,
    required this.number,
    required this.color,
  });
}
