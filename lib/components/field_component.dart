import 'package:flame/components.dart';

class FieldComponent extends SpriteComponent {
  FieldComponent() : super(size: Vector2.all(800));

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('images/field.png');
    position = Vector2.zero();
  }
}
