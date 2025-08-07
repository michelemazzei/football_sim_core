import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/components/field_bound_component.dart';
import 'package:football_sim_core/controllers/player_controller.dart';
import 'package:football_sim_core/game/football_game.dart';
import 'package:football_sim_core/model/player_model.dart';

class PlayerComponent
    extends FieldBoundComponent<PlayerController, PlayerModel> {
  late TextPaint textPaint;

  PlayerComponent({required FootballGame game, required PlayerModel model}) {
    anchor = Anchor.center;
    sizeRatio = 0.025;
    controller = PlayerController(
      model: model,
      game: game, // non game.size
    )..size = size;

    textPaint = TextPaint(
      style: TextStyle(
        fontSize: 12,
        color: model.color,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  void drawPlayerCircle(
    Canvas canvas,
    Vector2 size,
    Color color,
    String name,
    TextPaint textPaint,
  ) {
    final paint = Paint()..color = color;
    final radius = size.x / 2;

    // Disegna il cerchio
    canvas.drawCircle(Offset.zero, radius, paint);

    // Misura il testo
    final textSize = measureText(name, textPaint.style);
    final textOffset = Offset(-textSize.width / 2, -textSize.height / 2);

    // Disegna il nome
    textPaint.render(canvas, name, Vector2(textOffset.dx, textOffset.dy));
  }

  Size measureText(String text, TextStyle style) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.size;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    drawPlayerCircle(
      canvas,
      size,
      model.color,
      model.number.toString(),
      textPaint,
    );
  }
}
