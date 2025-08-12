import 'package:football_sim_core/ecs/entities/entity.dart';
import 'package:football_sim_core/ecs/entities/game_state_registrable.dart';
import 'package:football_sim_core/model/game_state.dart';
import 'package:football_sim_core/model/team.dart';

class TeamComponent implements GameStateRegistrable<TeamComponent> {
  final Team team;
  TeamComponent(this.team);

  @override
  void registerIn(GameState state, Entity entity) {
    state.teams[team.id] = team;
  }
}
