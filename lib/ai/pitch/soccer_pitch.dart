import 'package:flame/components.dart';
import 'package:football_sim_core/ai/entity/team_direction.dart';
import 'package:football_sim_core/ai/pitch/pitch_position.dart';
import 'package:football_sim_core/ai/pitch/pitch_role.dart';
import 'package:football_sim_core/ai/pitch/pitch_side.dart';
import 'package:football_sim_core/ai/pitch/playground.dart';
import 'package:football_sim_core/ai/pitch/playground_reader.dart';
import 'package:football_sim_core/ai/pitch/region.dart';

class SoccerPitch {
  Playground? playground;
  final regions = <int, Region>{};
  int get numberOfRegions => regions.length;
  final int cols;
  final int rows;
  final String playgroundName;

  SoccerPitch({
    this.playgroundName = 'assets/playground.json',
    this.cols = 12,
    this.rows = 5,
  });

  int _index(int col, int row) {
    return row + col * rows;
  }

  int mirror(int pos) {
    return numberOfRegions - 1 - pos;
  }

  List<int> _getRowFromSide(PitchSide side) {
    switch (side) {
      case SideRight():
        return [rows - 1];
      case SideLeft():
        return [0];
      case SideCenter():
        return [for (var i = 1; i < rows - 1; i++) i];
    }
  }

  bool ballInDanger(Vector2 position, TeamDirection direction) {
    var pitchWidth = playground!.br.x - playground!.ul.x;
    return direction == TeamDirection.fromLeftToRight
        ? (position.x - playground!.ul.x) < pitchWidth / 3
        : (position.x - playground!.ul.x) > 2 * pitchWidth / 3;
  }

  Region getRegionByPosition(Vector2 pos) => regions.values.firstWhere(
    (element) => element.inside(pos),
    orElse: () => Region.invalid(),
  );

  List<Region> getRegions(PitchPosition pos, TeamDirection direction) {
    var results = <Region>[];
    var indices = _fromRole(pos);
    for (var index in indices) {
      var counter = direction == TeamDirection.fromLeftToRight
          ? index
          : mirror(index);
      if (regions.containsKey(counter)) {
        results.add(regions[counter]!);
      }
    }
    return results;
  }

  List<int> _fromRole(PitchPosition pos) {
    var col = 0;
    var colPosition = cols ~/ 12;
    var rowsFound = _getRowFromSide(pos.side);
    switch (pos.role) {
      case RoleGoalkeeper():
        col = 0; //0*colPosition;
        break;
      case RoleDefender():
        col = colPosition;
        break;
      case RoleDefensiveMidfielder():
        col = 3 * colPosition;
        break;
      case RoleMidfielder():
        col = 3 * colPosition;
        break;
      case RoleAttackingMidfielder():
        col = 4 * colPosition;
        break;
      case RoleForward():
        col = 5 * colPosition;
        break;
    }
    return [
      for (int i = 0; i < rowsFound.length; i++) _index(col, rowsFound[i]),
    ];
  }

  Future<Playground> makePlayground() async {
    if (playground == null) {
      var reader = PlaygroundReader(playgroundName);
      playground = await reader.readPlayGround();
      _createRegions(cols, rows);
    }
    return playground!;
  }

  void _createRegions(int cols, int rows) {
    regions.clear();
    var height = playground!.height / rows;
    var width = playground!.width / cols;
    for (var col = 0; col < cols; col++) {
      for (var row = 0; row < rows; row++) {
        int index = row + col * rows;
        var region = Region(
          numOfCols: cols,
          numOfRows: rows,
          column: col,
          row: row,
          id: index,
          upLeft: Vector2(
            playground!.ul.x + width * col,
            playground!.ul.y + height * row,
          ),
          downRight: Vector2(
            playground!.ul.x + width * (col + 1),
            playground!.ul.y + height * (row + 1),
          ),
        );
        regions.putIfAbsent(index, () => region);
      }
    }
  }
}
