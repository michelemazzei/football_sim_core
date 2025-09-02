import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/ecs/entities/team_id.dart';

class GameClockComponent extends EcsComponent {
  double elapsedTime = 0.0;

  void update(double dt) {
    elapsedTime += dt;
  }

  void reset() {
    elapsedTime = 0.0;
  }
}

class ScoreComponent extends EcsComponent {
  final Map<TeamId, int> scores = {TeamId.red: 0, TeamId.blue: 0};

  void goalScored(TeamId teamId) {
    scores.update(teamId, (value) => value + 1);
  }

  int getScore(TeamId teamId) => scores[teamId] ?? 0;

  void reset() {
    scores.updateAll((key, value) => 0);
  }
}
