class SoccerParameters {
  static const neighborsRadius = 40;
  //
  //Players Constants
  //
  static const double possessionRadius = 0.025;
  static const playerMass = 3.0;
  static const playerMaxForce = 0.3;
  static const playerMaxSpeed = 0.5;
  static const playerMinSpeed = 0.1;
  static const playerComfortZone = 0.1;
  static const playerDecrease = -0.01;
  static const playerRadius = 25.0;
  static const playerPanicDistance = 2.0;
  static const decelerationTweaker = 5.0;
  //
  //Ball Constants
  //
  static const ballOffsetFromFeet = 0.02;
  static const ballFriction = -0.015;
  static const ballMass = 1.0;
  static const ballRadius = 20.0;
  static const ballSize = 15.0;
  static const ballMaxSpeed = 0.5;
  static const ballPanicDistance = 2.0;
  //
  //Force used to kick the ball.
  //
  static const lowForce = 5.0;
  static const mediumForce = 10.0;
  static const highForce = 15.0;
  //
  //Spots
  //
  static const numOfSpotsX = 11;
  static const numOfSpotsY = 6;
}
