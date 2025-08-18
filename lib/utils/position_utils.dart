// lib/utils/position_utils.dart
import 'package:flame/components.dart';

class PositionUtils {
  static Vector2 getAbsolutePosition({
    required Vector2 relative,
    required double radius,
    required Vector2 fieldPosition,
    required Vector2 fieldSize,
    required Anchor anchor,
  }) {
    final offset = relative.clone()..multiply(fieldSize);

    Vector2 anchorOffset;
    switch (anchor) {
      case Anchor.topLeft:
        anchorOffset = Vector2.zero();
        break;
      case Anchor.center:
        anchorOffset = Vector2(radius, radius);
        break;
      case Anchor.bottomRight:
        anchorOffset = Vector2(radius * 2, radius * 2);
        break;
      default:
        anchorOffset = Vector2(radius, radius);
    }

    return fieldPosition + offset - anchorOffset;
  }
}
