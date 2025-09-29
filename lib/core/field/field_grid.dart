import 'package:flame/game.dart';
import 'package:football_sim_core/core/field/zone.dart';

class FieldGrid {
  static final int width = 11; // X: lunghezza
  static final int height = 6; // Y: larghezza

  Zone fromNormalized(Vector2 v) {
    final x = (v.x * (width - 1)).round();
    final y = (v.y * (height - 1)).round();
    return Zone(x: x, y: y);
  }

  Zone mirrorZone(Zone zone) {
    return Zone(x: width - 1 - zone.x, y: zone.y);
  }

  bool isValidZone(Zone zone) {
    return zone.x >= 0 && zone.x < width && zone.y >= 0 && zone.y < height;
  }
}
