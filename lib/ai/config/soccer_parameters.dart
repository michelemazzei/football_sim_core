class SoccerParameters {
  // --- DISTANZE E RAGGI (Normalizzati 0..1) ---
  // Se il campo è 1.0, 0.025 è il 2.5% del campo.
  static const double possessionRadius = 0.025;
  static const double playerRadius = 0.02; // Invece di 25.0 pixel
  static const double ballRadius = 0.015; // Invece di 20.0 pixel
  static const double playerComfortZone = 0.1;
  static const double neighborsRadius = 0.2; // Raggio per il PerceptionModule

  // --- FISICA E MOVIMENTO ---
  static const double playerMaxSpeed = 0.05; // Velocità per tick (normalizzata)
  static const double playerMaxForce = 0.1;
  static const double ballMaxSpeed = 0.08;
  static const double ballFriction = -0.005; // Decelerazione logica

  // --- FORZE DI CALCIO (Kicks) ---
  // Questi valori verranno usati per calcolare il vettore spostamento della palla
  static const double lowForce = 0.05;
  static const double mediumForce = 0.12;
  static const double highForce = 0.25;

  // --- LOGICA DI CAMPO ---
  static const int numOfSpotsX = 11;
  static const int numOfSpotsY = 6;

  // Fisici
  static const double playerMass = 3.0;

  // --- Parametri della Palla (Valori normalizzati 0..1) ---
  static const double ballMass = 1.0;
  static const double ballOffsetFromFeet =
      0.02; // Posizione della palla rispetto al corpo
}
