import 'package:flutter/material.dart';
import 'package:football_sim_core/game/game_widget.dart';
import 'package:logging/logging.dart';

void setupLogging() {
  Logger.root.level = Level.ALL;
  hierarchicalLoggingEnabled = true;

  Logger('FootballGame').level = Level.INFO;

  Logger.root.onRecord.listen((record) {
    debugPrint(
      '[${record.level.name}: ${record.loggerName}]  ${record.message}',
    );
  });
}

void main() {
  setupLogging();
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
