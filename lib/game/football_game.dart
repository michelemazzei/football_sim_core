import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/components/player_component.dart';
import 'package:football_sim_core/model/ball_model.dart';
import 'package:football_sim_core/model/player_model.dart';

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

    await Future.delayed(Duration.zero); // aspetta un frame

    // Carica e aggiungi la palla
    ballComponent = BallComponent(
      game: this,
      model: BallModel(relativePosition: Vector2.all(0.5)),
    );
    await add(ballComponent);

    // final player1 = await PlayerComponent.create(
    //   this,
    //   PlayerModel(position: size / 4, color: Colors.blue, number: 10),
    // );
    // final player2 = await PlayerComponent.create(
    //   this,
    //   PlayerModel(
    //     position: size / 2 + Vector2(500, 100),
    //     color: Colors.red,
    //     number: 10,
    //   ),
    // );

    // await add(player1);
    // await add(player2);
    //  ballComponent.kick(Vector2(1, 1), 400);
  }
}
