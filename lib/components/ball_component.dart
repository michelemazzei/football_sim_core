import 'package:flame/components.dart';

class BallComponent extends SpriteComponent with HasGameReference {
  BallComponent() : super(size: Vector2.all(32));

  @override
  Future<void> onLoad() async {
    sprite = await game.loadSprite('ball.png');
  }
}
