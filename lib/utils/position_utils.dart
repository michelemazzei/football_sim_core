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
    final size = Vector2.all(radius * 2);
    final anchorOffset = size.clone()..multiply(anchor.toVector2());
    return fieldPosition + offset - anchorOffset;
  }
}
