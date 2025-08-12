import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/ecs/components/direction_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/components/game_reference_component.dart';
import 'package:football_sim_core/ecs/components/player_color_component.dart';
import 'package:football_sim_core/ecs/components/player_number_component.dart';
import 'package:football_sim_core/ecs/components/player_state_component.dart';
import 'package:football_sim_core/ecs/components/role_component.dart';
import 'package:football_sim_core/ecs/components/team_component.dart';
import 'package:football_sim_core/ecs/entities/entity.dart';
import 'package:football_sim_core/ecs/entities/team_id.dart';
import 'package:football_sim_core/game/football_game.dart';
import 'package:football_sim_core/model/player_role.dart';
import 'package:football_sim_core/model/team.dart';

class PlayerEntity extends Entity {
  final int number;
  final Color color;

  PlayerEntity(
    super.id, {
    required this.number,
    required this.color,
    required FootballGame game,
    required PlayerRole role,
    required TeamId team,
    Vector2? initialPosition,
  }) {
    addComponent(EntityPositionComponent(initialPosition ?? Vector2.zero()));
    addComponent(PlayerColorComponent(color));
    addComponent(PlayerNumberComponent(number));
    addComponent(VelocityComponent(Vector2.zero()));
    addComponent(DirectionComponent(Vector2.zero()));
    addComponent(PlayerStateComponent(PlayerState.idle));
    addComponent(GameReferenceComponent(game));
    addComponent(RoleComponent(role));
    addComponent(TeamComponent(Team(id: team, color: color)));
  }
}
