import 'package:flame/components.dart';

import '../game/football_game.dart'; // importa la tua classe Game

class FieldComponent extends SpriteComponent
    with HasGameReference<FootballGame> {
  FieldComponent() : super(size: Vector2.all(800), anchor: Anchor.topLeft);

  @override
  Future<void> onLoad() async {
    sprite = await game.loadSprite('field.png');
    position = Vector2.zero();
  }
}
