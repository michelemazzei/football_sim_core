import 'package:flame/game.dart';

import '../components/ball_component.dart';
import '../components/field_component.dart';

class FootballGame extends FlameGame {
  late FieldComponent fieldComponent;
  late BallComponent ballComponent;
  @override
  Future<void> onLoad() async {
    // Carica e aggiungi il campo
    fieldComponent = FieldComponent();
    await add(fieldComponent);

    // Carica e aggiungi la palla
    ballComponent = await BallComponent.create(this, size / 2);
    await add(ballComponent);

    ballComponent.kick(Vector2(1, 1), 400);
  }
}
