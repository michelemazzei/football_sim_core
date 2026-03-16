import 'package:flame/extensions.dart';

class FieldGeometry {
  // Esempio: il raggio della palla è circa lo 0.5% del campo
  static const double ballRadius = 0.005;
  // Proporzioni estratte dal tuo FieldComponent
  static const double goalHeightRatio = 0.18;
  static const double penaltyAreaWidthRatio = 0.15;
  static const double penaltyAreaHeightRatio = 0.40;

  // Limiti Y della porta (valido per entrambe le porte)
  static final double goalTopY = (1.0 - goalHeightRatio) / 2; // circa 0.41
  static final double goalBottomY = (1.0 + goalHeightRatio) / 2; // circa 0.59

  /// Controllo Laterale (Asse Y)
  /// Ritorna:
  ///  0: In campo
  /// -1: Uscita SOPRA (y < 0)
  ///  1: Uscita SOTTO (y > 1)
  static int checkLateralBounds(Vector2 pos) {
    if (pos.y < -ballRadius) return -1;
    if (pos.y > 1.0 + ballRadius) return 1;
    return 0;
  }

  /// Controllo Fondo Campo (Asse X)
  /// Ritorna:
  ///  0: In campo
  /// -1: Uscita SINISTRA (x < 0) - Porta Home
  ///  1: Uscita DESTRA (x > 1)   - Porta Away
  static int checkEndLineBounds(Vector2 pos) {
    if (pos.x < -ballRadius) return -1;
    if (pos.x > 1.0 + ballRadius) return 1;
    return 0;
  }

  // --- 1. TEST GOAL ---

  /// Controlla se la posizione (normalizzata 0.0-1.0) è un gol.
  /// Ritorna 0: No Goal, 1: Goal Porta Sinistra (Home?), 2: Goal Porta Destra (Away?)
  static int checkGoal(Vector2 pos) {
    // La palla deve essere tra i pali verticalmente
    if (pos.y >= goalTopY && pos.y <= goalBottomY) {
      if (pos.x <= -ballRadius) return 1; // Superata linea sinistra
      if (pos.x >= 1.0 + ballRadius) return 2; // Superata linea destra
    }
    return 0;
  }

  /// Verifica se la palla è ancora all'interno del perimetro di gioco
  static bool isBallInPlay(Vector2 pos) {
    return checkLateralBounds(pos) == 0 && checkEndLineBounds(pos) == 0;
  }

  // --- 2. TEST AREA DI RIGORE ---

  /// Controlla se la posizione è all'interno dell'area di rigore sinistra
  static bool isInsideLeftPenaltyArea(Vector2 pos) {
    final double areaTopY = (1.0 - penaltyAreaHeightRatio) / 2;
    final double areaBottomY = (1.0 + penaltyAreaHeightRatio) / 2;

    return pos.x <= penaltyAreaWidthRatio &&
        pos.y >= areaTopY &&
        pos.y <= areaBottomY;
  }

  /// Controlla se la posizione è all'interno dell'area di rigore destra
  static bool isInsideRightPenaltyArea(Vector2 pos) {
    final double areaTopY = (1.0 - penaltyAreaHeightRatio) / 2;
    final double areaBottomY = (1.0 + penaltyAreaHeightRatio) / 2;

    return pos.x >= (1.0 - penaltyAreaWidthRatio) &&
        pos.y >= areaTopY &&
        pos.y <= areaBottomY;
  }

  /// Metodo generico per sapere se siamo in una qualsiasi area di rigore
  static bool isInsideAnyPenaltyArea(Vector2 pos) {
    return isInsideLeftPenaltyArea(pos) || isInsideRightPenaltyArea(pos);
  }
}
