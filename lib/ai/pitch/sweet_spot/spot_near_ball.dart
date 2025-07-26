import 'package:football_sim_core/ai/entity/soccer_team.dart';
import 'package:football_sim_core/ai/pitch/sweet_spot/pitch_spot.dart';
import 'package:football_sim_core/ai/pitch/sweet_spot/spot_algorithm.dart';

class SpotNearBall extends SpotAlgorithm {
  SpotNearBall(super.weight, super.pitch);

  @override
  void updatePitchSpots(List<PitchSpot> spots, SoccerTeam team) {
    var playground = pitch.playground!;
    var maxDistance =
        (playground.rightGoalBottom - playground.leftGoalBottom).length2;
    var ballPosition = team.game.ball.position;
    for (var spot in spots) {
      var distance = (spot.pos - ballPosition).length2;
      spot.score += weight * (maxDistance - distance) / maxDistance;
    }
  }
}
