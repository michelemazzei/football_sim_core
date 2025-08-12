import 'package:football_sim_core/ecs/entities/entity.dart';
import 'package:football_sim_core/model/game_state.dart';

abstract class GameStateRegistrable<T> {
  void registerIn(GameState state, Entity entity);
}
