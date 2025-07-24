import 'package:flame/components.dart';
import 'package:football_sim_core/components/ball_trail.dart';

import '../game/football_game.dart';

class BallComponent extends SpriteComponent
    with HasGameReference<FootballGame> {
  /// Velocità corrente (unità: pixel/secondo)
  Vector2 velocity = Vector2.zero();

  /// Coefficiente di attrito: riduce la velocità ogni frame
  final double friction = 0.98;

  /// Velocità massima
  final double maxSpeed = 800;

  BallComponent({Vector2? initialPosition}) : super(anchor: Anchor.center) {
    if (initialPosition != null) {
      position = initialPosition;
    }
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // 1. Carica lo sprite
    sprite = await game.loadSprite('ball.png');

    // 2. Imposta le dimensioni in base alla texture
    final image = await game.images.load('ball.png');
    size = Vector2.all(image.width.toDouble().clamp(16, 64));
    // Qui limitiamo la dimensione tra 16 e 64 pixel;
    // adegua i valori come preferisci

    // 3. Se non ho già un position passato via costruttore, centro
    position = position.isZero() ? game.size / 2 : position;
  }

  @override
  void update(double dt) {
    super.update(dt);

    // 4. Applica movimento
    if (!velocity.isZero()) {
      // Limita la velocità
      if (velocity.length > maxSpeed) {
        velocity = velocity.normalized() * maxSpeed;
      }

      // Muovi la palla
      position += velocity * dt;

      // Applica attrito
      velocity *= friction;

      angle += velocity.length * dt * velocity.length2 / maxSpeed * 0.001;
      // Gestione rimbalzo sui bordi del campo
      _handleBoundsCollision();
    }
    if (velocity.length2 > 20) {
      // genera una scia istantanea in corrispondenza del centro della palla
      game.add(BallTrail(position.clone()));
    }
  }

  void _handleBoundsCollision() {
    final halfW = size.x / 2;
    final halfH = size.y / 2;

    // X
    if (position.x - halfW < 0) {
      position.x = halfW;
      velocity.x = -velocity.x;
    } else if (position.x + halfW > game.size.x) {
      position.x = game.size.x - halfW;
      velocity.x = -velocity.x;
    }

    // Y
    if (position.y - halfH < 0) {
      position.y = halfH;
      velocity.y = -velocity.y;
    } else if (position.y + halfH > game.size.y) {
      position.y = game.size.y - halfH;
      velocity.y = -velocity.y;
    }
  }

  /// Metodo di utilità per "calciare" la palla
  void kick(Vector2 direction, double strength) {
    // direction dovrebbe essere normalizzato
    velocity = direction.normalized() * strength;
  }
}
