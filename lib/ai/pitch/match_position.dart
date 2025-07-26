import 'package:flame/components.dart';
import 'package:football_sim_core/ai/pitch/pitch_position.dart';
import 'package:football_sim_core/ai/pitch/pitch_role.dart';
import 'package:football_sim_core/ai/pitch/region.dart';

class MatchPosition {
  int preferred;
  Region get region => regions[preferred];
  List<Region> regions;
  PitchPosition tacticePos;
  int get regionId => region.id;
  Vector2 get position => region.center;
  MatchPosition({
    required this.preferred,
    required this.regions,
    required this.tacticePos,
  }) : assert(preferred >= 0 && preferred <= regions.length);

  bool get isDefenser => tacticePos.role == PitchRole.d;
  bool get isForwarder => tacticePos.role == PitchRole.f;
  bool get isGoalkeeper => tacticePos.role == PitchRole.gk;
  bool get isMidFielder =>
      tacticePos.role == PitchRole.dm ||
      tacticePos.role == PitchRole.m ||
      tacticePos.role == PitchRole.am;
}
