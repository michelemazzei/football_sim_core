part of 'decision_module.dart';

class SupportDecisionModule extends DecisionModule {
  SupportDecisionModule({
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
    // 1. Identifichiamo chi ha la palla (il "Carrier")
    // In un sistema reale, potresti passarlo o cercarlo tra i compagni
    final ballCarrier = teammates.firstWhere(
      (p) => p.hasBall,
      orElse: () => me,
    );

    if (ballCarrier == me) {
      // Fallback di sicurezza: se per qualche motivo sono io il carrier,
      // dovrei usare OnBallModule, ma qui mettiamo un intento neutro.
      return ActionIntent(
        action: PlayerAction.advance,
        targetPosition: me.position,
      );
    }

    final currentZone = grid.fromNormalized(me.position);
    final direction = (me.teamId == TeamId.home) ? 1.0 : -1.0;

    // 2. Troviamo le zone candidate (la mia + le adiacenti)
    List<Zone> candidates = _getNearbyZones(currentZone);

    Zone bestZone = currentZone;
    double maxScore = -1.0;

    for (var zone in candidates) {
      Vector2 zoneCenter = grid.centerOfZone(zone);

      // A. Valore base della zona dal tuo sistema di pesi
      double score = zone.weight;

      // B. Bonus/Malus Posizionale: vogliamo stare "avanti" rispetto alla palla?
      // Nel calcio, a volte serve venire "incontro" (passaggio corto) o "andare nello spazio"
      double progress = (zone.x - ballCarrier.position.x) * direction;
      if (progress > 0 && progress < 3)
        score += 0.2; // Bonus zona di ricezione avanzata

      // C. Linea di passaggio: è una zona servibile?
      bool isVisible = perception.isPassLineClear(
        ballCarrier.position,
        zoneCenter,
        opponents,
      );
      if (!isVisible) score -= 0.5; // Malus pesante se la linea è coperta

      // D. Pressione: ci sono avversari troppo vicini a questa zona?
      var threats = opponents
          .where((o) => o.position.distanceTo(zoneCenter) < 0.1)
          .length;
      score -= (threats * 0.3);

      if (score > maxScore) {
        maxScore = score;
        bestZone = zone;
      }
    }

    // 3. L'intento è muoversi verso il centro della zona migliore
    return ActionIntent(
      action: PlayerAction.advance, // Usiamo advance come "muoviti verso"
      targetPosition: grid.centerOfZone(bestZone),
    );
  }

  List<Zone> _getNearbyZones(Zone center) {
    List<Zone> nearby = [center];
    // Aggiungi logica per prendere zone con x +/- 1 e y +/- 1 nella grid
    // assicurandoti che siano valide tramite grid.isValidZone
    return nearby;
  }
}
