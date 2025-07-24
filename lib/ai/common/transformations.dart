import 'package:flame/components.dart';

/// Utility per trasformazioni spaziali tra coordinate locali e globali.
class Transformations {
  /// Converte un vettore da spazio locale a spazio globale.
  static Vector2 vectorToWorldSpace(
    Vector2 vect,
    Vector2 heading,
    Vector2 side,
  ) {
    final matrix = Matrix2.zero()
      ..setValues(heading.x, side.x, heading.y, side.y);
    return matrix.transform(vect.clone());
  }

  /// Converte un punto da spazio globale a quello locale rispetto ad un agente.
  static Vector2 pointToLocalSpace(
    Vector2 point,
    Vector2 heading,
    Vector2 side,
    Vector2 position,
  ) {
    final tx = -position.dot(heading);
    final ty = -position.dot(side);

    final matrix = Matrix3.zero()
      ..setValues(heading.x, side.x, 0, heading.y, side.y, 0, tx, ty, 1);

    return matrix.transform2(point.clone());
  }
}
