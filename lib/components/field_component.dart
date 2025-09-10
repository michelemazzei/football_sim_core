import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import '../game/football_game.dart';

class FieldComponent extends PositionComponent
    with HasGameReference<FootballGame> {
  FieldComponent() : super(anchor: Anchor.topLeft);

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    _resizeField(size);
  }

  void _resizeField(Vector2 screenSize) {
    const double padding = 60;
    final usableWidth = screenSize.x - padding * 2;
    final usableHeight = screenSize.y - padding * 2;
    final fieldRatio = 16 / 9;
    final screenRatio = usableWidth / usableHeight;

    if (fieldRatio > screenRatio) {
      size = Vector2(usableWidth, usableWidth / fieldRatio);
    } else {
      size = Vector2(usableHeight * fieldRatio, usableHeight);
    }

    position = (screenSize - size) / 2;
  }

  void renderGrassPixelOverlay(Canvas canvas, Size size) {
    final pixelPaint = Paint()
      ..color = Colors.black.withAlpha(100)
      ..strokeWidth = 1;

    final spacing = 6.0;
    final points = <Offset>[];

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        if ((x + y) % (spacing * 2) == 0) {
          points.add(Offset(x, y));
        }
      }
    }

    canvas.drawPoints(PointMode.points, points, pixelPaint);
  }

  void renderGoalAreas(Canvas canvas, Size size) {
    final areaWidth = size.width * 0.08; // larghezza orizzontale
    final areaHeight = size.height * 0.25; // altezza verticale
    final linePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Area piccola lato sinistro (porta sinistra)
    final leftArea = Rect.fromLTWH(
      0,
      (size.height / 2) - (areaHeight / 2),
      areaWidth,
      areaHeight,
    );
    canvas.drawRect(leftArea, linePaint);

    // Area piccola lato destro (porta destra)
    final rightArea = Rect.fromLTWH(
      size.width - areaWidth,
      (size.height / 2) - (areaHeight / 2),
      areaWidth,
      areaHeight,
    );
    canvas.drawRect(rightArea, linePaint);
  }

  void renderGoalRight(Canvas canvas, Size size) {
    final double goalWidth = 20;
    final double goalHeight = size.height * 0.18;
    final double goalTop = (size.height - goalHeight) / 2;
    final double netSpacing = 8;
    final double shift = 20; // Sposta la porta fuori dal bordo destro

    final Paint goalPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2;

    final Paint netPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final double xStart = size.width + shift - goalWidth;

    // Struttura porta spostata verso destra
    canvas.drawLine(
      Offset(xStart, goalTop),
      Offset(xStart + goalWidth, goalTop),
      goalPaint,
    );
    canvas.drawLine(
      Offset(xStart, goalTop),
      Offset(xStart, goalTop + goalHeight),
      goalPaint,
    );
    canvas.drawLine(
      Offset(xStart, goalTop + goalHeight),
      Offset(xStart + goalWidth, goalTop + goalHeight),
      goalPaint,
    );

    // Linee verticali bombate verso sinistra (verso il campo)
    for (double x = 0; x <= goalWidth; x += netSpacing) {
      final Path path = Path();
      for (double y = goalTop; y <= goalTop + goalHeight; y += 2) {
        double offsetX = x + sin((y - goalTop) / goalHeight * pi) * 4 + 5;
        if (y == goalTop) {
          path.moveTo(xStart + offsetX, y);
        } else {
          path.lineTo(xStart + offsetX, y);
        }
      }
      canvas.drawPath(path, netPaint);
    }

    // Linee orizzontali bombate verso sinistra
    for (
      double y = goalTop + netSpacing;
      y <= goalTop + goalHeight;
      y += netSpacing
    ) {
      final Path path = Path();
      for (double x = 0; x <= goalWidth; x += 2) {
        double offsetY = y - sin((x / goalWidth) * pi) * 3;
        if (x == 0) {
          path.moveTo(xStart, offsetY);
        } else {
          path.lineTo(xStart + x, offsetY);
        }
      }
      canvas.drawPath(path, netPaint);
    }
  }

  void renderGoalLeft(Canvas canvas, Size size) {
    final double goalWidth = 20;
    final double goalHeight = size.height * 0.18;
    final double goalTop = (size.height - goalHeight) / 2;
    final double netSpacing = 8;
    final double shift = 20; // Sposta la porta fuori dal bordo sinistro

    final Paint goalPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2;

    final Paint netPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final double xStart = -shift;

    // Struttura porta spostata verso sinistra
    canvas.drawLine(
      Offset(xStart, goalTop),
      Offset(xStart + goalWidth, goalTop),
      goalPaint,
    );
    canvas.drawLine(
      Offset(xStart + goalWidth, goalTop),
      Offset(xStart + goalWidth, goalTop + goalHeight),
      goalPaint,
    );
    canvas.drawLine(
      Offset(xStart + goalWidth, goalTop + goalHeight),
      Offset(xStart, goalTop + goalHeight),
      goalPaint,
    );

    // Linee verticali bombate verso destra (speculare)
    for (double x = 0; x <= goalWidth; x += netSpacing) {
      final Path path = Path();
      for (double y = goalTop; y <= goalTop + goalHeight; y += 2) {
        double offsetX = x - sin((y - goalTop) / goalHeight * pi) * 4;
        if (y == goalTop) {
          path.moveTo(xStart + offsetX, y);
        } else {
          path.lineTo(xStart + offsetX, y);
        }
      }
      canvas.drawPath(path, netPaint);
    }

    // Linee orizzontali bombate verso destra (speculare)
    for (
      double y = goalTop + netSpacing;
      y <= goalTop + goalHeight;
      y += netSpacing
    ) {
      final Path path = Path();
      for (double x = 0; x <= goalWidth; x += 2) {
        double offsetY = y - sin((x / goalWidth) * pi) * 3;
        if (x == 0) {
          path.moveTo(xStart, offsetY);
        } else {
          path.lineTo(xStart + x, offsetY);
        }
      }
      canvas.drawPath(path, netPaint);
    }
  }

  void renderRetroCornerFlags(Canvas canvas, Size size) {
    const poleLength = 14.0;
    const flagWidth = 8.0;
    const flagHeight = 6.0;
    final polePaint = Paint()..color = Colors.grey.shade800;
    final flagPaint = Paint()..color = Colors.red;

    final corners = [
      // Alto sinistra
      {
        'poleStart': Offset(4, 4),
        'poleEnd': Offset(4 + poleLength * 0.7, 4 + poleLength * 0.7),
        'flagOffset': Offset(4 + poleLength * 0.7, 4 + poleLength * 0.7),
      },
      // Alto destra
      {
        'poleStart': Offset(size.width - 4, 4),
        'poleEnd': Offset(
          size.width - 4 - poleLength * 0.7,
          4 + poleLength * 0.7,
        ),
        'flagOffset': Offset(
          size.width - 4 - poleLength * 0.7,
          4 + poleLength * 0.7,
        ),
      },
      // Basso sinistra
      {
        'poleStart': Offset(4, size.height - 4),
        'poleEnd': Offset(
          4 + poleLength * 0.7,
          size.height - 4 - poleLength * 0.7,
        ),
        'flagOffset': Offset(
          4 + poleLength * 0.7,
          size.height - 4 - poleLength * 0.7,
        ),
      },
      // Basso destra
      {
        'poleStart': Offset(size.width - 4, size.height - 4),
        'poleEnd': Offset(
          size.width - 4 - poleLength * 0.7,
          size.height - 4 - poleLength * 0.7,
        ),
        'flagOffset': Offset(
          size.width - 4 - poleLength * 0.7,
          size.height - 4 - poleLength * 0.7,
        ),
      },
    ];

    for (final corner in corners) {
      // Gambo inclinato
      canvas.drawLine(
        corner['poleStart'] as Offset,
        corner['poleEnd'] as Offset,
        polePaint..strokeWidth = 2,
      );

      // Bandierina rettangolare
      final flagRect = Rect.fromLTWH(
        (corner['flagOffset'] as Offset).dx,
        (corner['flagOffset'] as Offset).dy,
        flagWidth,
        flagHeight,
      );
      canvas.drawRect(flagRect, flagPaint);
    }
  }

  void renderGrassTexture(Canvas canvas, Size size) {
    final stripeCount = 20;
    final stripeWidth = size.width / stripeCount;

    for (int i = 0; i < stripeCount; i++) {
      final paint = Paint()
        ..color = (i % 2 == 0)
            ? const Color.fromRGBO(46, 125, 50, 0.95)
            : const Color.fromRGBO(56, 142, 60, 0.95);

      final rect = Rect.fromLTWH(i * stripeWidth, 0, stripeWidth, size.height);
      canvas.drawRect(rect, paint);
    }
  }

  @override
  void render(Canvas canvas) {
    final Paint grassPaint = Paint()..color = const Color(0xFF2E7D32);
    canvas.drawRect(size.toRect(), grassPaint);
    final Paint linePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Bordo campo
    canvas.drawRect(size.toRect(), linePaint);
    renderGrassTexture(canvas, size.toSize());
    renderGrassPixelOverlay(canvas, size.toSize());
    renderRetroCornerFlags(canvas, size.toSize());
    renderGoalAreas(canvas, size.toSize());
    renderGoalLeft(canvas, size.toSize());
    renderGoalRight(canvas, size.toSize());

    // Cerchio centrale
    final center = Offset(size.x / 2, size.y / 2);
    canvas.drawCircle(center, size.x * 0.1, linePaint);

    // Linea di centrocampo
    canvas.drawLine(
      Offset(size.x / 2, 0),
      Offset(size.x / 2, size.y),
      linePaint,
    );

    // Aree di rigore
    final areaWidth = size.x * 0.15;
    final areaHeight = size.y * 0.4;

    final leftArea = Rect.fromLTWH(
      0,
      size.y / 2 - areaHeight / 2,
      areaWidth,
      areaHeight,
    );
    final rightArea = Rect.fromLTWH(
      size.x - areaWidth,
      size.y / 2 - areaHeight / 2,
      areaWidth,
      areaHeight,
    );

    canvas.drawRect(leftArea, linePaint);
    canvas.drawRect(rightArea, linePaint);

    // Dischetto del rigore (pixel)
    final leftPenaltySpot = Offset(areaWidth * 0.8, size.y / 2);
    final rightPenaltySpot = Offset(size.x - areaWidth * 0.8, size.y / 2);

    final Paint pixelPaint = Paint()..color = Colors.white;
    canvas.drawPoints(PointMode.points, [
      leftPenaltySpot,
      rightPenaltySpot,
    ], pixelPaint);

    // Mezza luna attaccata all’area
    final arcRadius = size.x * 0.06;

    final leftArcRect = Rect.fromCircle(
      center: leftPenaltySpot,
      radius: arcRadius,
    );
    final rightArcRect = Rect.fromCircle(
      center: rightPenaltySpot,
      radius: arcRadius,
    );

    // Calcola angoli per attaccare la mezza luna all’area
    final double angle = acos((areaWidth - areaWidth * 0.8) / arcRadius);

    canvas.drawArc(leftArcRect, -angle, 2 * angle, false, linePaint);
    canvas.drawArc(rightArcRect, 3.14 - angle, 2 * angle, false, linePaint);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    _resizeField(game.size);
  }
}
