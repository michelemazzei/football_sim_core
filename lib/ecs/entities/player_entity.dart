import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/ecs/components/direction_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/components/ecs_player_component.dart';
import 'package:football_sim_core/ecs/components/ecs_position_component.dart';
import 'package:football_sim_core/ecs/components/game_reference_component.dart';
import 'package:football_sim_core/ecs/components/role_component.dart';
import 'package:football_sim_core/ecs/components/size_ratio_component.dart';
import 'package:football_sim_core/ecs/components/team_component.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/ecs/entities/team_id.dart';
import 'package:football_sim_core/game/football_game.dart';
import 'package:football_sim_core/model/player_role.dart';
import 'package:football_sim_core/model/team.dart';

class PlayerEntity extends EcsEntity {
  /// Returns the [BallEntity] associated with this [EcsEntity].
  PlayerEntity(
    super.id, {
    required int number,
    required Color color,
    required FootballGame game,
    required PlayerRole role,
    required TeamId team,
    required Vector2 initialPosition,
  }) {
    addComponent(
      EcsPositionComponent(x: initialPosition.x, y: initialPosition.y),
    );
    addComponent(EcsPlayerComponent())
    // Imposta il rapporto dimensionale (es. 5% della larghezza del campo)
    ;
    addComponent(const SizeRatioComponent(0.03));
    addComponent(PlayerColorComponent(color));
    addComponent(SizeComponent(height: 10.0, width: 10.0));
    addComponent(PlayerNumberComponent(number));
    addComponent(VelocityComponent(Vector2.zero()));
    addComponent(DirectionComponent(Vector2.zero()));
    addComponent(PlayerStateComponent(PlayerState.idle));
    addComponent(GameReferenceComponent(game));
    addComponent(RoleComponent(role));
    addComponent(TeamComponent(Team(id: team, color: color)));
  }
}
