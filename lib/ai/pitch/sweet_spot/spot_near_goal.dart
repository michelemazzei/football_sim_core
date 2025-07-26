import 'package:flame/components.dart';
import 'package:football_sim_core/ai/entity/soccer_team.dart';
import 'package:football_sim_core/ai/entity/team_direction.dart';
import 'package:football_sim_core/ai/pitch/sweet_spot/pitch_spot.dart';
import 'package:football_sim_core/ai/pitch/sweet_spot/spot_algorithm.dart';

class SpotNearGoal extends SpotAlgorithm {
  final bool ownGoal;
  SpotNearGoal(super.weight, super.pitch, {this.ownGoal = false});

  @override
  void updatePitchSpots(List<PitchSpot> spots, SoccerTeam team) {
    var playground = pitch.playground!;
    var maxDistance =
        (playground.rightGoalBottom - playground.leftGoalBottom).length2;
    var goalPosition = Vector2.zero();
    if ((team.direction == TeamDirection.fromRightToLeft && ownGoal) ||
        (team.direction == TeamDirection.fromLeftToRight && !ownGoal)) {
      goalPosition =
          (playground.rightGoalBottom + playground.rightGoalUpper) / 2;
    } else {
      goalPosition = (playground.leftGoalBottom + playground.leftGoalUpper) / 2;
    }
    for (var spot in spots) {
      var distance = (spot.pos - goalPosition).length2;
      spot.score += weight * (maxDistance - distance) / maxDistance;
    }
  }
}
