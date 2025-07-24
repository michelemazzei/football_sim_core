import 'package:flutter/material.dart';
import 'package:football_sim_core/game/game_widget.dart';

void main() {
  runApp(const GameApp());
}

class GameApp extends StatelessWidget {
  const GameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calcio 2D Manager',
      home: const GameWidgetWrapper(),
    );
  }
}
