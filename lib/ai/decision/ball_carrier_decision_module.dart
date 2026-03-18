part of 'decision_module.dart';

/// Classe interna per accoppiare punteggio e intento
class _ActionProposal {
  final double score;
  final ActionIntent intent;
  _ActionProposal(this.score, this.intent);
}

class BallCarrierDecisionModule extends DecisionModule {
  BallCarrierDecisionModule({
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
    double direction = (me.teamId == TeamId.home) ? 1.0 : -1.0;

    // 1. Generiamo le proposte per ogni categoria
    var shootProp = _calculateShoot(me);
    var passProp = _calculateGroundPass(me, teammates, opponents, direction);
    var dribbleProp = _calculateDribble(me, opponents, direction);
    var advanceProp = _calculateAdvance(me, opponents, direction);

    // 2. Pesatura e scelta (Weighted Random)
    double totalScore =
        shootProp.score +
        passProp.score +
        dribbleProp.score +
        advanceProp.score;
    if (totalScore <= 0) {
      return advanceProp.intent; // Default: prova ad avanzare
    }

    return advanceProp.intent;
  }

  // --- LOGICA DI TIRO ---
  _ActionProposal _calculateShoot(PlayerEntity me) {
    double targetX = (me.teamId == TeamId.home) ? 1.0 : 0.0;
    double distToGoal = (targetX - me.position.x).abs();

    // Il target del tiro è il centro della porta (y=0.5) nelle coordinate 0..1
    Vector2 goalCenter = Vector2(targetX, 0.5);

    if (distToGoal > 0.35) {
      return _ActionProposal(
        0.01,
        ActionIntent(action: PlayerAction.shoot, targetPosition: goalCenter),
      );
    }

    double score = (1.0 - (distToGoal / 0.35)).clamp(0.1, 0.95);
    return _ActionProposal(
      score,
      ActionIntent(action: PlayerAction.shoot, targetPosition: goalCenter),
    );
  }

  // --- LOGICA DI AVANZAMENTO (ADVANCE) ---
  _ActionProposal _calculateAdvance(
    PlayerEntity me,
    List<PlayerEntity> opponents,
    double dir,
  ) {
    double stepX = 0.1 * dir;

    // Tre opzioni di movimento: dritto, diagonale "alta", diagonale "bassa"
    List<Vector2> potentialTargets = [
      me.position + Vector2(stepX, 0.0),
      me.position + Vector2(stepX, -0.08),
      me.position + Vector2(stepX, 0.08),
    ];

    Vector2 bestPos = potentialTargets[0];
    double bestScore = -1.0;

    for (var target in potentialTargets) {
      // Controllo bordi campo
      if (target.y < 0 || target.y > 1 || target.x < 0 || target.x > 1) {
        continue;
      }

      // Valutiamo la sicurezza del target (quanti avversari ci sono vicino)
      var nearbyOpponents = opponents
          .where((o) => o.position.distanceTo(target) < 0.1)
          .length;
      double currentScore = 1.0 - (nearbyOpponents * 0.3);

      if (currentScore > bestScore) {
        bestScore = currentScore;
        bestPos = target;
      }
    }

    return _ActionProposal(
      (bestScore * 0.6).clamp(0.1, 0.8),
      ActionIntent(action: PlayerAction.advance, targetPosition: bestPos),
    );
  }

  // --- LOGICA DI PASSAGGIO ---
  _ActionProposal _calculateGroundPass(
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

    return _ActionProposal(
      bestPassValue.clamp(0.0, 0.95),
      ActionIntent(action: PlayerAction.pass, targetPlayer: bestTeammate),
    );
  }

  _ActionProposal _calculateLobPass(
    PlayerEntity me,
    PlayerEntity teammate,
    List<PlayerEntity> opponents,
  ) {
    double lobValue = 0.0;

    // 1. Verifica se il lob è NECESSARIO
    bool groundLineBlocked = !perception.isPassLineClear(
      me.position,
      teammate.position,
      opponents,
    );
    if (groundLineBlocked) {
      lobValue += 0.4; // Bonus necessità: non posso passarla a terra
    }

    // 2. Verifica se il lob è POSSIBILE (spazio dietro i difensori)
    // Se ci sono avversari troppo vicini al compagno, il lob è rischioso
    var opponentsNearTarget = opponents
        .where((o) => o.position.distanceTo(teammate.position) < 0.05)
        .length;

    double safety = (1.0 - (opponentsNearTarget * 0.4)).clamp(0.0, 1.0);

    // 3. Calcolo della coordinata di atterraggio (Target Position)
    // Nel lob spesso passiamo sulla CORSA, non sui piedi.
    Vector2 landingPoint = _predictLandingPoint(teammate);

    // Sintesi finale
    double finalScore = (lobValue * 0.6) + (safety * 0.4);

    return _ActionProposal(
      finalScore.clamp(
        0.0,
        0.9,
      ), // Spesso un lob è meno preciso di un ground pass
      ActionIntent(
        action: PlayerAction.pass,
        targetPlayer: teammate,
        targetPosition: landingPoint,
        passType: PassType.lob,
      ),
    );
  }

  // --- LOGICA DI DRIBBLING ---
  _ActionProposal _calculateDribble(
    PlayerEntity me,
    List<PlayerEntity> opponents,
    double dir,
  ) {
    final grid = FieldGrid();
    Zone myZone = grid.fromNormalized(me.position);

    // 1. Pressione attuale
    var pressers = perception.getOpponentsInRadius(me, opponents, 0.08);

    // 2. Valutiamo lo spazio davanti (nella direzione di attacco)
    double stepX = 0.1 * dir;
    Vector2 spaceAhead = me.position + Vector2(stepX, 0.0);
    Zone zoneAhead = grid.fromNormalized(spaceAhead);

    double dribbleScore = 0.0;

    if (pressers.isNotEmpty) {
      // Se pressato, il dribbling diventa un'opzione di "salvataggio"
      dribbleScore = 0.4 + (pressers.length * 0.1);
    } else if (zoneAhead.weight > myZone.weight) {
      // Se ho campo libero verso una zona più importante, considero di avanzare in dribbling
      dribbleScore = 0.3;
    }

    // Se siamo vicini alla porta avversaria, l'istinto al dribbling aumenta
    if (myZone.type == ZoneType.attacking) {
      dribbleScore += 0.2;
    }

    return _ActionProposal(
      dribbleScore.clamp(0.0, 0.8),
      ActionIntent(
        action: PlayerAction.dribble,
        targetPosition: spaceAhead, // Puntiamo allo spazio davanti
        targetPlayer: pressers.isNotEmpty ? pressers.first : null,
      ),
    );
  }
}
