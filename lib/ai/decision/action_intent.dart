import 'package:flame/components.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';

enum PlayerAction { shoot, pass, dribble, advance }

enum PassType { ground, lob, high } // Rasoterra, Pallonetto, Lancio lungo

class ActionIntent {
  final PlayerAction action;
  final PlayerEntity? targetPlayer;
  final Vector2? targetPosition;

  // Aggiunta per il calcio a 11
  final PassType passType;
  final double curve; // Per i tiri o passaggi a effetto (opzionale)

  ActionIntent({
    required this.action,
    this.targetPlayer,
    this.targetPosition,
    this.passType = PassType.ground, // Default rasoterra per semplicità
    this.curve = 0.0,
  });
}
