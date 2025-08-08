import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/components/player_component.dart';
import 'package:football_sim_core/components/spalti_component.dart';
import 'package:football_sim_core/model/ball_model.dart';
import 'package:football_sim_core/model/player_model.dart';

import '../components/ball_component.dart';
import '../components/field_component.dart';

class FootballGame extends FlameGame {
  @override
  Color backgroundColor() => Colors.grey.shade900; // grigio scuro elegante
  late FieldComponent fieldComponent;
  late BallComponent ballComponent;
  PositionComponent? wrapper;
  final wrapping = Vector2(40, 40);
  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    if (wrapper != null) {
      remove(wrapper!);
      wrapper = null;
      wrapper = PositionComponent()..position = wrapping;
      wrapper!.add(SpaltiComponent.make(size: size, type: StadiumType.medium));
      add(wrapper!);
    }
  }

  @override
  Future<void> onLoad() async {
    // Crea e aggiungi il campo
    fieldComponent = FieldComponent();
    await add(fieldComponent);

    wrapper = PositionComponent()..position = wrapping;
    wrapper!.add(SpaltiComponent.make(size: size, type: StadiumType.medium));

    add(wrapper!);
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
    // ballComponent.kick(Vector2(1, 1), 0.5);
  }
}
