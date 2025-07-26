import 'package:flame/components.dart';
import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ai/entity/soccer_team.dart';
import 'package:football_sim_core/ai/pitch/playground.dart';
import 'package:football_sim_core/ai/pitch/sweet_spot/pitch_spot.dart';
import 'package:football_sim_core/ai/pitch/sweet_spot/spot_algorithm.dart';
import 'package:football_sim_core/ai/pitch/sweet_spot/spot_near_ball.dart';
import 'package:football_sim_core/ai/pitch/sweet_spot/spot_near_goal.dart';
import 'package:football_sim_core/ai/pitch/sweet_spot/spot_near_players.dart';

class PitchSpotCalculator {
  final List<PitchSpot> _spots = <PitchSpot>[];
  final SoccerTeam team;
  var _lastTimeCalculated = 0;
  final List<SpotAlgorithm> algorithms;

  PitchSpotCalculator(this.team, this.algorithms);

  factory PitchSpotCalculator.bestSupportingSpot(SoccerTeam team) {
    var pitch = team.game.soccerPitch;
    return PitchSpotCalculator(team, [
      SpotNearPlayers.nearOpponent(SoccerParameters.nearOpponentWeight, pitch),
      SpotNearPlayers.nearTeammate(SoccerParameters.nearTeammateWeight, pitch),
      SpotNearGoal(SoccerParameters.nearGoalWeight, pitch),
      SpotNearBall(SoccerParameters.nearBallWeight, pitch),
    ]);
  }

  factory PitchSpotCalculator.bestBallOwnerSpot(SoccerTeam team) {
    var pitch = team.game.soccerPitch;
    return PitchSpotCalculator(team, [
      SpotNearPlayers.nearOpponent(SoccerParameters.nearOpponentWeight, pitch),
      SpotNearPlayers.nearTeammate(SoccerParameters.nearTeammateWeight, pitch),
      SpotNearGoal(SoccerParameters.nearGoalWeight, pitch),
    ]);
  }
  factory PitchSpotCalculator.bestDefenderSpot(SoccerTeam team) {
    var pitch = team.game.soccerPitch;
    return PitchSpotCalculator(team, [
      SpotNearPlayers.nearOpponent(SoccerParameters.nearOpponentWeight, pitch),
      SpotNearPlayers.nearTeammate(SoccerParameters.nearTeammateWeight, pitch),
      SpotNearGoal(SoccerParameters.nearGoalWeight, pitch, ownGoal: true),
      SpotNearBall(SoccerParameters.nearBallWeight, pitch),
    ]);
  }

  void createSpots(int numX, int numY, Playground playground) {
    _spots.clear();
    var width = playground.width * 0.9 / numX;
    var height = playground.height * 0.9 / numY;
    var left = playground.ul.x + width / 2;
    var up = playground.ul.y + height / 2;
    for (var x = 0; x < numX; x++) {
      for (var y = 0; y < numY; y++) {
        _spots.add(PitchSpot(Vector2(left + x * width, up + y * height)));
      }
    }
  }

  void _clear(PitchSpot spot) => spot.score = 0.0;

  void _reset() => _spots.forEach(_clear);

  void _calculateSpots(DateTime now) {
    _lastTimeCalculated = now.millisecondsSinceEpoch;
    for (var algo in algorithms) {
      algo.updatePitchSpots(spots, team);
    }
  }

  List<PitchSpot> get spots {
    var now = DateTime.now();
    if (now.millisecondsSinceEpoch - _lastTimeCalculated > 1000) {
      _reset();
      _calculateSpots(now);
    }
    return _spots;
  }
}
