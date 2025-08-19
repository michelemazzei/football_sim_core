import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/game/football_game.dart';

class PlayerComponent extends PositionComponent
    with HasGameReference<FootballGame> {
  final Color color;
  final String name;
  final int number;
  final TextPaint textPaint;

  PlayerComponent(
    this.name,
    this.number,
    this.color, [
    Anchor anchor = Anchor.center,
  ]) : textPaint = TextPaint(
         style: TextStyle(
           fontSize: 12,
           color: color,
           fontWeight: FontWeight.bold,
         ),
       ),
       super(anchor: anchor, size: Vector2.all(20.0));

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final color = textPaint.style.color ?? Colors.white;

    _drawPlayerCircle(canvas, game.size.toSize(), color, number.toString());
  }

  void _drawPlayerCircle(
    Canvas canvas,
    Size fieldSize,
    Color color,
    String name,
  ) {
    final center = Offset(size.x / 2, size.y / 2);
    final radius = size.x / 2;

    final Paint shadowPaint = Paint()..color = Colors.black.withAlpha(80);
    final Paint fillPaint = Paint()..color = color.withAlpha(180);
    final Paint borderPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    canvas.drawCircle(center.translate(2, 2), radius, shadowPaint);
    canvas.drawCircle(center, radius, fillPaint);
    canvas.drawCircle(center, radius, borderPaint);

    final Color textColor = color.computeLuminance() > 0.6
        ? Colors.black
        : Colors.white;

    final TextPaint namePaint = TextPaint(
      style: TextStyle(
        color: textColor,
        fontSize: radius * 1.2,
        fontWeight: FontWeight.bold,
      ),
    );

    final textSize = _measureText(name, namePaint.style);
    final textOffset = Offset(
      center.dx - textSize.width / 2,
      center.dy - textSize.height / 2,
    );

    namePaint.render(canvas, name, Vector2(textOffset.dx, textOffset.dy));
  }

  Size _measureText(String text, TextStyle style) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.size;
  }
}
