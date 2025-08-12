import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/ecs/components/direction_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/components/game_reference_component.dart';
import 'package:football_sim_core/ecs/components/player_color_component.dart';
import 'package:football_sim_core/ecs/components/player_number_component.dart';
import 'package:football_sim_core/ecs/components/player_state_component.dart';
import 'package:football_sim_core/ecs/entities/entity.dart';
import 'package:football_sim_core/game/football_game.dart';

class PlayerEntity extends Entity {
  final int number;
  final Color color;

  PlayerEntity(
    super.id, {
    required this.number,
    required this.color,
    required FootballGame game,
    Vector2? initialPosition,
  }) {
    // Posizione iniziale
    addComponent(EntityPositionComponent(initialPosition ?? Vector2.zero()));

    // Colore del giocatore
    addComponent(PlayerColorComponent(color));

    // Numero del giocatore
    addComponent(PlayerNumberComponent(number));

    // Velocità e direzione iniziali
    addComponent(VelocityComponent(Vector2.zero()));
    addComponent(DirectionComponent(Vector2.zero()));

    // Stato del giocatore (es. idle, running, passing)
    addComponent(PlayerStateComponent(PlayerState.idle));

    // Riferimento al gioco
    addComponent(GameReferenceComponent(game));
  }
}
