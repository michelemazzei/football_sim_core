import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class PlayerComponent extends PositionComponent {
  Color jerseyColor;

  PlayerComponent({required this.jerseyColor}) {
    size = Vector2(16, 32); // dimensioni del giocatore
  }

  @override
  void render(Canvas canvas) {
    final skinPaint = Paint()..color = const Color(0xFFFFE0B2); // pelle
    final jerseyPaint = Paint()..color = jerseyColor;
    final shortsPaint = Paint()..color = Colors.black;
    final sockPaint = Paint()..color = jerseyColor;
    final shoePaint = Paint()..color = Colors.black;
    final ballPaint = Paint()..color = Colors.white;

    // Testa
    canvas.drawRect(Rect.fromLTWH(6, 0, 4, 4), skinPaint);

    // Maglietta
    canvas.drawRect(Rect.fromLTWH(4, 4, 8, 6), jerseyPaint);

    // Braccia
    canvas.drawRect(Rect.fromLTWH(2, 4, 2, 6), skinPaint); // sinistra
    canvas.drawRect(Rect.fromLTWH(12, 4, 2, 6), skinPaint); // destra

    // Pantaloncini
    canvas.drawRect(Rect.fromLTWH(4, 10, 8, 4), shortsPaint);

    // Gambe
    canvas.drawRect(Rect.fromLTWH(5, 14, 2, 6), skinPaint); // sinistra
    canvas.drawRect(Rect.fromLTWH(9, 14, 2, 6), skinPaint); // destra

    // Calzettoni
    canvas.drawRect(Rect.fromLTWH(5, 20, 2, 4), sockPaint);
    canvas.drawRect(Rect.fromLTWH(9, 20, 2, 4), sockPaint);

    // Scarpe
    canvas.drawRect(Rect.fromLTWH(5, 24, 2, 2), shoePaint);
    canvas.drawRect(Rect.fromLTWH(9, 24, 2, 2), shoePaint);

    // Pallone a sinistra
    canvas.drawCircle(Offset(0, 26), 2, ballPaint);
  }
}
