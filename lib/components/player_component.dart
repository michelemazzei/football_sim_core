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
    Size fieldSize,
    Color color,
    String name,
  ) {
    final double radius = fieldSize.width * 0.012; // proporzionale al campo

    final Paint shadowPaint = Paint()..color = Colors.black.withAlpha(80);
    final Paint fillPaint = Paint()..color = color.withAlpha(180);
    final Paint borderPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final Offset center = Offset(0, 0);

    // Ombra
    canvas.drawCircle(center.translate(2, 2), radius, shadowPaint);

    // Cerchio giocatore
    canvas.drawCircle(center, radius, fillPaint);
    canvas.drawCircle(center, radius, borderPaint);

    // Colore adattivo per il testo
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

    final textSize = measureText(name, namePaint.style);
    final textOffset = Offset(
      center.dx - textSize.width / 2,
      center.dy - textSize.height / 2,
    );

    namePaint.render(canvas, name, Vector2(textOffset.dx, textOffset.dy));
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
      game.size.toSize(),
      model.color,
      model.number.toString(),
    );
  }
}
