// lib/ai/fsm/states/move_to_target_state.dart

import 'package:football_sim_core/ai/fsm/entities/game_state.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:flame/components.dart';

class MoveToTargetState extends GameState<PlayerEntity> {
  final Vector2 target;

  MoveToTargetState(this.target);

  @override
  void doEnter(PlayerEntity entity, EcsWorld world) {
    // Imposta direzione verso il target
    final heading = (target - entity.position).normalized();
    entity.getComponent<MovingComponent>()?.heading = heading;
  }

  @override
  void doExecute(PlayerEntity entity, double dt, EcsWorld world) {
    // Aggiorna posizione verso il target
    final moving = entity.getComponent<MovingComponent>();
    if (moving == null) return;

    final direction = (target - moving.currentPosition).normalized();
    moving.velocity = direction * moving.maxSpeed;
  }

  @override
  void doExit(PlayerEntity entity, EcsWorld world) {
    // Ferma il movimento
    entity.getComponent<MovingComponent>()?.stopMoving();
  }
}
