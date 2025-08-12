import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/components/entity_component.dart';
import 'package:football_sim_core/controllers/player_controller.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/components/player_number_component.dart';
import 'package:football_sim_core/ecs/entities/entity.dart';
import 'package:football_sim_core/game/football_game.dart';

class PlayerComponent extends EntityComponent<PlayerController> {
  final Entity entity;
  late TextPaint textPaint;

  PlayerComponent({
    required this.entity,
    required FootballGame game,
    required Color color,
  }) {
    this.game = game;
    anchor = Anchor.center;
    sizeRatio = 0.012;

    controller = PlayerController(entity: entity, game: game);

    textPaint = TextPaint(
      style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.bold),
    );

    // Registra la size nel GameState
    final sizeComponent = entity.getComponent<SizeComponent>();
    if (sizeComponent != null) {
      sizeComponent.size = size;
    } else {
      entity.addComponent(SizeComponent(size));
    }

    game.gameState.sizeMap[entity] = entity.getComponent<SizeComponent>()!;
  }

  void drawPlayerCircle(
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

    final color = textPaint.style.color ?? Colors.white;
    final number = entity.getComponent<PlayerNumberComponent>()?.number ?? 0;

    drawPlayerCircle(canvas, game.size.toSize(), color, number.toString());
  }
}
