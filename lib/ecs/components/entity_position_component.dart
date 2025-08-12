import 'package:flame/components.dart';
import 'package:football_sim_core/ecs/entities/entity.dart';
import 'package:football_sim_core/ecs/entities/game_state_registrable.dart';
import 'package:football_sim_core/model/game_state.dart';

class EntityPositionComponent
    implements GameStateRegistrable<EntityPositionComponent> {
  Vector2 position;
  EntityPositionComponent(this.position);
  @override
  void registerIn(GameState state, Entity entity) {
    state.positionMap[entity] = this;
  }
}
