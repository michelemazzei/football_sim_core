import 'package:flame/components.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/components/ecs_position_component.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/game/football_game.dart';
import 'package:football_sim_core/controllers/ientity_controller.dart';

@Deprecated('Use ECS system')
abstract class EntityController implements IEntityController {
  final EcsEntity entity;
  final FootballGame game;

  Vector2 size = Vector2.all(32);
  double friction = 0.98;
  double maxSpeed = 800;

  EntityController({
    required this.entity,
    required this.game,
    this.friction = 0.98,
    this.maxSpeed = 800,
  });

  Vector2 get gameSize => game.fieldComponent.size;

  /// Posizione assoluta per Flame, calcolata da PositionComponent
  @override
  Vector2 getRenderPosition() => position;

  @override
  Vector2 get position {
    final posComp = entity.getComponent<EcsPositionComponent>();
    final rel = posComp != null
        ? Vector2(posComp.x, posComp.y)
        : Vector2.zero();
    return getAbsolutePosition(
      relative: rel,
      fieldPosition: game.fieldComponent.position,
      fieldSize: game.fieldComponent.size,
      anchor: Anchor.center,
    );
  }

  /// Velocità assoluta letta da VelocityComponent
  @override
  Vector2 get velocity {
    final velComp = entity.getComponent<VelocityComponent>();
    return velComp?.velocity ?? Vector2.zero();
  }

  @override
  set velocity(Vector2 v) {
    final velComp = entity.getComponent<VelocityComponent>();
    if (velComp != null) velComp.velocity = v;
  }

  /// Logica di aggiornamento (se ti serve ancora qui; altrimenti sposta tutto in MovementSystem)
  @override
  void update(double dt) {
    // Leggi i componenti
    final posComp = entity.getComponent<EcsPositionComponent>();
    final velComp = entity.getComponent<VelocityComponent>();

    if (velComp != null) {
      // Clamp e frizione
      var v = velComp.velocity;
      if (v.length > maxSpeed) v = v.normalized() * maxSpeed;
      v *= friction;
      velComp.velocity = v;
    }

    if (posComp != null && velComp != null) {
      // Movimento relativo al campo
      posComp.x = (posComp.x + velComp.velocity.x * dt / gameSize.x).clamp(
        0.0,
        1.0,
      );
      posComp.y = (posComp.y + velComp.velocity.y * dt / gameSize.y).clamp(
        0.0,
        1.0,
      );
    }

    handleCollision();
  }

  // Collisioni rimangono qui
  void handleCollision();

  // Calcolo dell’offset di rendering (resta identico)
  Vector2 getAbsolutePosition({
    required Vector2 relative,
    required Vector2 fieldPosition,
    required Vector2 fieldSize,
    required Anchor anchor,
  }) {
    final offset = relative.clone()..multiply(fieldSize);
    // ... stessa logica di prima per gli anchor
    // ritorna fieldPosition + offset - anchorOffset
    // (puoi ricopiare il tuo switch su Anchor)
    return fieldPosition + offset;
  }
}
