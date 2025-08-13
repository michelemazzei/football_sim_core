import 'package:football_sim_core/match/match_fsm.dart';
import 'package:football_sim_core/model/team.dart';

class EcsMatch {
  /// Tempo trascorso in secondi
  double elapsedTime = 0.0;

  /// Delta time dell’ultimo frame
  double deltaTime = 0.0;

  /// Riferimento alla FSM (opzionale, utile per transizioni)
  late MatchFSM fsm;

  /// Squadre (puoi definire una classe `Team`)
  Team? teamA;
  Team? teamB;

  /// Stato del punteggio
  int scoreA = 0;
  int scoreB = 0;

  /// Eventi di gioco (es. goal, fallo, ecc.)
  final List<String> events = [];

  EcsMatch({this.teamA, this.teamB});

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
