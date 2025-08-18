import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/ai/fsm/ball_fsm.dart';
import 'package:football_sim_core/ai/fsm/components/fsm_component.dart';
import 'package:football_sim_core/ecs/components/ball_logic_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/ecs/models/ball.dart';

class BallEntity extends EcsEntity {
  late BallFSM ballFsm;
  final Ball ballModel = Ball();
  BallEntity(super.id, Vector2 position) {
    ballFsm = BallFSM(ballModel);
    addComponent(EntityPositionComponent(position));
    addComponent(VelocityComponent(Vector2.zero()));
    addComponent(SizeComponent(height: 20.0, width: 20.0));
    addComponent(
      MovementConfigComponent(maxVelocity: 800, frictionFactor: 0.98),
    );
    addComponent(BallLogicComponent(ballModel));
    addComponent(EcsBallComponent());
    addComponent(FsmComponent<Ball>(ballFsm));
  }
}
