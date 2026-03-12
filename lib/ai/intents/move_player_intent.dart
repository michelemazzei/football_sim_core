enum MovePlayerIntent {
  receivePass(0.5),
  intercept(1.2),
  chaseBall(0.8),
  pressOpponent(0.9),
  idle(0.0),
  prepareKick(0.4);

  final double speed;
  const MovePlayerIntent(this.speed);

  // Helper rapidi per la logica del Brain
  bool get isMoving => speed > 0;
  bool get isUrgent => speed > 1.0;

  @override
  String toString() => '$name(speed: $speed)';
}
