import 'package:flutter/material.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';

class PlayerColorComponent extends EcsComponent {
  final Color color;
  PlayerColorComponent(this.color);
}
