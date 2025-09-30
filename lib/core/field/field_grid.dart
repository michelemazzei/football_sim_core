import 'dart:ui';

import 'package:flame/game.dart';
import 'package:football_sim_core/core/field/zone.dart';

class FieldGrid {
  static const int columns = 11; // X: lunghezza del campo
  static const int rows = 6; // Y: larghezza del campo
  static const double fieldWidth =
      1.0; // lunghezza e larghezza del campo in unità normalizzate
  static const double fieldHeight = 1.0;

  double get zoneWidth => fieldWidth / columns;
  double get zoneHeight => fieldHeight / rows;

  /// Converte una posizione normalizzata (0..1) in una zona discreta
  Zone fromNormalized(Vector2 v) {
    final x = (v.x * (columns - 1)).round();
    final y = (v.y * (rows - 1)).round();
    return Zone(x: x, y: y);
  }

  /// Centro fisico della zona
  Vector2 centerOfZone(Zone zone) {
    final cx = (zone.x + 0.5) * zoneWidth;
    final cy = (zone.y + 0.5) * zoneHeight;
    return Vector2(cx, cy);
  }

  /// Bounding box fisico della zona
  Rect rectOfZone(Zone zone) {
    final left = zone.x * zoneWidth;
    final top = zone.y * zoneHeight;
    return Rect.fromLTWH(left, top, zoneWidth, zoneHeight);
  }

  /// Zona speculare rispetto all'asse X (per cambio lato)
  Zone mirrorZone(Zone zone) {
    return Zone(x: columns - 1 - zone.x, y: zone.y);
  }

  /// Verifica se la zona è valida nella griglia
  bool isValidZone(Zone zone) {
    return zone.x >= 0 && zone.x < columns && zone.y >= 0 && zone.y < rows;
  }
}
