import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/model/team_id.dart';

class BallPossessionComponent extends EcsComponent {
  // Possesso attuale
  int? lastPlayerId;
  TeamId? lastTeamId;

  // Possesso precedente (per assist/analisi)
  int? secondLastPlayerId;
  TeamId? secondLastTeamId;

  BallPossessionComponent({
    this.lastPlayerId,
    this.lastTeamId,
    this.secondLastPlayerId,
    this.secondLastTeamId,
  });

  /// Metodo per aggiornare il possesso in modo mutabile.
  /// Da chiamare nel sistema di collisione o gestione palla.
  void updatePossession({required int newPlayerId, required TeamId newTeamId}) {
    // Se lo stesso giocatore tocca la palla consecutivamente,
    // non scaliamo il possesso precedente.
    if (newPlayerId == lastPlayerId) return;

    // Shift: il vecchio attuale diventa il precedente
    secondLastPlayerId = lastPlayerId;
    secondLastTeamId = lastTeamId;

    // Aggiornamento sul posto
    lastPlayerId = newPlayerId;
    lastTeamId = newTeamId;
  }

  void losePossession() {
    // Spostiamo l'attuale nel precedente prima di pulire
    secondLastPlayerId = lastPlayerId;
    secondLastTeamId = lastTeamId;

    lastPlayerId = null;
    lastTeamId = null;
  }

  // Metodi di utilità rapidi
  bool isTeamInPossession(TeamId team) => team == lastTeamId;
  bool isPlayerInPossession(int player) => player == lastPlayerId;

  /// Pulisce il possesso (es. palla ferma o dopo un kickoff)
  void reset() {
    lastPlayerId = null;
    lastTeamId = null;
    secondLastPlayerId = null;
    secondLastTeamId = null;
  }
}
