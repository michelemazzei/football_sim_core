import 'dart:ui';

import 'package:football_sim_core/ecs/entities/entity.dart';
import 'package:football_sim_core/ecs/entities/game_state_registrable.dart';
import 'package:football_sim_core/model/game_state.dart';

class BallLogicComponent implements GameStateRegistrable<BallLogicComponent> {
  final VoidCallback? onOutOfBounds;
  BallLogicComponent({this.onOutOfBounds});

  @override
  void registerIn(GameState state, Entity entity) {
    state.ballLogicMap[entity] = this;
  }
}
