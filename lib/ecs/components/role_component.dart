import 'package:football_sim_core/ecs/entities/entity.dart';
import 'package:football_sim_core/ecs/entities/game_state_registrable.dart';
import 'package:football_sim_core/model/game_state.dart';
import 'package:football_sim_core/model/player_role.dart';

class RoleComponent implements GameStateRegistrable<RoleComponent> {
  final PlayerRole role;
  RoleComponent(this.role);

  @override
  void registerIn(GameState state, Entity entity) {
    state.roleMap[entity] = this;
  }
}
