import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/ecs/components/ball_logic_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/entities/entity.dart';

class BallEntity extends Entity {
  BallEntity(super.id, Vector2 position) {
    addComponent(EntityPositionComponent(position));
    addComponent(VelocityComponent(Vector2.zero()));
    addComponent(SizeComponent(Vector2.all(20)));
    addComponent(
      MovementConfigComponent(maxVelocity: 800, frictionFactor: 0.98),
    );
    addComponent(BallLogicComponent());
    addComponent(
      BallComponentData(color: Colors.white, type: 'standard', scoreValue: 1),
    );
  }
}
