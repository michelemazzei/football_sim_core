import 'package:flame/game.dart';

import '../components/ball_component.dart';
import '../components/field_component.dart';

class FootballGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    // Carica e aggiungi il campo
    final field = FieldComponent();
    await add(field);

    // Carica e aggiungi la palla
    final ball = await BallComponent.create(this, size / 2);
    await add(ball);

    ball.kick(Vector2(0, 1), 400);
  }
}
