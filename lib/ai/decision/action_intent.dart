import 'package:flame/components.dart';
import 'package:football_sim_core/ai/decision/decision_module.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';

class ActionIntent {
  final PlayerAction action;

  // Target opzionali in base all'azione
  final PlayerEntity? targetPlayer; // Per Pass o Dribble
  final Vector2? targetPosition; // Per Advance o Shoot (punto della porta)

  ActionIntent({required this.action, this.targetPlayer, this.targetPosition});

  @override
  String toString() =>
      'Intent: $action | Target: ${targetPlayer ?? targetPosition}';
}
