import 'package:flame/components.dart';
import 'package:flutter/material.dart';

enum StadiumType { small, medium, big, biggest }

class SpaltiComponent extends PositionComponent {
  final StadiumType tipo;
  final List<String> spettatoriPng;
  final Vector2 spettatoreSize = Vector2(12, 12);
  final List<SpriteComponent> spettatori = [];
  final List<RectangleComponent> gradoni = [];

  SpaltiComponent({
    required Vector2 campoSize,
    required this.tipo,
    required this.spettatoriPng,
  }) {
    size = campoSize;
  }

  factory SpaltiComponent.make({required Vector2 size, StadiumType? type}) =>
      SpaltiComponent(
        campoSize: size,
        tipo: type ?? StadiumType.medium,
        spettatoriPng: [
          'spettatori/spettatore_1.png',
          'spettatori/spettatore_2.png',
          'spettatori/spettatore_3.png',
          'spettatori/spettatore_4.png',
          'spettatori/spettatore_5.png',
          'spettatori/spettatore_6.png',
          'spettatori/spettatore_7.png',
          'spettatori/spettatore_8.png',
          'spettatori/spettatore_9.png',
          'spettatori/spettatore_10.png',
        ],
      );

  @override
  Future<void> onLoad() async {
    await _generaSpalti();
  }

  @override
  void onGameResize(Vector2 newSize) {
    super.onGameResize(newSize);
    size.setFrom(newSize);

    removeAll(spettatori);
    spettatori.clear();

    removeAll(gradoni);
    gradoni.clear();

    _generaSpalti();
  }

  Future<void> _generaSpalti() async {
    await _generaLato('top');
    await _generaLato('bottom');
    await _generaLato('left');
    await _generaLato('right');
  }

  Future<void> _generaLato(String lato) async {
    int fileCount;
    switch (tipo) {
      case StadiumType.small:
        fileCount = 1;
        break;
      case StadiumType.medium:
        fileCount = 2;
        break;
      case StadiumType.big:
        fileCount = 3;
        break;
      case StadiumType.biggest:
        fileCount = 4;
        break;
    }

    final isOrizzontale = lato == 'top' || lato == 'bottom';
    final colonne = isOrizzontale
        ? ((size.x - 70) / spettatoreSize.x).floor()
        : ((size.y - 70) / spettatoreSize.y).floor();

    for (int fila = 0; fila < fileCount; fila++) {
      // Gradone sotto la fila
      final gradone = RectangleComponent(
        size: isOrizzontale
            ? Vector2(colonne * spettatoreSize.x, spettatoreSize.y)
            : Vector2(spettatoreSize.x, colonne * spettatoreSize.y),
        paint: Paint()..color = Colors.grey.shade700,
        priority: -2,
      );

      switch (lato) {
        case 'top':
          gradone.position = Vector2(0, -((fila + 1) * spettatoreSize.y) - 10);
          break;
        case 'bottom':
          gradone.position = Vector2(
            0,
            size.y + (fila * spettatoreSize.y) - 70,
          );
          break;
        case 'left':
          gradone.position = Vector2(-((fila + 1) * spettatoreSize.x) - 10, 0);
          break;
        case 'right':
          gradone.position = Vector2(
            size.x + (fila * spettatoreSize.x) - 60,
            0,
          );
          break;
      }

      gradoni.add(gradone);
      add(gradone);

      for (int col = 0; col < colonne; col++) {
        final spriteName = spettatoriPng[(fila + col) % spettatoriPng.length];
        final sprite = await Sprite.load(spriteName);

        final spettatore = SpriteComponent()
          ..sprite = sprite
          ..size = spettatoreSize
          ..priority = -1;

        switch (lato) {
          case 'top':
            spettatore.position = Vector2(
              col * spettatoreSize.x,
              -((fila + 1) * spettatoreSize.y) - 10,
            );
            spettatore.angle = 3.14 / 2;
            break;
          case 'bottom':
            spettatore.position = Vector2(
              col * spettatoreSize.x,
              size.y + (fila * spettatoreSize.y) - 70,
            );
            spettatore.angle = -3.14 / 2;
            break;
          case 'left':
            spettatore.position = Vector2(
              -((fila + 1) * spettatoreSize.x) - 10,
              col * spettatoreSize.y,
            );
            spettatore.angle = 0;
            break;
          case 'right':
            spettatore.position = Vector2(
              size.x + (fila * spettatoreSize.x) - 60,
              col * spettatoreSize.y,
            );
            spettatore.angle = 3.14;
            break;
        }

        spettatori.add(spettatore);
        add(spettatore);
      }
    }
  }
}
