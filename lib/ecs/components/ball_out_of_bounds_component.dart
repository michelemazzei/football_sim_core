import 'package:flame/extensions.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/model/team_id.dart';

/// Definisce i vari tipi di uscita dal campo per gestire la ripresa corretta
enum OutOfBoundsType {
  none,
  sideLine, // Rimessa laterale
  goalLine, // Calcio d'angolo o rinvio dal fondo
  goalScored, // Gol (palla oltre la linea tra i pali)
}

class BallOutOfBoundsComponent extends EcsComponent {
  // Stato principale: la palla è "viva" o "morta"?
  bool isOutOfBounds;

  // Il tipo di uscita rilevato dal BoundarySystem
  OutOfBoundsType type;

  // Memoria dell'ultimo tocco (scritta dal BallHistorySystem)
  int? lastPlayerId;
  TeamId? lastTeamId;

  // Dove esattamente la palla ha varcato la linea (utile per il posizionamento)
  Vector2? exitPosition;

  BallOutOfBoundsComponent({
    this.isOutOfBounds = false,
    this.type = OutOfBoundsType.none,
    this.lastPlayerId,
    this.lastTeamId,
    this.exitPosition,
  });

  /// Metodo per riportare la palla in stato "In Play" dopo la ripresa
  void reset() {
    isOutOfBounds = false;
    type = OutOfBoundsType.none;
    exitPosition = null;
    // Tipicamente non resettiamo lastTeamId qui per evitare null-pointer
    // prima del primo tocco post-ripresa.
  }
}
