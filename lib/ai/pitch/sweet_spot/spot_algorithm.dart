import 'package:football_sim_core/ai/entity/soccer_team.dart';
import 'package:football_sim_core/ai/pitch/soccer_pitch.dart';
import 'package:football_sim_core/ai/pitch/sweet_spot/pitch_spot.dart';

abstract class SpotAlgorithm {
  final int weight;
  final SoccerPitch pitch;

  SpotAlgorithm(this.weight, this.pitch);
  void updatePitchSpots(List<PitchSpot> spots, SoccerTeam team);
}
