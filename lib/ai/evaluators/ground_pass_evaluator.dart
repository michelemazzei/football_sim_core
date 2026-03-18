import 'package:football_sim_core/ai/decision/action_intent.dart';
import 'package:football_sim_core/ai/evaluators/behavior_evaluator.dart';
import 'package:football_sim_core/ai/models/action_proposal.dart';
import 'package:football_sim_core/core/field/field_grid.dart';
import 'package:football_sim_core/core/field/zone.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';

class GroundPassEvaluator extends BehaviorEvaluator {
  GroundPassEvaluator({
    required super.config,
    required super.world,
    required super.perception,
    required super.grid,
  });

  @override
  ActionProposal evaluate(
    PlayerEntity me,
    List<PlayerEntity> teammates,
    List<PlayerEntity> opponents,
  ) {
    // 1. Calcola il punteggio (logica che faremo dopo)
    return _calculateGroundPass(me);
  }

  // --- LOGICA DI PASSAGGIO ---
  ActionProposal _calculateGroundPass(
    PlayerEntity me,
    List<PlayerEntity> teammates,
    List<PlayerEntity> opponents,
    double dir,
  ) {
    // 1. Otteniamo la griglia (assumiamo sia accessibile o passata)
    final grid = FieldGrid();

    // Trova la zona attuale del portatore
    Zone myZone = grid.fromNormalized(me.position);

    List<PlayerEntity> candidates = perception.getKNearestTeammates(
      me,
      teammates,
      5,
    );
    PlayerEntity? bestTeammate;
    double bestPassValue = -1.0;

    for (var teammate in candidates) {
      // 2. Troviamo la zona del compagno
      Zone targetZone = grid.fromNormalized(teammate.position);

      // 3. Calcolo del valore strategico basato sulle tue Zone
      // Usiamo il 'weight' che hai definito nella classe Zone
      double strategicValue = targetZone.weight;

      // Bonus se la zona del compagno è "più avanti" o "migliore" della mia secondo il tipo
      if (dir == 1.0) {
        // Home attacca verso destra (x crescenti)
        if (targetZone.x > myZone.x) strategicValue += 0.2;
      } else {
        // Away attacca verso sinistra (x decrescenti)
        if (targetZone.x < myZone.x) strategicValue += 0.2;
      }

      // 4. Controllo di sicurezza e linea di passaggio
      bool lineClear = perception.isPassLineClear(
        me.position,
        teammate.position,
        opponents,
      );
      if (!lineClear) continue;

      var threats = opponents
          .where((o) => o.position.distanceTo(teammate.position) < 0.08)
          .length;
      double safety = (1.0 - (threats * 0.35)).clamp(0.0, 1.0);

      // 5. Sintesi: (Valore della Zona * Sicurezza)
      // Un passaggio in una zona ottima (es. Attacking) ma molto pressata
      // potrebbe valere meno di un passaggio in una zona media ma libera.
      double totalVal = (strategicValue * 0.5) + (safety * 0.5);

      if (totalVal > bestPassValue) {
        bestPassValue = totalVal;
        bestTeammate = teammate;
      }
    }

    return ActionProposal(
      score: bestPassValue.clamp(0.0, 0.95),
      intent: ActionIntent(
        action: PlayerAction.pass,
        targetPlayer: bestTeammate,
      ),
    );
  }
}
