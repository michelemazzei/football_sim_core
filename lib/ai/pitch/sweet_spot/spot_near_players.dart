import 'dart:math';

import 'package:football_sim_core/ai/entity/soccer_team.dart';
import 'package:football_sim_core/ai/pitch/soccer_pitch.dart';
import 'package:football_sim_core/ai/pitch/sweet_spot/pitch_spot.dart';
import 'package:football_sim_core/ai/pitch/sweet_spot/spot_algorithm.dart';

class SpotNearPlayers extends SpotAlgorithm {
  final bool nearTeammate;
  SpotNearPlayers(super.weight, super.pitch, {this.nearTeammate = true});

  factory SpotNearPlayers.nearTeammate(int weight, SoccerPitch pitch) =>
      SpotNearPlayers(weight, pitch, nearTeammate: true);

  factory SpotNearPlayers.nearOpponent(int weight, SoccerPitch pitch) =>
      SpotNearPlayers(weight, pitch, nearTeammate: false);

  @override
  void updatePitchSpots(List<PitchSpot> spots, SoccerTeam team) {
    var playground = pitch.playground!;

    for (var spot in spots) {
      var maxDistance = (playground.ul - playground.br).length2;
      var minDistance = double.maxFinite;
      var increment = 0.0;
      if (nearTeammate) {
        minDistance = team.players.fold<double>(maxDistance, (
          previousValue,
          p,
        ) {
          var distance = (p.currentPosition - spot.pos).length2;
          return min(distance, maxDistance);
        });
        increment = (maxDistance - minDistance) / maxDistance;
      } else {
        minDistance = team.opponentTeam.players.fold<double>(maxDistance, (
          previousValue,
          p,
        ) {
          var distance = (p.currentPosition - spot.pos).length2;
          return min(distance, maxDistance);
        });
        increment = minDistance / maxDistance;
      }
      spot.score += increment * weight;
    }
  }
}
