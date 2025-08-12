class MovementConfigComponent {
  final double minVelocity;
  final double maxVelocity;
  final double frictionFactor;

  MovementConfigComponent({
    this.minVelocity = 0.1,
    this.maxVelocity = 5.0,
    this.frictionFactor = 0.95,
  });
}
