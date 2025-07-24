import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'football_game.dart';

class GameWidgetWrapper extends StatelessWidget {
  const GameWidgetWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: FootballGame());
  }
}
