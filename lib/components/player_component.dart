import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/components/entity_component.dart';
import 'package:football_sim_core/ecs/components/player_number_component.dart';

class PlayerComponent extends EntityComponent {
  late TextPaint textPaint;

  PlayerComponent({
    required super.entity,
    required super.footballGame,
    required Color color,
  }) {
    anchor = Anchor.center;
    sizeRatio = 0.012;

    textPaint = TextPaint(
      style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.bold),
    );
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final color = textPaint.style.color ?? Colors.white;
    final number = entity.getComponent<PlayerNumberComponent>()?.number ?? 0;

    _drawPlayerCircle(canvas, game.size.toSize(), color, number.toString());
  }

  void _drawPlayerCircle(
    Canvas canvas,
    Size fieldSize,
    Color color,
    String name,
  ) {
    final double radius = fieldSize.width * sizeRatio;

    final Paint shadowPaint = Paint()..color = Colors.black.withAlpha(80);
    final Paint fillPaint = Paint()..color = color.withAlpha(180);
    final Paint borderPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final Offset center = Offset(0, 0);

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
