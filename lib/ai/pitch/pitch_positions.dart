import 'package:football_sim_core/ai/pitch/pitch_position.dart';
import 'package:football_sim_core/ai/pitch/pitch_role.dart';
import 'package:football_sim_core/ai/pitch/pitch_side.dart';

class PitchPositions {
  static List<PitchPosition> make(String positionsStr) {
    var positions = <(PitchRole, PitchSide)>[];
    positionsStr = positionsStr.trim().toLowerCase();
    if (positionsStr == RoleGoalkeeper().name) {
      return [PitchPosition(role: RoleGoalkeeper())];
    }
    var splitted = positionsStr.split(',');
    final listOfsides = <PitchSide>[];
    for (var counter = splitted.length - 1; counter > -1; counter--) {
      var position = splitted[counter];
      if (position.contains('(') && position.contains(')')) {
        listOfsides.clear();
        var sides = position
            .substring(position.indexOf('('), position.indexOf(')'))
            .split('');
        for (var side in sides) {
          listOfsides.add(PitchSide.fromString(side, onError: PitchSide.c()));
        }
      }
      final currentRole = position.substring(
        0,
        position.contains('(') ? position.indexOf('(') : position.length,
      );
      var role = PitchRole.fromString(currentRole, onError: RoleDefender());

      for (var aSide in listOfsides) {
        positions.add((role, aSide));
      }
    }
    return [
      for (var pos in positions) PitchPosition(role: pos.$1, side: pos.$2),
    ];
  }
}
