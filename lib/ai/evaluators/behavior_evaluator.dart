import 'package:football_sim_core/ai/models/action_proposal.dart';
import 'package:football_sim_core/ai/models/evaluator_config.dart';
import 'package:football_sim_core/ai/perception/perception_module.dart';
import 'package:football_sim_core/core/field/field_grid.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';

abstract class BehaviorEvaluator {
  final EvaluatorConfig config;
  final PerceptionModule perception;
  final FieldGrid grid;
  final EcsWorld world;

  BehaviorEvaluator({
    required this.config,
    required this.world,
    required this.perception,
    required this.grid,
  });

  /// Calcola l'utilità di una specifica azione per il giocatore [me].
  /// Restituisce un [ActionProposal] che contiene il punteggio (0.0 - 1.0)
  /// e l'intento con i parametri (target, posizione, ecc.).
  ActionProposal evaluate(
    PlayerEntity me,
    List<PlayerEntity> teammates,
    List<PlayerEntity> opponents,
  );
}
