import 'package:flame/components.dart';
import 'package:football_sim_core/ai/decision/action_intent.dart';
import 'package:football_sim_core/ai/evaluators/behavior_evaluator.dart';
import 'package:football_sim_core/ai/models/action_proposal.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/model/team_id.dart';

class ShootEvaluator extends BehaviorEvaluator {
  ShootEvaluator({
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
    return _calculateShoot(me);
  }

  // --- LOGICA DI TIRO ---
  ActionProposal _calculateShoot(PlayerEntity me) {
    double targetX = (me.teamId == TeamId.home) ? 1.0 : 0.0;
    double distToGoal = (targetX - me.position.x).abs();

    // Il target del tiro è il centro della porta (y=0.5) nelle coordinate 0..1
    Vector2 goalCenter = Vector2(targetX, 0.5);

    if (distToGoal > config.shoot.maxDistance) {
      return ActionProposal(
        score: config.shoot.minScore,
        intent: ActionIntent(
          action: PlayerAction.shoot,
          targetPosition: goalCenter,
        ),
      );
    }

    double score = (1.0 - (distToGoal / config.shoot.maxDistance)).clamp(
      config.shoot.minScore,
      config.shoot.maxScore,
    );
    return ActionProposal(
      score: score,
      intent: ActionIntent(
        action: PlayerAction.shoot,
        targetPosition: goalCenter,
      ),
    );
  }
}
