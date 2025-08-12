import 'package:flame/components.dart';
import 'package:football_sim_core/ecs/entities/entity.dart';
import 'package:football_sim_core/ecs/entities/game_state_registrable.dart';
import 'package:football_sim_core/model/game_state.dart';

class SizeComponent implements GameStateRegistrable<SizeComponent> {
  Vector2 size;
  SizeComponent(this.size);

  @override
  void registerIn(GameState state, Entity entity) {
    state.sizeMap[entity] = this;
  }
}
