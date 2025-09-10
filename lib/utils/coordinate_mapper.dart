import 'package:flame/components.dart';

class CoordinateMapper {
  final Vector2 fieldPosition;
  final Vector2 fieldSize;

  CoordinateMapper(this.fieldPosition, this.fieldSize);

  Vector2 toScreen(
    Vector2 logical, {
    Anchor anchor = Anchor.center,
    Vector2? size,
  }) {
    final offset = logical.clone()..multiply(fieldSize);
    final anchorOffset = _getAnchorOffset(anchor, size ?? Vector2.zero());
    return fieldPosition + offset - anchorOffset;
  }

  Vector2 _getAnchorOffset(Anchor anchor, Vector2 size) {
    switch (anchor) {
      case Anchor.topLeft:
        return Vector2.zero();
      case Anchor.topCenter:
        return Vector2(size.x / 2, 0);
      case Anchor.topRight:
        return Vector2(size.x, 0);
      case Anchor.centerLeft:
        return Vector2(0, size.y / 2);
      case Anchor.centerRight:
        return Vector2(size.x, size.y / 2);
      case Anchor.bottomLeft:
        return Vector2(0, size.y);
      case Anchor.bottomCenter:
        return Vector2(size.x / 2, size.y);
      case Anchor.bottomRight:
        return Vector2(size.x, size.y);
      default:
        return Vector2.zero();
    }
  }
}
