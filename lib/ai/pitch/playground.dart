import 'package:flame/components.dart';

class Playground {
  final Vector2 ul;
  final Vector2 br;
  final Vector2 leftPenalty;
  final Vector2 rightPenalty;
  final Vector2 centerSpot;
  final Vector2 leftGoalUpper;
  final Vector2 rightGoalUpper;
  final Vector2 leftGoalBottom;
  final Vector2 rightGoalBottom;
  Playground({
    required this.ul,
    required this.br,
    required this.leftPenalty,
    required this.rightPenalty,
    required this.centerSpot,
    required this.leftGoalUpper,
    required this.rightGoalUpper,
    required this.leftGoalBottom,
    required this.rightGoalBottom,
  });

  double get width => (ul.x - br.x).abs();
  double get height => (ul.y - br.y).abs();

  Playground copyWith({
    Vector2? ul,
    Vector2? br,
    Vector2? leftPenalty,
    Vector2? rightPenalty,
    Vector2? centerSpot,
    Vector2? leftGoalUpper,
    Vector2? rightGoalUpper,
    Vector2? leftGoalBottom,
    Vector2? rightGoalBottom,
  }) {
    return Playground(
      ul: ul ?? this.ul,
      br: br ?? this.br,
      leftPenalty: leftPenalty ?? this.leftPenalty,
      rightPenalty: rightPenalty ?? this.rightPenalty,
      centerSpot: centerSpot ?? this.centerSpot,
      leftGoalUpper: leftGoalUpper ?? this.leftGoalUpper,
      rightGoalUpper: rightGoalUpper ?? this.rightGoalUpper,
      leftGoalBottom: leftGoalBottom ?? this.leftGoalBottom,
      rightGoalBottom: rightGoalBottom ?? this.rightGoalBottom,
    );
  }

  @override
  String toString() {
    return 'Playground(ul: $ul, br: $br, leftPenalty: $leftPenalty, rightPenalty: $rightPenalty, centerSpot: $centerSpot, leftGoalUpper: $leftGoalUpper, rightGoalUpper: $rightGoalUpper, leftGoalBottom: $leftGoalBottom, rightGoalBottom: $rightGoalBottom)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Playground &&
        other.ul == ul &&
        other.br == br &&
        other.leftPenalty == leftPenalty &&
        other.rightPenalty == rightPenalty &&
        other.centerSpot == centerSpot &&
        other.leftGoalUpper == leftGoalUpper &&
        other.rightGoalUpper == rightGoalUpper &&
        other.leftGoalBottom == leftGoalBottom &&
        other.rightGoalBottom == rightGoalBottom;
  }

  @override
  int get hashCode {
    return ul.hashCode ^
        br.hashCode ^
        leftPenalty.hashCode ^
        rightPenalty.hashCode ^
        centerSpot.hashCode ^
        leftGoalUpper.hashCode ^
        rightGoalUpper.hashCode ^
        leftGoalBottom.hashCode ^
        rightGoalBottom.hashCode;
  }
}
