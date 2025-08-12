import 'package:flame/components.dart';
import 'package:football_sim_core/ecs/entities/entity.dart';
import 'package:football_sim_core/ecs/entities/game_state_registrable.dart';
import 'package:football_sim_core/model/game_state.dart';

class VelocityComponent implements GameStateRegistrable<VelocityComponent> {
  Vector2 velocity;

  VelocityComponent(this.velocity);

  @override
  void registerIn(GameState state, Entity entity) {
    state.velocityMap[entity] = this;
  }
}
