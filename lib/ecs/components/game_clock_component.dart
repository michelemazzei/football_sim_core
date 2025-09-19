import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:logging/logging.dart';

class GameClockComponent extends EcsComponent {
  final _logger = Logger('ecs.components.GameClockComponent');
  double _elapsed = 0.0;

  /// Durata totale della partita in secondi simulati (es. 90.0 = 90s)
  final double duration;

  /// Fattore di velocità: 1.0 = tempo reale, >1.0 = simulazione accelerata
  final double speedFactor;

  GameClockComponent({
    this.duration = 90.0,
    this.speedFactor = 10.0, // es. 10x più veloce
  });

  /// Resetta il tempo simulato
  void reset() {
    _elapsed = 0.0;
  }

  /// Aggiorna il tempo simulato in base al delta time e al fattore di velocità
  void update(double dt) {
    _elapsed += dt * speedFactor;
    if (_elapsed > duration) _elapsed = duration;
  }

  /// Ritorna true se il tempo è scaduto
  bool get isTimeUp => _elapsed >= duration;

  /// Tempo simulato in minuti (utile per log o UI)
  double get minutes => _elapsed / 60.0;

  /// Tempo simulato in secondi
  double get elapsedTime => _elapsed;

  /// Delta time scalato (opzionale, utile per altri sistemi)
  double scaledDelta(double dt) => dt * speedFactor;

  /// Log utile per debug
  void logTime() {
    _logger.info(
      '⏱️ Tempo simulato: ${minutes.toStringAsFixed(1)} min / ${(duration / 60.0).toStringAsFixed(1)} totali',
    );
  }
}
