import 'dart:ui';

class BallComponentData {
  final Color color;
  final String type;
  final int scoreValue;

  BallComponentData({
    required this.color,
    required this.type,
    this.scoreValue = 0,
  });
}
