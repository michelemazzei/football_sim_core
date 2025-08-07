import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/components/player_component.dart';
import 'package:football_sim_core/components/stands_component.dart';
import 'package:football_sim_core/model/ball_model.dart';
import 'package:football_sim_core/model/player_model.dart';

import '../components/ball_component.dart';
import '../components/field_component.dart';

class FootballGame extends FlameGame {
  late FieldComponent fieldComponent;
  late BallComponent ballComponent;
  @override
  Future<void> onLoad() async {
    // Crea e aggiungi il campo
    fieldComponent = FieldComponent()..position = Vector2(0, size.y * 0.1);
    await add(fieldComponent);

    // Crea e aggiungi la palla
    ballComponent = BallComponent(
      game: this,
      model: BallModel(relativePosition: Vector2.all(0.5)),
    );
    await add(ballComponent);

    // Crea e aggiungi il giocatore
    final player1 = PlayerComponent(
      game: this,
      model: PlayerModel(
        relativePosition: Vector2(0.4, 0.5),
        color: Colors.blue,
        number: 10,
      ),
    );
    await add(player1);

    // Avvia il movimento della palla
    ballComponent.kick(Vector2(1, 1), 0.5);
  }
}
