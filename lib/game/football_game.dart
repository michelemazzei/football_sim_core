import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/components/player_component.dart';
import 'package:football_sim_core/components/spalti_component.dart';
import 'package:football_sim_core/model/ball_model.dart';
import 'package:football_sim_core/model/formation.dart';
import 'package:football_sim_core/model/team.dart';

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
      wrapper!.priority = -1;
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

    await add(wrapper!);
    // Crea e aggiungi la palla
    ballComponent = BallComponent(
      game: this,
      model: BallModel(relativePosition: Vector2.all(0.5)),
    );
    await add(ballComponent);

    // Crea e aggiungi il giocatore

    final teamA = Team(id: 'A', color: Colors.blue);
    final teamB = Team(id: 'B', color: Colors.red);

    teamA.initializePlayers(formation442, true);
    teamB.initializePlayers(formation442, false);

    // Poi aggiungi i PlayerComponent al Flame game
    for (final player in [...teamA.players, ...teamB.players]) {
      final component = PlayerComponent(model: player, game: this);
      add(component);
    }
    add(MidlineDebug(this)..position = Vector2(0, fieldComponent.size.y / 2));
  }
}

class MidlineDebug extends PositionComponent {
  final FootballGame game;
  MidlineDebug(this.game);
  @override
  void render(Canvas canvas) {
    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 1;
    canvas.drawLine(Offset(0, 0), Offset(game.size.x, 0), paint);
  }
}
