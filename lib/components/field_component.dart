import 'package:flame/components.dart';

import '../game/football_game.dart';

class FieldComponent extends SpriteComponent
    with HasGameReference<FootballGame> {
  FieldComponent() : super(anchor: Anchor.topLeft);

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    _resizeField(size);
  }

  void _resizeField(Vector2 screenSize) {
    final fieldRatio = sprite!.originalSize.x / sprite!.originalSize.y;
    final screenRatio = screenSize.x / screenSize.y;

    if (fieldRatio > screenRatio) {
      size = Vector2(screenSize.x, screenSize.x / fieldRatio);
    } else {
      size = Vector2(screenSize.y * fieldRatio, screenSize.y);
    }

    position = (screenSize - size) / 2;
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // 1. carica lo sprite del campo
    sprite = await game.loadSprite('field.png');
    _resizeField(game.size);

    // 2. prendi le dimensioni reali dell'immagine
    final image = await game.images.load('field.png');
    final fieldRatio = image.width / image.height;

    // 3. prendi le dimensioni dello schermo di gioco
    final screenSize = game.size;
    final screenRatio = screenSize.x / screenSize.y;

    // 4. calcola size mantenendo le proporzioni
    if (fieldRatio > screenRatio) {
      // l’immagine è più “larga” rispetto allo schermo
      size = Vector2(screenSize.x, screenSize.x / fieldRatio);
    } else {
      // l’immagine è più “alta”
      size = Vector2(screenSize.y * fieldRatio, screenSize.y);
    }

    // 5. centra il campo sullo schermo
    position = (screenSize - size) / 2;
  }
}
