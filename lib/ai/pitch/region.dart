import 'package:flame/components.dart';

class Region {
  final Vector2 upLeft;
  final Vector2 downRight;
  final int id;
  final Vector2 center;
  final double width;
  final double height;
  final int column;
  final int row;
  final int numOfRows;
  final int numOfCols;
  Region({
    required this.numOfCols,
    required this.numOfRows,
    required this.row,
    required this.column,
    required this.upLeft,
    required this.downRight,
    this.id = -1,
  })  : width = (upLeft.x - downRight.x).abs(),
        height = (upLeft.y - downRight.y).abs(),
        center = Vector2(
            (upLeft.x + downRight.x) * 0.5, (upLeft.y + downRight.y) * 0.5);

  factory Region.invalid() => Region(
        column: 0,
        numOfCols: 0,
        numOfRows: 0,
        row: 0,
        downRight: Vector2.zero(),
        upLeft: Vector2.zero(),
        id: -1,
      );

  bool isValid() =>
      id > -1 &&
      upLeft.x < downRight.x &&
      upLeft.y < downRight.y &&
      numOfCols > 0 &&
      numOfRows > 0;
  bool isInvalid() => !isValid();

  bool inside(Vector2 position) =>
      position.x >= upLeft.x &&
      position.x <= downRight.x &&
      position.y >= upLeft.y &&
      position.y <= downRight.y;

  bool insideHalf(Vector2 position) =>
      position.x >= (upLeft.x + width / 2) &&
      position.x <= (downRight.x - width / 2) &&
      position.y >= (upLeft.y + height / 2) &&
      position.y <= (downRight.y - height / 2);

  @override
  String toString() => id.toString();
}
