import 'package:flutter/material.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';

class EcsPlayerComponent extends EcsComponent {}

class PlayerNumberComponent extends EcsComponent {
  final int number;
  PlayerNumberComponent(this.number);
}

class PlayerColorComponent extends EcsComponent {
  final Color color;
  PlayerColorComponent(this.color);
}

enum PlayerState { idle, running, passing, shooting }

class PlayerStateComponent extends EcsComponent {
  PlayerState state;
  PlayerStateComponent(this.state);
}
