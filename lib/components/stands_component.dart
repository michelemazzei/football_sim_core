import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class StandsComponent extends PositionComponent {
  final int levels;
  final Color crowdColor;

  StandsComponent({
    required this.levels,
    this.crowdColor = const Color(0xFFBDBDBD),
  });

  @override
  void render(Canvas canvas) {
    final Paint standPaint = Paint()..color = crowdColor;

    final double levelHeight = size.y * 0.05;
    final double padding = size.x * 0.02;

    for (int i = 0; i < levels; i++) {
      final double offset = i * levelHeight;
      final Rect topStand = Rect.fromLTWH(
        -padding - i * padding,
        -offset - levelHeight,
        size.x + 2 * (padding + i * padding),
        levelHeight,
      );
      final Rect bottomStand = Rect.fromLTWH(
        -padding - i * padding,
        size.y + offset,
        size.x + 2 * (padding + i * padding),
        levelHeight,
      );

      canvas.drawRect(topStand, standPaint);
      canvas.drawRect(bottomStand, standPaint);
    }
  }
}
