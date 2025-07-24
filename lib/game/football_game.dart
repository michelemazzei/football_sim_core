import 'package:flame/components.dart';
import 'package:flame/game.dart';
import '../components/field_component.dart';
import '../components/ball_component.dart';

class FootballGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    // Carica e aggiungi il campo
    final field = FieldComponent();
    await add(field);

    // Carica e aggiungi la palla
    final ball = BallComponent()
      ..position = size / 2
      ..anchor = Anchor.center;
    await add(ball);
  }
}
