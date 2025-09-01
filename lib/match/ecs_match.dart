import 'package:football_sim_core/model/team.dart';
import 'package:logging/logging.dart';

class EcsMatch {
  final logger = Logger('EcsMatch');

  /// Tempo trascorso in secondi
  double elapsedTime = 0.0;

  final double duration; // in secondi simulati
  final double timeScale;

  /// Squadre (puoi definire una classe `Team`)
  final Team teamA;
  final Team teamB;

  EcsMatch({
    required this.teamA,
    required this.teamB,
    this.duration = 90,
    this.timeScale = 30.0,
  });

  void updateElapsedTime(double dt) {
    final previous = elapsedTime;
    elapsedTime += dt * timeScale;

    if (elapsedTime > duration) {
      elapsedTime = duration;
    }
    logger.fine(
      'Time updated: $previous → $elapsedTime (${minutes.toStringAsFixed(1)} min)',
    );
  }

  double get minutes => elapsedTime / 60.0;
}
