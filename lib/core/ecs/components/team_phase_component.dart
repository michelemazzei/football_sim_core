import 'package:football_sim_core/core/tactics/game_phases.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';

class TeamPhaseComponent extends EcsComponent {
  GamePhase current;

  TeamPhaseComponent(this.current);
}
