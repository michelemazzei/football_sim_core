import 'dart:ui';

import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/ecs/models/ball.dart';

class BallLogicComponent extends EcsComponent {
  final Ball ball;
  final VoidCallback onOutOfBounds;
  static void defaultOnOutOfBounds() {
    print('Ball is out of bounds!');
  }

  BallLogicComponent(this.ball, {this.onOutOfBounds = defaultOnOutOfBounds});
}
