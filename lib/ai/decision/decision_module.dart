import 'dart:math';
import 'package:flame/components.dart';
import 'package:football_sim_core/ai/decision/action_intent.dart';
import 'package:football_sim_core/ai/perception/perception_module.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/model/team_id.dart';

enum PlayerAction { shoot, pass, dribble, advance }

/// Classe interna per accoppiare punteggio e intento
class _ActionProposal {
  final double score;
  final ActionIntent intent;
  _ActionProposal(this.score, this.intent);
}

class DecisionModule {
  final Random _random = Random();
  final PerceptionModule _perception = PerceptionModule();

  ActionIntent decideAction(
    PlayerEntity me,
    List<PlayerEntity> teammates,
    List<PlayerEntity> opponents,
  ) {
    double direction = (me.teamId == TeamId.home) ? 1.0 : -1.0;

    // 1. Generiamo le proposte per ogni categoria
    var shootProp = _calculateShoot(me);
    var passProp = _calculatePass(me, teammates, opponents, direction);
    var dribbleProp = _calculateDribble(me, opponents);
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

    double roll = _random.nextDouble() * totalScore;

    if (roll < shootProp.score) return shootProp.intent;
    if (roll < shootProp.score + passProp.score) return passProp.intent;
    if (roll < shootProp.score + passProp.score + dribbleProp.score) {
      return dribbleProp.intent;
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
  _ActionProposal _calculatePass(
    PlayerEntity me,
    List<PlayerEntity> teammates,
    List<PlayerEntity> opponents,
    double dir,
  ) {
    List<PlayerEntity> candidates = _perception.getKNearestTeammates(
      me,
      teammates,
      3,
    );
    if (candidates.isEmpty) {
      return _ActionProposal(0.0, ActionIntent(action: PlayerAction.pass));
    }

    PlayerEntity? bestTeammate;
    double bestPassValue = 0.0;

    for (var teammate in candidates) {
      // Quanto spazio guadagniamo verso la porta?
      double progress = (teammate.position.x - me.position.x) * dir;

      // Controllo "linea di passaggio" semplificato (distanza degli avversari dal compagno)
      var threats = opponents
          .where((o) => o.position.distanceTo(teammate.position) < 0.08)
          .length;
      double safety = 1.0 - (threats * 0.4);

      double totalVal = (progress * 0.7) + (safety * 0.3);

      if (totalVal > bestPassValue) {
        bestPassValue = totalVal;
        bestTeammate = teammate;
      }
    }

    return _ActionProposal(
      bestPassValue.clamp(0.05, 0.85),
      ActionIntent(action: PlayerAction.pass, targetPlayer: bestTeammate),
    );
  }

  // --- LOGICA DI DRIBBLING ---
  _ActionProposal _calculateDribble(
    PlayerEntity me,
    List<PlayerEntity> opponents,
  ) {
    // Cerchiamo l'avversario più vicino che ci sta pressando
    var pressers = _perception.getOpponentsInRadius(me, opponents, 0.1);

    if (pressers.isEmpty) {
      return _ActionProposal(0.05, ActionIntent(action: PlayerAction.dribble));
    }

    // L'intento è superare l'avversario più vicino (targetPlayer)
    PlayerEntity closestOpponent = pressers.first;
    double score = (pressers.length * 0.25).clamp(0.1, 0.7);

    return _ActionProposal(
      score,
      ActionIntent(action: PlayerAction.dribble, targetPlayer: closestOpponent),
    );
  }
}
