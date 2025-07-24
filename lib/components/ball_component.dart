import 'package:flame/components.dart';

class BallComponent extends SpriteComponent with HasGameRef {
  BallComponent() : super(size: Vector2.all(32));

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('images/ball.png');
  }
}
