import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/ecs/entities/team_id.dart';

class GameClockComponent extends EcsComponent {
  double _elapsed = 0.0;
  final double duration;
  final double timeScale;

  GameClockComponent({this.duration = 90.0, this.timeScale = 10.0});
  void reset() {
    _elapsed = 0.0;
  }

  void update(double dt) {
    _elapsed += dt * timeScale;
    if (_elapsed > duration) _elapsed = duration;
  }

  bool get isTimeUp => _elapsed >= duration;

  double get minutes => _elapsed / 60.0;
  double get elapsedTime => _elapsed;
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
