import 'package:football_sim_core/match/match_fsm.dart';
import 'package:football_sim_core/model/team.dart';

class EcsMatch {
  /// Tempo trascorso in secondi
  double elapsedTime = 0.0;

  /// Delta time dell’ultimo frame
  double deltaTime = 0.0;

  /// Riferimento alla FSM (opzionale, utile per transizioni)
  late final MatchFSM _fsm;

  /// Squadre (puoi definire una classe `Team`)
  final Team teamA;
  final Team teamB;

  /// Eventi di gioco (es. goal, fallo, ecc.)
  final List<String> events = [];

  EcsMatch({required this.teamA, required this.teamB, MatchFSM? fsm}) {
    // Inizializza la FSM se non è stata passata
    fsm ??= MatchFSM(this);
    _fsm = fsm;
  }

  MatchFSM get fsm => _fsm;

  /// Metodo da chiamare ogni frame per aggiornare il tempo
  void update(double dt) {
    deltaTime = dt;
    elapsedTime += dt;
  }

  /// Utility per registrare eventi
  void logEvent(String event) {
    events.add(event);
    print('[EVENTO] $event');
  }
}
