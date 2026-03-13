part of 'decision_module.dart';

class DefensiveDecisionModule extends DecisionModule {
  DefensiveDecisionModule({
    required super.world,
    required super.perception,
    required super.grid,
  });

  @override
  ActionIntent decideAction(
    PlayerEntity me,
    List<PlayerEntity> teammates,
    List<PlayerEntity> opponents,
  ) {
    // 1. Chi ha la palla?
    // Cerchiamo il portatore SENZA fallback forzato
    final PlayerEntity? carrier = opponents.firstWhereOrNull((p) => p.hasBall);

    if (carrier == null) {
      // STATO SPORCO: La palla è vagante o contesa.
      // L'intento qui dovrebbe essere: "Corri verso la palla" o "Copri lo spazio"
      return ActionIntent(
        action: PlayerAction.advance,
        targetPosition: world.ball.position, // O un riferimento alla palla
      );
    }

    // 2. Cerchiamo l'avversario più pericoloso (escluso il portatore)
    PlayerEntity? dangerousOpponent = _findDangerousOpponent(me, opponents);

    // 3. Calcoliamo i pesi delle azioni
    // Pressione sul portatore
    double pressureWeight = (1.0 - me.position.distanceTo(carrier.position))
        .clamp(0.0, 1.0);

    // Voglia di marcare (sale se c'è un avversario pericoloso libero)
    double markingWeight = (dangerousOpponent != null) ? 0.5 : 0.0;

    // Usiamo il tuo amato centralRandom() per aggiungere variabilità "umana"
    double roll = centralRandom();

    if (pressureWeight > roll &&
        me.position.distanceTo(carrier.position) < 0.3) {
      // Vado a chiudere il portatore
      return ActionIntent(
        action: PlayerAction.advance,
        targetPosition: carrier.position,
      );
    } else if (dangerousOpponent != null) {
      // Mi incollo all'uomo pericoloso (stare tra lui e la palla)
      Vector2 markingPos = (dangerousOpponent.position + carrier.position) / 2;
      return ActionIntent(
        action: PlayerAction.advance,
        targetPosition: markingPos,
      );
    }

    // Default: copro lo spazio verso la mia porta
    return ActionIntent(
      action: PlayerAction.advance,
      targetPosition: me.position,
    );
  }

  PlayerEntity? _findDangerousOpponent(
    PlayerEntity me,
    List<PlayerEntity> opponents,
  ) {
    PlayerEntity? bestTarget;
    double highestDanger = -1.0;

    for (var opp in opponents) {
      if (opp.hasBall) continue;

      // Un avversario è pericoloso se è in una zona ad alto peso (vicino alla mia porta)
      Zone zone = grid.fromNormalized(opp.position);
      double danger = zone.weight;

      // Se non ha nessuno vicino, il pericolo aumenta
      var defendersNearby = perception.getOpponentsInRadius(opp, [
        me,
      ], 0.15).length;
      if (defendersNearby == 0) danger += 0.3;

      if (danger > highestDanger) {
        highestDanger = danger;
        bestTarget = opp;
      }
    }
    return bestTarget;
  }
}
