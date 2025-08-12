import 'dart:ui';

import 'package:flame/components.dart';
import 'package:football_sim_core/ecs/components/ball_logic_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/entity.dart';
import 'package:football_sim_core/model/game_state.dart';

class EntityManager {
  final GameState gameState;

  EntityManager(this.gameState);

  Entity createBall({
    required int id,
    required Vector2 position,
    required Vector2 size,
    VoidCallback? onOutOfBounds,
  }) {
    final ballEntity = BallEntity(id, position);

    // Componenti
    final posComp = ballEntity.getComponent<EntityPositionComponent>()!;
    final velComp = ballEntity.getComponent<VelocityComponent>()!;
    final sizeComp = ballEntity.getComponent<SizeComponent>()!;

    // Registrazione automatica
    gameState.positionMap[ballEntity] = posComp;
    gameState.velocityMap[ballEntity] = velComp;
    gameState.sizeMap[ballEntity] = sizeComp;
    gameState.ballLogicMap[ballEntity] = BallLogicComponent(
      onOutOfBounds: onOutOfBounds,
    );

    return ballEntity;
  }

  // Puoi aggiungere altri metodi per giocatori, arbitri, ecc.
}
