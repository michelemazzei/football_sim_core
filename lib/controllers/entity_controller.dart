import 'package:flame/components.dart';
import 'package:football_sim_core/controllers/ientity_controller.dart';
import 'package:football_sim_core/ecs/entities/entity.dart';
import 'package:football_sim_core/game/football_game.dart';

abstract class EntityController implements IEntityController {
  final Entity entity;
  final FootballGame game;

  Vector2 size = Vector2.all(32); // Default size
  double friction = 0.98;
  double maxSpeed = 800;

  EntityController({
    required this.entity,
    required this.game,
    this.friction = 0.98,
    this.maxSpeed = 800,
  });

  Vector2 get gameSize => game.fieldComponent.size;

  /// Posizione assoluta nel mondo di gioco (per Flame)
  @override
  Vector2 getRenderPosition() => position;

  @override
  Vector2 get position {
    final relative =
        game.gameState.positionMap[entity]?.position ?? Vector2.zero();
    return getAbsolutePosition(
      relative: relative,
      fieldPosition: game.fieldComponent.position,
      fieldSize: game.fieldComponent.size,
      anchor: Anchor.center,
    );
  }

  Vector2 getAbsolutePosition({
    required Vector2 relative,
    required Vector2 fieldPosition,
    required Vector2 fieldSize,
    required Anchor anchor,
  }) {
    final offset = relative.clone()..multiply(fieldSize);
    final anchorOffset = switch (anchor) {
      Anchor.center => Vector2.zero(),
      Anchor.topLeft => Vector2.zero(),
      Anchor.topRight => Vector2(fieldSize.x, 0),
      Anchor.bottomLeft => Vector2(0, fieldSize.y),
      Anchor.bottomRight => fieldSize,
      Anchor.topCenter => Vector2(fieldSize.x / 2, 0),
      Anchor.bottomCenter => Vector2(fieldSize.x / 2, fieldSize.y),
      Anchor.centerLeft => Vector2(0, fieldSize.y / 2),
      Anchor.centerRight => Vector2(fieldSize.x, fieldSize.y / 2),
      Anchor() => Vector2.zero(),
    };
    return fieldPosition + offset - anchorOffset;
  }

  /// Velocità assoluta
  Vector2 get velocity {
    return game.gameState.velocityMap[entity]?.velocity ?? Vector2.zero();
  }

  /// Imposta la velocità assoluta
  set velocity(Vector2 v) {
    final comp = game.gameState.velocityMap[entity];
    if (comp != null) comp.velocity = v;
  }

  /// Velocità relativa (normalizzata rispetto al campo)
  Vector2 get relativeVelocity {
    if (gameSize.x == 0 || gameSize.y == 0) return Vector2.zero();
    return velocity.clone()..divide(gameSize);
  }

  /// Imposta la velocità relativa
  set relativeVelocity(Vector2 v) {
    if (gameSize.x == 0 || gameSize.y == 0) return;
    velocity = v.clone()..multiply(gameSize);
  }

  /// Logica di aggiornamento dell'entità
  @override
  void update(double dt) {
    // Clamp velocità
    if (velocity.length > maxSpeed) {
      velocity = velocity.normalized() * maxSpeed;
    }

    // Aggiorna posizione relativa
    final posComp = game.gameState.positionMap[entity];
    if (posComp != null) {
      posComp.position += relativeVelocity * dt;
      posComp.position.clamp(Vector2.zero(), Vector2.all(1.0));
    }

    // Applica frizione
    velocity *= friction;

    handleCollision();
  }

  /// Gestione delle collisioni (da implementare nelle sottoclassi)
  void handleCollision();
}
